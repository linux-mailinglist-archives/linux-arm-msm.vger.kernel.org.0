Return-Path: <linux-arm-msm+bounces-92178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CXIOHAViWko2QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 00:00:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5F10A8C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACC6A3008756
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 22:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C90381703;
	Sun,  8 Feb 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7kKFMII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A3342C8F;
	Sun,  8 Feb 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770591597; cv=none; b=I5K1dE9868j2urR+fMq/XqjQ1FaADKOUk6rCwFXoH3LP5hQ4KBNy+1FTfL6dp7RCp0opxwCvQZRUXPLHiiSq/jSVoRQJIjL8H42okzrgyVpz4SWk9Gt8qtybJH8dIXfNmZU390R1+8dli9e7+3tQCgIkEVFRv7WAa0sk6fTOG2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770591597; c=relaxed/simple;
	bh=vrozi+Ia7SoQnbXsLpZ/HefKMDz8FKkknmXv/NhTnNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o23ljadQM/Eafr1V8z7H0QCLarpGHYrHl8be5d5Ab+0Q5SByTV8V+VXjBS8PUqYzPCPk1Vte9ay45eblOAlD7xi5MGJ430BiRtFCyC7RkaOc4G/8N+k+iiXVMwOysCX42VjstJDlAQbcxRKsl1mWaO4DpyhKKjMaMNpCBzzOpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7kKFMII; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62172C4CEF7;
	Sun,  8 Feb 2026 22:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770591597;
	bh=vrozi+Ia7SoQnbXsLpZ/HefKMDz8FKkknmXv/NhTnNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7kKFMIIt+HMPV/OgdLXgcRq5x8bbzlCVhDSz54ERsK2D3byzwIJiHGSom6k8hNjl
	 woSzGXskgodzqYXh0pUNsY+xCAE4oW9SRX/htCE6gsktOZTu+f0f2A9vNo3ILiVxql
	 dybEM5swVwOIx3OPmIGRGNlHPmFJ7QnCaquvp04FAB8ALNjfzsAXzmhe6+L+zvqScb
	 irqJ8qAQkTVX3TKoLPbrSqHsnEPYIHjgTMDhTFSQ8KM5nnUinU/XzpuZEOEGw64pnE
	 L0wb++ImugmoQjojTx6htP6FkqwN2eNuzXVwr7ueNfuew7d1eAHSHtTvyXFEnUFcYG
	 B6+0naDJeGZTw==
Date: Sun, 8 Feb 2026 16:59:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: webgeek1234@gmail.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Message-ID: <73mvlkbwem3rt7kd6udyenazfufgb4zkt2kggiihihincjc6ry@53ztcljmqxnd>
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92178-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31C5F10A8C5
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 07:16:03PM -0600, Aaron Kling via B4 Relay wrote:
> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> 
> ABL requires certain things in the base dtb to apply a dtbo.

What if I don't need/want a dtbo? Or are you referring to some specific
overlay that ABL attempts to apply?

> Namely:
> 
> * A label named qcom_tzlog must exist, but doesn't have to contain any
>   specific properties
> * The timer node must have a label named arch_timer
> 
> This aligns the sm8550 soc dtsi with those requirements. Without these
> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> the bootloader menu.
> 

I don't consider this to be a property of the SM8550 SoC, but rather
ABL shipping on specific devices - where ABL can't be replaced/fixed.

It's been a while since I booted SM8550 with the unmodified ABL (as I
always use abl2esp these days), but I don't remember having this problem
on the MTP...

Can we push this down to those specific devices that manifest this
problem and does not allow replacing ABL?

> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
> and fail back to the bootloader menu. There are two changes needed:
> 
> * Add a label named qcom_tzlog
> * Add a label named arch_timer to the timer node

You said that in the commit message.

Regards,
Bjorn

> ---
> Changes in v2:
> - Drop tz log changes
> - Add tz log label to a generic node
> - Link to v1: https://lore.kernel.org/r/20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..04ea1a4a015aa5a4fd615e068b6f18b7c336607c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -32,7 +32,8 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> -	chosen { };
> +	// This label is required by ABL to apply a dtbo
> +	qcom_tzlog: chosen { };
>  
>  	clocks {
>  		xo_board: xo-board {
> @@ -6756,7 +6757,8 @@ trip-point2 {
>  		};
>  	};
>  
> -	timer {
> +	// This label is required by ABL to apply a dtbo
> +	arch_timer: timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
>  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20260128-sm8550-abl-dtbo-96288634f00d
> 
> Best regards,
> -- 
> Aaron Kling <webgeek1234@gmail.com>
> 
> 

