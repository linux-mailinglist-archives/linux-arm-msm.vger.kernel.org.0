Return-Path: <linux-arm-msm+bounces-80009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A6C285BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 19:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9ECF4E150D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 18:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7AA2FD1B6;
	Sat,  1 Nov 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVgy8Ebl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5B2FCBE5;
	Sat,  1 Nov 2025 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762023385; cv=none; b=cUf8Qt91o04RHcv0JxblV7lWt9DgHfPjkMnK2ehQ0uOx4I4s8rx1p8dPwm1cuX6ocuPaJEXGCeYzsHWYhX6MbISIhdBqFvPriTsw358NIrDG5wBE2SeA3vgue8rSLgxnNFbvVrtyrDK43PK4toMQ1rADFJMGnT76DEamM3PXP2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762023385; c=relaxed/simple;
	bh=Rvtu9l5fDahHyClytx/z8pD6jps8dw8Jm3ocrKxQOFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mogcu7i5Nn4idyLpwRYU+i6XLa7sNtJUvcbK2+uK6le7S3g02+CWMShVz3B+H4wbH4jfMXpAy/BHMQJF91+8V6DBRasy6/cunmioLjz9b1U420Jd6rtKkR0gMqJGNrfOMN8EF1vNtwkWu12rsILeVESmtYq/DMlRfXC1elFBxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVgy8Ebl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08063C4CEF1;
	Sat,  1 Nov 2025 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762023384;
	bh=Rvtu9l5fDahHyClytx/z8pD6jps8dw8Jm3ocrKxQOFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVgy8Ebl1vzH6dKZeYYaIVcIiOUyULa8GYuJwWNj/kwwdzlXaNPgJtkhWX0oKi6Ov
	 Rpny9h/f7rQ7yIdJAqktFD93F822JGYLtpUD5DzHw2wCLu5qy7zLDgJ/UhhYElB8xQ
	 85w83n+a4ccGK+CT8a9uM35m6FVvfjSklG4UJOYfKBxOh5zY86IZ6eBkJ+nxijdAeJ
	 SOSw2G8BRTdcIPyFR4sNOiW3bHlEyn9QrdljYkdmx18AlFoVw/pVHlK8KHwJejbzVF
	 96uIMGKtJ35cbUiBlEYwYa8HSXNidMg8PPuzrACgCB6MXjdukrk5F1cOUaU+yiTWIl
	 7mTN794yKJ6Ww==
Date: Sat, 1 Nov 2025 13:59:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Amit Singh <quic_amitsi@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot'
 function for hpd gpio
Message-ID: <nzg7auudxocxnpnjsc2emot7sgh5azvucl72jqzgqsp4jhzint@hykb2xyx66uh>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031085739.440153-1-quic_amitsi@quicinc.com>

On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
> Currently, hpd gpio is configured as a general-purpose gpio, which does
> not support interrupt generation. This change removes the generic
> hpd-gpios property and assigns the edp_hot function to the pin,
> enabling proper irq support.
> 

No, it replaces the use of display-connector for hotplug detect with the
DP-controller's internal HPD logic.

There might be good reasons to do so, but you need to describe them.

I'm guessing that there are still some issues in the DP driver's logic
for handling of external HPD? This should be addressed by fixing that
logic in the DP driver, to ensure that this (display-connector +
hpd-gpios) works, and then you should send this patch again explaining
why the internal HPD hardware does a better job.

Regards,
Bjorn

> Fixes: 756efb7cb7293 ("arm64: dts: qcom: qcs6490-rb3gen2: Add DP output")
> Signed-off-by: Amit Singh <quic_amitsi@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index c146161e4bb4..caa0b6784df3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -49,8 +49,6 @@ dp-connector {
>  		label = "DP";
>  		type = "mini";
>  
> -		hpd-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
> -
>  		port {
>  			dp_connector_in: endpoint {
>  				remote-endpoint = <&mdss_edp_out>;
> @@ -1420,7 +1418,6 @@ &wifi {
>  /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
>  
>  &edp_hot_plug_det {
> -	function = "gpio";
>  	bias-disable;
>  };
>  
> -- 
> 2.34.1
> 

