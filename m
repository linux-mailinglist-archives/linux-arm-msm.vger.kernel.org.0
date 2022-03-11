Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B514D69B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 21:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiCKUyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Mar 2022 15:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiCKUx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Mar 2022 15:53:56 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D1943AE2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 12:52:48 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id w17-20020a056830111100b005b22c584b93so7090342otq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Mar 2022 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EoGq7CQCvilBzLF7EBvLt44/XMCx9ydzBEATyyna41M=;
        b=CKKJLhM3DL0STMT/zHMYyuQkf7SjzNu9GIO9XEDKVh6oPrb8hpH8CDIv32r2mMmodO
         OC0AXhq5oIUdcxLhu3S1kRXRl3KfkRZdrKoQonU/m+d7VeqYOA4SsEdC7qRz8Pdy9brt
         e6vHcthX3R55CCIZKRCwOpe8BhDcghibEyq/qUu6KKZIuDlTVhhTo2VsRhFLBhF2SL6q
         ARrVGlenbvXoXn4K3QM050iftag/43xdBuhk+JNoNivjvDJ+bgGMaNiijFCS1rntcrqT
         C2S2qT/f4accnWi7ioLEfEkhQbiTz06Y5ccVkIdpii1rRDEH+dLuTh9Knz875k1KHaAA
         kvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EoGq7CQCvilBzLF7EBvLt44/XMCx9ydzBEATyyna41M=;
        b=qB2dBLQFYF+ogKc1BTSEBzYRx51E2/qjYcibq9poJ1Zc9J22qYcTqJH1gh7h3n54JY
         RU3ayteq0SzZOk2bQQ+zq9RwYv+199qokw5yLgYJmFBb7yjd2yFK3arsbGLZQrVypdN6
         E3NG5PHvXFinB2Rw7plQLPQj0S9qQCuyEhpN04LRkvc4Dba/6TrX5PAhUwnUjD1ap3OS
         xM5cYbv0IbPUGqgJDNL5Sr0q/y99b5ABAs/3qtw1loQlqd3JTTCiYVrxSsjv7zN8p6SO
         +jjKkS3V65Q/6pl8DpP/XELquLv+anji72fxxxD85PNhBlWwae/pA1/RrhfORJ2VTta0
         N2EA==
X-Gm-Message-State: AOAM533VGt4HbPV+lT6I1Cl7c1xgFu36VlniH1QdgG6TKUlAhvVuGoIg
        DJXqm0XNbfhi57MLoO8PnLFruw==
X-Google-Smtp-Source: ABdhPJxFVPqtmT+KW+gdOsiTMsN9KZ49xHJYjMjRYlvIq1fZNQlALIw5/drNOFmDnOmXp/sMZ9V0Zg==
X-Received: by 2002:a05:6830:1394:b0:5af:6776:ea37 with SMTP id d20-20020a056830139400b005af6776ea37mr5808079otq.80.1647031967989;
        Fri, 11 Mar 2022 12:52:47 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id y66-20020a9d22c8000000b005c943ff75dbsm825295ota.7.2022.03.11.12.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 12:52:47 -0800 (PST)
Date:   Fri, 11 Mar 2022 14:52:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     swboyd@chromium.org, quic_clew@quicinc.com,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 2/3] rpmsg: glink: Add lock to avoid race when rpmsg
 device is released
Message-ID: <Yiu2nawUPxWYaIY3@builder.lan>
References: <1643223886-28170-1-git-send-email-quic_deesin@quicinc.com>
 <1643223886-28170-3-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643223886-28170-3-git-send-email-quic_deesin@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 26 Jan 13:04 CST 2022, Deepak Kumar Singh wrote:

> When remote host goes down glink char device channel is freed,
> At the same time user space apps can still try to open rpmsg_char
> device which will result in calling rpmsg_create_ept. This may cause
> reference to already freed context of glink chardev channel.
> 

Hi Deepak,

Could you please be a little bit more specific on the details of where
you're seeing this race? Perhaps I'm just missing something obvious?

> Use per ept lock to avoid race between rpmsg_destroy_ept and
> rpmsg_destory_ept.

I presume one of these should say rpmsg_eptdev_open().

Regards,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_char.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 72ee101..2108ef8 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -85,6 +85,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
>  	mutex_lock(&eptdev->ept_lock);
> +	eptdev->rpdev = NULL;
>  	if (eptdev->ept) {
>  		rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
> @@ -145,15 +146,24 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  
>  	get_device(dev);
>  
> +	mutex_lock(&eptdev->ept_lock);
> +	if (!eptdev->rpdev) {
> +		put_device(dev);
> +		mutex_unlock(&eptdev->ept_lock);
> +		return -ENETRESET;
> +	}
> +
>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> +		mutex_unlock(&eptdev->ept_lock);
>  		put_device(dev);
>  		return -EINVAL;
>  	}
>  
>  	ept->sig_cb = rpmsg_sigs_cb;
>  	eptdev->ept = ept;
> +	mutex_unlock(&eptdev->ept_lock);
>  	filp->private_data = eptdev;
>  
>  	return 0;
> @@ -285,7 +295,9 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
>  	if (eptdev->sig_pending)
>  		mask |= EPOLLPRI;
>  
> +	mutex_lock(&eptdev->ept_lock);
>  	mask |= rpmsg_poll(eptdev->ept, filp, wait);
> +	mutex_unlock(&eptdev->ept_lock);
>  
>  	return mask;
>  }
> -- 
> 2.7.4
> 
