Return-Path: <linux-arm-msm+bounces-66533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0D9B10AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3536218936D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC242D5406;
	Thu, 24 Jul 2025 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6hlbBnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FC1FECA1;
	Thu, 24 Jul 2025 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362521; cv=none; b=ihBuGqHu7HYQrkTNSvV9dwTfI+xlPZNELgVWR7vkA3fevVt24pOG1tfcc8fKPIEUKLIycmgSv5VfhoL5whiMYkQ3wV/Y6orFas1/g3yZ/2BPLZ5MpyzBQ1k6ibYf3PQ4gMBpr02RZU9cTW+Akf6DAggpR3ILTQW4vZsclteKpKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362521; c=relaxed/simple;
	bh=9/urdIbYiKqceWNkeAR0N6jpkuTxgmFHBasqqGfbxeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSQ5TWD9Bq+GGCZnRUKSMCETxdcD28YeLg1WRnnfuCvMmAAxPYrVN96z9yKL7N+k8K0n4us1Z8M+tM6/9s/ftwaXTNnS1HpxaTF7hnIyG9OAADZGw1r2QtrzrzzHB9L+iehemP05JXHaLv102bYpOSkRxj2yOTLbPCkT01OPOdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6hlbBnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8CFC4CEED;
	Thu, 24 Jul 2025 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753362521;
	bh=9/urdIbYiKqceWNkeAR0N6jpkuTxgmFHBasqqGfbxeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6hlbBnw4T17aGg15oV+WEBPuG0BpD7S2FkU6UDo40FKdL8L287PXZJ3b4E4G/I/H
	 DSqKNdPuaYjcEwR+NXkN4+bPm+zGC8yg7a5Ex6NKbDkOQjxvJN6i7t8Fyurf6TwACu
	 KRPiryi+OSthtziRg0vnsucaSwLrKZ3IBSSJxMvEkfCeCe5r8RXETb2Hu4v90WVld4
	 9MLbtzEaHwVSaK2kMM/njfs4qls+MzM5O062xxLCv/ZAtWaMPfozzErDopZpjbg98J
	 zWZuBg9H7A5DC4PDg4gJL2aV88i7LBYFdo8w5BhltN+Ltp81rhqwfcfA08fiMFub9/
	 vZI35l67FkULQ==
Date: Thu, 24 Jul 2025 14:08:36 +0100
From: Simon Horman <horms@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
	Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <20250724130836.GL1150792@horms.kernel.org>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>

On Thu, Jul 24, 2025 at 01:24:01AM +0200, Mihai Moldovan wrote:
> From: Denis Kenzior <denkenz@gmail.com>
> 
> Add support for tracking multiple endpoints that may have conflicting
> node identifiers. This is achieved by using both the node and endpoint
> identifiers as the key inside the radix_tree data structure.
> 
> For backward compatibility with existing clients, the previous key
> schema (node identifier only) is preserved. However, this schema will
> only support the first endpoint/node combination.  This is acceptable
> for legacy clients as support for multiple endpoints with conflicting
> node identifiers was not previously possible.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>

...

> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c

...

> @@ -465,19 +466,36 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
>   *
>   * This is mostly useful for automatic node id assignment, based on
>   * the source id in the incoming packet.
> + *
> + * Return: 0 on success; negative error code on failure
>   */
> -static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
> +static int qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
>  {
>  	unsigned long flags;
> +	unsigned long key;
>  
>  	if (nid == QRTR_EP_NID_AUTO)
> -		return;
> +		return 0;
>  
>  	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> -	radix_tree_insert(&qrtr_nodes, nid, node);
> +
> +	if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
> +	    nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
> +		return -EINVAL;

Hi Mihai, Denis, all,

This will leak holding qrtr_nodes_lock.

Flagged by Smatch.

> +
> +	/* Always insert with the endpoint_id + node_id */
> +	key = ((unsigned long)(node->ep->id) << QRTR_INDEX_HALF_BITS) |
> +	      ((unsigned long)(nid) & QRTR_INDEX_HALF_UNSIGNED_MAX);
> +	radix_tree_insert(&qrtr_nodes, key, node);
> +
> +	if (!radix_tree_lookup(&qrtr_nodes, nid))
> +		radix_tree_insert(&qrtr_nodes, nid, node);
> +
>  	if (node->nid == QRTR_EP_NID_AUTO)
>  		node->nid = nid;
>  	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
> +
> +	return 0;
>  }
>  
>  /**
> @@ -571,14 +589,18 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
>  
>  	skb_put_data(skb, data + hdrlen, size);

When declared, ret is assigned the value -EINVAL.
And that is still the value of ret if this line is reached.

>  
> -	qrtr_node_assign(node, cb->src_node);
> +	ret = qrtr_node_assign(node, cb->src_node);
> +	if (ret)
> +		goto err;

With this patch, if we get to this line, ret is 0.
Whereas before this patch it was -EINVAL.

>  
>  	if (cb->type == QRTR_TYPE_NEW_SERVER) {
>  		/* Remote node endpoint can bridge other distant nodes */
>  		const struct qrtr_ctrl_pkt *pkt;
>  
>  		pkt = data + hdrlen;
> -		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
> +		ret = qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
> +		if (ret)
> +			goto err;
>  	}
>  
>  	if (cb->type == QRTR_TYPE_RESUME_TX) {

The next portion of this function looks like this:

		ret = qrtr_tx_resume(node, skb);
		if (ret)
			goto err;
	} else {
		ipc = qrtr_port_lookup(cb->dst_port);
		if (!ipc)
			goto err;

If we get to the line above, then the function will jump to err,
free skb, and return ret.

But ret is now 0, whereas before this patch it was -EINVAL.
This seems both to be an unintentional side effect of this patch,
and incorrect.

Also flagged by Smatch.

...

