Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A699835D181
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 21:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238885AbhDLTx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 15:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238878AbhDLTxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 15:53:54 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766DFC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:53:36 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso7726567pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lohhSZFnccGy8jGa7QsIGJ/XDmBANUFVxrmI+3Kxbmc=;
        b=gLuCRPomfgXVwaBM17qd3/jC44Igsbt8WKgl4XvpZ1GivlizY8xNMgmq3LpV0orNVf
         QRlsDYxDXcAWNh9LTSTY+k6DgWFzxnoS6/fI6e50qGwCnKlfPutiNGac7YsAKgaqDdcl
         GfPatf4ArWO3dzi4/u3Ky0dtmQPuAhnWSmcHwLW4Bt00QfaPpNkLdEhDIMOSaWhfnM9X
         AORpvC2Jme2Ge6RwjJFPEOP91o/siangMmSE1OlUWTMKcmsGQ3ls3xFvWCNn1O+3jTo1
         MUsimmcWqSeG5aobnlTjYRqqidI8IYK+HpIhXHL4I6K8KJ4+HUWu0vQ1L+N6fmrnEMJw
         43fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lohhSZFnccGy8jGa7QsIGJ/XDmBANUFVxrmI+3Kxbmc=;
        b=JRR9vfFSstfjhSDK5PEhomQedax0sVwyBjZl6DNDfQ/LT0/qDNFdZqOLEn+dV/j846
         OVRIFmddmI9tg7cOfcvabSaxuHNpL+2YUnZF2ckhqyR3Fy8+gHlZlRkPflmSEYkljCiS
         zLCQLZIC2B58Wi8MptXiU4SZvOqjDit3hdRn9OhPgSQWcnzjeqg3e0mJ+WoLv2if71f5
         r1BX01tvAtqXGIYWoSXk4YnIy5IIohB+T2vtD1ja0WUJafZqg1g7G5w/xQFXGKc+w1Ft
         GUuZaA8lSMxoPFeYryCGYlCSalVAPtKbws55hVAwB22bWwFM6CmYUGgzXKWfT1XQur65
         Gikw==
X-Gm-Message-State: AOAM533csf0oG363bvGQuOI8UT36nt3RiPdcTquD0uFTGO31ukkK/3iT
        tTvN3mLjjV1EPlUzDXOi/rbb4g==
X-Google-Smtp-Source: ABdhPJzLvlP63bgMOBlYnFI7oM1829T9k+AQhynPrAGgacI8MdN24SvJnYMQRGsImsy8fWnSZL3Y1g==
X-Received: by 2002:a17:90a:2807:: with SMTP id e7mr872172pjd.202.1618257215898;
        Mon, 12 Apr 2021 12:53:35 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x30sm12391335pgl.39.2021.04.12.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 12:53:34 -0700 (PDT)
Date:   Mon, 12 Apr 2021 13:53:31 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] rpmsg: char: Introduce a rpmsg driver for the rpmsg
 char device
Message-ID: <20210412195331.GA582352@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 23, 2021 at 01:27:35PM +0100, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 58 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 7f6d46078179..69e774edb74b 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -28,6 +28,8 @@
>  
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +
>  static dev_t rpmsg_major;
>  
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -405,13 +407,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +
> +	if (!rpdev->ept)
> +		return -EINVAL;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/* Set the private field of the default endpoint to retrieve context on callback. */
> +	rpdev->ept->priv = eptdev;
> +
> +	return 0;
> +}
> +
> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> +{
> +	int ret;
> +
> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> +}
> +
> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> +	{ .name	= RPMSG_CHAR_DEVNAME },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.callback = rpmsg_ept_cb,
> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
> -	if (ret < 0)
> +	if (ret < 0) {
>  		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +	}

Function unregister_rpmsg_driver() has to be called in rpmsg_chrdev_exit().

>  
>  	return ret;
>  }
> -- 
> 2.17.1
> 
