Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7863DE265
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 00:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhHBWVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 18:21:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhHBWVO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 18:21:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BDB960F36;
        Mon,  2 Aug 2021 22:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627942864;
        bh=6aX9/Bt43bl53L5jhqHaKlrsxRZ9CIuNwap0K/eMxSI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mSLG9Aklw9l2tZh+9Ck1je3fPLx6Cx6xxjMAW7fSE/V1HWI6/XQCVKWpP6/pQBMOB
         22ocuHFpnDUYWx2Twvo8dxCvxwrQTp6lfMTkmxwRK53cFndvgcEP3PepFLfg3yy5Ys
         LUaeKzMQGtbglBhtUTP3putUHhy8tzsOPckRboB/jiKpq85pbOJz4Og/B+Auj9Ajqo
         s5RqQkbK5fgw2y7Mg/gYOTcZ63QeYkd01U2KaXOu7qaYiAw4BbZdDDOdun5uS8/CuM
         ZrNLkb+UaARq2NHJyNdDDShf9L+DXTrCHY0hf856ETnjbktU483zB5uUpWUXA96wu4
         cVXXBW+BjbdAg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210801103448.3329333-2-iskren.chernev@gmail.com>
References: <20210801103448.3329333-1-iskren.chernev@gmail.com> <20210801103448.3329333-2-iskren.chernev@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document SM6115 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Mon, 02 Aug 2021 15:21:02 -0700
Message-ID: <162794286285.714452.14111966516954708252@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Iskren Chernev (2021-08-01 03:34:47)
> Add device tree bindings for global clock controller on SM6115 and
> SM4250 SoCs (pin and software compatible).
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/clock/qcom,gcc-sm6115.yaml       |  74 +++++++
>  include/dt-bindings/clock/qcom,gcc-sm6115.h   | 201 ++++++++++++++++++
>  2 files changed, 275 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm61=
15.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
> new file mode 100644
> index 000000000000..c8c9eb82b9b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SM6115 and S=
M4250
> +
> +maintainers:
> +  - Iskren Chernev <iskren.chernev@gmail.com>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets=
 and
> +  power domains on SM4250/6115.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sm6115.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sm6115
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: PLL test clock source (Optional clock)

Please drop this last one

> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: sleep_clk
> +      - const: core_bi_pll_test_se # Optional clock

And this last one. The test input is never used. I'd make this the same
as gcc-sc7180, i.e. have the always on XO as an input in case it is
needed.

> +
> +  '#clock-cells':
> +    const: 1
