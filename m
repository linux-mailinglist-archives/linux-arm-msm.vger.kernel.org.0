Return-Path: <linux-arm-msm+bounces-41492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE29ECDCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67D31887FBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED04C2336BF;
	Wed, 11 Dec 2024 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwpKKNai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296ED233690
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925477; cv=none; b=e567o1kDB+dxngjx3ggv+TNIQY6e/kGMx+CBVeeBoGaAt/tW03QZdO4lxccnBsCUGeuLrruEfRT48aT+7iN30X3L37YYaxsiW4AUV2Nx7NxqL8zmS5UhY1yaz/uoOzvhR90fvbL2KYGkc2/Bs+nAUgJk48w4kM3GUInhLkFuNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925477; c=relaxed/simple;
	bh=zhm5/qneWDtFKip5gZc5Ug51qbj4ZyGlCNuuB0VT+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHXN4XwJiBHH3F7hlYJ+4eC0vXqpKxByODIP5ZP6MKGXKfttjzLZVuFpA9KBCrrwJNFt8cQKWtORpO7ggVn2By2Njo2X0PNZICQ3ApWQnwJspelH09eIq7G7ZykrKWxe6UV1oePcGlqOuE2cGRfD+aH0/fTo/xmm6XED4GFXqKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwpKKNai; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283d48so11071855e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925473; x=1734530273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+Nq0JPihsIDotmBgK7j9oUK4hXd8/xtAenPkWmVRYY=;
        b=IwpKKNaivrfAl7DAvLkboGqSQldDQDYOxPkLhfHMGObrTYp94v3gxZYKeHana3kUp5
         80hOVvQB84pAcoNh5RAMnJaUFk/jZBywtQ5VGk1UhtPapWh/pvER8rOiNkC7T31xd1bq
         BxQSil+kipx1emxVHkWLTwfrcCz5zEjWBGPiUpRSXlvqoyyVL2bdUYuSRw3zPdNsv/gK
         T51MXKE63TQhmP1w6/qZ7w+Ab6FIRGGl6C+A0ociKVYIHyvBMdyLcAA3t686ca1YSS2j
         JXVpS8IHe0ZFgMA6kGKWYeAztbvJZtRcDvGcL8cUIJcNL+C8d0W3AsA4vNhY3WAbeAPC
         EYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925473; x=1734530273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+Nq0JPihsIDotmBgK7j9oUK4hXd8/xtAenPkWmVRYY=;
        b=o8/8jKufEMW4+VbVu2dfh9DMaOL3n+bmj2VfCaOw+9h6rN0cgxp6Dm65ljitBfL63P
         JBJilD79WnnXhozR0G4YnHzQPQ7Zg8G10/+z7M4Fp8iQWkh8VK+sv+pFAdHBqX+WfD++
         a/sZMQqK/dNiHbQ5ck4Ap7Ion7HRF0GsP01nUwlAGojqHk0qGzZmxm7UEtuT/uo9VRzw
         T/u3hGbHZXXh+4mFmxyCM5A3u/fFJLh81MF00v9l6DjAt3ZrSxs/eiwtNliNxy4JuJNk
         KXD0h7l+lf8GBnAUE6GqOX8EP3V0lrQPu9ZJ0nVqNlPvEhhuVn9NJTnWvJF01NhQ2LyJ
         10Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVeuprkxgsvXhL2ZVxhwiWUl6ViIzkh5OH7yzTTjdV+ldKnYsNxbqQC2mPus/6sJMSWOPWRIhcnFeexiurL@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgbrfvBz035EDxtGni4Dknude2uOwfqpaYOYg1viOqSVRsKPL
	7f/3aA54eMRVmRgAA+UYp3avW8Mdcd3eDHYWhG51YSPaQ+fjfrFMSqHejIxbIro=
X-Gm-Gg: ASbGncv49FwlBkf/FfCZsqfZO5DnWFSv507AuoOjR/fHZneVVBldbykGJWdtcGm2zzZ
	/0V4S03WUNZE8uelrNx3k58teN9gC6sdeB+LvxDbwm9Ym4jMe9L/6s9PF4QMiSprsmZIJSAdYzJ
	b3RHsrAALsN6cLcjCyBeWIMufmYo/AHYdXN3A1PI/KZl7Xh9yQ/cah9KPx5X/Os3F3z+PKUSDN4
	fmncO+knYZN1IUDeNw1NzJyPHBI5MyL7mI+SDUOXV9XiWum4s8B
X-Google-Smtp-Source: AGHT+IGJCYJTlBedjQm+GK+uiVv40a+NR20VpMjki58l34sVua7BTMisnr0pAsT6vjoKEaDgR/Mj5Q==
X-Received: by 2002:a05:600c:35c9:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-4361c3a336dmr23180715e9.18.1733925473454;
        Wed, 11 Dec 2024 05:57:53 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43621ebf8e8sm1879635e9.32.2024.12.11.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:52 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:50 +0200
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
Subject: Re: [PATCH v3 1/3] Revert "arm64: dts: qcom: x1e78100-t14s: enable
 otg on usb-c ports"
Message-ID: <Z1maXuaVQiO3vGM6@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-2-johan+linaro@kernel.org>

On 24-12-10 12:14:42, Johan Hovold wrote:
> This reverts commit 1a48dd7b9ac809d1bd0fd2fef509abba83433846.
> 
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging. The host controller is
> enumerated, but the device is not:
> 
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
> 	xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x000080a000000810
> 	xhci-hcd xhci-hcd.5.auto: irq 247, io mem 0x0a800000
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
> 	xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
> 	hub 3-0:1.0: USB hub found
> 	hub 3-0:1.0: 1 port detected
> 	hub 4-0:1.0: USB hub found
> 	hub 4-0:1.0: 1 port detected
> 
> Once this happens on either of the two ports, no amount of disconnecting
> and reconnecting makes the SuperSpeed device be enumerated, while
> FullSpeed device enumeration still works.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Fixes: 1a48dd7b9ac8 ("arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports")
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 5a4a72a030d4..b4b6260c670c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -1515,6 +1515,10 @@ &usb_1_ss0 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> @@ -1543,6 +1547,10 @@ &usb_1_ss1 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>  };
> -- 
> 2.45.2
> 

