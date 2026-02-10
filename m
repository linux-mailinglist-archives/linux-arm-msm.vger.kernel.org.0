Return-Path: <linux-arm-msm+bounces-92406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I4/Nk/LimmbNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637B117458
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7260D3007223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC70329BDBF;
	Tue, 10 Feb 2026 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="te3z+m8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931F22B5AC;
	Tue, 10 Feb 2026 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703690; cv=none; b=WPjKd6t+jTmvodey7Cj5Edg3hzY+SBjc3l4DWHxgI3z+wQLJ0bfc1wyXkTR93FBTnz+xKa+ykau+XC803A6F+6m9tJnqucdkpfqMy2TL1y0HJkSlz+/nMrQ4SLAMkoRDxe8uhiYjrpF0hHu4pZEss4X+1v/d5KVdn5sOCoqIqdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703690; c=relaxed/simple;
	bh=yEB+we77jei6NeNin4hjlX2lMwU6tG4XNQB8aDO+nM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqBc1kIqDsJXnH5jkrM4j5SCLXAo8UkPLnMkSwdMOJsIJqocsslRDf2qsGkxVWpsFzz0JnxaLh2Gg4Tq0laDc/Z4q9Z2koVDwuTWhv3Rc/eyv5UWc899Bmwg0y0akGfeM8G1lxo0vzSgOE/dn+sdSrDzeR20w/EV5oYaqxZEoDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=te3z+m8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1530FC116C6;
	Tue, 10 Feb 2026 06:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770703690;
	bh=yEB+we77jei6NeNin4hjlX2lMwU6tG4XNQB8aDO+nM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=te3z+m8zKLp6BpAJ9XkH5Lt6A75lAuun5KEtLtngmR0wtqOrJxTJ+vipb716i3uD2
	 NIx21fcMEeS8wq0BhrtOrXS+vW6S//TbUZcrz+tIUNYwrR+Vtao3w6o6OAT+p5KtVv
	 bPeSzQSfUpKTlzHPKHZd38Svy3JgvTRKR61jb9l3GsW5LP2Hb3qLEgr4KOlwmoL/1A
	 CQNbgpEjtgrkdAQCNY9kFUgc8ymQRcrbb7aZE2KFtd1DI9J2wq+X7lSPhyNv5DxHuo
	 jdwtEDNUMWEddb57ZLJUf3TVwWzHJ/ZgrieTeGUPEAtNGbYeZ9aDmCz/6Sy3uaipfh
	 lf7FHwqnADSjg==
Date: Tue, 10 Feb 2026 11:38:03 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Wu <michael@allwinnertech.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] tee: optee: prevent use-after-free when the client
 exits before the supplicant
Message-ID: <aYrLQznl-OCcWCtZ@sumit-xelite>
References: <20260209-fix-use-after-free-v4-1-7c4c4b02368f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-fix-use-after-free-v4-1-7c4c4b02368f@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92406-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0637B117458
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 06:47:39PM -0800, Amirreza Zarrabi wrote:
> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
> client wait as killable so it can be interrupted during shutdown or
> after a supplicant crash. This changes the original lifetime expectations:
> the client task can now terminate while the supplicant is still processing
> its request.
> 
> If the client exits first it removes the request from its queue and
> kfree()s it, while the request ID remains in supp->idr. A subsequent
> lookup on the supplicant path then dereferences freed memory, leading to
> a use-after-free.
> 
> Serialise access to the request with supp->mutex:
> 
>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>     looking up and touching the request.
>   * Let optee_supp_thrd_req() notice that the client has terminated and
>     signal optee_supp_send() accordingly.
> 
> With these changes the request cannot be freed while the supplicant still
> has a reference, eliminating the race.
> 
> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> Changes in v4:
> - Pre-allocate request ID when allocating the request.
> - Cleanup the loop in optee_supp_recv().
> - Update the return value for revoked request from -ENOENT to -EBADF.
> - Link to v3: https://lore.kernel.org/r/20260128-fix-use-after-free-v3-1-b0786670d927@oss.qualcomm.com
> 
> Changes in v3:
> - Introduce processed flag instead of -1 for req->id.
> - Update optee_supp_release() as reported by Michael Wu.
> - Use mutex instead of guard.
> - Link to v2: https://lore.kernel.org/r/20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com
> 
> Changes in v2:
> - Replace the static variable with a sentinel value.
> - Fix the issue with returning the popped request to the supplicant.
> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-a70d23bff248@oss.qualcomm.com
> ---
>  drivers/tee/optee/supp.c | 106 ++++++++++++++++++++++++++++++++---------------
>  1 file changed, 73 insertions(+), 33 deletions(-)

Looks like a reasonable fix to me but needs a reproducer where this
actually fixes the mentioned problem.

-Sumit

> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index d0f397c90242..c1ae76df7067 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -10,7 +10,11 @@
>  struct optee_supp_req {
>  	struct list_head link;
>  
> +	int id;
> +
>  	bool in_queue;
> +	bool processed;
> +
>  	u32 func;
>  	u32 ret;
>  	size_t num_params;
> @@ -19,6 +23,9 @@ struct optee_supp_req {
>  	struct completion c;
>  };
>  
> +/* It is temporary request used for revoked pending request in supp->idr. */
> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-EBADF))
> +
>  void optee_supp_init(struct optee_supp *supp)
>  {
>  	memset(supp, 0, sizeof(*supp));
> @@ -39,21 +46,23 @@ void optee_supp_release(struct optee_supp *supp)
>  {
>  	int id;
>  	struct optee_supp_req *req;
> -	struct optee_supp_req *req_tmp;
>  
>  	mutex_lock(&supp->mutex);
>  
> -	/* Abort all request retrieved by supplicant */
> +	/* Abort all request */
>  	idr_for_each_entry(&supp->idr, req, id) {
>  		idr_remove(&supp->idr, id);
> -		req->ret = TEEC_ERROR_COMMUNICATION;
> -		complete(&req->c);
> -	}
> +		/* Skip if request was already marked invalid */
> +		if (IS_ERR(req))
> +			continue;
>  
> -	/* Abort all queued requests */
> -	list_for_each_entry_safe(req, req_tmp, &supp->reqs, link) {
> -		list_del(&req->link);
> -		req->in_queue = false;
> +		/* For queued requests where supplicant has not seen it */
> +		if (req->in_queue) {
> +			list_del(&req->link);
> +			req->in_queue = false;
> +		}
> +
> +		req->processed = true;
>  		req->ret = TEEC_ERROR_COMMUNICATION;
>  		complete(&req->c);
>  	}
> @@ -93,6 +102,12 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>  	if (!req)
>  		return TEEC_ERROR_OUT_OF_MEMORY;
>  
> +	req->id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> +	if (req->id < 0) {
> +		kfree(req);
> +		return TEEC_ERROR_OUT_OF_MEMORY;
> +	}
> +
>  	init_completion(&req->c);
>  	req->func = func;
>  	req->num_params = num_params;
> @@ -102,6 +117,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>  	mutex_lock(&supp->mutex);
>  	list_add_tail(&req->link, &supp->reqs);
>  	req->in_queue = true;
> +	req->processed = false;
>  	mutex_unlock(&supp->mutex);
>  
>  	/* Tell an eventual waiter there's a new request */
> @@ -117,21 +133,43 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
>  	if (wait_for_completion_killable(&req->c)) {
>  		mutex_lock(&supp->mutex);
>  		if (req->in_queue) {
> +			/* Supplicant has not seen this request yet. */
> +			idr_remove(&supp->idr, req->id);
>  			list_del(&req->link);
>  			req->in_queue = false;
> +
> +			ret = TEEC_ERROR_COMMUNICATION;
> +		} else if (req->processed) {
> +			/*
> +			 * Supplicant has processed this request. Ignore the
> +			 * kill signal for now and submit the result. req is not
> +			 * in supp->reqs (removed by supp_pop_entry()) nor in
> +			 * supp->idr (removed by supp_pop_req()).
> +			 */
> +			ret = req->ret;
> +		} else {
> +			/*
> +			 * Supplicant is in the middle of processing this
> +			 * request. Replace req with INVALID_REQ_PTR so that
> +			 * the ID remains busy, causing optee_supp_send() to
> +			 * fail on the next call to supp_pop_req() with this ID.
> +			 */
> +			idr_replace(&supp->idr, INVALID_REQ_PTR, req->id);
> +			ret = TEEC_ERROR_COMMUNICATION;
>  		}
> +
>  		mutex_unlock(&supp->mutex);
> -		req->ret = TEEC_ERROR_COMMUNICATION;
> +	} else {
> +		ret = req->ret;
>  	}
>  
> -	ret = req->ret;
>  	kfree(req);
>  
>  	return ret;
>  }
>  
>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
> -					      int num_params, int *id)
> +					      int num_params)
>  {
>  	struct optee_supp_req *req;
>  
> @@ -153,10 +191,6 @@ static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	*id = idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> -	if (*id < 0)
> -		return ERR_PTR(-ENOMEM);
> -
>  	list_del(&req->link);
>  	req->in_queue = false;
>  
> @@ -214,7 +248,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>  	struct optee *optee = tee_get_drvdata(teedev);
>  	struct optee_supp *supp = &optee->supp;
>  	struct optee_supp_req *req = NULL;
> -	int id;
>  	size_t num_meta;
>  	int rc;
>  
> @@ -224,15 +257,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>  
>  	while (true) {
>  		mutex_lock(&supp->mutex);
> -		req = supp_pop_entry(supp, *num_params - num_meta, &id);
> +		req = supp_pop_entry(supp, *num_params - num_meta);
> +		if (req)
> +			break; /* Keep mutex held. */
>  		mutex_unlock(&supp->mutex);
>  
> -		if (req) {
> -			if (IS_ERR(req))
> -				return PTR_ERR(req);
> -			break;
> -		}
> -
>  		/*
>  		 * If we didn't get a request we'll block in
>  		 * wait_for_completion() to avoid needless spinning.
> @@ -245,6 +274,13 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>  			return -ERESTARTSYS;
>  	}
>  
> +	/* supp->mutex held and req != NULL. */
> +
> +	if (IS_ERR(req)) {
> +		mutex_unlock(&supp->mutex);
> +		return PTR_ERR(req);
> +	}
> +
>  	if (num_meta) {
>  		/*
>  		 * tee-supplicant support meta parameters -> requsts can be
> @@ -252,13 +288,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>  		 */
>  		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
>  			      TEE_IOCTL_PARAM_ATTR_META;
> -		param->u.value.a = id;
> +		param->u.value.a = req->id;
>  		param->u.value.b = 0;
>  		param->u.value.c = 0;
>  	} else {
> -		mutex_lock(&supp->mutex);
> -		supp->req_id = id;
> -		mutex_unlock(&supp->mutex);
> +		supp->req_id = req->id;
>  	}
>  
>  	*func = req->func;
> @@ -266,6 +300,7 @@ int optee_supp_recv(struct tee_context *ctx, u32 *func, u32 *num_params,
>  	memcpy(param + num_meta, req->param,
>  	       sizeof(struct tee_param) * req->num_params);
>  
> +	mutex_unlock(&supp->mutex);
>  	return 0;
>  }
>  
> @@ -297,12 +332,17 @@ static struct optee_supp_req *supp_pop_req(struct optee_supp *supp,
>  	if (!req)
>  		return ERR_PTR(-ENOENT);
>  
> +	/* optee_supp_thrd_req() already returned to optee. */
> +	if (IS_ERR(req))
> +		goto failed_req;
> +
>  	if ((num_params - nm) != req->num_params)
>  		return ERR_PTR(-EINVAL);
>  
> +	*num_meta = nm;
> +failed_req:
>  	idr_remove(&supp->idr, id);
>  	supp->req_id = -1;
> -	*num_meta = nm;
>  
>  	return req;
>  }
> @@ -328,10 +368,9 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>  
>  	mutex_lock(&supp->mutex);
>  	req = supp_pop_req(supp, num_params, param, &num_meta);
> -	mutex_unlock(&supp->mutex);
> -
>  	if (IS_ERR(req)) {
> -		/* Something is wrong, let supplicant restart. */
> +		mutex_unlock(&supp->mutex);
> +		/* Something is wrong, let supplicant handel it. */
>  		return PTR_ERR(req);
>  	}
>  
> @@ -355,9 +394,10 @@ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
>  		}
>  	}
>  	req->ret = ret;
> -
> +	req->processed = true;
>  	/* Let the requesting thread continue */
>  	complete(&req->c);
> +	mutex_unlock(&supp->mutex);
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
> 
> Best regards,
> -- 
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 

