Return-Path: <linux-arm-msm+bounces-81351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E51C5105E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C602A1897E89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670E328A3FA;
	Wed, 12 Nov 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3ykk909"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C2524F;
	Wed, 12 Nov 2025 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934035; cv=none; b=fx4jyTy3pcwl0cVZMWzBijYMjUlpVdOtLnXqZLl2B+yTErbtS9HaWnEgRLb7Wws/wGjIaOU02xVQxDYk77Tbb5wgBviI2c/9Ltw+t0CHhShgV5ucJovAkTn80sU8DFf8qhRazUXcGauXvmVmzyufkLF6ZdtTJxRjzcvu8/NPbx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934035; c=relaxed/simple;
	bh=oM0JeTTvUpqVY6SFAd/6+llHZkwzaZXqX1EM0V5i61Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko2Dl9YwH/kN0O6Vpc5XzQeubCtPcuC9yAImWsEAvq3t0EI9Mh1JgF3AHFCqP/Q01o4AMXV4ZGrTKXLND6Di43Ce1ONBfdsaGjgaXxE6UMfRp0d4aXMcnU5i0bmRYjsnjbOTE9YxpxR8OjXi4olheSYnUjwJdgakzSUz77nO2QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3ykk909; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782AAC116B1;
	Wed, 12 Nov 2025 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762934034;
	bh=oM0JeTTvUpqVY6SFAd/6+llHZkwzaZXqX1EM0V5i61Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3ykk909Mysh4N3z7D4b74Fiwo+i66kLpa9Gk4MJJucZiiQkGiXAJRDpm7RLQ+y7C
	 fEFbSS2BraQBbZ5W6nDY39FUCwggLwC6BRIDAfc3xjfcv0fGSaFJyVjaQBnoVbRGXj
	 FUaZ477gWDuFG1718n7/8Rn/llcYG63i2wUsPUYjemlGyMEKzAsnPiZR1mSuWRb1UY
	 FmoSvY90sZx7oI2NUQ8XMdcOUEVZ4Q/9k8ih7gUEGALZnz3SBv3xvKyNpaDWmY5ZAi
	 BYxhxFoP4upCxDa9SGBtTBXf1ohrbtICLSoO1tlVtD5oA7E+ILp4c2LwuECe7zaRti
	 DmrVflMm/08Rw==
Date: Wed, 12 Nov 2025 13:23:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Ally Heev <allyheev@gmail.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3] tee: qcomtee: fix uninitialized pointers with free
 attribute
Message-ID: <aRQ9DQ1Ncf4Iep4o@sumit-X1>
References: <20251111-aheev-uninitialized-free-attr-tee-v3-1-57905b913359@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-aheev-uninitialized-free-attr-tee-v3-1-57905b913359@gmail.com>

On Tue, Nov 11, 2025 at 01:26:42PM +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behavior as the memory assigned randomly to the pointer is freed
> automatically when the pointer goes out of scope.
> 
> qcomtee doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free`
> attribute in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
> Changes in v3:
> - fixed commit message and description
> - Link to v2: https://lore.kernel.org/r/20251110-aheev-uninitialized-free-attr-tee-v2-1-023ffba9ea0f@gmail.com
> 
> Changes in v2:
> - initializing variables to NULL at the declaration
> - Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com
> ---
>  drivers/tee/qcomtee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index ac134452cc9cfd384c28d41547545f2c5748d86c..65f9140d4e1f8909d072004fd24730543e320d74 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -645,7 +645,7 @@ static void qcomtee_get_version(struct tee_device *teedev,
>  static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  					  u32 *version)
>  {
> -	struct qcomtee_object_invoke_ctx *oic __free(kfree);
> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>  	struct qcomtee_object *client_env, *service;
>  	struct qcomtee_arg u[3] = { 0 };
>  	int result;
> 
> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
> 
> Best regards,
> -- 
> Ally Heev <allyheev@gmail.com>
> 

