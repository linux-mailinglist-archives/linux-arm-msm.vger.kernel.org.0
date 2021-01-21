Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A192FF91F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbhAUXxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbhAUXxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:53:54 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B82C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:53:01 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b5so2722695pjl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oJrGhqFdkfW9wRZyay7gwNcE73cpE4zERtrcMcbTWr0=;
        b=OPELpH75YfQI1ATMiUGuilGIUBPs8DsfCGvxdD/RxoAW+K4McjtBdgnhXdrGn/sFIi
         FFFHaobn9FbUP/3jpSBU7Fl48nrsSETVJaAgZhzmJQKea0q2Tp6Q1S3iREur5mT8Fndj
         ToIWyQPv+mVhJ9RNEMO17mrBpmavV39aPqP9VcmYkLbjxLLgB2fpALfHSVVLh2+NnGtp
         79qKIAvIN9KaZlHViSxHuZjpU8ONYfEyGA5Vd8U0YSDWUpboZ+vQ1o7s9FgyJorqqn7m
         vzFHOo40C6i18UnWn60qehhiBeY9fckRMbffVdWOyea5kZlP/q6124YSsJ4Oah15AoFc
         GOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oJrGhqFdkfW9wRZyay7gwNcE73cpE4zERtrcMcbTWr0=;
        b=eHQ2PSDjlG0hiDtM1auzBtrnt4Pxb28/cJX49PxUAF+953ODay/bhPtlqTN2qYMKAk
         jZjhTgg7VQifo8LS2KCKB4uE3p7ahXzHooN2YDIkmAnuW+kzBXQqANBF/QOZh/Hv3HNT
         wtnsUV3Lo7+HmfE2FIf40kn8Ms52Cla24zdAM18svF2THiDDrubsj8lefNlYP94NQDjC
         0wCKGpL8egpNHOTAwsg2TVo04Q/yKjjwO72zJ7pNALYQqL5wAOPKCa1cHOtCXTABSjGJ
         879vzPWPISoo2sjPx1lgl9UVkx39lTpDv3nTU7RatNF6XM1dzYIEKYPJVAZ4LSefal7k
         eevg==
X-Gm-Message-State: AOAM5323QnBfWqprd1CLu6++EhwWJcJ/9yAlf69od5mSHHMoejyHEvHt
        dtHsHHLo8vWPhreqDak16+JAZg==
X-Google-Smtp-Source: ABdhPJw7vWA2rsCwRMG2SZYl6Oy49UG7A7wKq6eSudZ3L0H49zTx2h1DTw4Jgm7bepuEOjnJz6wz5g==
X-Received: by 2002:a17:902:834a:b029:de:343e:adb0 with SMTP id z10-20020a170902834ab02900de343eadb0mr1943726pln.28.1611273180836;
        Thu, 21 Jan 2021 15:53:00 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n128sm6948132pga.55.2021.01.21.15.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:53:00 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:52:58 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl function to
 create device
Message-ID: <20210121235258.GG611676@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 22, 2020 at 11:57:14AM +0100, Arnaud Pouliquen wrote:
> Implement the ioctl function that parses the list of
> rpmsg drivers registered to create an associated device.
> To be ISO user API, in a first step, the driver_override
> is only allowed for the RPMsg raw service, supported by the
> rpmsg_char driver.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 065e2e304019..8381b5b2b794 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +static const char *rpmsg_ctrl_get_drv_name(u32 service)
> +{
> +	struct rpmsg_ctl_info *drv_info;
> +
> +	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
> +		if (drv_info->ctrl->service == service)
> +			return drv_info->ctrl->drv_name;
> +	}
> +

I'm unsure about the above... To me this looks like what the .match() function
of a bus would do.  And when I read Bjorn's comment he brought up the
auxiliary_bus.  I don't know about the auxiliary_bus but it is worth looking
into.  Registering with a bus would streamline a lot of the code in this
patchset.

I'm out of time for today - I will continue tomorrow.

Thanks,
Mathieu

> +	return NULL;
> +}
> +
>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
>  				 unsigned long arg)
>  {
>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> -
> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> +	void __user *argp = (void __user *)arg;
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_endpoint_info eptinfo;
> +	struct rpmsg_device *newch;
> +
> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +		return -EFAULT;
> +
> +	/*
> +	 * In a frst step only the rpmsg_raw service is supported.
> +	 * The override is foorced to RPMSG_RAW_SERVICE
> +	 */
> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
> +	if (!chinfo.driver_override)
> +		return -ENODEV;
> +
> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +	chinfo.src = eptinfo.src;
> +	chinfo.dst = eptinfo.dst;
> +
> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> +	if (!newch) {
> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
> +		return -ENXIO;
> +	}
>  
>  	return 0;
>  };
> -- 
> 2.17.1
> 
