Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE38E23E705
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 07:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgHGFWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 01:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgHGFWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 01:22:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE7AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 22:22:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d4so343604pjx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JxnD3/Pk7tGnhOkTuFO11epA3dxlvhmHX5n0F+oID6c=;
        b=ZKeK46FNkuyyfRSMVpN2j8uKDk34aDJkC8yTWBJlHvfsLVg0xWZI0004hEFRZVZyRQ
         /IzGWIYjgw332qsSsNd2H054P2Be4/LDNMFnbXSRoVgLEn6Wf5FbAZWQvQbX8KMlGKu+
         aKRckxnOKJIm/Q3rz+kV/jyv8owGbr0L6mTFYRRIZm7/S8jIlXnQSLIju+30yp64ZRMb
         sHwKafqXu25LjdrMGCJcHHnH7MIjQ24gZXNPZUki79PIF3bRH5Bcee8SKD1heQ/JkXAh
         kMhmDcHhkLtAozdjh33wF/BsXGNCMcdf6knKa8jEsdJb+jsgGsyVjl1WmkPPWmCm9Yy1
         hogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JxnD3/Pk7tGnhOkTuFO11epA3dxlvhmHX5n0F+oID6c=;
        b=grIpX8PFETghRCFcWaTzb+Juvtjki4BJJ0B3qXmqRipuo/44JGXTBp2zs0iTYBXKBx
         rYfxBuWCiqhuJJSwPe4hDK9s9GxPFNpezoLDysFiEEnPHwb4vQEcuFfRe8TE2zhh+XJK
         SQbjIED01F7jBA8uS3FPLuxVBJPmHK1+U8C6lhpTVWz5dBnGVrP8H+hqElL0R/RvX7Ip
         nl5tJj9itmowT/5nIZ8ST6/7QmJPMOU72zOtiyJhAxw4kv6DaGC9t+e7LoxsgMlzA7rk
         RzepR4zQIkoQZ8eq+mIbBzHUnOQxxq2Y5hz75ioj4qUaxAJpT1mJTWPBt13ayjRmYdOo
         PadA==
X-Gm-Message-State: AOAM530uCAYy+WwfdnjaHy0tBnLOAFbh4r4zQvfFGCgE+Nf7C8wqogbs
        h/RbHlcENjoyKG7wKt95hEb2
X-Google-Smtp-Source: ABdhPJxmbvbEI5hmrW4eSH1i/wA0McdyTqgDffGrrEOfEBZo3k7iq0OJ4X/qpwLCdPoLKZHHf+dhcg==
X-Received: by 2002:a17:90b:3603:: with SMTP id ml3mr11786232pjb.207.1596777769954;
        Thu, 06 Aug 2020 22:22:49 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d15:d4c4:a84b:5551:d33e:ccd2])
        by smtp.gmail.com with ESMTPSA id mj6sm9249442pjb.15.2020.08.06.22.22.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 22:22:49 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:52:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/11] bus: mhi: core: Introduce sysfs entries for MHI
Message-ID: <20200807052242.GD3230@Mani-XPS-13-9360>
References: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
 <1595901740-27379-12-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595901740-27379-12-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 07:02:20PM -0700, Bhaumik Bhatt wrote:
> Introduce sysfs entries to enable userspace clients the ability to read
> the serial number and the OEM PK Hash values obtained from BHI. OEMs
> need to read these device-specific hardware information values through
> userspace for factory testing purposes and cannot be exposed via degbufs
> as it may remain disabled for performance reasons. Also, update the
> documentation for ABI to include these entries.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  Documentation/ABI/stable/sysfs-bus-mhi | 21 ++++++++++++++
>  MAINTAINERS                            |  1 +
>  drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> new file mode 100644
> index 0000000..1d5d0d6
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -0,0 +1,21 @@
> +What:		/sys/bus/mhi/devices/.../serialnumber
> +Date:		Jul 2020
> +KernelVersion:	5.8
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:	The file holds the serial number of the client device obtained
> +		using a BHI (Boot Host Interface) register read after at least
> +		one attempt to power up the device has been done. If read
> +		without having the device power on at least once, the file will
> +		read all 0's.
> +Users:		Any userspace application or clients interested in device info.

I think you're not using tabs here and that's why it is showing mangled. Please
use tabs as like other files.

Thanks,
Mani

> +
> +What:		/sys/bus/mhi/devices/.../oem_pk_hash
> +Date:		Jul 2020
> +KernelVersion:	5.8
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:	The file holds the OEM PK Hash value of the endpoint device
> +		obtained using a BHI (Boot Host Interface) register read after
> +		at least one attempt to power up the device has been done. If
> +		read without having the device power on at least once, the file
> +		will read all 0's.
> +Users:		Any userspace application or clients interested in device info.
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
> index 972dbf0..c086ef2 100644
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
> +	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +			mhi_cntrl->serial_number);
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
> +				"OEMPKHASH[%d]: 0x%x\n", i,
> +				mhi_cntrl->oem_pk_hash[i]);
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
