Return-Path: <linux-arm-msm+bounces-40883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 324349E825E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 22:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DADB718833CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 21:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C52528F5;
	Sat,  7 Dec 2024 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqOZ4pI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213B15530C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Dec 2024 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733608147; cv=none; b=aVKE7Cc9GDHxGZu4D96c57pgt5wYyswCrZruYUrb7i2r4Wyw3aVxG05y3Y7Eb4aKI54WR+NOWUBJY8ClqydPzXDHhVNvAa7qezpxnQ5xpGjK7UGe6a1MQs/eaL8lrcJ0V0Qfs4PrGlqei4a9197rAo2dtdQ6hGcW2qMYNfOxhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733608147; c=relaxed/simple;
	bh=XP3j1/4hGEAC2iNDIke1mBk6kVbZ+dv9A+GBgBQwQy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fq44PxOEtKIYZvRD4CkDk7TRBE3dzX2Y3yeY/y33U1zNC5BBC8G1mmTPGMRB446xAyBxuPzgF5LDUjjWc6Wp/ufMQrYuNZ6AH8U9eQoyEZMfxkIZ9cTpxaox8CkPHhQiDrO1UaGblaN/0cfvTfzSU6BEtGu8ZL9lSkC8LjaT1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqOZ4pI9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38637614567so258651f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733608144; x=1734212944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsfew4ZFMeZbleew2kyM9F4xOEfh/La2iijlA6czpC8=;
        b=NqOZ4pI9x4rc1LzrNpdBY6RqedPromI2VThlvM1eib74h6fnIRwz4sBXHdBrDLHFrA
         wbTL1dZpMuITP2GJz8sN5MI+BKYCh6sSwemLLVmXxZYgqaQFVJsu1ah9Hk1mZof4t5Ao
         Y3pjoDKf5DMsCF/NurqQgecK3UExxRAXwOTELg8gwD/nBZ4/WTW5WmAWimD8pjQkF0+g
         UGfhjq+mwd01gIZpdWGCgjWpkOoGsaPFS/x4lltgNZrjv1R/3zxj8o/KCTZ2LmuyG79H
         BE/3cHMpawJL7UjVTON4b7B2/zbXDfe5PgcBa1yJX47fSdRCV8Ok3guOBrMFAjq7bmd6
         W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733608144; x=1734212944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsfew4ZFMeZbleew2kyM9F4xOEfh/La2iijlA6czpC8=;
        b=AaE6FGNI+flbdchB2Bu8eFlzeZvwxWxYqQLJ/U0FCfXsDWcudcHn5F0+85Js8VaVOG
         DWBBsECBMRNvZLVxMYWOH7ZAqh7MCJDSoTWTv6d0ZaM7wjv5FQAd+zKyHpb2JNHGAbat
         YwfoYWQWau+N8MmeY19taBBT7Gf9GCeOvb9drOW/LmDjTv644cZ22a28VQOQSvOvV7uw
         gzsD/h0AzV06HgjRrX9b3StnE0kxfTUCRfSI83jCbmFSUMFpaC/sM3NhMgqkATujnFW4
         WDH7FiJV98Di+7EHarfjvpSvv6bQegx3VlhkZ0k3IStP8EbiRIFvYg6mJqnUReQBXoJw
         Rrtg==
X-Forwarded-Encrypted: i=1; AJvYcCVaC/XSIzTxyQSJCYDjRQzk2WxfieBIFcVfhgmfWpa5z7bAq6XwYh4BWBidu+59rrqECuS8+FcQYVhkbh/u@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjAWkabeFp8zIlGeiVJEmV6ECxFosa8+tCdTBqhIX7SWNKcbA
	5WgknYj10lq7McZQI7Cp0uYRMX/kq8/SEKJCLn/BiyvcbrbN4pqCaEKg+VVIDkY=
X-Gm-Gg: ASbGnct0klFaVlOqcP8HBSbI/cW1uHwo+dH/Jvah85nIKmfzO6+L6TZECtk5plc1zYA
	sqOUbSAKeCS5vEogC24VclQ1FlMvr3U5fPGOOhi+IHnrC8FzPxk/kNq7ZQPMxiuiQGEIA1Tu0N6
	kjflUmuXo+vsl34i+I81Jz+9VmzOJJXhoMrVe80I5MQtB7N7hwaJi5gXJRFLHaJQ7bGZsMjkMDf
	ckQReOaPv7GjD79+au+ncPuWEFSh1jLYPPfeHXwiPS3I8cf
X-Google-Smtp-Source: AGHT+IH+ko/7VIODrYwfCnjU0zGn4D+6rRMhVzbvM2RWWXIDLkbwi9KP0/YKC1XI4EiPxhf0nmocBw==
X-Received: by 2002:a05:6000:709:b0:385:dd10:215d with SMTP id ffacd0b85a97d-3862b3d3554mr5627621f8f.44.1733608143816;
        Sat, 07 Dec 2024 13:49:03 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862de365f0sm5026157f8f.3.2024.12.07.13.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 13:49:02 -0800 (PST)
Date: Sat, 7 Dec 2024 23:49:00 +0200
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
Subject: Re: [PATCH] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on
 usb-c ports"
Message-ID: <Z1TCzEj05Anzwcc6@linaro.org>
References: <20241206172402.20724-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172402.20724-1-johan+linaro@kernel.org>

On 24-12-06 18:24:02, Johan Hovold wrote:
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
> 
> I have not been able to reproduce this on the (third port of) the CRD,
> but I hit this constantly with the T14s so let's start with reverting
> there.
> 
> Note that Stephan has already identified another problem with the
> offending commit here:
> 
> 	https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> 
> Johan
> 
> 
> #regzbot introduced: 1a48dd7b9ac8
> 
> 
> 
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

