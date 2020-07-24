Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E97222BDA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 07:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgGXFmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 01:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgGXFmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 01:42:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB02C0619D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 22:42:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so4480994pfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 22:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/7h13uK3yaCmC6CvwntDrcPq/x8aDHrW9fKg5HxHfJ8=;
        b=dro2IQ3giApo6ftru/j+SRlfgGyyq/joz+CqXpj+SkXiFG3KqSiPG5xEf84M0adWtQ
         DQFwEcqs5o/AojmOxk2loupywrh4gZ7jVgS7M8uXJTixBZpsr0TPa3lSFDRV9eQbfk85
         3NJf37XuXYMHx6zLiRbFwRZbnFIzVAxyKQdkwFcVS+vcuDR/8zNMWwaEo9Zx3R7MfBsx
         llbxS8G1Hipp9VKkcmrw2eWaqp9ZXY8TuDjW+4EsWt+lf+91noSc35V+3MmeIHWRLC9b
         ew0tpQExMvxfRadSlQG5p/Pk2uvg1M9BUS6QcPNmZpNPNYi2sIkn+MlI9Sn5uKb7ZXhV
         k/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/7h13uK3yaCmC6CvwntDrcPq/x8aDHrW9fKg5HxHfJ8=;
        b=XDH4zYN5LSHr3Abay733hr/UydoKYX9Gv+3v5hWIY86WpvZYZugUzQ6QRZ3+T6AJLs
         0Wqj1VxO0DW0xpfjyCdUiyaJrFkrAhjrBVScA6/JD9U6dNDl+U/VX2HLoKZs+oO7PlV+
         h4yd61SQH/htMUn+N5P+XyGTkK1YA1kChRI+Hbh3tAILfvTHQIh6Df+fkpeSXWjnQtSu
         UeXjUuB/08dbfhClnEyXmM/FyjF8UNn5HV6rSVgbkCEdk01qntNgrf+5QhDF7itxD4Ro
         ErgKyfMaUlpbMZNNkZq4Q6cxk2Yb4IONtd9WFBDHJPLXdgugd9IDL2bpaJwjhjhg8qNs
         EhqA==
X-Gm-Message-State: AOAM5338jUvIBTH5I1PwgsLlVcQmtn2z6zADR6xYf9BSfFxX6Vi3Yjmn
        4zYMPIqDBc466tzd9gp0uZeu
X-Google-Smtp-Source: ABdhPJxlVphFfTC0uNq8+LW41fK8sJCI/GPQ8wSRCRSNL4eEQMMHcVxK25DtuSSiYx9Yw9Eesr2yUA==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr7157006pgn.111.1595569334629;
        Thu, 23 Jul 2020 22:42:14 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6c9b:7816:d54:f58c:a790:e57b])
        by smtp.gmail.com with ESMTPSA id ml8sm4462138pjb.47.2020.07.23.22.42.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 22:42:14 -0700 (PDT)
Date:   Fri, 24 Jul 2020 11:12:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/10] bus: mhi: core: Introduce sysfs entries for MHI
Message-ID: <20200724054206.GC17957@Mani-XPS-13-9360>
References: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
 <1595543802-17859-11-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595543802-17859-11-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 03:36:42PM -0700, Bhaumik Bhatt wrote:
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
> index 0000000..a4e4bd2
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -0,0 +1,25 @@
> +What:		/sys/bus/mhi/devices/.../serialnumber
> +Date:		July 2020
> +KernelVersion:  5.8
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:
> +		The file holds the serial number of the client device obtained
> +		using a BHI (Boot Host Interface) register read after at least
> +		one attempt to power up the device has been done. If read
> +		without having the device power on at least once, the file will
> +		read all 0's.
> +Users:		Any userspace application or clients interested in the device
> +		hardware information.

Please align all the fields onto a single starting point. Have a look at other
ABI documentation like, Documentation/ABI/stable/sysfs-bus-vmbus.

> +
> +What:		/sys/bus/mhi/devices/.../oem_pk_hash
> +Date:		July 2020
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
> index d2c0f6e..a7b0d76 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -76,6 +76,56 @@ const char *to_mhi_pm_state_str(enum mhi_pm_state state)
>  	return mhi_pm_state_str[index];
>  }
>  
> +static ssize_t serial_number_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)

We haven't followed this before but it is good to align the function parameters
with respect to '('.

> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +
> +	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +			mhi_cntrl->serial_number);

We need to think about what happens if the mhi_cntrl structure is not zero
initialized by the controller driver. All throughout the stack we assume that
the mhi_cntrl struct is zero initialized but things can go awry if it was not
the case!

There was one API in the downstream (mhi_alloc_controller()) for this purpose
but I removed it since we ended up with just a kzalloc(). Does it make sense to
introduce it now?

Thanks,
Mani

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
