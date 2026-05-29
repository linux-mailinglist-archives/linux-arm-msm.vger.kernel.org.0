Return-Path: <linux-arm-msm+bounces-110319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO8dL+/WGWqjzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:11:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA086071A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 20:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87260302BE1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF11390204;
	Fri, 29 May 2026 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWdPzf++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC938F630;
	Fri, 29 May 2026 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076302; cv=none; b=ks0ofYEEQ2I261kaIHlJbsYYlGpsDjLUkwHwTxvKz12rjP2/GQ5dHl33Z8RzNEAa9lEOI4Mny2qfedHAy6Q3MgBhtvqBIzO1KmzFQ+WQxA+Of9B4d9WOuiHM2FMPSgUApFRRXKbOXDXUDDrMeD+6hDJji+p4pIlCPpTDTtLkYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076302; c=relaxed/simple;
	bh=cmkxqSxtIDKahIbN1h44TcAFb3tO9nJLrFhtJRI2s5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW+8Mjhgq3Ggpx1yHvaAkCn+5+5J/SYwyFb3KD+BILc1sP9W79VCC1hWW0T2IJBqaMpfEIesxQOmWMEPl/B94gzt928a1Q/Y6RLS9/VFuTc9+O33CAIVL0Hc1s+pm0SzenlNz3k+IDysRV4bUJHXfuo+vmr+TJReYNIGxkM4Mdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWdPzf++; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF071F00893;
	Fri, 29 May 2026 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076301;
	bh=P/GJ+nOxf/TVyXP/2khmzVXEKgvkAXFYHGowDjyeIQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWdPzf++hmsqrd5XdRXF1X2lp0YhUFz7CNjNEsdQaQOyG8A+Q6QMLNa+T+/BkEt62
	 69+BtJ1FnwmAFZLSacCRNxcrzTAXWz1+II0ouZ0VUrOD95zA97IUe7H0KC20Xn3GfU
	 XDfC9DOV//349e5DuqRenO6ExOHZe1Dm4i7lJBT33Kvsj8qnGbxov7N4kZfd++DX6A
	 hyhKOlWYqNlBX4jGNKZTaXIaSedD4Bk0sHMu4NBsF/bL2M82vj+ipN82jSJvdrwy5B
	 oFHRE+vac09Rig5EN6EQj5Vr9kokWfsNVL5rw+/uoqlAn+09SIiqgdmRVf5lVwb4q4
	 IpAyV/3SfJbgg==
Date: Fri, 29 May 2026 19:38:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: fix node refcount leak on ctrl packet alloc
 failure
Message-ID: <54wyv42wcizvq3j6kadyecwr7csx4i72jzdnuea5bnjvpuqpll@ufmlxecdc3ka>
References: <20260528080019.1176700-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528080019.1176700-1-vulab@iscas.ac.cn>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110319-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 3FA086071A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 08:00:19AM +0000, Wentao Liang wrote:
> qrtr_send_resume_tx() calls qrtr_node_lookup() which takes a
> reference on the returned node. If the subsequent call to
> qrtr_alloc_ctrl_packet() fails due to memory allocation failure, the
> function returns -ENOMEM without calling qrtr_node_release() to
> release the node reference.
> 
> Add qrtr_node_release(node) before returning on the allocation failure
> path to properly release the reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: cb6530b99faf ("net: qrtr: Move resume-tx transmission to recvmsg")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  net/qrtr/af_qrtr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 7cec6a7859b0..c9f892427f7c 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -1009,8 +1009,10 @@ static int qrtr_send_resume_tx(struct qrtr_cb *cb)
>  		return -EINVAL;
>  
>  	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
> -	if (!skb)
> +	if (!skb) {
> +		qrtr_node_release(node);
>  		return -ENOMEM;
> +	}
>  
>  	pkt->cmd = cpu_to_le32(QRTR_TYPE_RESUME_TX);
>  	pkt->client.node = cpu_to_le32(cb->dst_node);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

