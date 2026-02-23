Return-Path: <linux-arm-msm+bounces-93725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMXkJi12nGmwHwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:45:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D7178F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0669E310B6BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C2E2F069D;
	Mon, 23 Feb 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWcvxJpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D852EBBA4;
	Mon, 23 Feb 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861261; cv=none; b=feqWx0VVSjjekKCgkLLdWG6wria99anQG5BQNthIkjBDNxKQ6QHD8NOJKM+p2pUBV0rzIeszTWLNq39Nx+R6pvHW51SuBQqEixEtS1mkvo7nelCzjfnNG1iYAdTZ9LfpMUIY8Jg6sHoCn6a8Cu2uGK0h+KlOksvtoREqjGo5R0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861261; c=relaxed/simple;
	bh=yA4mBo7fGhMG12irVzEGNMwje2lJuQcbwkfY4YvVV44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqcuubp1VOk+mNeG/hXyhm1OyG8Cnh08Ov+OZngibHGqoT4LdldFiO0Yho3o+rUA6Rufzya7U+mGIpctzw6HFcR3RKheBKTOElZnpz817165jG48JgprJQZnKz6+0QfWVZfDOUZ9OZnGjSxPDP6F7MSb+LYYAIe9eGeaoBM1/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWcvxJpi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B532C19423;
	Mon, 23 Feb 2026 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861261;
	bh=yA4mBo7fGhMG12irVzEGNMwje2lJuQcbwkfY4YvVV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWcvxJpiaQqHQEmK0BStnroMC4KVg2ZdPmCQRzfQr4Tg/f5YsHt/ZrGrlUP9cH552
	 AtW27uOD2HCDuiM/RzhEOYCJgGKcSDP1wFBKgzluC8p10Bc8etq2//OomL8ucqSf/9
	 iShgFaah33AAd8x8LK35J1yfOKHo56LKXlJuIIjcUr8Rflx6qt2NyZJh3k/vXEJSJx
	 nfcFQ5KYOzyQWB5pR9mySIsPQAAvN90/cSKS7KDq5BgORuIbxF+S72lDbu6Ry+cYOE
	 4F+OgzEMCepMqYokrl10V6tm1rPtRwHitlPIQSYAX1sz9JNenia2OJlORauhTHtJKZ
	 TMCVBf1n4bgmA==
Date: Mon, 23 Feb 2026 09:40:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power
 domain node
Message-ID: <g4gbzoh2nxoqp7fvrkpfxjpknf5zslxo5vy3qsicee62ilkj33@at22cyojpgaa>
References: <20260221105245.19328-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221105245.19328-1-daniel@quora.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93725-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 226D7178F98
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 06:51:56PM +0800, Daniel J Blueman wrote:
> At present, designs based on the Qualcomm X1 Hamoa reference platform have an always-on system power domain since the OF node values aren't implement.
> 
> Fix this by using the CPU C4, cluster CL5 and system DRIPS parameters from the ACPI DSDT Windows uses, together with the Low Power Idle _LPI minimum residency of 9000us and wake latency of 5000us as exit latency. Finally, assume the entry latency is the difference of these two values.

Please wrap your lines to 72 characters.

Regards,
Bjorn

> 
> Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.
> 
> Fixes: f33767e3cfa5 ("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..64338769bc85 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <4000>;
> +				exit-latency-us = <5000>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -448,7 +456,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  
> -- 
> 2.51.0
> 

