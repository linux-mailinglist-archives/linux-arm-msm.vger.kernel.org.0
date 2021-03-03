Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3332C24D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389872AbhCCVsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383252AbhCCSoa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 13:44:30 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06186C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 10:43:48 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d2so4914013pjs.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gVzR7oLstl6ac4ZTkA4CIGL1WR32C+kvWFg+bT72InI=;
        b=Kdp0z6TouC9vsp6Gaa4T0X4l/lsXsHfBSgHsbjgBgBPnZs72XvLOn3wMnlX2wWvV+U
         zAMijtl3Db+skGKokSbjFctHPeDghD+JPckIzTRM+Fx2LFOFfIymQelQrxwLgZlOYD4j
         YO2yBXWtCdBIUxFcBE1BbMM/MVUOP60rUwUdqaOe9MTiaIxQZBVKN3o3iJyV5pEm3h1U
         pz+M9M2KJbAiQoZiDGGSSqkcchEre8O5f/3u2SuaFDxXZBbBV4J74E4O05bgZTa54tad
         9oD8BVbYvPaWNc7HCsQkWiYbEST7gerlhWe9ONUT1GMXJcWy7IjXVQfVNn3IHTPjp0rS
         lpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gVzR7oLstl6ac4ZTkA4CIGL1WR32C+kvWFg+bT72InI=;
        b=MxyZTBL9gB5PKlf/e7xN9rrTyqnxX7dxV4S5iRQJ3f4g+j7+gb9sq8vhil/DpRaajY
         7mMGR0nO1Im/3+ks90upi3FGaYigLiDVDuzjfBilZMVSu8T/prs8oWusAZSTO65mHgMZ
         5BxvfNPwz7wTf94RvxvgbL/Zn1B//6RN5jp928sHrAXkArLXqrgVK1Dox5oO6FQK3k0e
         e01h7yxB5kPowGyQaYJauKleosaryy3LLIRoPa+BPafkvA4lVi7zcEwGN2CqRmdX1bDX
         7w0jP2LZxuG2WlZeQPu1m6ZYyCPZkqssqul5aUA84KdFufXEdvAoUr4NoffaAhv0BcCF
         QGKA==
X-Gm-Message-State: AOAM533iaxegFjQYTFElTQ09w7IblIGohzPYNwJeCt4kIMcLz3Dx+eft
        YeXSFm73P/I3ZkVvga13dmSX5Q==
X-Google-Smtp-Source: ABdhPJyaZX7NAFW2wCjv1k35xfC/hJogQ35MtOZEOH1TxdzZzw44BBaFYPLSKZlYUZq4CWNEHQPUwQ==
X-Received: by 2002:a17:90a:4882:: with SMTP id b2mr474911pjh.69.1614797028306;
        Wed, 03 Mar 2021 10:43:48 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v126sm23944372pfv.163.2021.03.03.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:43:47 -0800 (PST)
Date:   Wed, 3 Mar 2021 11:43:45 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 11/16] rpmsg: virtio: register the rpmsg_ctrl device
Message-ID: <20210303184345.GD3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:56PM +0100, Arnaud Pouliquen wrote:
> Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.

s/rpmsg_ioctl/rpmsg_ctrl

Now I understand what you meant in patch 05.

> This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
> to create RPMsg chdev endpoints.

You mean RPMSG device endpoints, i.e rpmsg_eptdev?  If so I think it should be
added to the changelog.  Otherwiser someone could be tempted to look for "chdev"
and find anything but a rpmsg_eptdev.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> V5:
> Fix compilation issue
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 57 +++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index e87d4cf926eb..2e6b34084012 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -813,14 +813,52 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
>  	wake_up_interruptible(&vrp->sendq);
>  }
>  
> +static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev)
> +{
> +	struct virtproc_info *vrp = vdev->priv;
> +	struct virtio_rpmsg_channel *vch;
> +	struct rpmsg_device *rpdev_ctrl;
> +	int err = 0;
> +
> +	vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> +	if (!vch)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Link the channel to the vrp */
> +	vch->vrp = vrp;
> +
> +	/* Assign public information to the rpmsg_device */
> +	rpdev_ctrl = &vch->rpdev;
> +	rpdev_ctrl->ops = &virtio_rpmsg_ops;
> +
> +	rpdev_ctrl->dev.parent = &vrp->vdev->dev;
> +	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
> +	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
> +
> +	err = rpmsg_ctrl_register_device(rpdev_ctrl);
> +	if (err) {
> +		kfree(vch);
> +		return ERR_PTR(err);
> +	}
> +
> +	return rpdev_ctrl;
> +}
> +
> +static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> +{
> +	if (!rpdev_ctrl)
> +		return;
> +	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> +}
> +
>  static int rpmsg_probe(struct virtio_device *vdev)
>  {
>  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
>  	static const char * const names[] = { "input", "output" };
>  	struct virtqueue *vqs[2];
>  	struct virtproc_info *vrp;
> -	struct virtio_rpmsg_channel *vch;
> -	struct rpmsg_device *rpdev_ns;
> +	struct virtio_rpmsg_channel *vch = NULL;
> +	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl;

As far as I can tell @rpdev_ns doesn't have to be initialized.

>  	void *bufs_va;
>  	int err = 0, i;
>  	size_t total_buf_space;
> @@ -894,12 +932,18 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	vdev->priv = vrp;
>  
> +	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
> +	if (IS_ERR(rpdev_ctrl)) {
> +		err = PTR_ERR(rpdev_ctrl);
> +		goto free_coherent;
> +	}
> +
>  	/* if supported by the remote processor, enable the name service */
>  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
>  		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
>  		if (!vch) {
>  			err = -ENOMEM;
> -			goto free_coherent;
> +			goto free_ctrldev;
>  		}
>  
>  		/* Link the channel to our vrp */
> @@ -915,7 +959,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  		err = rpmsg_ns_register_device(rpdev_ns);
>  		if (err)
> -			goto free_coherent;
> +			goto free_vch;
>  	}
>  
>  	/*
> @@ -939,8 +983,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  
>  	return 0;
>  
> -free_coherent:
> +free_vch:
>  	kfree(vch);
> +free_ctrldev:
> +	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
> +free_coherent:
>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
>  			  bufs_va, vrp->bufs_dma);
>  vqs_del:
> -- 
> 2.17.1
> 
