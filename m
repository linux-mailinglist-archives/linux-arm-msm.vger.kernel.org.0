Return-Path: <linux-arm-msm+bounces-19820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6B8C4DD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 10:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8311F22B6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 08:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8DB1D555;
	Tue, 14 May 2024 08:43:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90991D54B;
	Tue, 14 May 2024 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715676188; cv=none; b=LhadBY+/7t/DnIDLW1JY9M9lHSZYgt83iPTMlgOzb07tC2H2FejbGAdtIESrvfrjPdrpBZ9RdsMTAZC1x1AxuSdY8tfIUm7tvxi8x8AD9ZADOw+zGXxtDTXGAI+o1VTDl66sumwq7zzyd7FU0IhsykOlVke0G9K6WW6dpCVZy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715676188; c=relaxed/simple;
	bh=Fljb2ROWbiju3hczRTFPhDqUN7rOS5RI6ewU7ldmI0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9Q8YGUkYGAEl5OGm/AlQp7uboPSGlLPaICaveOG8cd8Jjw7n9nJ8eQ3tZtmTcVjEsBo/wsi3CENmaaiWyYBCHySuWA0npJIMBqYdkLlC4fHmhsocU63pdu9NrhW++ljBONz4wkujyiL6nbhoUWQcUsuvcQEFXq/LQNp6SsHpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA347C2BD10;
	Tue, 14 May 2024 08:43:05 +0000 (UTC)
Date: Tue, 14 May 2024 10:43:03 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH] net: qrtr: ns: Fix module refcnt
Message-ID: <20240514084303.GD2463@thinkpad>
References: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>

+ Qiang (who also reported a similar issue)

On Mon, May 13, 2024 at 10:31:46AM -0700, Chris Lew wrote:
> The qrtr protocol core logic and the qrtr nameservice are combined into
> a single module. Neither the core logic or nameservice provide much
> functionality by themselves; combining the two into a single module also
> prevents any possible issues that may stem from client modules loading
> inbetween qrtr and the ns.
> 
> Creating a socket takes two references to the module that owns the
> socket protocol. Since the ns needs to create the control socket, this
> creates a scenario where there are always two references to the qrtr
> module. This prevents the execution of 'rmmod' for qrtr.
> 
> To resolve this, forcefully put the module refcount for the socket
> opened by the nameservice.
> 
> Fixes: a365023a76f2 ("net: qrtr: combine nameservice into main module")
> Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> This patch takes heavy influence from the following TIPC patch.
> 
> Link: https://lore.kernel.org/all/1426642379-20503-2-git-send-email-ying.xue@windriver.com/
> ---
>  net/qrtr/ns.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index abb0c70ffc8b..654a3cc0d347 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -725,6 +725,24 @@ int qrtr_ns_init(void)
>  	if (ret < 0)
>  		goto err_wq;
>  
> +	/* As the qrtr ns socket owner and creator is the same module, we have
> +	 * to decrease the qrtr module reference count to guarantee that it
> +	 * remains zero after the ns socket is created, otherwise, executing
> +	 * "rmmod" command is unable to make the qrtr module deleted after the
> +	 *  qrtr module is inserted successfully.
> +	 *
> +	 * However, the reference count is increased twice in
> +	 * sock_create_kern(): one is to increase the reference count of owner
> +	 * of qrtr socket's proto_ops struct; another is to increment the
> +	 * reference count of owner of qrtr proto struct. Therefore, we must
> +	 * decrement the module reference count twice to ensure that it keeps
> +	 * zero after server's listening socket is created. Of course, we
> +	 * must bump the module reference count twice as well before the socket
> +	 * is closed.
> +	 */
> +	module_put(qrtr_ns.sock->ops->owner);
> +	module_put(qrtr_ns.sock->sk->sk_prot_creator->owner);
> +
>  	return 0;
>  
>  err_wq:
> @@ -739,6 +757,15 @@ void qrtr_ns_remove(void)
>  {
>  	cancel_work_sync(&qrtr_ns.work);
>  	destroy_workqueue(qrtr_ns.workqueue);
> +
> +	/* sock_release() expects the two references that were put during
> +	 * qrtr_ns_init(). This function is only called during module remove,
> +	 * so try_stop_module() has already set the refcnt to 0. Use
> +	 * __module_get() instead of try_module_get() to successfully take two
> +	 * references.
> +	 */
> +	__module_get(qrtr_ns.sock->ops->owner);
> +	__module_get(qrtr_ns.sock->sk->sk_prot_creator->owner);
>  	sock_release(qrtr_ns.sock);
>  }
>  EXPORT_SYMBOL_GPL(qrtr_ns_remove);
> 
> ---
> base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
> change-id: 20240508-fix-qrtr-rmmod-5265be704bad
> 
> Best regards,
> -- 
> Chris Lew <quic_clew@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

