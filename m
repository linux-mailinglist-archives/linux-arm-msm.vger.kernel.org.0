Return-Path: <linux-arm-msm+bounces-81179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357EC4BB9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6DFB3A246B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FEC32E75E;
	Tue, 11 Nov 2025 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHj0fVFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EE32D421;
	Tue, 11 Nov 2025 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843599; cv=none; b=QbTzBVDwAtPlKCDPHe8cdTfOIUh+h2Q8PQyPonaMl+V7SnutY29vp5zcrzONtMme5HEJRm0Hkebw+pRaVJYNZeu1uqb0IGBB3USrhhl1gPkMAcJ+babiNeRL6iXkXPBjP4VjJGvnZDUDGRrHOd/kYxrRS83wDxZNdTYj+iW4rJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843599; c=relaxed/simple;
	bh=S8NL42wQ9BP/YnBr2kNkscTRPs3arYtcaxRYzrae+28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjMLTuipFgExHtnKMYq3DoZGxQdkBY8oYPocb0VZcF8Rp9La43pL9SYuTQitL/G2zyhbJryxft93MhL7ofopVxXpoyvfZwKz9EZHpSNA5cUaMc7G55OVJFe8mVQRGkSn2eSZCYGd8XzN+3M+243rnEykzWbi7gXOC6m1Jat131E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHj0fVFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB37C116D0;
	Tue, 11 Nov 2025 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762843599;
	bh=S8NL42wQ9BP/YnBr2kNkscTRPs3arYtcaxRYzrae+28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHj0fVFM0JMpXzeg92ClDm8ztAFvZ3XoCd4IeyozoD6bTmKO9945kho/d3oD86VDv
	 eLrywXMONm7KBHc1m8qFz4xJrpjUq+89IH1y4kAZdQgPzZ++hDr8mF8H2FGb3NsCbz
	 ZsGXYaVmOdFSnkZaHrnV00bvzcqRViYAZcgJ091QsN31DglGf40IgRM9Zwrv+z72pp
	 O7W7qIyCgaz4XCB0Pez0MwNiw46t4ZfE+CsCkKmSp4xqtjGxUcmTSxRc0kY8zjGPMc
	 pNTQFFgJHLJzrCMdw5B8kZMlKQ1Q4j1ISqYdw2KNDe9V8Pv4h+cTrHMaDxcENCNnWU
	 /BIbWO6QStHMw==
Date: Tue, 11 Nov 2025 12:16:34 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Ally Heev <allyheev@gmail.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] tee: fix uninitialized pointers with free attribute
Message-ID: <aRLbymGzR-dTAjco@sumit-X1>
References: <20251110-aheev-uninitialized-free-attr-tee-v2-1-023ffba9ea0f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-aheev-uninitialized-free-attr-tee-v2-1-023ffba9ea0f@gmail.com>

On Mon, Nov 10, 2025 at 08:47:30PM +0530, Ally Heev wrote:

For the subject, try to follow the convention:

tee: qcomtee: fix ...

> Uninitialized pointers with `__free` attribute can cause undefined
> behavior as the memory assigned randomly to the pointer is freed
> automatically when the pointer goes out of scope.
> 
> tee doesn't have any bugs related to this as of now, but

s/tee/qcomtee/

> it is better to initialize and assign pointers with `__free`
> attribute in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
> Signed-off-by: Ally Heev <allyheev@gmail.com>
> ---
> Changes in v2:
> - initializing variables to NULL at the declaration
> - Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-tee-v1-1-2e1ee8483bc5@gmail.com
> ---
>  drivers/tee/qcomtee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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

The change itself looks fine to me.

-Sumit

> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251105-aheev-uninitialized-free-attr-tee-0221e45ec5a2
> 
> Best regards,
> -- 
> Ally Heev <allyheev@gmail.com>
> 

