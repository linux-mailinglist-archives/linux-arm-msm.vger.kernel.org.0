Return-Path: <linux-arm-msm+bounces-4254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D4A80D433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 18:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7960B215E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741644E616;
	Mon, 11 Dec 2023 17:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMk5Kx40"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF16E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:39:38 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db5e692d4e0so4930332276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702316377; x=1702921177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm/U5iX89/NkKIBpHMc6e7m4WD1ivJqJGvRe8VbK7nY=;
        b=xMk5Kx40uxnogy9AW7ZGbyel1segDScwJiW1q/8+184jID9Hc+mGeFtmnwtQ1IpDQz
         SYMeM/SdNzq99X/NS5fiqnSNzlPmTiOBnRFr+5oxsAhYf0KDA3+C07qcUQYZVF+r3tva
         EmhGlI7m8AqvI/C+gjP0wOVkLwWID8pJvqIaleVOUApl0zU//TRSkmH9L0NnJpehbblD
         4skez4shaR3btqb0eaTCUlaeKrMKB0klyYKtTlSA3NRhN7iozRnw41Iydt50YZUNZG/z
         Ycyf639054gAT8I4DG65lehK/OnZyjcjiUYeLgrnN1Rn0N6wq14k9zKAR8fXKNzRY32R
         1Kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316377; x=1702921177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm/U5iX89/NkKIBpHMc6e7m4WD1ivJqJGvRe8VbK7nY=;
        b=IdRARp6pN0rHrDNB9G1C9Uhl+AEg4qXS4H2u41GIl6PGGhZw4gO19N7quBXgir8y5q
         vT/KcP5TRV9hpylAbgQU36G4huUz/2A39xlvK4wCcRkzdmJ7QCkhUtFgASbXthwrIcR2
         fE9BOHmT5+OrMdkFiMFdp/Cn8y0GPO0iQBxopb00V8GKZ3U1F7Cody1mwSwZHu3AAYXd
         BXIFqnLyJ1c+izxm37t71U2dU2qDLe4I/w+VDAw/y3cW14VYtxPNARNRqq329/8tqOyb
         liVIVACDHAHBA3T0s0gYFg+SzNp+fh0gCUxkhFUUCiEYUKF2tx1ks3yBFcoc5uHAoYZ8
         rZ0g==
X-Gm-Message-State: AOJu0Yy9MjIFc3szHaY5c6FmZCKof3NGsSC2FtzPpw1FASM48F5Y0oPK
	ZvG+bMxSBxSm3iXn6wQwxC1a5rIu1gUxW2hr36UUYQ==
X-Google-Smtp-Source: AGHT+IFP/Y5PRlU1eXMLK1DEPHD4ZlTXHmj1o1ZRYUX5WxIJwcx84DGmQIVNKNxHrRJGzAv/k5G2es+ZoybkpQPW+kc=
X-Received: by 2002:a05:6902:1a44:b0:db9:8c22:a455 with SMTP id
 cy4-20020a0569021a4400b00db98c22a455mr3582817ybb.11.1702316377187; Mon, 11
 Dec 2023 09:39:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211172411.141289-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20231211172411.141289-1-manivannan.sadhasivam@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 19:39:25 +0200
Message-ID: <CAA8EJppQNnLhH2XNg1qSTuY9uvChLU2rWy3Ep97yq8yLgwAJYg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom-sdx55: Fix the base address of PCIe PHY
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 19:24, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> While convering the binding to new format, serdes address specified in the
> old binding was used as the base address. This causes a boot hang as the
> driver tries to access memory region outside of the specified address. Fix
> it!
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: stable@vger.kernel.org # 6.6
> Fixes: bb56cff4ac03 ("ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> index 2aa5089a8513..a88f186fcf03 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> @@ -436,9 +436,9 @@ pcie_ep: pcie-ep@1c00000 {
>                         status = "disabled";
>                 };
>
> -               pcie_phy: phy@1c07000 {
> +               pcie_phy: phy@1c06000 {
>                         compatible = "qcom,sdx55-qmp-pcie-phy";
> -                       reg = <0x01c07000 0x2000>;
> +                       reg = <0x01c06000 0x2000>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         ranges;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

