Return-Path: <linux-arm-msm+bounces-85084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A29CB77D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2F7B301E5B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 00:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A034246BB9;
	Fri, 12 Dec 2025 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjzBSwah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31009246762;
	Fri, 12 Dec 2025 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765500930; cv=none; b=nS/jxCSMrnDtbpjVAVDKfTzFKSdm++IxiWbATKB7SiJ+LV1YSkBMpZpoRLat16QTw4Kc3+T8Kb02rZc3qkouHPu6s1FX62Fe97amkFFZKZP8mjZBCy5f4OijAUF9+flvw9aw7yJnJYzlhV7UBPjxe+YUqUB6QjrJ2DXpmpktn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765500930; c=relaxed/simple;
	bh=ImNiUJg9EtXcUshmWqXKE8CX1Seb/doZFlOMj0aesag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QL9R4YcAirPfDrfBolPt6iWYBBYB5lY0ZNXUI/2EJoEnXxo327wD7AR9p0NpqOkfU/U7eifnUPooc7p1DqASvEr9PpbmahvxBFvwyicY7aXSvsDGCJY2mTIwYbeE71DEQASImuIhFQG5ReNU8vge+2mwpuz/FqcW3Jq7fBf8GVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjzBSwah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26265C4CEF7;
	Fri, 12 Dec 2025 00:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765500929;
	bh=ImNiUJg9EtXcUshmWqXKE8CX1Seb/doZFlOMj0aesag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjzBSwahr1WYnQkSMxhNcq3KXkm9k4+BcQKk4iKKm75+eBjmj0hNJ7X510XvwFMIH
	 zv8iqY33hJyGA8kELK6fIjy9sQwnELpxZvw7Geq8W913rCk8PTqYOHKICuc4MQWfy7
	 mXYkDujbs66Ld/fZTGurUaqTb6g5peENujt5OG+vKN+fBndoRwIBjR5dlGAP309R3j
	 OXM1fxGHWjN28Ce2MV3snluLG9PBAHCxcmCI02X3xqfNKgNv45ydg/j7hW2orHzURR
	 lop8Sr644vAEN8ySbD89aZmAzyUOJ1vGI6mS/0Opz04/I8DMjlJkJ4SfAQ3D4Sump8
	 wfD5V1cc7J9vg==
Date: Fri, 12 Dec 2025 09:55:23 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
Message-ID: <aTtn-x0hh18V7n7J@sumit-X1>
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com>

On Mon, Dec 08, 2025 at 03:08:45AM +0100, Krzysztof Kozlowski wrote:
> Initializing automatic __free variables to NULL without need (e.g.
> branches with different allocations), followed by actual allocation is
> in contrary to explicit coding rules guiding cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem the
> recommendation is to always define and assign variables in one statement
> and not group variable definitions at the top of the function when
> __free() is used."
> 
> Code does not have a bug, but is less readable and uses discouraged
> coding practice, so fix that by moving declaration to the place of
> assignment.

Okay I see but..

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 65f9140d4e1f..8f8830f0df26 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -395,9 +395,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  				 struct tee_ioctl_object_invoke_arg *arg,
>  				 struct tee_param *params)
>  {
> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>  	struct qcomtee_context_data *ctxdata = ctx->data;
> -	struct qcomtee_arg *u __free(kfree) = NULL;
>  	struct qcomtee_object *object;
>  	int i, ret, result;
>  
> @@ -412,12 +410,14 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  	}
>  
>  	/* Otherwise, invoke a QTEE object: */
> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx);
>  	if (!oic)
>  		return -ENOMEM;
>  
>  	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
> -	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
> +	struct qcomtee_arg *u __free(kfree) = kcalloc(arg->num_params + 1, sizeof(*u),
> +						      GFP_KERNEL);

..this makes the code less readable with variable declarations floating
within the function. I would rather favor to not use the cleanup.h construct
but use explicit kfree() invocations instead like it's done in all other
allocations in the TEE subsystem.

-Sumit

>  	if (!u)
>  		return -ENOMEM;
>  
> @@ -562,9 +562,8 @@ static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
>  
>  static int qcomtee_open(struct tee_context *ctx)
>  {
> -	struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
> -
> -	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
> +	struct qcomtee_context_data *ctxdata __free(kfree) = kzalloc(sizeof(*ctxdata),
> +								     GFP_KERNEL);
>  	if (!ctxdata)
>  		return -ENOMEM;
>  
> @@ -645,12 +644,12 @@ static void qcomtee_get_version(struct tee_device *teedev,
>  static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  					  u32 *version)
>  {
> -	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>  	struct qcomtee_object *client_env, *service;
>  	struct qcomtee_arg u[3] = { 0 };
>  	int result;
>  
> -	oic = qcomtee_object_invoke_ctx_alloc(ctx);
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> +		qcomtee_object_invoke_ctx_alloc(ctx);
>  	if (!oic)
>  		return;
>  
> -- 
> 2.51.0
> 

