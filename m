Return-Path: <linux-arm-msm+bounces-41490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FDB9ECDC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EC228596F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699942336AF;
	Wed, 11 Dec 2024 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEhqgPWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CA381AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925449; cv=none; b=RD1qKw0EPHpCLoOlgKUYTdCZ7twPvG2QDDkfQzK3HNmRPHyaLy2/LrPTXVeZIlaB/DH/9aKs6hBIGoRnXBx7YioZ7CdqnVNOe35t2Fg5d1F4jV1365gX7N0RUAuTLFjhH3/2oglpxknJyVHN94+oTrl0hDdMQeUdzC/MUvsgUJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925449; c=relaxed/simple;
	bh=JhwlRQCUlSido+cOopKgWGuxkf6VA5zfN500pz/rIjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz7hYBrHsVLkYzMl4/3FPp7Tbn9Fw09xERuFZclQFu5Q/abB4l37L8367cNxVP3RXAi8Z3s7XNz9wj1OdeBEzYc1fphztijP9Jt/p/t/ZIx1+9x/Z38cCMJYKkDRbjZtHNy9bI+2dlJYN7eujt/RwNU9pFtYudawtnB+xixIIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEhqgPWo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434f30ba149so24652955e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925446; x=1734530246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4+3IBZgQdDXFwyfmcTHMczi/2LVRqIwQiyJZ1onodg=;
        b=gEhqgPWopHRmtCG0E57BKyWnL6k1/eYgGMjvdmXP/5AujETDEa5uWiR/TjKFSfqXEs
         tUX/+rnSJHRZ6W6ReSjROaqCQyEQI77QayYvauaKATk5XGYYxPhPKDoEyFh5yS2/X7cJ
         kzaeCJ+Apjss4NoLeB2pqmzbMHXpsac/SaycrwROV3Xz5E8SDn74VXFFGAn3B+7ao8Hy
         5ZX0dMkMb+hb+7YEJ753Vh7ioH1c2W2dZ10DqmdrF4dAlWBmNX61BKugnFqN+B0R3B+c
         exlv6sxFrVslgY19Z/9ui5qzL/y6Il7/L1jHWLFp0gycdHPXfKuHyG0KvRV5S62eX1gd
         hWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925446; x=1734530246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4+3IBZgQdDXFwyfmcTHMczi/2LVRqIwQiyJZ1onodg=;
        b=Mo6q4va+Hp/zYovzhhJchtxUFS6IdLfZcJQo029qBj93G8GB+XKBm2X1T2N8Q0/qiC
         cKN5Z+bhb11A7S1tBGd/KBo8X9can36NW8Y9kyQ5fCVvzgOhLCYWjXFe2zHCCt0r+Cu5
         QdMOYnB06E7Aivxe3BBZFeWb4h1JWpaxO3GTQIGdyJon4PKTaZ8sdBmE99O2bLkioLXR
         QoFsN8HAzQnCUQZucBtq41YrpN7BlEx8bzeqgtOma1DskoKNfEElSDsVd0InDRf+rXOg
         uB0dn9sSpS9jVaaz3JAoMb098vU2Bat24S9m0iu8CPnS8ztGxBmEBveIx0Dgs2hJDFgx
         KOkg==
X-Forwarded-Encrypted: i=1; AJvYcCUy6KMlJleY/bgWzRnZ2GQwYexnvna2BVfho29siJUjeJUT+rr8DDZPWjYW03hIO553fn4cqSOSR4K2DeeT@vger.kernel.org
X-Gm-Message-State: AOJu0YyUxrJAJ1StccPLwF8VL5RqEMOnJsd1eb/ds3ktQDXUW99gC/yz
	9KAkFDIHrgDXXh1JfaEaBUSPVTDVfPHG/l9jlcwSCINN6uv3qfFxBvOfrNzoLV4TEHgwFClVyCm
	r
X-Gm-Gg: ASbGncuCj0NmGWHK0YOAKMmHnWBNWvho7Xd9gu/v/7iQUuUZ10hAKpeJO3bYNSbZrup
	zLEhlbMbN0xkcnSD/owvqw+JvEaYRQOKLGj1L6D/TtphEAjRq6OjBGXS+ne4rT7rCVGu7cAlFw9
	9qCW+AqCgSGCrm4AygGVe4JZSWkGliBjgL+E8hqda+nNEVKIHPBkfkE65X3KTATFUXPQkAsLq81
	Yrvz5dlBiGdmY5kmXNfgrp3jJoO6fns9+/MxAnBsIJhKcGEyTxp
X-Google-Smtp-Source: AGHT+IGj6e56QapjjDkMGtxmigoFIildblF7J2AdVirl2LbBPSwWrReDkRoqBxNuZpY75ur5m0i4WQ==
X-Received: by 2002:a05:600c:b86:b0:434:f5c0:32b1 with SMTP id 5b1f17b1804b1-4361c3755afmr24750765e9.15.1733925444346;
        Wed, 11 Dec 2024 05:57:24 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c8aadsm1332447f8f.60.2024.12.11.05.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:23 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:22 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3 3/3] Revert "arm64: dts: qcom: x1e80100: enable OTG on
 USB-C controllers"
Message-ID: <Z1maQhIyS1LVfDc6@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-4-johan+linaro@kernel.org>

On 24-12-10 12:14:44, Johan Hovold wrote:
> This reverts commit f042bc234c2e00764b8aa2c9e2f8177cdc63f664.
> 
> A recent change enabling role switching for the x1e80100 USB-C
> controllers breaks UCSI and DisplayPort Alternate Mode when the
> controllers are in host mode:
> 
> 	ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
> 
> As enabling OTG mode currently breaks SuperSpeed hotplug and suspend,
> and with retimer (and orientation detection) support not even merged
> yet, let's revert at least until we have stable host mode in mainline.
> 
> Fixes: f042bc234c2e ("arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Link: https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
> Link: https://lore.kernel.org/lkml/Z1gbyXk-SktGjL6-@hovoldconsulting.com/
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 1740fdf7b1de..4c1e01605e87 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4422,8 +4422,6 @@ usb_1_ss2_dwc3: usb@a000000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -4677,8 +4675,6 @@ usb_1_ss0_dwc3: usb@a600000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -4777,8 +4773,6 @@ usb_1_ss1_dwc3: usb@a800000 {
>  
>  				dma-coherent;
>  
> -				usb-role-switch;
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> -- 
> 2.45.2
> 

