Return-Path: <linux-arm-msm+bounces-99572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNTxJ4RJwmnvbAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:21:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E529304804
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06B8C31DDDD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066C83B8933;
	Tue, 24 Mar 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+35JLS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483DC3B389F;
	Tue, 24 Mar 2026 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339125; cv=none; b=FRgJZ9U6XstzPgdka1/8edvXNNxyAH+qhaEkxE7JrL3skSCHf6k2+NFNUs0dfDi9ympGFGMlift6TRy5+Zl2ur0xRcnYhESSivGgXnrFfRZxEHd+Dm1Vf0mfkh5Ru7apOAyJkvhb0jaBPJLOxjwJnW055M8sdxuHccawjr0BYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339125; c=relaxed/simple;
	bh=IoO4oixgKrhyoDjOoRkC2RAB6BsAex2YlHMO0ODROGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUGZ3BvsyQWGa65LQEEDEzhLsX+6TeQweejzPQNLyEhTYivfFdHx2Hy7zJSjLcstVS75+/RnazcfvIurr61dDnzXD5OC1EArhjucflGzEv1qexrevMOBl/HKQJLDe3QpQkHZP+JQ1WrqiZE9WNDKMiJR8zER/bYIkFW8QmGg0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+35JLS+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE55C19424;
	Tue, 24 Mar 2026 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774339124;
	bh=IoO4oixgKrhyoDjOoRkC2RAB6BsAex2YlHMO0ODROGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+35JLS+/Q5OVGIFzDTYSX93Zm/Yq0MhQVWriQpDj4Qd1O06YEUpwMl3iLsvzxzki
	 ZeTuVIHwZt1xh3ktbKq+VC12zfswHCLGmu+YwcXKD2EkJeve90vAiI7BsW+h5sTITq
	 93qBS23AAPvAeNqat4dcyLZ2/6kbfkMKhmM+1YevEZ3AlyU/FhZjj7T17gxqIAhVyo
	 aNA1GHEz9Q/LKi2J1EdGourcaRa3x9gh8hj/FtqegXnza/rpnLtNs2Y+sHpjqlQpMo
	 +hv/kk/TkdF0+zGkSHc0xpwNHoTvEMo6jjTlvHM2w1v/Y14FM+I4n7HEoshZB31Gq4
	 r+SQDhT+fe2Vg==
Date: Tue, 24 Mar 2026 13:28:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: fix endian handling of confirm_rx field
Message-ID: <jwqcbxfhnzbxn3iwvoe3shtfttio2pjsah3pkwknzqvjx4xfp5@nmfkkgrjxkhk>
References: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99572-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,westermo.com:email]
X-Rspamd-Queue-Id: 1E529304804
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 08:50:33AM +0100, Alexander Wilhelm wrote:
> Convert confirm_rx to little endian when enqueueing and convert it back on
> receive. This fixes control flow on big endian hosts, little endian is
> unaffected.
> 
> On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> in native endianness, so the conversion isn’t strictly required here, but
> it is kept for consistency and clarity.
> 
> Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> Changes in v2:
> - Rebase on latest net tree
> - Improve commit message
> - Link to v1: https://lore.kernel.org/r/20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com
> ---
>  net/qrtr/af_qrtr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 55fd2dd37588..bea1f1720e7f 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -365,7 +365,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	}
>  
>  	hdr->size = cpu_to_le32(len);
> -	hdr->confirm_rx = !!confirm_rx;
> +	hdr->confirm_rx = cpu_to_le32(!!confirm_rx);
>  
>  	rc = skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
>  
> @@ -466,7 +466,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  		cb->type = le32_to_cpu(v1->type);
>  		cb->src_node = le32_to_cpu(v1->src_node_id);
>  		cb->src_port = le32_to_cpu(v1->src_port_id);
> -		cb->confirm_rx = !!v1->confirm_rx;
> +		cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);
>  		cb->dst_node = le32_to_cpu(v1->dst_node_id);
>  		cb->dst_port = le32_to_cpu(v1->dst_port_id);
>  
> 
> ---
> base-commit: 70b439bf06f6a12e491f827fa81a9887a11501f9
> change-id: 20260324-b4-qrtr-fix-confirm_rx-on-big-endian-ee2b9637d265
> 
> Best regards,
> -- 
> Alexander Wilhelm <alexander.wilhelm@westermo.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

