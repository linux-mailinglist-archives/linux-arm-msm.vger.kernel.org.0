Return-Path: <linux-arm-msm+bounces-74122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC4B87E92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 07:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406E05629AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 05:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C681219A79;
	Fri, 19 Sep 2025 05:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igLixv5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1234BA4C;
	Fri, 19 Sep 2025 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758259268; cv=none; b=mCVV/EzOVu2+TeXAIhlumujowPHgo5e6ntdXKpzSvqJHkxpe1yBN4ax+vt5Sj1P1oPdhqueG0SCz9TxQ0tVxS/PKppHd5k4R5faFpjE1VZU3QkV2Sb3dGGiQhBqLNh6k9IF7yJjaCSkwpgn4cqeYDdvt1a7RZx6+zJelCKqNL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758259268; c=relaxed/simple;
	bh=T7nSh+shj7guGdolih7Yv5v9HrzkJVn157Nh6VJh8Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWhdLmOFLG3id6Sjm2fbQwJaX6Gey0TzjEY2OTpdnURp7IBdQTpOEISDMvsy0OLxsgshNrorRpnLwauY+Hl+xVYDcUSCRY52B+SjMmg/weo1SJEXuR66Tek+ptwEPjnFow+0ixlY5p8zf04OkXt3G+9+xxGmhBRANY/tZon5IoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igLixv5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AF0C4CEF0;
	Fri, 19 Sep 2025 05:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758259267;
	bh=T7nSh+shj7guGdolih7Yv5v9HrzkJVn157Nh6VJh8Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igLixv5H7kLt9hMkzcGGIBbYUNMAGH+D3As4VpYWKjN210BxqXmrQwIhbMp1zDOGv
	 UffJScAL3V9ytoeLEXRtG5MjVa19Vuda1M83ueSc7Poc3NvzwHizjEA44Kk607ADDy
	 HgVdqJRq9YMT3DN89JDb0NIObnGmPoLoenKeWynYhttdvG3mS81jD/iPFT6Y0WsxMG
	 wIFdaOu8HebttjbnqwrYOJ5PIJahua+jYd/VXGW6Dl7yoY/bX+xw+FKurtS+8F15CU
	 RQF3M1IadDYbHcz1YlBZlJ2ERV5pk2gesPbjF42k81/+bAeUqTzuTzPbN66/ElHiTb
	 ED4Un1P4J0stQ==
Date: Fri, 19 Sep 2025 10:51:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aMzoPc67ws5NMpKS@sumit-X1>
References: <aMvV4kK386Sni10i@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMvV4kK386Sni10i@stanley.mountain>

On Thu, Sep 18, 2025 at 12:50:26PM +0300, Dan Carpenter wrote:
> Re-order these checks to check if "i" is a valid array index before using
> it.  This prevents a potential off by one read access.
> 
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/tee/qcomtee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index cc17a48d0ab7..ac134452cc9c 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  	}
>  
>  	/* Release any IO and OO objects not processed. */
> -	for (; u[i].type && i < num_params; i++) {
> +	for (; i < num_params && u[i].type; i++) {
>  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>  			qcomtee_object_put(u[i].o);
> -- 
> 2.51.0
> 
> 

