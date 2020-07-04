Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C7321471D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 17:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgGDPyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 11:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgGDPyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 11:54:37 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3631C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 08:54:37 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u185so13124237pfu.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L4EVn41M5mnJuXUgF6zQik4T8zfm6CgayUMdSIXrMaA=;
        b=NodaEulFiGgEnGzixPVl16IiNvTeDLTTaU3LjHZ4C2XJ7Kte4ZuYes6Gu6gEoBjTdl
         RVRKf61oNdJWB62eKFtTaClOe+Stv0QTheDFWnJFZorhjjYhk2UQc3dOCscpcBi0Uvyx
         yFi6W58EzLxHD1/1xdFoRKUfB+4ZL5nUgV0MZ45bysZmmDaXOJpFdug30rAK8Xers78D
         z57MfPLD+rnLZ5IY91sbu3v0zeDTmQMAge4PO1bnWx/hgxLNq2+RiTm0ogjMrU+z6jFc
         Y/BzoU6i+6BcjmQxqHy0wmG68OJZI2N7/AbQTQK9DVeupa58vFTDea4olBfnlmowocul
         4lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L4EVn41M5mnJuXUgF6zQik4T8zfm6CgayUMdSIXrMaA=;
        b=jQHrwNjGjJR+OMkPAKMjDoPzWi/k+CH9wDcPkjLEgpU6xLx9uJSnuKtBl2Ki7Ui7q5
         shQDsiwuTz5vr9UcgR/SWx+e1eCW79xbe8G2dUH4dWAc+Cr2aaHlGeiLtuVuXoAVkHPs
         7P6mcEzZNGGIEaU07MGpXGFpIgl0Ww221G6mvXYHe9kM5EzWQwJrWP2v8Bm9OWP7lyKD
         qRgS932Umgc6ZIPQKuo75hKHFKugmYiQWjUTeNoajRyzyFD9LB/N/wJlK8j/SHPUzc07
         P69WqUotRndBKcVw8SH+E/BQkBY3hXxLXbf4zLwGMhtFQAbuGL82Q9zqmjneXvjOzoue
         R9qw==
X-Gm-Message-State: AOAM533/2CdjMuBTPmV+L0ykrEwet2GrwP/p8UXEJ4zJ97x4NY8On6l9
        5LKauzsMdDzjCjM8DU7l3Wtk
X-Google-Smtp-Source: ABdhPJzLAbVf7WyDYmdsnnHHd51jpEjSVSfD+cnv5k9YhbNduPo+z3do80oWqA9FTbXUP7x1sJgz/Q==
X-Received: by 2002:a63:441c:: with SMTP id r28mr31953262pga.372.1593878077021;
        Sat, 04 Jul 2020 08:54:37 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id l23sm6055557pjy.45.2020.07.04.08.54.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:54:36 -0700 (PDT)
Date:   Sat, 4 Jul 2020 21:24:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] bus: mhi: core: Introduce sysfs entries for MHI
Message-ID: <20200704155430.GI3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-10-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-10-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:42AM -0700, Bhaumik Bhatt wrote:
> Introduce sysfs entries to enable userspace clients the ability to read
> the serial number and the OEM PK Hash values obtained from BHI. OEMs
> need to read these device-specific hardware information values through
> userspace for factory testing purposes and cannot be exposed via degbufs
> as it may remain disabled for performance reasons. Also, update the
> documentation for ABI to include these entries.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  Documentation/ABI/stable/sysfs-bus-mhi | 25 ++++++++++++++++
>  MAINTAINERS                            |  1 +
>  drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> new file mode 100644
> index 0000000..65ef711
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -0,0 +1,25 @@
> +What:		/sys/bus/mhi/devices/.../serialnumber
> +Date:		May 2020

July?

> +KernelVersion:  5.8
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:
> +		The file holds the serial number of the endpoint device obtained

Don't use the term endpoint here. Just say MHI client device.

> +		using a BHI (Boot Host Interface) register read after at least
> +		one attempt to power up the device has been done. If read
> +		without having the device power on at least once, the file will
> +		read all 0's.
> +Users:		Any userspace application or clients interested in the device
> +		hardware information.
> +
> +What:		/sys/bus/mhi/devices/.../oem_pk_hash
> +Date:		May 2020
> +KernelVersion:  5.8
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:
> +		The file holds the OEM PK Hash value of the endpoint device
> +		obtained using a BHI (Boot Host Interface) register read after
> +		at least one attempt to power up the device has been done. If
> +		read without having the device power on at least once, the file
> +		will read all 0's.
> +Users:		Any userspace application or clients interested in the device
> +		hardware information.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db..5e49316 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11018,6 +11018,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> +F:	Documentation/ABI/stable/sysfs-bus-mhi
>  F:	Documentation/mhi/
>  F:	drivers/bus/mhi/
>  F:	include/linux/mhi.h
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index d2c0f6e..745e146 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -76,6 +76,56 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>  	return mhi_pm_state_str[index];
>  }
>  
> +static ssize_t serial_number_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +
> +	return snprintf(buf, PAGE_SIZE, "Serial Number:%u\n",
> +			mhi_cntrl->serial_number);

Space after ':'

> +}
> +static DEVICE_ATTR_RO(serial_number);
> +
> +static ssize_t oem_pk_hash_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	int i, cnt = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++)
> +		cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
> +				"OEMPKHASH[%d]:0x%x\n", i,
> +				mhi_cntrl->oem_pk_hash[i]);

Same here.

Thanks,
Mani

> +
> +	return cnt;
> +}
> +static DEVICE_ATTR_RO(oem_pk_hash);
> +
> +static struct attribute *mhi_sysfs_attrs[] = {
> +	&dev_attr_serial_number.attr,
> +	&dev_attr_oem_pk_hash.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group mhi_sysfs_group = {
> +	.attrs = mhi_sysfs_attrs,
> +};
> +
> +static int mhi_create_sysfs(struct mhi_controller *mhi_cntrl)
> +{
> +	return sysfs_create_group(&mhi_cntrl->mhi_dev->dev.kobj,
> +				  &mhi_sysfs_group);
> +}
> +
> +static void mhi_destroy_sysfs(struct mhi_controller *mhi_cntrl)
> +{
> +	sysfs_remove_group(&mhi_cntrl->mhi_dev->dev.kobj, &mhi_sysfs_group);
> +}
> +
>  /* MHI protocol requires the transfer ring to be aligned with ring length */
>  static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
>  				  struct mhi_ring *ring,
> @@ -917,6 +967,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	mhi_cntrl->mhi_dev = mhi_dev;
>  
>  	mhi_create_debugfs(mhi_cntrl);
> +	if (mhi_create_sysfs(mhi_cntrl))
> +		dev_err(mhi_cntrl->cntrl_dev, "Failed to create sysfs entries\n");
>  
>  	return 0;
>  
> @@ -940,6 +992,7 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
>  	unsigned int i;
>  
> +	mhi_destroy_sysfs(mhi_cntrl);
>  	mhi_destroy_debugfs(mhi_cntrl);
>  
>  	kfree(mhi_cntrl->mhi_cmd);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
