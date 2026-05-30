Return-Path: <linux-arm-msm+bounces-110418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HUYF79CG2o4AgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:04:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F26132A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51ADE301982D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACE1C5F11;
	Sat, 30 May 2026 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWU0Ichv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291651C84BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171436; cv=none; b=jrKX9Y+2FqWgQl54my4IOTuU91NOm39D51dSi0Iw9UjWrWOiFk+fZIZX0yYOMgKbc5ha8OdGkdgulQKntEcq6FcFMM4I1KxVfvEbN/vQGuYVcthRFQ3/FFcV89vHogmEdDtB0AtTEdPLUsezcmtitaBCOP+Ic8Gv4U+1pxZ0JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171436; c=relaxed/simple;
	bh=JC2+iA4thvEu9S92k4NBo/Va6G5cJJKFnYN2fJZQmLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6o1n+PA51Zt8Z7ju0/X0F7x1iZ3QoILGxinXLVYcfVCKr5BUWJJvpoL1/+xMH8j5ytXs/1EVoWntDaXh8mudTk3r/9LZR8768+p4zDMyRIxbnobZhI+nMTbrH7lgR1Q349twoMAF6aLhcy+pmzjcQszC59vEbLu4CTVhweGzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWU0Ichv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22691F00893;
	Sat, 30 May 2026 20:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780171434;
	bh=0CWRdPzTGGm3IJusbFqUnaiFmZGynBYSVeLplXww+FM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kWU0IchvgcAPZh4J+Z87SGoeq7gt/9bxDyYU76VqHjCtjW6thUJP0bt+OTUFG70KX
	 eCKGwbJ67kGZr3gHaWtbPpWNOAtsrHUylmWtgdBAEsQmYQ7AbEzHIDQSTCcvFh5nAQ
	 c78gGgoVDPPHjHdOD8Xgesj7g6lnCB7JN32Q96u2eg5TTVpe+KvJWrabzfxND+Y2BP
	 uDBPhzCaWXunCpNlx4t0BXrTpsw2n9ryDU/VSPH7JYcTLBdVBOlx4Xb/HfJhtlmo7A
	 fLI+/T4wCyFLaTLD+dUbt5vL1cZXt/WMpUnnJIBo/6euK15DYoKZjM8qbLzViDDF6I
	 pX2sB3RLv0HzA==
Message-ID: <338485ec-41f5-4967-bac9-488dbcf7db1b@kernel.org>
Date: Sat, 30 May 2026 21:03:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH misc] misc: fastrpc: fix use-after-free on map->fl in
 device release
To: Zhenghang Xiao <kipreyyy@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
References: <20260526104243.27596-1-kipreyyy@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260526104243.27596-1-kipreyyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110418-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AC1F26132A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 11:42 AM, Zhenghang Xiao wrote:
> fastrpc_device_release() calls fastrpc_map_put() for each map without
> clearing map->fl, then frees the fastrpc_user (fl) structure. If a map's
> refcount is > 1 (held by a pending invoke context), the map survives
> with a dangling fl pointer. When the deferred workqueue later drops the
> context's last reference, fastrpc_context_free() -> fastrpc_map_put() ->
> fastrpc_free_map() dereferences map->fl->lock -- a use-after-free.
> 
> Detach maps from fl and clear map->fl in the release path before freeing
> fl. Also guard the FASTRPC_ATTR_SECUREMAP section in fastrpc_free_map()
> against NULL map->fl, since maps detached during release will have fl
> cleared.
> 

Thanks for the patch, have you tested this on linux-next this should be
fixed with
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=b01bf21ae7e7c4c7cd4f1c8419bafc1e04c008e4
?

--srini
> Fixes: 5bb96c8f9268 ("misc: fastrpc: Don't remove map on creater_process and device_release")
> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..3c7aec9e938e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -337,7 +337,7 @@ static void fastrpc_free_map(struct kref *ref)
>  	map = container_of(ref, struct fastrpc_map, refcount);
>  
>  	if (map->table) {
> -		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
> +		if (map->fl && (map->attr & FASTRPC_ATTR_SECUREMAP)) {
>  			struct qcom_scm_vmperm perm;
>  			int vmid = map->fl->cctx->vmperms[0].vmid;
>  			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS) | BIT(vmid);
> @@ -1598,8 +1598,11 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  		fastrpc_context_put(ctx);
>  	}
>  
> -	list_for_each_entry_safe(map, m, &fl->maps, node)
> +	list_for_each_entry_safe(map, m, &fl->maps, node) {
> +		list_del(&map->node);
> +		map->fl = NULL;
>  		fastrpc_map_put(map);
> +	}
>  
>  	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
>  		list_del(&buf->node);


