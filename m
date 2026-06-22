Return-Path: <linux-arm-msm+bounces-114010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2aP3JLw8OWoopAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:46:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2646AFFBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:46:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ni93tuwk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114010-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114010-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA27C3059092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29623B38AB;
	Mon, 22 Jun 2026 13:42:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A5345CBF;
	Mon, 22 Jun 2026 13:42:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135740; cv=none; b=AYkcRYUGo3ndK62EpBGkm/oHKfA8uoZ1hkACGeRDHmMOzv45eAncRVtXvYOslD1hfIkZ1vyNntccLpXbVYUWt+fVP2VBKXPDXAkR/sXPlmmFJUL8t/NiwW7OuveSIEvtsK/xpP7WOaMrdhwP9dCoP5ls7zzQBplj/4YDOUUZHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135740; c=relaxed/simple;
	bh=wPs2KvIcrzxAfqFySRNk66FlQJWyRYYOYsEFmeCGzDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMc6TNBhb1q1UynZxXuF/LX9N1ZlaZBO/zy/cAD9dFOKcpaJnsoZ7aIFt5Yvfry6+hCq8RLDNUr0LneDRJHhKZBzP8B/AtzGtA6UP+GU+oebGDdyUFbjT+SOOKmL6FqBE7JXT4e0jLTyM5Xv1rRDtPVgejPGJKgl8iVcH/zk6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ni93tuwk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A54A1F000E9;
	Mon, 22 Jun 2026 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782135739;
	bh=FC/VBYU4oBVduK0L5ASsa1ThohOhgLydmEOiMbsObKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ni93tuwkHsNp9dRWNzSEJk/muSbISp48Wg5v+f81pcpNpSxlHzQt8xlHt0cP3Eafs
	 pw6LXSApGr9mVEBp9Tg2mIztdRfhGjIJaM+9u+Eo9/bU25laEXmaQZxww52wps6Jfh
	 pAaWXsVpzFT8LchKv6tLVXOFivRB9KP2nfJyJwWlrI+p4sjc0SztY9rMgfSdM1bZnR
	 Pf1XuLzmMHu5EP1XrBGPRbtbETwIvF+oadfnWIlTmzjfnn6GyQdWB+YGobXCB99ouY
	 1pw2MlckbKN8paILOwObzbbcsNScuwqzeHwWX1txDeiZwNWb+OOw9Y3oWibzRGVRvD
	 q7LensQSBnvdw==
Date: Mon, 22 Jun 2026 15:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory
 and update APM DAIs memory regions
Message-ID: <20260622-defiant-warthog-of-authority-d9d1ba@quoll>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114010-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A2646AFFBF

On Thu, Jun 18, 2026 at 05:05:09PM +0530, Ajay Kumar Nandam wrote:
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 88954ee943ef..d744f7e38ca6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -365,7 +365,14 @@ smem_mem: smem@86000000 {
>  		};
>  
>  		audio_heap_mem: audio-heap@86200000 {
> -			reg = <0x0 0x86200000 0x0 0x100000>;
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86200000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86240000 0x0 0x100000>;
>  			no-map;
>  		};
>  
> @@ -1935,7 +1942,10 @@ q6apmbedai: bedais {
>  
>  						q6apmdai: dais {
>  							compatible = "qcom,q6apm-dais";
> -							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;

There is no such line in next-20260619, which means this is some wrong
base.

Best regards,
Krzysztof


