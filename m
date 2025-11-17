Return-Path: <linux-arm-msm+bounces-82036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B792C62671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19D334E3F9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8A730C37C;
	Mon, 17 Nov 2025 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+TVnLiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E852E8B62;
	Mon, 17 Nov 2025 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357362; cv=none; b=qDrfdbcc0rkV0yDLZAnjxvMFeJtRBQRe9Sd7pYUE3E3hF2IOqkp8TspX3H/FbKHp4U9g0/rdqoPS8t9iP45mYz3bx6fq9tAfbxuZPTuRGg+LnG67C5ta8AkQsiAbAgs9Feb+DLEHqV3heTrhMzSvMBes9LidEwWKZqPdsHMIgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357362; c=relaxed/simple;
	bh=D4C8s3ogFo2WH2UtGwrimNp5R/LGGPPXFVIRCGScgqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAMLqquY2i2WkCS37mzHkLJsZc6JDz9i//L0TMgSlb2C2vTT4hB7R4bqUEA8MhMDeq8x8/HvD6UjBFVkAVAPum2753lkMl3kw0u1NAcwaGYJlYAwGAPoHLxAQfoc9kUO1wFd4OnQ9cJSXVFmJY2MtOdIzieKLTxjKDGovP1i8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+TVnLiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704B7C4CEF1;
	Mon, 17 Nov 2025 05:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763357361;
	bh=D4C8s3ogFo2WH2UtGwrimNp5R/LGGPPXFVIRCGScgqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+TVnLiWUjTx9G/xv9jPa/6wRSYN+RAE/E8U9ixzlmf5s0PWewG8StAl7iZaE2aNF
	 F7ZLExL4WPhQ3KHQ+11z/HA2wpHemvHL61Ey9sltk1PyayXF2aFHNZMy33Z5nrAxyx
	 YZCej09AWXAkWvoR8S0SHazkYNVhS7Rprmuy0O5xbIvHeP77UzhSpJxnQJkjLkGTRo
	 O4lHEGe2V/YGEQu5dBfEVEkARFoe1C0EXerpT5+UT2Ei4yOO8qBbpe3Wx83X/0Z2Vm
	 s3zpjZJ/Pd3Ka1x8+wfT+Pgwh91ee5SzfOhDqnwmPZ0RcDx39VKerkcHZaklLIGh4l
	 ss+JgwdHdPqqQ==
Date: Mon, 17 Nov 2025 10:59:16 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] tee: qcomtee: initialize result before use in release
 worker
Message-ID: <aRqyrIxcWk8tYYOi@sumit-X1>
References: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 07:38:42PM -0800, Amirreza Zarrabi wrote:
> Initialize result to 0 so the error path doesn't read it
> uninitialized when the invoke fails. Fixes a Smatch warning.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update subject to tee: qcomtee:.
> - Link to v1: https://lore.kernel.org/r/20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com
> ---
>  drivers/tee/qcomtee/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b6715ada7700..ecd04403591c 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_struct *work)
>  {
>  	struct qcomtee_object *object;
>  	struct qcomtee *qcomtee;
> -	int ret, result;
> +	int ret, result = 0;
>  
>  	/* RELEASE does not require any argument. */
>  	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
> 
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8
> 
> Best regards,
> -- 
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 

