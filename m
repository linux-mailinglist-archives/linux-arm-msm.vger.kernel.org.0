Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A84D69BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 21:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiCKU4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Mar 2022 15:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiCKU4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Mar 2022 15:56:06 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237391E374B
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 12:54:53 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso11868739oop.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Eb4lJ/gRDGHQtzxeJ/n15BUoLk+AfXEc1aV/y6NJFo=;
        b=mD6CQw0YWd3H8i8Emv3nPIRx2chGxuqbAk1C75U0CqzBBTn9zloG/aU5nIwgWuMjxc
         UNkPmd8Pwd4Duvvp6MIgSvRF6LPOgQQ8aG12+/IS04ubDMbb1ZXfGGjaA+V2hEqhdMsF
         L7Iw19u8joHut2ekiM4dK6FMbRZ4wGH6jP3ps9KWjKXPkFzGEMw/DcjRDwxmpRY0vZE2
         qOEDk0a1Bh8kjMzxvUa+36rTE9pdSV+DJ8IfrmBQhLYiJucMJEXg+S7RYm8+h5JukFhL
         IC0hP3TnWoHw+wu0sPhi7zeITEXSB32A3lFsLhZ5MxwhDSvp5v6S+59ACGi6RfgRkEHh
         7klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Eb4lJ/gRDGHQtzxeJ/n15BUoLk+AfXEc1aV/y6NJFo=;
        b=bBGmpNFCzqJvAVhlvc1tAEi54rQX9mA8rId4Ely+LrYaMGQnIynT/0bfoU/YHEOG8u
         etcsSFsPGa+Sdq4Qwqq+mW/b4+OgixcLBuQeoFTJpyth9urHzdQWq4W/XVRaRfxKp6HS
         xuBoJa9edciIH0ShBlXGOg3f+7QJOwDxO01Mlm6z85FWAtWrVEqPaElG2RfRNsbi9pTH
         0ogRLIoHVs4a+NM6HaHnV9a2lOWA7+EWaSaMZKlLrmpcvzEMMAn26d446eIIHlFv44J5
         mYafopCaX61mVg3vrTvif6prm1fQqcy9G93h1H8bmAgtw8qmzoUbh0l8e5fLpG3ccqdw
         z/AQ==
X-Gm-Message-State: AOAM5319qbMHd/Kzg/RPR1tP2rbSvh5g2X80ZO8Ye6oMZwsw4ORjIEL3
        2buHutvJF41TPZinygZJqiOp+Q==
X-Google-Smtp-Source: ABdhPJy5GmX5UQ0mj0ySsNzmIfZIFATXV7mzuj3RfTYMC74asWaMPo8GP7EpX/K3319p7uZfI+aziQ==
X-Received: by 2002:a05:6870:a986:b0:da:b3f:3277 with SMTP id ep6-20020a056870a98600b000da0b3f3277mr6854732oab.295.1647032089018;
        Fri, 11 Mar 2022 12:54:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o10-20020acaf00a000000b002da04e165a4sm4245817oih.23.2022.03.11.12.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 12:54:48 -0800 (PST)
Date:   Fri, 11 Mar 2022 14:54:46 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     swboyd@chromium.org, quic_clew@quicinc.com,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 3/3] rpmsg: glink: Add lock for ctrl device
Message-ID: <Yiu3Fl/Diw5iqh24@builder.lan>
References: <1643223886-28170-1-git-send-email-quic_deesin@quicinc.com>
 <1643223886-28170-4-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643223886-28170-4-git-send-email-quic_deesin@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Jan 13:04 CST 2022, Deepak Kumar Singh wrote:

> Race between rpmsg_eptdev_create and rpmsg_chrdev_remove
> can sometime casue crash while accessing rpdev while new
> endpoint is being created. Using lock ensure no new eptdev
> is created after rpmsg_chrdev_remove has been completed.

This patch lacks a Signed-off-by.

Isn't this solving the same problem as the previous patch? Would be nice
with some more specifics on the race that you're seeing.

Thanks,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_char.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2108ef8..3e5b85d 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -27,6 +27,7 @@
>  
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
> +struct mutex ctrl_lock;
>  
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -396,9 +397,12 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	struct device *dev;
>  	int ret;
>  
> +	mutex_lock(&ctrl_lock);
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
> -	if (!eptdev)
> +	if (!eptdev) {
> +		mutex_unlock(&ctrl_lock);
>  		return -ENOMEM;
> +	}
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -443,6 +447,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  		put_device(dev);
>  	}
>  
> +	mutex_unlock(&ctrl_lock);
>  	return ret;
>  
>  free_ept_ida:
> @@ -453,6 +458,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	put_device(dev);
>  	kfree(eptdev);
>  
> +	mutex_unlock(&ctrl_lock);
>  	return ret;
>  }
>  
> @@ -525,6 +531,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	if (!ctrldev)
>  		return -ENOMEM;
>  
> +	mutex_init(&ctrl_lock);
>  	ctrldev->rpdev = rpdev;
>  
>  	dev = &ctrldev->dev;
> @@ -581,12 +588,14 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  	int ret;
>  
>  	/* Destroy all endpoints */
> +	mutex_lock(&ctrl_lock);
>  	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
>  	if (ret)
>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>  
>  	device_del(&ctrldev->dev);
>  	put_device(&ctrldev->dev);
> +	mutex_unlock(&ctrl_lock);
>  }
>  
>  static struct rpmsg_driver rpmsg_chrdev_driver = {
> -- 
> 2.7.4
> 
