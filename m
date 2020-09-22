Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD512748B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 21:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgIVTC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 15:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:42830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgIVTC6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 15:02:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 183E22311C;
        Tue, 22 Sep 2020 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801377;
        bh=kfSHjo9onjvmI6pMBNdhR3lxeQF9LkBIVqUdjFkkZOU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gF37dLFEuJkiXyqf/Z5fbwTmkIE1AqH6lHhce6qh8OA+RP1rXD5Jsxb1/X7mVS0y7
         Uw7bPGpxiJLr9P1VGDrVpaFZUIlL7U9EWpmbMzZGSOC8u5fyugn73OhdkO5IImpdaK
         rNvZOAsShkNXns+J1R6KFVsQcqirfkS7yKUwlX1I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911153412.21672-4-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-4-jonathan@marek.ca>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 12:02:55 -0700
Message-ID: <160080137590.310579.8319855170599098111@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-11 08:34:03)
> These two bindings are almost identical, so combine them into one. This
> will make it easier to add the sm8150 and sm8250 dispcc bindings.

Why not just add the sm8150 and sm8250 to the sc7180 binding?

>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  ...om,sdm845-dispcc.yaml =3D> qcom,dispcc.yaml} | 18 ++--
>  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 86 -------------------
>  2 files changed, 12 insertions(+), 92 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml =
=3D> qcom,dispcc.yaml} (86%)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-d=
ispcc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.y=
aml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
> similarity index 86%
> rename from Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.ya=
ml
> rename to Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
> index ead44705333b..7d5b25dfe0b1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
> @@ -1,32 +1,37 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/clock/qcom,sdm845-dispcc.yaml#
> +$id: http://devicetree.org/schemas/clock/qcom,dispcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Display Clock & Reset Controller Binding for SDM845
> +title: Qualcomm Display Clock & Reset Controller Binding
> =20
>  maintainers:
>    - Taniya Das <tdas@codeaurora.org>
> =20
>  description: |
>    Qualcomm display clock control module which supports the clocks, reset=
s and
> -  power domains on SDM845.
> +  power domains on SDM845/SC7180.
> =20
> -  See also dt-bindings/clock/qcom,dispcc-sdm845.h.
> +  See also:
> +    dt-bindings/clock/qcom,dispcc-sdm845.h
> +    dt-bindings/clock/qcom,dispcc-sc7180.h

Sort please.

> =20
>  properties:
>    compatible:
> -    const: qcom,sdm845-dispcc
> +    enum:
> +      - qcom,sdm845-dispcc
> +      - qcom,sc7180-dispcc

Sort please.

> =20
>    # NOTE: sdm845.dtsi existed for quite some time and specified no clock=
s.
>    # The code had to use hardcoded mechanisms to find the input clocks.
>    # New dts files should have these clocks.
>    clocks:
> +    minItems: 8
>      items:
>        - description: Board XO source
>        - description: GPLL0 source from GCC
> -      - description: GPLL0 div source from GCC
> +      - description: GPLL0 div source from GCC (sdm845 only)

They're not the same. Why are we combining them?

>        - description: Byte clock from DSI PHY0
>        - description: Pixel clock from DSI PHY0
>        - description: Byte clock from DSI PHY1
> @@ -35,6 +40,7 @@ properties:
>        - description: VCO DIV clock from DP PHY
> =20
>    clock-names:
> +    minItems: 8
>      items:
>        - const: bi_tcxo
>        - const: gcc_disp_gpll0_clk_src
