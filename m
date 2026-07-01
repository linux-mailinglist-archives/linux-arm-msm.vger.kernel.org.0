Return-Path: <linux-arm-msm+bounces-115791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k4UbDVV4RWoTAwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:28:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD16F176A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:28:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gy8FXnjR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D72E300C031
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6C73AD524;
	Wed,  1 Jul 2026 20:21:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096BF38F93B;
	Wed,  1 Jul 2026 20:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937265; cv=none; b=RHDYxkGPbhXmf7Wn+gQ+BA8Tc8yRchzD67YYX7X51Ma9yuNQacIBfykFcifndQVnT2mODlElXJXCHoEomxcurHGueVubE3Kis7ZqVn4CslJ1XRctlyyLVOJOTKPSKlqltDgPgOLKsp2RRO3xlgDhwV3e+VxPh/xqGaMJ3gojZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937265; c=relaxed/simple;
	bh=GFkU62V5NymGhsVjhfbw+4bqdlAqrkWoSmJCkEpC2Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etnGfEnV/mgdRH0ypeFx29mYMuu6e8OXpP/eZOVH84rQunsIMG9Oylm4wm0o0LyW2SAL0V8Rp96YN308p+v9jpfy8N2aJxPVz77IgfsXZnWqWjAf7LA+jbdwRiIXulXZn8k3wdH9QEse5ESK6zvjzC3CeS43PbUxt+rGfSsoMFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy8FXnjR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79931F000E9;
	Wed,  1 Jul 2026 20:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937263;
	bh=I1MrHWNoePasAF89bOFkx3E+DQzJNV1VoJf4OgB1Qys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gy8FXnjRj2EIDzXAefjnJ+gxN1nxuartvvuZijND8toXIyijlieTf93gnuO/zyl21
	 SDrHBf+HBAe5pIhmFjtdIlmDWOs7cs+kciFy6t4UujoXrOgd+G8Hyi3J7iN5k4padx
	 IA6dqBqqKvP+0MkK6H/EmTDLrluICUEJOO8VjvLXrIVIKBs9rFVDVSeNxYlrglZbrJ
	 ejK1AWp1lJ639oJi8hnuygEcF5coDuVzWpT1gN2RrJF7VuRSj0zJK4W3ZUgNCzlyyl
	 LhKnZIu7lind/cU1E86YCdlf62pTuAazNPCBjnGAAeLm/p3t2HgkQbo7tPmtRDdNEv
	 ifENFzG3opwag==
Message-ID: <6a7e3394-9dc7-4371-9935-47f3be8a59f4@kernel.org>
Date: Wed, 1 Jul 2026 21:21:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: create duplicate sessions after all CB
 probing
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
 Chenna Kesava Raju <chennak@qti.qualcomm.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
References: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115791-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vinayak.katoch@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85DD16F176A



On 6/9/26 11:33 AM, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To address this limitation, a Device Tree change was used till now:
>   qcom,nsessions = <5>;
> 
You should mark this property as deprecated in dt bindings.
Which should discourage people to use this property.


> However, feedback from the upstream community indicated that this change
> should not be made in the Device Tree. Instead, it was recommended to
> handle this as a driver-level change.

Changing it in driver will make it applicable for all the SoCs.

> 
> Instead of duplicating sessions inline during fastrpc_cb_probe() using
> the qcom,nsessions DT property, defer duplication until after
> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
> all compute-CB child nodes have been probed and the session array is
> fully populated.
> 
> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
> last probed session once of_platform_populate() succeeds. This keeps
> the per-CB probe path simple and ensures duplicates are always derived
> from a stable, fully-initialised session state.
> 
> The qcom,nsessions DT property is no longer consumed by the driver; the
> binding and DT sources are left unchanged.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..46afbae9c234 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -30,6 +30,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
>  	u32 dma_bits;
> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> -
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		dev_err(&pdev->dev, "too many sessions\n");
> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2445,6 +2433,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +		int i;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];

Why only for last session?

This is now un conditionally done for ADSP which changes the whole
behaviour.

> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260609-dup-sessions-ea2acaac1994
> 
> Best regards,


