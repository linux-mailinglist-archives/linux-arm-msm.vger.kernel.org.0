Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD64272669
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgIUN6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 09:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgIUN6k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 09:58:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE39C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 06:58:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so7527443pjd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9hSV7fSUtzdZKmvu2s5Ab7d0Ct/uxMH78YXRXFCN6qw=;
        b=ca/xuhXFSfKKMmGzf7dK3R6B2A/KV6Qryv0ZOqBorcAICHIQnyg1bN5NJp3NbUkoxH
         P6PkelBN0n9ZZzKxnt+VJ3rYjAceKgEogA00BGmFB0xmg+lBVkgYbA8wZi+tM3E9x9Dd
         za85lf2Dm3DtmQJKT1lPiI8DwQwUZDvQN8lQ4YrkM/MmhI4AsSsfvKMtc7rpktGzbXch
         wtLIu86rBFkh0StJoNbheg92t/xaR/8ZyJ2SdYOoGaEyHmI/R9ls/n4LtOOKo3+Yd9Xf
         QTakkzfrPVswO+VS6lrVywLjd/brhdUPOjcUzXjaYDOtEHXGMDSyHo9YFc/r3Of8ETHM
         ZTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9hSV7fSUtzdZKmvu2s5Ab7d0Ct/uxMH78YXRXFCN6qw=;
        b=RBuyfQUBcqm+1XocqWDmOv5yTWCgy1VgPL/kmk6pKD0RTn4kb3p4OpzThpasFCe+r9
         Jxx3qNMhxmVh9E1/mrfGnWl//q8o5KXS+krL2CXKjmOB4G4/CoYDr3luFnf8QTQO61pt
         nj2OMeQ1CXEFIxJE/j7MFelxkO0bk1YsVIE6Si9pCTshqMc/oifHjrawQgkUU4Q1HW7U
         4NILDQEEIgFSsESs58Gj/JvWOkdBjrS8j8qOiLLHPHX0491fL9d6GBkf7ZmxbkBTyCNv
         JoU2Qwx3Ev98pq2Koe9FKlmXLRyBqtqcKRfsrLdem4BIzlgTtV4HRTX41mU+zrCISQGe
         AwlQ==
X-Gm-Message-State: AOAM5325i5L92hVQ6VDZMRbeiltQcPCKjT5NobKGrBxtExFXIGRLv6do
        2lXyd2b/EFSFdA5tVRNZZNeU
X-Google-Smtp-Source: ABdhPJyI5KAWB7AqZ+yK56GJpopjzhYgHkWKNeodFVltKLu2c3ADqXqA/qqH0CDo0Er+yrk3Isl3fw==
X-Received: by 2002:a17:90a:9317:: with SMTP id p23mr13235pjo.160.1600696719779;
        Mon, 21 Sep 2020 06:58:39 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id m20sm12351965pfa.115.2020.09.21.06.58.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 06:58:38 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:28:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] bus: mhi: core: Introduce sysfs entries for MHI
Message-ID: <20200921135832.GC3262@Mani-XPS-13-9360>
References: <1600457992-18448-1-git-send-email-bbhatt@codeaurora.org>
 <1600457992-18448-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600457992-18448-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 12:39:52PM -0700, Bhaumik Bhatt wrote:
> Introduce sysfs entries to enable userspace clients the ability to read
> the serial number and the OEM PK Hash values obtained from BHI. OEMs
> need to read these device-specific hardware information values through
> userspace for factory testing purposes and cannot be exposed via degbufs
> as it may remain disabled for performance reasons. Also, update the
> documentation for ABI to include these entries.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/ABI/stable/sysfs-bus-mhi | 21 ++++++++++++++
>  MAINTAINERS                            |  1 +
>  drivers/bus/mhi/core/init.c            | 53 ++++++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> new file mode 100644
> index 0000000..ecfe766
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -0,0 +1,21 @@
> +What:		/sys/bus/mhi/devices/.../serialnumber
> +Date:		Sept 2020
> +KernelVersion:	5.10
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:	The file holds the serial number of the client device obtained
> +		using a BHI (Boot Host Interface) register read after at least
> +		one attempt to power up the device has been done. If read
> +		without having the device power on at least once, the file will
> +		read all 0's.
> +Users:		Any userspace application or clients interested in device info.
> +
> +What:		/sys/bus/mhi/devices/.../oem_pk_hash
> +Date:		Sept 2020
> +KernelVersion:	5.10
> +Contact:	Bhaumik Bhatt <bbhatt@codeaurora.org>
> +Description:	The file holds the OEM PK Hash value of the endpoint device
> +		obtained using a BHI (Boot Host Interface) register read after
> +		at least one attempt to power up the device has been done. If
> +		read without having the device power on at least once, the file
> +		will read all 0's.
> +Users:		Any userspace application or clients interested in device info.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb6..11e7be9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11323,6 +11323,7 @@ M:	Hemant Kumar <hemantk@codeaurora.org>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> +F:	Documentation/ABI/stable/sysfs-bus-mhi
>  F:	Documentation/mhi/
>  F:	drivers/bus/mhi/
>  F:	include/linux/mhi.h
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 61e5885..1b4161e 100644
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
