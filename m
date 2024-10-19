Return-Path: <linux-arm-msm+bounces-35070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6EC9A4C7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 11:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C44C0B22990
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 09:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96071DE4D9;
	Sat, 19 Oct 2024 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkWHmSge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE871BE852;
	Sat, 19 Oct 2024 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729329502; cv=none; b=V34S68rLBxo2cJWlsuRThfddW3Md90x//aIoU00EFlX9l6E21MhrZlQyBBEW+l1jiHrGmCTKksKxSVx+/ATea2KhnvzpR8ZeQTD1Rl+sTMnqo+/BCb9uwH82iBUa27dINbusijy6MwTrYYAoYYjYlBnENZ8Gk2gxM0Dkzj3SL+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729329502; c=relaxed/simple;
	bh=K7s08afJ/t8NUdIaTaTP/yhBBkCgPkJGXscU2wSCvXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/kmX2bIyuJmaYni+f7qUWNhFAJgMgzlNWedxfSu2HhWuMtX4h3NihWjKRh4QYWOpjbk7Bf6coQGSyobDZFtwAOCDAE3U48HwlOmFHDK+igpo3cwK//jOdltVp/PbfKXJLCmnWkUA/snGkfS9hVEuSzpEL0P3Dj8jHHVFC4zNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkWHmSge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5C7C4CEC5;
	Sat, 19 Oct 2024 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729329502;
	bh=K7s08afJ/t8NUdIaTaTP/yhBBkCgPkJGXscU2wSCvXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkWHmSgee0v6k/ByVzu7wkIl+b8hU5gqcyikDkQi8/FtBYryjFFiDXMt5HXZgzufB
	 wEc8URYsOCQ0cV/JqeTSgU/b5ZA4mM0+dt0dVSssmFPCj60jJKVKrSfluvUwR3Ldq0
	 u9ls37nth0iW75rNKpwlVw98gqQPFsa8scubhNVSvDYngfwlUrDWMS4fEcI1wEjoLq
	 MAdaOCoq8MBazccgzaPbmf9xA9/ZwqEHaAW0Ttv/vEIXz1/5NkekvLb6/M16LB+eGI
	 AH3/9SVhTDWhLFoqEtiG55eYwtQa9ASW8Ew3X9tJw9rj3pw1fSj8GPYQflj7UIVNqH
	 iv5K3R7RzA5jA==
Date: Sat, 19 Oct 2024 10:18:17 +0100
From: Simon Horman <horms@kernel.org>
To: Denis Kenzior <denkenz@gmail.com>
Cc: netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 03/10] net: qrtr: support identical node ids
Message-ID: <20241019091817.GR1697@kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-4-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018181842.1368394-4-denkenz@gmail.com>

On Fri, Oct 18, 2024 at 01:18:21PM -0500, Denis Kenzior wrote:
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
> ---
>  net/qrtr/af_qrtr.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index be275871fb2a..e83d491a8da9 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -418,12 +418,20 @@ static struct qrtr_node *qrtr_node_lookup(unsigned int nid)
>  static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
>  {
>  	unsigned long flags;
> +	unsigned long key;
>  
>  	if (nid == QRTR_EP_NID_AUTO)
>  		return;
>  
>  	spin_lock_irqsave(&qrtr_nodes_lock, flags);
> -	radix_tree_insert(&qrtr_nodes, nid, node);
> +
> +	/* Always insert with the endpoint_id + node_id */
> +	key = (unsigned long)node->ep->id << 32 | nid;

Hi Denis,

On systems with 32-bit longs, such as ARM, this will overflow.

> +	radix_tree_insert(&qrtr_nodes, key, node);
> +
> +	if (!radix_tree_lookup(&qrtr_nodes, nid))
> +		radix_tree_insert(&qrtr_nodes, nid, node);
> +
>  	if (node->nid == QRTR_EP_NID_AUTO)
>  		node->nid = nid;
>  	spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
> -- 
> 2.45.2
> 
> 

