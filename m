Return-Path: <linux-arm-msm+bounces-74123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE5B87EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8D717CFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 05:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30331FF7BC;
	Fri, 19 Sep 2025 05:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6D6N0PI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB834BA4C;
	Fri, 19 Sep 2025 05:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758259323; cv=none; b=i8Ig85zrOap5R5XvIinl+UrJHqTP3Em/J+Su+vZ7tWByvvkQNQ1SBqszzLkbmCXufoahnaXNH/N0ieWKxsgZztWZz1Zf7gTDJXLl7Vrk7q2folJ8w166BL3eut2iRq7g11JiuNPS4TnHrRWtm/F1ofqqJVFNG23QNFefiy/OAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758259323; c=relaxed/simple;
	bh=aGuXua3RqBqMbkEsqs3c662eE1wX94ZzkiZiXLaHhzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROKRuoAH/Uzzdx5L4+sLskJqZr2YAz3EKMs5SFc3R12dDIQ8D2fYuLefuGTJEEn5OaGO6zVgpWv3ui2KbZ6HsURsEdA8q61VZYyQEIIROsFPIzsDcMr0X38z+k3/AR0rV4qYl9pO4e4CZije3M8Qgo/eCxnLPCO1I2sj6YSY89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6D6N0PI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F53C4CEF0;
	Fri, 19 Sep 2025 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758259322;
	bh=aGuXua3RqBqMbkEsqs3c662eE1wX94ZzkiZiXLaHhzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6D6N0PIhaCCFjsH08OGh0t8fxy+kTrdSXnJl8UqJ7CpLcYuL31JMz4XScQcA6CAr
	 SbY0YldCPFdK/lYnBHZIs9qmyefWPS5xXYPQfngKZTub05Q3lKvvYqhCmBjAF8ljGe
	 H885r+ZhMNKuKmB+peHYhXHLDihH1clX6FUtIFIdlA4eTTrAouFQqu8Q/vFqhSFeIu
	 IFjCnDkQcdye/T+TYw+5DMC14mKwakTDbd9QmTdoEIceelk9px8/0/5uAkTL6JUerk
	 IPB+FzfbZTSeARLRMQZ8nS88CYIz3LffHT/EGT7Qj/bc8Dh5U5Q7qYl/WQfpaZwt4t
	 XOEynmnopKDVw==
Date: Fri, 19 Sep 2025 10:51:56 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] tee: qcom: return -EFAULT instead of -EINVAL if
 copy_from_user() fails
Message-ID: <aMzodGIvL88HNi0d@sumit-X1>
References: <aMvV8WIKnqLN3w6R@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMvV8WIKnqLN3w6R@stanley.mountain>

On Thu, Sep 18, 2025 at 12:50:41PM +0300, Dan Carpenter wrote:
> If copy_from_user() fails, the correct error code is -EFAULT, not
> -EINVAL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/tee/qcomtee/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index 783acc59cfa9..b6715ada7700 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -424,7 +424,7 @@ static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
>  		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
>  			memcpy(msgptr, u[i].b.addr, u[i].b.size);
>  		else if (copy_from_user(msgptr, u[i].b.uaddr, u[i].b.size))
> -			return -EINVAL;
> +			return -EFAULT;
>  
>  		offset += qcomtee_msg_offset_align(u[i].b.size);
>  		ib++;
> -- 
> 2.51.0
> 

