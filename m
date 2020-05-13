Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752041D2187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 23:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbgEMV4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 17:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729829AbgEMV4O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 17:56:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40FCC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 14:56:12 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so11668574pjh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 14:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=URXKt/CtJiUnLhAXRhzn7WHXaaovZqdso8oMCz+GR2c=;
        b=zgg3uSPYjx1Fq9SF/NJZDBOu6PaZKWswvNlnYpfhfyOpMHs9QgxJblQ9SHH8w4SVTm
         U/j8SreK901TGCI8VLZe+cGqfFACPgDBgsFNopQ6IwqhF0IGJlDwWt28aZCXIRLHhV2x
         vGCe2fw3s0+OSJ931/VrF+xGe/D1G4Mu+Q3175i9r/udCjesuDuaEWCHLlw4srYQ47+p
         wQodfH6T46WwVYrSeeva9WEM7EAc8UE64FUDcZ5lurlWEXPtrB5JiLHgSI1uOj7xhpoR
         zZalj0FxzE0WLn62TQJhBirmicHXekBH1wLvNpHuHHRl8xSfazqCZmDTTVBbex0zdZlN
         pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=URXKt/CtJiUnLhAXRhzn7WHXaaovZqdso8oMCz+GR2c=;
        b=XZUelDxwzDYaBCWWtcqVL9pliqZrFVS92ST0Jwx4AbM3fexVINLhmL/xBidY8ZYmS4
         WhHgmit6JblXxtG2N76QENHQYmqUgdHeHb0XJ00FWyexW8WYozqx1I81rHWKOPu72i4c
         O9BiGCGXu0UqW70jv9OfN9kJWTKe/dszUR09qSdQ+U1//rVI6LWI3DbwC8SScpXcURrG
         Wo6v4POfw/UvD+t4gDSCYwtQquer3GZp3QUcc19VfiuTt8sMwAjSaIbCg8nX5BIhwFyy
         Zr4qmOcZ6KBYAm0myoMeeoky45FYJVQt7AOvX1KrHLrrqNsPWaD1lo/0PHtS3ZCTmbYi
         5H8g==
X-Gm-Message-State: AGi0PuaO3mk3WWvbuhH9/UdOp9Qxkn6S0hPQMSSQfkc/yBW9aFufNevc
        8X/0ergTFtFr7fKJ/Sn/HsJeqg==
X-Google-Smtp-Source: APiQypLfZxmnarSDfauVRkIFplhL7r6EsFhDlKlDgtFu9R1IGXvtHs2lg5ugQzGaB0VBgM7OJ3kYkg==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr37699942pjw.158.1589406972131;
        Wed, 13 May 2020 14:56:12 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b24sm475244pfi.4.2020.05.13.14.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:56:11 -0700 (PDT)
Date:   Wed, 13 May 2020 15:56:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V5 3/5] rpmsg: glink: Add support for rpmsg glink chrdev
Message-ID: <20200513215609.GB8328@xps15>
References: <1589346606-15046-1-git-send-email-aneela@codeaurora.org>
 <1589346606-15046-4-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346606-15046-4-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 10:40:04AM +0530, Arun Kumar Neelakantam wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> RPMSG provides a char device interface to userspace. Probe the rpmsg
> chrdev channel to enable the rpmsg_ctrl device creation on glink
> transports.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 40 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 604f11f..3a7f87c 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1178,7 +1178,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
>  	__be32 *val = defaults;
>  	int size;
>  
> -	if (glink->intentless)
> +	if (glink->intentless || !completion_done(&channel->open_ack))

Please move this to patch 01.

>  		return 0;
>  
>  	prop = of_find_property(np, "qcom,intents", NULL);
> @@ -1574,6 +1574,40 @@ static void qcom_glink_cancel_rx_work(struct qcom_glink *glink)
>  		kfree(dcmd);
>  }
>  
> +static void qcom_glink_device_release(struct device *dev)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +
> +	/* Release qcom_glink_alloc_channel() reference */
> +	kref_put(&channel->refcount, qcom_glink_channel_release);
> +	kfree(rpdev);
> +}
> +
> +static int qcom_glink_create_chrdev(struct qcom_glink *glink)
> +{
> +	struct rpmsg_device *rpdev;
> +	struct glink_channel *channel;
> +
> +	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> +	if (!rpdev)
> +		return -ENOMEM;
> +
> +	channel = qcom_glink_alloc_channel(glink, "rpmsg_chrdev");
> +	if (IS_ERR(channel)) {
> +		kfree(rpdev);
> +		return PTR_ERR(channel);
> +	}
> +	channel->rpdev = rpdev;
> +
> +	rpdev->ept = &channel->ept;
> +	rpdev->ops = &glink_device_ops;
> +	rpdev->dev.parent = glink->dev;
> +	rpdev->dev.release = qcom_glink_device_release;
> +
> +	return rpmsg_chrdev_register_device(rpdev);
> +}
> +
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
>  					   unsigned long features,
>  					   struct qcom_glink_pipe *rx,
> @@ -1633,6 +1667,10 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = qcom_glink_create_chrdev(glink);
> +	if (ret)
> +		dev_err(glink->dev, "failed to register chrdev\n");
> +
>  	return glink;
>  }
>  EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
> -- 
> 2.7.4
