Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA137357900
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhDHAUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:20:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHAUK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:20:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D916D61159;
        Thu,  8 Apr 2021 00:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841200;
        bh=DSGhC5SaLK4W1fvVjx832a5NLDBEVNuhBUSpb2HfKzQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jLsowCmOWhN3irBK9wD7NeVFs4qhDumgCz9j5/BKmnQVK3uwUg3GCwP5aVxUa5YP2
         /MVPCk4wnC31w1ySg254sW5XeQE+l6cjDlHZNHR6Mc9xZzgIR32C9IYhBc+5/nw2sW
         CsEOb0RiAXFLxg9TNNDtLCJMyDRSS0IE31OfnMT7ZRpUX091jyDZo6T9drLGeUSNgU
         nksgS5yMbPzUC2Zx9pV7ZWDOJfSjF91mpuf44QjLbdHXMhAtTi2BNDCrxjGLxaiBhN
         VIR1upqdTfueEULRFKyx8GNdXb+KbOKfAHfY/4fgI+TS4n4nh3wsYoRzpc/LcKwHU5
         60kyr4BPBxwYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406231909.3035267-2-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org> <20210406231909.3035267-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 07 Apr 2021 17:19:58 -0700
Message-ID: <161784119850.3790633.17698180700358661431@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-06 16:19:06)
> Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
> clock-names properties.

Yes, but why?

>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-sdm845.yaml       | 84 +++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
>  2 files changed, 84 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm8=
45.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> new file mode 100644
> index 000000000000..4808fa7a6b8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets=
 and
> +  power domains on SDM845
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sdm845.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sdm845
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source (Optional clock)
> +      - description: PCIE 1 Pipe clock source (Optional clock)

Can we make them not optional?

> +    minItems: 3
> +    maxItems: 5

And remove this? Because in reality the clks are always going there so
we can put a <0> element in the clocks array if we don't care to
actually specify it.

> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk
> +      - const: pcie_0_pipe_clk # Optional clock
> +      - const: pcie_1_pipe_clk # Optional clock
> +    minItems: 3
> +    maxItems: 5
> +
