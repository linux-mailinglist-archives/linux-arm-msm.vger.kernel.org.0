Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146F0352006
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 21:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhDATjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 15:39:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234316AbhDATjk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 15:39:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2588E60725;
        Thu,  1 Apr 2021 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617305980;
        bh=HnnPKXIu+Kt9kaxYUQGcL/XccprXnMk8lJbIJrdwHsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mgRpQ4YfK/zy01EV8ShdcvTPoNnCGzM6xcgTrGXkqNA5Hi4ep6Gha02h1NolvomFj
         fdx3P1uKTyUhCbg8pJRBemjyOfwIaldWtTKhvZ3RGV5DXKoRKyjW0PeBdgOLebUtS9
         0eLREPNz6XG8OYGY+G/5rL2lQoMrwE3teUK+QuyR12TtEzPkwHbGeQUCZ0rQ9hXdSf
         HPhKiLdnTYzwSQyN8DhZA9ZbOGn4VdFZaMYwjl+mQ0q8/BKhVeLpzHywDZeBdrvmeW
         2Y6DZ2sErNF4xDJ4gDkK85P+xcjz8Id78VWtwRazjNmibI2hNK1D9G/3SVz9OXp027
         1lVs24G4GvZSg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 01 Apr 2021 12:39:38 -0700
Message-ID: <161730597895.2260335.4437139498852095330@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-03-12 18:19:10)
> Add documentation for the MSM8994 GCC driver.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8=
994.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> new file mode 100644
> index 000000000000..f8067fb1bbd6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/qcom,gcc-msm8994.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8994
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets=
 and
> +  power domains on MSM8994 and MSM8992.

Isn't this already documented in
Documentation/devicetree/bindings/clock/qcom,gcc.yaml
