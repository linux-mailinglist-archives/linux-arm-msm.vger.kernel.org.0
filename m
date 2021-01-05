Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD402EA2C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 02:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbhAEBJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 20:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbhAEBJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 20:09:16 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C6AC061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 17:08:36 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id s2so34319261oij.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 17:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YcK6x2F0hAH3C4ilxXFyLj41n5Xvo6yc+ELSQXD0LIc=;
        b=f/RE34BW/oAyQKlrhKc/zNrq77fwzysiyNj4beCL+g5SAFMXpG5NyzsWq7BNgrd7jN
         Zf/gFE66oE7EtuUQOyIhaZUWtXaLs1KhIwLV5Wf07Nx3BOegQBgKmZTWqyQaBqmejhYR
         YOuqRjdgaUaRgfbdFZ2z//mqKDXXkibVj2Qkjt1SrmBBkpkeEkMD0FAM4ry5GUkHZw+j
         K7hOXVcTZTulH61DyTpkEzu0rCqOWAvKBc3jzZNxRZxBKWZokrSmYRQ+dsE7O3sKMql0
         ibGw6dX9oAHkCuCy2s8MkrWsUHqYAEciUwoav3wNoiC2b+fItWKvyK5Hj1TR1tgm8q3I
         4Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YcK6x2F0hAH3C4ilxXFyLj41n5Xvo6yc+ELSQXD0LIc=;
        b=g1ogdXk7/b/OVPPqSqnyTui5NtrJCDmbcv85mTNeOC9YoUohKUD2hrc5iBYmV8gVCs
         0RmgddkM01B2EGktva6iKo3K6qd2Q8IDr+91oorBwwFKsqJFXv2RmACCyTsKPoKjLIsN
         pAjH8XpQgR9NzLueKQx8Q8jrFOU/piYsg9c5MMH5OTSb4+3BNYEN7/TtjeOuxLuH9tfB
         7TBWLjM9X9gtlS3gx5oprKSZL7hJerV0xIZZaiAIl4BrCz0mpv1oaqjXrLPoCITD4UoC
         Q0byheSHULDS38n9p2jEajcPnoqsOFVaTrSjI8FRBadJbu5LK0/EWs8wFCAnvHWVTjq+
         vEGw==
X-Gm-Message-State: AOAM531TUOtBwJ6mOTFDkc81VU/MfIYUqqw1Q0dqcb+/y/5psLl6v/yu
        Vy5BmcKHTLAA9TngcAA0gRsE2Q==
X-Google-Smtp-Source: ABdhPJyx+ugT8ZkD8E5L04yl0GXuh1mnuRmFVWGgnA7uM+EHuA0qlFOf3vlltEo08p/2z/8/+8u9kA==
X-Received: by 2002:aca:3f07:: with SMTP id m7mr1091975oia.104.1609808916036;
        Mon, 04 Jan 2021 17:08:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m29sm13888454oof.20.2021.01.04.17.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 17:08:35 -0800 (PST)
Date:   Mon, 4 Jan 2021 19:08:33 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 14/16] rpmsg: glink: add create and release rpmsg
 channel ops
Message-ID: <X/O8EdzYBPXRel8d@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Add the new ops introduced by the rpmsg_ns series and used
> by the rpmsg_ctrl driver to instantiate a new rpmsg channel.
> 

This is nice for completeness sake, but I don't think it makes sense for
transports that has the nameserver "builtin" to the transport itself.

I.e. if we have the NS sitting on top of GLINK and the remote firmware
sends a "create channel" message, then this code would cause Linux to
send a in-transport "create channel" message back to the remote side in
hope that it would be willing to talk on that channel - but that would
imply that the remote side needs to have registered a rpmsg device
related to that service name - in which case it already sent a
in-transport "create channel" message.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 94 ++++++++++++++++++++++++-------
>  1 file changed, 75 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 27a05167c18c..d74c338de077 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -205,6 +205,9 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
>  #define GLINK_FEATURE_INTENTLESS	BIT(1)
>  
>  static void qcom_glink_rx_done_work(struct work_struct *work);
> +static struct rpmsg_device *
> +qcom_glink_create_rpdev(struct qcom_glink *glink,
> +			struct rpmsg_channel_info *chinfo);
>  
>  static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>  						      const char *name)
> @@ -1203,6 +1206,37 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
>  	return 0;
>  }
>  
> +static struct rpmsg_device *
> +qcom_glink_create_channel(struct rpmsg_device *rp_parent,
> +			  struct rpmsg_channel_info *chinfo)
> +{
> +	struct glink_channel *channel = to_glink_channel(rp_parent->ept);
> +	struct qcom_glink *glink = channel->glink;
> +	struct rpmsg_device *rpdev;
> +	const char *name = chinfo->name;
> +
> +	channel = qcom_glink_alloc_channel(glink, name);
> +	if (IS_ERR(channel))
> +		return ERR_PTR(PTR_ERR(channel));
> +
> +	rpdev = qcom_glink_create_rpdev(glink, chinfo);
> +	if (!IS_ERR(rpdev)) {
> +		rpdev->ept = &channel->ept;
> +		channel->rpdev = rpdev;
> +	}
> +
> +	return rpdev;
> +}
> +
> +static int qcom_glink_release_channel(struct rpmsg_device *rpdev,
> +				      struct rpmsg_channel_info *chinfo)
> +{
> +	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +	struct qcom_glink *glink = channel->glink;
> +
> +	return rpmsg_unregister_device(glink->dev, chinfo);
> +}
> +
>  static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  {
>  	struct glink_channel *channel = to_glink_channel(ept);
> @@ -1359,6 +1393,8 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
>  static const struct rpmsg_device_ops glink_device_ops = {
>  	.create_ept = qcom_glink_create_ept,
>  	.announce_create = qcom_glink_announce_create,
> +	.create_channel = qcom_glink_create_channel,
> +	.release_channel = qcom_glink_release_channel,
>  };
>  
>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
> @@ -1376,13 +1412,45 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  	kfree(rpdev);
>  }
>  
> +static struct rpmsg_device *
> +qcom_glink_create_rpdev(struct qcom_glink *glink,
> +			struct rpmsg_channel_info *chinfo)
> +{
> +	struct rpmsg_device *rpdev;
> +	struct device_node *node;
> +	int ret;
> +
> +	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> +	if (!rpdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
> +	rpdev->src = chinfo->src;
> +	rpdev->dst = chinfo->dst;
> +	rpdev->ops = &glink_device_ops;
> +
> +	node = qcom_glink_match_channel(glink->dev->of_node, chinfo->name);
> +	rpdev->dev.of_node = node;
> +	rpdev->dev.parent = glink->dev;
> +	rpdev->dev.release = qcom_glink_rpdev_release;
> +	rpdev->driver_override = (char *)chinfo->driver_override;
> +
> +	ret = rpmsg_register_device(rpdev);
> +	if (ret) {
> +		kfree(rpdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return rpdev;
> +}
> +
>  static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  			      char *name)
>  {
>  	struct glink_channel *channel;
>  	struct rpmsg_device *rpdev;
>  	bool create_device = false;
> -	struct device_node *node;
> +	struct rpmsg_channel_info chinfo;
>  	int lcid;
>  	int ret;
>  	unsigned long flags;
> @@ -1416,27 +1484,15 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  	complete_all(&channel->open_req);
>  
>  	if (create_device) {
> -		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
> -		if (!rpdev) {
> -			ret = -ENOMEM;
> +		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
> +		chinfo.src = RPMSG_ADDR_ANY;
> +		chinfo.dst = RPMSG_ADDR_ANY;
> +		rpdev = qcom_glink_create_rpdev(glink, &chinfo);
> +		if (IS_ERR(rpdev)) {
> +			ret = PTR_ERR(rpdev);
>  			goto rcid_remove;
>  		}
> -
>  		rpdev->ept = &channel->ept;
> -		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
> -		rpdev->src = RPMSG_ADDR_ANY;
> -		rpdev->dst = RPMSG_ADDR_ANY;
> -		rpdev->ops = &glink_device_ops;
> -
> -		node = qcom_glink_match_channel(glink->dev->of_node, name);
> -		rpdev->dev.of_node = node;
> -		rpdev->dev.parent = glink->dev;
> -		rpdev->dev.release = qcom_glink_rpdev_release;
> -
> -		ret = rpmsg_register_device(rpdev);
> -		if (ret)
> -			goto rcid_remove;
> -
>  		channel->rpdev = rpdev;
>  	}
>  
> -- 
> 2.17.1
> 
