Return-Path: <linux-arm-msm+bounces-112359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lzdcHb0mKWpfRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:56:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7126677FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g1Sg4Hv0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112359-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112359-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59B53309863E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938C3BB695;
	Wed, 10 Jun 2026 08:52:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9743B3BF3;
	Wed, 10 Jun 2026 08:52:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081553; cv=none; b=La2KS+xX6SY24P9cpjr/KJC3BUY2fLdGnXfdnJcY+2FMFFwc3lA5it4EdNmBUu6gD7LXFiBze+DLTthRxcvg5S4svJ8tVbtYh41hyFRPuO4O/nmyZJerZZ1To0cH9+cnx94QwXcJZpDreFaPfKP39LD0SyW0wLbJ7kZ/uvjcyVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081553; c=relaxed/simple;
	bh=u0LR3SYBuJwgYvGP2OXBUhsRu4xYAEjv/Q7ZAW6n3Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLuesfTARL6zaQVmo9mfJYueQSOZqKIcmG7rWT3tV0R0+GOzOSzFj5THCs5EnE8t7JZPX7VVdAvgjYu75n49l+k6bHHKdf+BkUVuS81SZh+LqERna2B+H7EtMSZ4g/YNc76VQ6cAPePwxaViduSlECc4FbKHSnPAaptuNsCKDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1Sg4Hv0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1EF1F00898;
	Wed, 10 Jun 2026 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081551;
	bh=5SzetJXMUGhRXQho0GH8amXNhAhLSHfKjTR6z8oRNaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1Sg4Hv0x1UnnI0PXZYe2GZxhEJoKoru2hzNyElmeTI/Horl+nCScUhAWcxMV0CMx
	 hD2pOgzlhNgpEOTriq9KZY20m2uYsoKT9s1zrtcnGVGsfe5PerGkn+GRw0ryu6aCDu
	 WCqIuUyohZz1x/M4DAXL4c63Td06IIkfTrU/RSBAtmh3xkG/j6qHLc3K1YwIEIh4TJ
	 WMlkZsaaXvw3Dp4djKJNVNp9nbCf6qVxCaUi66ZUJ1u3T/2HF1ePegzde9Es0ocbV4
	 YSD4NvIrLpdDuUMfbmzdudc9VK9em9nea2ylUoqCDiEs0KCbl3++x1L0/ihn7fARb1
	 t7RkNiB9nT5UA==
Date: Wed, 10 Jun 2026 10:52:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: Re: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Message-ID: <20260610-goat-of-pragmatic-imagination-2ee30f@quoll>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:mpratyus@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112359-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F7126677FF

On Tue, Jun 09, 2026 at 12:10:38PM +0530, Ajay Kumar Nandam wrote:
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 04892fb4423f..15ca51ce33b8 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -71,8 +71,9 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>  		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
>  	}
>  
> -	struct gpr_pkt *pkt __free(kfree) =
> -		audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
> +					    opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID,
> +					    audioreach_gpr_dest_domain(gdev));

I don't understand why you are making all these changes - code is not
readable.

>  	if (IS_ERR(pkt))
>  		return PTR_ERR(pkt);
>  
> @@ -112,9 +113,10 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
>  	struct prm_cmd_request_rsc *req;
>  	gpr_device_t *gdev = prm->gdev;
>  
> -	struct gpr_pkt *pkt __free(kfree) =
> -		audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0,
> -					 gdev->svc.id, GPR_PRM_MODULE_IID);
> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*req),
> +					    PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
> +					    GPR_PRM_MODULE_IID,
> +					    audioreach_gpr_dest_domain(gdev));

Best regards,
Krzysztof


