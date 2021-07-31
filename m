Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B123DC491
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 09:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhGaHqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 03:46:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:37018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230441AbhGaHqu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 03:46:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94A1660F35;
        Sat, 31 Jul 2021 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627717604;
        bh=XoRLlO6yREwE79bg45XGs0yLsmam6jgdgV4yxxcmUaU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DE+Qr0CUdXaG4/Gy3FxgREAMgqUUl/IEOMLYhXN/0tT2CR+QuyhG9sMVbVEnpdSR8
         Osz1ONhYxO2Ht2emZ5ejlOHI9+yRydrQfqOGBl4LyoNBNi5uGUIQj0cKoQXjkkqfhW
         HknJ9/Zt7Pp11mgrax6TM6pALywRc2Ag5nmXrE3J1nfK16Bov14TsaJ20prqaggERw
         0/wIKw0jNuRvtSGv7IoYECay3Rz7I6/8KrSybBZuDUvonbMg1EO/XlZftEvU0aNBXQ
         gnbAyB2rq3RlsWNBOis9/6wBptNxP/9cGryTHcvKS32sJaEJ3ugjkPfjhHiahE51yl
         /zfmhEy9C+FHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c9ac6fa07e81cb79c1eb8f2760a040eb0c72f0a6.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com> <c9ac6fa07e81cb79c1eb8f2760a040eb0c72f0a6.1626986805.git.quic_vamslank@quicinc.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: clock: Introduce pdc bindings for SDX65
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, maz@kernel.org,
        mturquette@baylibre.com, quic_vamslank@quicinc.com,
        robh+dt@kernel.org, tglx@linutronix.de
Date:   Sat, 31 Jul 2021 00:46:43 -0700
Message-ID: <162771760329.714452.3247897858898753903@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting quic_vamslank@quicinc.com (2021-07-22 14:09:43)
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
>=20
> Add compatible for SDX65 pdc.

This isn't clk related. It's an interrupt controller. Please don't send
this to linux-clk list.

>=20
> To: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Kozlowski <krzk@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.t=
xt
> index e9afb48182c7..7bdbffb572dc 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -22,6 +22,7 @@ Properties:
>                     - "qcom,sdm845-pdc": For SDM845
>                     - "qcom,sdm8250-pdc": For SM8250
>                     - "qcom,sdm8350-pdc": For SM8350
> +                   - "qcom,sdx65-pdc": For SDX65
> =20
>  - reg:
>         Usage: required
> --=20
> 2.32.0
>
