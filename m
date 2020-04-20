Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A613B1B00CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 06:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgDTEoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 00:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgDTEoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 00:44:24 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD1CC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 21:44:24 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f8so3505914plt.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 21:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MJIP8pHcT300D54AAT1yN4S1w4viB7U9JXrFMLuLerE=;
        b=KQ6B7QT1vtZae/f6saQDPC1F+hKTVP9SjEi4M5AnDFpngSbILwyCEn89QG7jMCu5x2
         Wi5ynabHoI3D1XslyJUOkWDkMvs7GfzKLnialIPNjZw6bfo8WdcJ4VR/8gHbS/SUNSOq
         mPTULBkLJyw8ELtdNz7i1AelUej5/0q7yCJHgvEkvCgEbJRnCegzJuzFlY3xBauIThjp
         5kJBmdc9lL2Z88zDjhx2FREp9lFxBFvIhOFqNqhYywVpXi0tCqOuvLfIeC0HsfgZEUfA
         eawYMjg0CijPj+YtKHyQSFdtLAHWkftnZqZ60jUsx4ahla6kFttA0a89OZP07cu8Xuyx
         8Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MJIP8pHcT300D54AAT1yN4S1w4viB7U9JXrFMLuLerE=;
        b=N9sPBjAkD+kCMDfMCZ9KC8diP/z/kPe0e9htkvmw1Iaaaf8oiArfopEtGHOlKrEdn0
         r7/VeyiGh+Jwez4ko5X/THmMnwkOdiO5L1+7+oLEqWVm6pMX/IFE2ZoTYpmRSgOZIWeS
         70ZdJgNH2IieXdG1qB7rQHgjdOjn+tONPsdH1JfoSVdLRxdRD5Yl0V4+SOgLXyGVTZgp
         d9UlOq0Q5HJzdLhL1aYaqldd37qPFbfLmfg4+rD6CwP25rfTbY2cyRFZAsH2GD4IJUEg
         bhjPjj0ZPhYjcOz8Zag0DkY3wdEFTPp6PO+c7O4yj0uXC4pBE8s3CUlStar6TbSW+4kf
         yu2w==
X-Gm-Message-State: AGi0PuaBrNuJ14gl2UFTuSezqHOHovdeEmRUtxSnBG6AaD2BySclgVFJ
        Yfzg+gYFzYwdbArB69X4XsnJYA==
X-Google-Smtp-Source: APiQypLT4AnAfvIs1wxlQlpm/x0eJ78jMSVhHjboYPPzhpNJj5WX081j71YKvOptmveabL1vNLmO/Q==
X-Received: by 2002:a17:90a:1f8f:: with SMTP id x15mr7116967pja.76.1587357863366;
        Sun, 19 Apr 2020 21:44:23 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e26sm25887897pfi.84.2020.04.19.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 21:44:22 -0700 (PDT)
Date:   Sun, 19 Apr 2020 21:44:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, wsa@the-dreams.de,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: remove unneeded conversion to bool
Message-ID: <20200420044420.GG987656@yoga>
References: <20200420042816.18989-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420042816.18989-1-yanaijie@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 19 Apr 21:28 PDT 2020, Jason Yan wrote:

> The '>' expression itself is bool, no need to convert it to bool again.
> This fixes the following coccicheck warning:
> 
> drivers/i2c/busses/i2c-qup.c:960:48-53: WARNING: conversion to bool not needed here
> drivers/i2c/busses/i2c-qup.c:962:47-52: WARNING: conversion to bool not needed here
> drivers/i2c/busses/i2c-qup.c:1531:29-34: WARNING: conversion to bool not needed here
> drivers/i2c/busses/i2c-qup.c:1533:29-34: WARNING: conversion to bool not needed here
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/i2c/busses/i2c-qup.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 155dcde70fc9..25d5fe2f8316 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -956,10 +956,8 @@ static void qup_i2c_conf_v1(struct qup_i2c_dev *qup)
>  	u32 qup_config = I2C_MINI_CORE | I2C_N_VAL;
>  	u32 io_mode = QUP_REPACK_EN;
>  
> -	blk->is_tx_blk_mode =
> -		blk->total_tx_len > qup->out_fifo_sz ? true : false;
> -	blk->is_rx_blk_mode =
> -		blk->total_rx_len > qup->in_fifo_sz ? true : false;
> +	blk->is_tx_blk_mode = blk->total_tx_len > qup->out_fifo_sz;
> +	blk->is_rx_blk_mode = blk->total_rx_len > qup->in_fifo_sz;
>  
>  	if (blk->is_tx_blk_mode) {
>  		io_mode |= QUP_OUTPUT_BLK_MODE;
> @@ -1528,9 +1526,9 @@ qup_i2c_determine_mode_v2(struct qup_i2c_dev *qup,
>  		qup->use_dma = true;
>  	} else {
>  		qup->blk.is_tx_blk_mode = max_tx_len > qup->out_fifo_sz -
> -			QUP_MAX_TAGS_LEN ? true : false;
> +			QUP_MAX_TAGS_LEN;
>  		qup->blk.is_rx_blk_mode = max_rx_len > qup->in_fifo_sz -
> -			READ_RX_TAGS_LEN ? true : false;
> +			READ_RX_TAGS_LEN;
>  	}
>  
>  	return 0;
> -- 
> 2.21.1
> 
