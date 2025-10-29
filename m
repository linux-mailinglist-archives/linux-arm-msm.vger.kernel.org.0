Return-Path: <linux-arm-msm+bounces-79341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB92C18BB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8746B4E29F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B1130CD84;
	Wed, 29 Oct 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONj8wa1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE7266565
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723660; cv=none; b=tEDLRCu/7aO2jyFxW4J4vpQtcKHiKb+R9iIFsEgZkukNQBI6JIbCufl3Eyh4p9avHimwml6KCR+Vp3k+w/CZ4xZL6su3L9yBlRTCTvbgDND+4mc6Pf4AQ12Py94p2vH4bEEl6pXecwIYL0V+GBA00T+w1zdkg2R5FZVV9ZoNUNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723660; c=relaxed/simple;
	bh=fOAjv7j7SFgxzDGkJ4moXZTVUrxByDzt/RzwZg//8q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubZPi+Gi3WY4FTFSrJ6jed5isjxfuHejtybOQxOY9eeQkm7TQyEwprmFTlVx361DdSUKFsn7k2sFbEDZrHsrKboV5vnZf9PedmWUb1whtVF/55jgfz9iIFrx3mB/OMTDowkxXW13XtBwvY1QV0/EXmUJo2HZa8BzaIIqHD8IjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONj8wa1a; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3516717f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723657; x=1762328457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbFme51wo4xn9EeHD5Qfvqgq+jXrkaUfGgQGuVELTCA=;
        b=ONj8wa1a/ZJQWv/vbEWrP5sGVJQz72UbpQTRGg8a2tWA+39MurjVSuTW4Hf/XWM9Yr
         HiJsEPS6T7ueUG2dFBih6GFKV7ZCa4VV3Ehw0pmLGYbgJDwCIKcJY4Ja9z5vGxo7Z4kt
         NNhZRMcNdrNlM7rAUVkLqaquD3SyEzov+PAVc9crdQSsY6DGYVFO4RXja48QgI0/VW/k
         c6vQRuWCIEuaoEswpHXhBSK4/njqe6MD1CSPbxQXAuG99Rl17C92PrESOvmnndO3JPtA
         CySI3mpm+3ZbXLPNZT9hNGNAcHxmZq6cssTRcnjMQL6QvD0s3vIA6V3rhAIixPBjAl/m
         rCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723657; x=1762328457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbFme51wo4xn9EeHD5Qfvqgq+jXrkaUfGgQGuVELTCA=;
        b=Tq4eSlpi27/rbwGf4TMg5/34rKiJte5xfASTNmk4zgUBcvBQ47MaotuOJ1tR21zfUs
         mYd5TUpUM/8U3rRKAxAkcxhsjbNNpNN8dcEa1HBP7o9bNFUKjnXTM8WCcSl9htcQiEJj
         xHCk0i113ysKayg4nPmsDXvYsBm//4ue5GhO7jzTS5uJhncNiNlMLEp8poKdOez8Iomj
         femAlwTfTpTP5Jw1Vr45/s1cSNH6sZLQRCklN66Zs1rHFm8da0N2yl8YxGtit04s1mdt
         UWaOXHM4skO2ZxaHyavK4T8V2Td2MBjNgGKudh779Ps0OX7L5igqgDqNNE3yXFvJVYdV
         7/jA==
X-Forwarded-Encrypted: i=1; AJvYcCUc9O1ei7/q/8RbxmsJFXlqTcqaA3Nopy1knmAZ3XhHC9iFhc42/ZXI+uI7+FCnhsDVO/7bIGAKXBxO7jn6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7h3UMIMLfAN+DydHmBOq9gN4KyaZKCjLxzNhWVZuoYYoRCHbe
	i0zdswvv8qZtvMhXzuKRcNLs4Ku3PUSXCzer0fztZlhIrcMFVK7LQMywCsWYbamrTxU=
X-Gm-Gg: ASbGncvcGK45ETAE5LK0Y1icUuzfOiaT4FcL6yeeVyQALkkxJ1tIG/DD1xjmG/jvVUc
	nWqFBDzrotfgx2NF1LsRQFHPe5l476fqwwO6sPTLhDHG36rgYXDRWchOHtzKFt44Y69FzNigAea
	QZiiXUA0mrFHhyz64bpqNTZxgWfeobRkeqKij3wKf/uUa8fxHVETV5BrgfBx6Wy0jnDfLg66/8u
	LnMCuZ2C7eWPhBZ72kVvGh5/B/vgZVTiaC+Wc7JJ7mJHame/m4jjxTBYNQGdfBSEoZ/jQXSacXY
	dXz5/OGr5Jc/+vYakRtnhOGTsUMXbk2IY2cmaXxHGmJsjyaLBnhMaEZq76BjSvbOm2lh6b5AjR7
	/Bjb+tVohmDJj3v6JrmxCUgLfUEUEfb/sTjtHocAnP5KDp6yIPP7lP2vYrUka0p1DiZ09vShu
X-Google-Smtp-Source: AGHT+IGMnDPTwT/kgdtrsrLOV6KEqnyYwSmrAPqp6vapwMp97UENpV8di+mbWQ4I3pUNNnIxvqWPYg==
X-Received: by 2002:a5d:5c8a:0:b0:3ee:154e:4f9 with SMTP id ffacd0b85a97d-429aef82fe0mr1522824f8f.20.1761723657326;
        Wed, 29 Oct 2025 00:40:57 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm24298194f8f.12.2025.10.29.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:40:56 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:40:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar <abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
Message-ID: <nwyrhupbrqrh6q5yvk6egtm3whi5h6xslhzio4g7f7l7yjx7c3@atl4bbk5f4vb>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>

On 25-04-24 15:04:25, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Bindings (dtbs_check dependency):
> https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 415 +++++++++++++++++++++++++++++++++++
>  1 file changed, 415 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 30ee98567b6078e8225142f2e13b25b5f35a3038..753b069cab1de636a3b1108747f300bec0f33980 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi

[...]

> +			mdss_dp0: displayport-controller@af54000 {
> +				compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
> +				reg = <0x0 0xaf54000 0x0 0x104>,
> +				      <0x0 0xaf54200 0x0 0xc0>,
> +				      <0x0 0xaf55000 0x0 0x770>,
> +				      <0x0 0xaf56000 0x0 0x9c>,
> +				      <0x0 0xaf57000 0x0 0x9c>;
> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;

No PIXEL1_CLK ?

