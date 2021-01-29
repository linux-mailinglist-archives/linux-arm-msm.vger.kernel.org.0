Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414F3308247
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 01:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhA2AOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 19:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhA2AOC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 19:14:02 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7551C061354
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 16:13:06 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o63so5411296pgo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 16:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DvXKajRo/sxOf4IOVGOfrlqOa4H+vynjfq2cu2QEPHs=;
        b=LBgFNkuNXpSTQcIsZcvhpIfjd9FmCB1AcxB4yaQafY98EB4WohlJ+c9g91dB/lReAp
         g87T9DUvk5kmVttqkF7c8H/FU1IP3uAg1byEKeOGnW0LN7qnjjgPgI8D+/phW1b7zbTr
         MNKOKfWzCOwaKEVBI7LWsrPrze1rtdCqVZX/D6gkS4xHV/T0uwOFj1F6cKTcyPGDf9sO
         IQloDZZZHFrRv4oSY3Wdhhb0PFS6RQF8LjDbFUWuLHbGm7NTTwr1T4zWnpHTbw3VbC36
         zsLPpi7cmjccnXo0EfTzBGBxefTPt31T83MgXTvjQOTLkvc3HLZf1rR5/jSjNuVMBeuh
         ADcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DvXKajRo/sxOf4IOVGOfrlqOa4H+vynjfq2cu2QEPHs=;
        b=QCdkhm+TluNVsbJ7o731XpEGLIf572ozEXKiRl283WGawOgnzz/EeeDh/I9v35Nt3p
         eVnFCBmA2neYhMycPGrpDDXuPyCsFQdcD2ej439fdR7G+G7PRPnBuFU6BJvJpEBfIMHc
         ouCOTaiEOvW6DmAL18BHzv6u6+sIFXQDn5Ta44uTn3Eq+evLkvQoShr5Qa1K3eTi1eZ+
         EunoQzMgypiEPC8ZQfc7MPICL2ew3pYIsTBE8gmY6uG6W/y4poOVuUspwEKFzSQ8cvFS
         EjlgpOk5zTFMI6zrUKzv4Pvi0fVrQjeqxZTiHF9EPGjL8ceRenxpDMmqx755T6TEFvfA
         1O2w==
X-Gm-Message-State: AOAM533ipIAP0ypNABl1LmZy4eE/fXXQXkpGPvweujWrgn7jxbrrIhur
        dEvdQT5E0LQa8aO34GotzF3Zyw==
X-Google-Smtp-Source: ABdhPJwI5XsRAklaO6w93ZOvFl74HCJjs7x8iMLj3nCgU9B/WvrEaxXRekU7t1Y/L2d1vbTjRA5/Rg==
X-Received: by 2002:a63:33c4:: with SMTP id z187mr1953619pgz.312.1611879186273;
        Thu, 28 Jan 2021 16:13:06 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n1sm5789580pjv.47.2021.01.28.16.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 16:13:05 -0800 (PST)
Date:   Thu, 28 Jan 2021 17:13:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl function to
 create device
Message-ID: <20210129001303.GA1211489@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
 <20210121235258.GG611676@xps15>
 <1b76bf93-9647-c658-b4dd-1b10264a1189@foss.st.com>
 <20210122205934.GA866146@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122205934.GA866146@xps15>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

> > It seems to me that the main point to step forward is to clarify the global
> > design and features of the rpmsg-ctrl.
> > Depending on the decision taken, this series could be trashed and rewritten from
> > a blank page...To not lost to much time on the series don't hesitate to limit
> > the review to the minimum.
> > 
> 
> I doubt you will ever get clear guidelines on the whole solution.  I will get
> back to you once I am done with the SMD driver, which should be in the
> latter part of next week.
>

After looking at the rpmsg_chrdev driver, its current customers (i.e the Qcom
drivers), the rpmsg name service and considering the long term goals of this
patchset I have the following guidelines: 

1) I thought long and hard about how to split the current rpmsg_chrdev driver
between the control plane and the raw device plane and the end solution looks
much slimpler than I expected.  Exporting function rpmsg_eptdev_create() after
moving it to another file (along with other dependencies) should be all we need.
Calling rpmsg_eptdev_create() from rpmsg_ctrldev_ioctl() will automatically load
the new driver, the same way calling rpmsg_ns_register_device() from
rpmsg_probe() took care of loading the rpmsg_ns driver.

2) While keeping the control plane functionality related to
RPMSG_CREATE_EPT_IOCTL intact, introduce a new RPMSG_CREATE_DEV_IOCTL that will
allow for the instantiation of rpmsg_devices, exactly the same way a name service
announcement from a remote processor does.  I envision that code path to
eventually call rpmsg_create_channel().

3) Leave the rpmsg_channel_info structure intact and use the
rpmsg_channel_info::name to bind to a rpmsg_driver, exactly how it is currently
done for name service driver selection.  That will allow us to re-use the
current rpmsg_bus intrastructure, i.e rpmsg_bus::match(), without having to deal
with yet another bus type.  Proceeding this way gives us the opportunity to keep
the current channel name convention for other rpmch_chrdev users untouched.

4) In a prior conversation you indicated the intention of instantiating the
rpmsg_chrdev from the name service interface.  I agree with doing so but 
conjugating that with the RPMSG_CHAR kenrel define may be tricky.  I will wait
to see what you come up with.

I hope this helps.

Thanks,
Mathieu


 
> > Thanks,
> > Arnaud
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > >> +	return NULL;
> > >> +}
> > >> +
> > >>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
> > >>  				 unsigned long arg)
> > >>  {
> > >>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> > >> -
> > >> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> > >> +	void __user *argp = (void __user *)arg;
> > >> +	struct rpmsg_channel_info chinfo;
> > >> +	struct rpmsg_endpoint_info eptinfo;
> > >> +	struct rpmsg_device *newch;
> > >> +
> > >> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> > >> +		return -EINVAL;
> > >> +
> > >> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> > >> +		return -EFAULT;
> > >> +
> > >> +	/*
> > >> +	 * In a frst step only the rpmsg_raw service is supported.
> > >> +	 * The override is foorced to RPMSG_RAW_SERVICE
> > >> +	 */
> > >> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
> > >> +	if (!chinfo.driver_override)
> > >> +		return -ENODEV;
> > >> +
> > >> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> > >> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> > >> +	chinfo.src = eptinfo.src;
> > >> +	chinfo.dst = eptinfo.dst;
> > >> +
> > >> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> > >> +	if (!newch) {
> > >> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
> > >> +		return -ENXIO;
> > >> +	}
> > >>  
> > >>  	return 0;
> > >>  };
> > >> -- 
> > >> 2.17.1
> > >>
