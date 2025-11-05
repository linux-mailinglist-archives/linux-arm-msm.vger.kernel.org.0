Return-Path: <linux-arm-msm+bounces-80490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 60340C38271
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 23:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0ADE34DF6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 22:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8541F2F0671;
	Wed,  5 Nov 2025 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRdh415l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3561B287505;
	Wed,  5 Nov 2025 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762380842; cv=none; b=QkvKDEgISawvnwLMwnD03qv8B9TGSJCu7K3LmRe3S30p/uFk7SkHTpsjzz+I6Radd5GnWKotSebb0p6msJDTgueLbpg4PIsi4eSNmiKNNJev72nzJIUzdulxCsRI608vGUruvo9hh9QkpyBRwlon36B7Q0EZdeuAzsQMPAcGMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762380842; c=relaxed/simple;
	bh=cwUjtxQ+WjyslL51wnYe/k/TDHsrlMFfmJyM+afqKdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGaO2jznBRauw+fpHhV/hWrA2Fgt8SD3A8bBgugFC9nCU1kDe+XamuYRkTeN4GIaJgTmPjzZM9o12b/zUdTPTiRub8Bi52m2biTpayONTG95eCxj/iRgD+NNgCklcgVCOQVHTTiO7kaeEo97F6xGxek5oNQ9hqvbEtyr7+ORc6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRdh415l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA347C4CEF5;
	Wed,  5 Nov 2025 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762380839;
	bh=cwUjtxQ+WjyslL51wnYe/k/TDHsrlMFfmJyM+afqKdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRdh415luq+Pye/1mLq92dRsabkTQxrGVYnZ43eKPYntayxPFGiKy03E+oNeCBWd4
	 b5xZzEAxOdbs3kjA9d2FkKOhmXgsp1ye/Gp9RRh1kYvtBkE+VYhuLuSUARfPAR9fQb
	 MFhRfL1YUWPEOx/ea95PLaWEwMVzP7WF2W0zuO0iODm5BC49t3gO3BoE272n7+8Cxf
	 py7FtyryggBffI0Cpj/Mb/M7yDsQI+WGWO+zLztj25ePG9jl5FdpYiob8jYcyS9yrU
	 ZujnjpyMzh6GkFMd6RWAupzxOYzVzDDW7Sn9/4zhUMnrG6BfmXoTAzpFUQ9EH4XVrn
	 Qy0P+i6XXdA+Q==
Date: Wed, 5 Nov 2025 16:17:41 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com
Subject: Re: [PATCH v2 1/3] bus: mhi: host: Add loopback driver with sysfs
 interface
Message-ID: <g7yr3psfoyya76wvcgjs24xyyofgkllmdsvworjnfjgc3q3qeq@vjkxyh5oabkd>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
 <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 11:09:05AM +0530, Sumit Kumar wrote:
> Add loopback driver for MHI host controllers that provides sysfs based
  ^--- Here would be e good place to explain why we want this driver. Per
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
start your commit message with a description of the problem you're
solving.

> testing interface for data path validation. The driver supports the
> "LOOPBACK" channel and offers configurable test parameters.
> 
> Sysfs interface provides:
> - size: Configure TRE size
> - num_tre: Set number of TREs for chained transfers
> - start: Initiate loopback test
> - status: Read test results

The words "loopback" and "testing" gives clear indications that this
should live in debugfs and not sysfs.

Also, sysfs attribute should be documented in Documentation/ABI/testing/

> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/Kconfig        |   7 +
>  drivers/bus/mhi/host/Makefile       |   1 +
>  drivers/bus/mhi/host/mhi_loopback.c | 347 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..08a39ecb47f585bf39721c101ed5e2ff44bdd5f8 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,10 @@ config MHI_BUS_PCI_GENERIC
>  	  This driver provides MHI PCI controller driver for devices such as
>  	  Qualcomm SDX55 based PCIe modems.
>  
> +config MHI_BUS_LOOPBACK
> +	tristate "MHI loopback driver"
> +	depends on MHI_BUS
> +	help
> +	  MHI loopback driver for data path testing. This driver
> +	  provides a mechanism to test MHI data transfer functionality
> +	  by implementing an echo service between host and endpoint.
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..e5d6dccf5a976eaeb827c47924ad0614c9958f8b 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>  
>  obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>  mhi_pci_generic-y += pci_generic.o
> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
> diff --git a/drivers/bus/mhi/host/mhi_loopback.c b/drivers/bus/mhi/host/mhi_loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..980ace675718a79c97d9b2968ccef04c992a6c20
> --- /dev/null
> +++ b/drivers/bus/mhi/host/mhi_loopback.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/completion.h>
> +#include <linux/string.h>
> +#include <linux/random.h>
> +#include <linux/kernel.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/mutex.h>
> +#include <linux/atomic.h>
> +#include <linux/cleanup.h>
> +#include <linux/sizes.h>

Keep them sorted, and make sure you need all of them.

> +
> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE   32
> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE    1
> +#define MHI_LOOPBACK_TIMEOUT_MS         5000
> +#define MHI_LOOPBACK_MAX_TRE_SIZE       SZ_64K
> +
> +struct mhi_loopback {
> +	struct mhi_device *mdev;
> +	struct mutex lb_mutex;
> +	struct completion comp;
> +	atomic_t num_completions_received;
> +	char result[32];
> +	u32 num_tre;
> +	u32 size;
> +	bool loopback_in_progress;
> +};
> +
> +static ssize_t size_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", mhi_lb->size);
> +}
> +
> +static ssize_t size_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +	u32 val;
> +
> +	if (kstrtou32(buf, 0, &val)) {
> +		dev_err(dev, "Invalid size value\n");
> +		return -EINVAL;
> +	}
> +
> +	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE) {
> +		dev_err(dev, "Size must be between 1 and %u bytes\n",
> +			MHI_LOOPBACK_MAX_TRE_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&mhi_lb->lb_mutex);
> +	if (mhi_lb->loopback_in_progress)

The only time loopback_in_progress is true is between the beginning and
end of start_store(), and that entire function is under guard(lb_mutex),
just as here and in num_tre_store().

So at all times loopback_in_progress is true, any other context will
block on getting the mutex, and then it will be reset to false before
the mutex is let go.

In other words, loopback_in_progress is unnecessary.

> +		return -EBUSY;
> +
> +	mhi_lb->size = val;
> +	return count;
> +}
> +static DEVICE_ATTR_RW(size);
> +
> +static ssize_t num_tre_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", mhi_lb->num_tre);
> +}
> +
> +static ssize_t num_tre_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +	u32 val;
> +	int el_num;
> +
> +	if (kstrtou32(buf, 0, &val)) {
> +		dev_err(dev, "Invalid num_tre value\n");
> +		return -EINVAL;
> +	}
> +
> +	if (val == 0) {
> +		dev_err(dev, "Number of TREs cannot be zero\n");
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&mhi_lb->lb_mutex);
> +	if (mhi_lb->loopback_in_progress)
> +		return -EBUSY;
> +
> +	el_num = mhi_get_free_desc_count(mhi_lb->mdev, DMA_TO_DEVICE);

Aren't the descs per-channel in MHI? Given that you have a mutex around
start_store() is this actually a dynamic value?

> +	if (val > el_num) {
> +		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
> +		return -EINVAL;
> +	}
> +
> +	mhi_lb->num_tre = val;
> +	return count;
> +}
> +static DEVICE_ATTR_RW(num_tre);
> +
> +static ssize_t start_store(struct device *dev,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +	void *send_buf __free(kfree) = NULL;
> +	void *recv_buf __free(kfree) = NULL;
> +	u32 total_size, tre_count, tre_size;
> +	int ret, i;
> +
> +	guard(mutex)(&mhi_lb->lb_mutex);
> +
> +	if (mhi_lb->loopback_in_progress)
> +		return -EBUSY;
> +
> +	atomic_set(&mhi_lb->num_completions_received, 0);
> +	mhi_lb->loopback_in_progress = true;
> +
> +	tre_size = mhi_lb->size;
> +	tre_count = mhi_lb->num_tre;
> +
> +	strscpy(mhi_lb->result, "Loopback started", sizeof(mhi_lb->result));

All assignments to result are static const strings being strscpy'ed into
the buffer, if you made result a const char * instead, you could just
assign the string.

> +
> +	total_size = tre_count * tre_size;
> +
> +	recv_buf = kzalloc(total_size, GFP_KERNEL);
> +	if (!recv_buf) {
> +		strscpy(mhi_lb->result, "Memory allocation failed", sizeof(mhi_lb->result));
> +		mhi_lb->loopback_in_progress = false;
> +		return -ENOMEM;

You're setting loopback_in_progress to false and returning in 7
different places in this function. There seems to be some room for
improvement here.

That said, as I said above, I don't think your code can ever find
loopback_in_progress to be true...

> +	}
> +
> +	send_buf = kzalloc(total_size, GFP_KERNEL);
> +	if (!send_buf) {
> +		strscpy(mhi_lb->result, "Memory allocation failed", sizeof(mhi_lb->result));
> +		mhi_lb->loopback_in_progress = false;
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < tre_count; i++) {
> +		ret = mhi_queue_buf(mhi_lb->mdev, DMA_FROM_DEVICE, recv_buf + (i * tre_size),
> +				    tre_size, MHI_EOT);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
> +			strscpy(mhi_lb->result, "Queue tre failed", sizeof(mhi_lb->result));
> +			mhi_lb->loopback_in_progress = false;
> +			return ret;
> +		}
> +	}
> +
> +	get_random_bytes(send_buf, total_size);
> +
> +	reinit_completion(&mhi_lb->comp);
> +
> +	for (i = 0; i < tre_count - 1; i++) {
> +		ret = mhi_queue_buf(mhi_lb->mdev, DMA_TO_DEVICE, send_buf + (i * tre_size),
> +				    tre_size, MHI_CHAIN);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue send TRE %d (chained): %d\n", i, ret);
> +			strscpy(mhi_lb->result, "Queue send failed", sizeof(mhi_lb->result));
> +			mhi_lb->loopback_in_progress = false;
> +			return ret;
> +		}
> +	}
> +
> +	ret = mhi_queue_buf(mhi_lb->mdev, DMA_TO_DEVICE, send_buf + (i * tre_size),
> +			    tre_size, MHI_EOT);
> +	if (ret) {
> +		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
> +		strscpy(mhi_lb->result, "Queue final tre failed", sizeof(mhi_lb->result));
> +		mhi_lb->loopback_in_progress = false;
> +		return ret;
> +	}
> +
> +	if (!wait_for_completion_timeout(&mhi_lb->comp,
> +					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
> +		strscpy(mhi_lb->result, "Loopback timeout", sizeof(mhi_lb->result));
> +		dev_err(dev, "Loopback test timed out\n");
> +		mhi_lb->loopback_in_progress = false;
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = memcmp(send_buf, recv_buf, total_size);
> +	if (!ret) {
> +		strscpy(mhi_lb->result, "Loopback successful", sizeof(mhi_lb->result));
> +		dev_info(dev, "Loopback test passed\n");

Why both print the test status and log it to the result? Less is more...

> +	} else {
> +		strscpy(mhi_lb->result, "Loopback data mismatch", sizeof(mhi_lb->result));
> +		dev_err(dev, "Loopback test failed\n");
> +		ret = -EIO;
> +	}
> +
> +	mhi_lb->loopback_in_progress = false;
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_WO(start);
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", mhi_lb->result);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(&mhi_dev->dev);
> +
> +	if (!mhi_res->transaction_status) {
> +		if (atomic_inc_return(&mhi_lb->num_completions_received) >= mhi_lb->num_tre) {
> +			atomic_set(&mhi_lb->num_completions_received, 0);
> +			complete(&mhi_lb->comp);
> +		}
> +	} else {
> +		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
> +			mhi_res->transaction_status);
> +		atomic_set(&mhi_lb->num_completions_received, 0);
> +		complete(&mhi_lb->comp);
> +	}
> +}
> +
> +static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +}
> +
> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
> +			      const struct mhi_device_id *id)
> +{
> +	struct mhi_loopback *mhi_lb;
> +	int rc;
> +
> +	mhi_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_lb), GFP_KERNEL);
> +	if (!mhi_lb)
> +		return -ENOMEM;
> +
> +	mhi_lb->mdev = mhi_dev;
> +
> +	dev_set_drvdata(&mhi_dev->dev, mhi_lb);
> +
> +	mhi_lb->size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
> +	mhi_lb->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
> +	mhi_lb->loopback_in_progress = false;

kzalloc() already did that for you.

> +
> +	mutex_init(&mhi_lb->lb_mutex);
> +	strscpy(mhi_lb->result, "Loopback not started", sizeof(mhi_lb->result));
> +
> +	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to create size sysfs file\n");
> +		goto out;
> +	}
> +
> +	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to create num_tre sysfs file\n");
> +		goto del_size_sysfs;

This is ugly, devm_device_add_group() seems more appropriate. Then
again, I don't think this belongs in sysfs in the first place.

Regards,
Bjorn

> +	}
> +
> +	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to create start sysfs file\n");
> +		goto del_num_tre_sysfs;
> +	}
> +
> +	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to create status sysfs file\n");
> +		goto del_start_sysfs;
> +	}
> +
> +	rc = mhi_prepare_for_transfer(mhi_lb->mdev);
> +	if (rc) {
> +		dev_err(&mhi_dev->dev, "failed to prepare for transfers\n");
> +		goto del_status_sysfs;
> +	}
> +
> +	init_completion(&mhi_lb->comp);
> +
> +	return 0;
> +
> +del_status_sysfs:
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
> +del_start_sysfs:
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
> +del_num_tre_sysfs:
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
> +del_size_sysfs:
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
> +out:
> +	return rc;
> +}
> +
> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
> +{
> +	struct mhi_loopback *mhi_lb = dev_get_drvdata(&mhi_dev->dev);
> +
> +	if (mhi_lb)
> +		complete(&mhi_lb->comp);
> +
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
> +	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
> +	mhi_unprepare_from_transfer(mhi_dev);
> +	dev_set_drvdata(&mhi_dev->dev, NULL);
> +}
> +
> +static const struct mhi_device_id mhi_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
> +
> +static struct mhi_driver mhi_loopback_driver = {
> +	.probe = mhi_loopback_probe,
> +	.remove = mhi_loopback_remove,
> +	.dl_xfer_cb = mhi_loopback_dl_callback,
> +	.ul_xfer_cb = mhi_loopback_ul_callback,
> +	.id_table = mhi_loopback_id_table,
> +	.driver = {
> +		.name = "mhi_loopback",
> +	},
> +};
> +
> +module_mhi_driver(mhi_loopback_driver);
> +
> +MODULE_AUTHOR("Krishna chaitanya chundru <krishna.chundru@oss.qualcomm.com>");
> +MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("MHI Host Loopback Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 

