Return-Path: <linux-arm-msm+bounces-14128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D687BC11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 12:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D03E1F21CDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB8D6CDB5;
	Thu, 14 Mar 2024 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl3f40yJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1766DCF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710416518; cv=none; b=cKAsu+b2VK5eqfI8VCLBQ5OZZlQmww58/eoQI1tN2H9PwNK8FiBuBJiEl/taAPP6UVdKzIPvqKK4mORTy5CB0r5fOcaTjcrCeesiHEPIRYVYu34ltq0IzRbd713Ia1TutQCYoiPeW/ffVE8kcTlUJfxm6BL5DX81E6/4DXtBYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710416518; c=relaxed/simple;
	bh=30pvyIV+cW7okQGQmlvCv/g42GGl2E4HHvcdiqL1sEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qM8n9PcZLTxHnmX4aL+JkNFFWIemj1w+2fUgnTGURf3X5b96n/4bVjzcokIGLoHJLSlBO5dGmgRhh/7lmnbsQy0XxT85KpQUe3TQYci9ZZTATveXanIoY+7BM9GXk1+bROzD1HC4KD2b4gkTad9EmQNpsy+NWi6YvtMJd8JZd0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl3f40yJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710416516; x=1741952516;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=30pvyIV+cW7okQGQmlvCv/g42GGl2E4HHvcdiqL1sEo=;
  b=Vl3f40yJ71IhMKJ8xh6O1HbnkZsJ48SymlU+4PEVqj/oWeKnJNRJmjvM
   7IgFQGpyMVnspbmM2eGsS3OVR7cm2/dInVNt7LqJKb6H4mnTcbch6AWmQ
   YpntaYNW2/tLA6mdJrj/tCSNt4q8pxZrMg/KgiwfB+DiK4NhCCKgstKgR
   4v8nTi3QuIFqnyyy9zLMQRRCpbJZMErFUrloTD2izu9S344Bm65aDIrKJ
   ULUvz1gX99lvraAwCKrcV6oRMvVxqaGQ1nSEyHSl++kJ1hvHI0WQLMp0m
   RBLHuNPMm8DrkHanlBXFDxsrserF2c1568wx6t+eh+B5tlyJp3kR5tbUy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9006266"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9006266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 04:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="43299005"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.217.160.171]) ([10.217.160.171])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 04:41:54 -0700
Message-ID: <2b00ea2c-3193-48fb-bb61-c96a87db44a6@linux.intel.com>
Date: Thu, 14 Mar 2024 12:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/qaic: Add bootlog debugfs
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
 <20240311165826.1728693-2-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240311165826.1728693-2-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11.03.2024 17:58, Jeffrey Hugo wrote:
> During the boot process of AIC100, the bootloaders (PBL and SBL) log
> messages to device RAM. During SBL, if the host opens the QAIC_LOGGING
> channel, SBL will offload the contents of the log buffer to the host,
> and stream any new messages that SBL logs.
> 
> This log of the boot process can be very useful for an initial triage of
> any boot related issues. For example, if SBL rejects one of the runtime
> firmware images for a validation failure, SBL will log a reason why.
> 
> Add the ability of the driver to open the logging channel, receive the
> messages, and store them. Also define a debugfs entry called "bootlog"
> by hooking into the DRM debugfs framework. When the bootlog debugfs
> entry is read, the current contents of the log that the host is caching
> is displayed to the user. The driver will retain the cache until it
> detects that the device has rebooted.  At that point, the cache will be
> freed, and the driver will wait for a new log. With this scheme, the
> driver will only have a cache of the log from the current device boot.
> Note that if the driver initializes a device and it is already in the
> runtime state (QSM), no bootlog will be available through this mechanism
> because the driver and SBL have not communicated.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/qaic/Makefile       |   2 +
>  drivers/accel/qaic/qaic.h         |   8 +
>  drivers/accel/qaic/qaic_debugfs.c | 271 ++++++++++++++++++++++++++++++
>  drivers/accel/qaic/qaic_debugfs.h |  20 +++
>  drivers/accel/qaic/qaic_drv.c     |  16 +-
>  5 files changed, 316 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/accel/qaic/qaic_debugfs.c
>  create mode 100644 drivers/accel/qaic/qaic_debugfs.h
> 
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> index 3f7f6dfde7f2..2cadcc1baa0e 100644
> --- a/drivers/accel/qaic/Makefile
> +++ b/drivers/accel/qaic/Makefile
> @@ -11,3 +11,5 @@ qaic-y := \
>  	qaic_data.o \
>  	qaic_drv.o \
>  	qaic_timesync.o
> +
> +qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 9256653b3036..03d9c9fbffb3 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -153,6 +153,14 @@ struct qaic_device {
>  	struct mhi_device	*qts_ch;
>  	/* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
>  	struct workqueue_struct	*qts_wq;
> +	/* Head of list of page allocated by MHI bootlog device */
> +	struct list_head        bootlog;
> +	/* MHI bootlog channel device */
> +	struct mhi_device       *bootlog_ch;
> +	/* Work queue for tasks related to MHI bootlog device */
> +	struct workqueue_struct *bootlog_wq;
> +	/* Synchronizes access of pages in MHI bootlog device */
> +	struct mutex            bootlog_mutex;
>  };
>  
>  struct qaic_drm_device {
> diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
> new file mode 100644
> index 000000000000..4f87fe29be1a
> --- /dev/null
> +++ b/drivers/accel/qaic/qaic_debugfs.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/list.h>
> +#include <linux/mhi.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "qaic.h"
> +#include "qaic_debugfs.h"
> +
> +#define BOOTLOG_POOL_SIZE		16
> +#define BOOTLOG_MSG_SIZE		512
> +
> +struct bootlog_msg {
> +	/* Buffer for bootlog messages */
> +	char str[BOOTLOG_MSG_SIZE];
> +	/* Root struct of device, used to access device resources */
> +	struct qaic_device *qdev;
> +	/* Work struct to schedule work coming on QAIC_LOGGING channel */
> +	struct work_struct work;
> +};
> +
> +struct bootlog_page {
> +	/* Node in list of bootlog pages maintained by root device struct */
> +	struct list_head node;
> +	/* Total size of the buffer that holds the bootlogs. It is PAGE_SIZE */
> +	unsigned int size;
> +	/* Offset for the next bootlog */
> +	unsigned int offset;
> +};
> +
> +static int bootlog_show(struct seq_file *s, void *unused)
> +{
> +	struct bootlog_page *page;
> +	struct qaic_device *qdev;
> +	void *page_end;
> +	void *log;
> +
> +	qdev = s->private;
> +	mutex_lock(&qdev->bootlog_mutex);
> +	list_for_each_entry(page, &qdev->bootlog, node) {
> +		log = page + 1;
> +		page_end = (void *)page + page->offset;
> +		while (log < page_end) {
> +			seq_printf(s, "%s", (char *)log);
> +			log += strlen(log) + 1;
> +		}
> +	}
> +	mutex_unlock(&qdev->bootlog_mutex);
> +
> +	return 0;
> +}
> +
> +static int bootlog_fops_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, bootlog_show, inode->i_private);
> +}
> +
> +static const struct file_operations bootlog_fops = {
> +	.owner = THIS_MODULE,
> +	.open = bootlog_fops_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +void qaic_debugfs_init(struct qaic_drm_device *qddev)
> +{
> +	struct qaic_device *qdev = qddev->qdev;
> +	struct dentry *debugfs_root;
> +
> +	debugfs_root = to_drm(qddev)->debugfs_root;
> +
> +	debugfs_create_file("bootlog", 0400, debugfs_root, qdev, &bootlog_fops);
> +}
> +
> +static struct bootlog_page *alloc_bootlog_page(struct qaic_device *qdev)
> +{
> +	struct bootlog_page *page;
> +
> +	page = (struct bootlog_page *)devm_get_free_pages(&qdev->pdev->dev, GFP_KERNEL, 0);
> +	if (!page)
> +		return page;
> +
> +	page->size = PAGE_SIZE;
> +	page->offset = sizeof(*page);
> +	list_add_tail(&page->node, &qdev->bootlog);
> +
> +	return page;
> +}
> +
> +static int reset_bootlog(struct qaic_device *qdev)
> +{
> +	struct bootlog_page *page;
> +	struct bootlog_page *i;
> +
> +	list_for_each_entry_safe(page, i, &qdev->bootlog, node) {
> +		list_del(&page->node);
> +		devm_free_pages(&qdev->pdev->dev, (unsigned long)page);
> +	}
This is currently dead code. reset is only used to init the bootlog. You may consider making this init_bootlog() if you are not planning to actually reset the bootlog.
> +
> +	page = alloc_bootlog_page(qdev);
> +	if (!page)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void *bootlog_get_space(struct qaic_device *qdev, unsigned int size)
> +{
> +	struct bootlog_page *page;
> +
> +	page = list_last_entry(&qdev->bootlog, struct bootlog_page, node);
> +
> +	if (size > page->size - sizeof(*page))
Not critical but would be safer to use this condition: "sizeof(*page) + size > page->size"

> +		return NULL;
> +
> +	if (page->offset + size > page->size) {
> +		page = alloc_bootlog_page(qdev);
> +		if (!page)
> +			return NULL;
> +	}
> +
> +	return (void *)page + page->offset;
> +}
> +
> +static void bootlog_commit(struct qaic_device *qdev, unsigned int size)
> +{
> +	struct bootlog_page *page;
> +
> +	page = list_last_entry(&qdev->bootlog, struct bootlog_page, node);
> +
> +	page->offset += size;
> +}
> +
> +static void bootlog_log(struct work_struct *work)
> +{
> +	struct bootlog_msg *msg = container_of(work, struct bootlog_msg, work);
> +	unsigned int len = strlen(msg->str) + 1;
> +	struct qaic_device *qdev = msg->qdev;
> +	void *log;
> +
> +	mutex_lock(&qdev->bootlog_mutex);
> +	log = bootlog_get_space(qdev, len);
> +	if (log) {
> +		memcpy(log, msg, len);
> +		bootlog_commit(qdev, len);
> +	}
> +	mutex_unlock(&qdev->bootlog_mutex);
> +
> +	if (mhi_queue_buf(qdev->bootlog_ch, DMA_FROM_DEVICE, msg, BOOTLOG_MSG_SIZE, MHI_EOT))
> +		devm_kfree(&qdev->pdev->dev, msg);
You are freeing `struct work` while still in work callback. This is unsafe.
See https://elixir.bootlin.com/linux/v6.8/source/kernel/workqueue.c#L2564.
Work ptr is kept in busy_hash after the callback has finished and may be still be accessed.

> +}
> +
> +static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
> +{
> +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
> +	struct bootlog_msg *msg;
> +	int i, ret;
> +
> +	qdev->bootlog_wq = alloc_ordered_workqueue("qaic_bootlog", 0);
> +	if (!qdev->bootlog_wq) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	mutex_lock(&qdev->bootlog_mutex);
Looks like locking should be inside reset_bootlog(), like in other places.

> +	ret = reset_bootlog(qdev);
> +	mutex_unlock(&qdev->bootlog_mutex);
> +	if (ret)
> +		goto destroy_workqueue;
> +
> +	ret = mhi_prepare_for_transfer(mhi_dev);
> +	if (ret)
> +		goto destroy_workqueue;
> +
> +	for (i = 0; i < BOOTLOG_POOL_SIZE; i++) {
> +		msg = devm_kzalloc(&qdev->pdev->dev, sizeof(*msg), GFP_KERNEL);
> +		if (!msg) {
> +			ret = -ENOMEM;
> +			goto mhi_unprepare;
> +		}
> +
> +		msg->qdev = qdev;
> +		INIT_WORK(&msg->work, bootlog_log);
> +
> +		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, msg, BOOTLOG_MSG_SIZE, MHI_EOT);
> +		if (ret)
> +			goto mhi_unprepare;
> +	}
> +
> +	dev_set_drvdata(&mhi_dev->dev, qdev);
> +	qdev->bootlog_ch = mhi_dev;
> +	return 0;
> +
> +mhi_unprepare:
> +	mhi_unprepare_from_transfer(mhi_dev);
> +destroy_workqueue:
> +	flush_workqueue(qdev->bootlog_wq);
> +	destroy_workqueue(qdev->bootlog_wq);
> +out:
> +	return ret;
> +}
> +
> +static void qaic_bootlog_mhi_remove(struct mhi_device *mhi_dev)
> +{
> +	struct qaic_device *qdev;
> +
> +	qdev = dev_get_drvdata(&mhi_dev->dev);
> +
> +	mhi_unprepare_from_transfer(qdev->bootlog_ch);
> +	flush_workqueue(qdev->bootlog_wq);
> +	destroy_workqueue(qdev->bootlog_wq);
> +	qdev->bootlog_ch = NULL;
> +}
> +
> +static void qaic_bootlog_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
> +{
> +}
> +
> +static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
> +{
> +	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
> +	struct bootlog_msg *msg = mhi_result->buf_addr;
> +
> +	if (mhi_result->transaction_status) {
> +		devm_kfree(&qdev->pdev->dev, msg);
> +		return;
> +	}
> +
> +	/* Force a null at the end of the transferred string */
> +	msg->str[mhi_result->bytes_xferd - 1] = 0;
Is it guaranteed that bytes_xferd will always be within valid range here?

> +
> +	queue_work(qdev->bootlog_wq, &msg->work);
> +}
> +
> +static const struct mhi_device_id qaic_bootlog_mhi_match_table[] = {
> +	{ .chan = "QAIC_LOGGING", },
> +	{},
> +};
> +
> +static struct mhi_driver qaic_bootlog_mhi_driver = {
> +	.id_table = qaic_bootlog_mhi_match_table,
> +	.remove = qaic_bootlog_mhi_remove,
> +	.probe = qaic_bootlog_mhi_probe,
> +	.ul_xfer_cb = qaic_bootlog_mhi_ul_xfer_cb,
> +	.dl_xfer_cb = qaic_bootlog_mhi_dl_xfer_cb,
> +	.driver = {
> +		.name = "qaic_bootlog",
> +	},
> +};
> +
> +int qaic_bootlog_register(void)
> +{
> +	return mhi_driver_register(&qaic_bootlog_mhi_driver);
> +}
> +
> +void qaic_bootlog_unregister(void)
> +{
> +	mhi_driver_unregister(&qaic_bootlog_mhi_driver);
> +}
> diff --git a/drivers/accel/qaic/qaic_debugfs.h b/drivers/accel/qaic/qaic_debugfs.h
> new file mode 100644
> index 000000000000..ea3fd1a88405
> --- /dev/null
> +++ b/drivers/accel/qaic/qaic_debugfs.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> +
> +#ifndef __QAIC_DEBUGFS_H__
> +#define __QAIC_DEBUGFS_H__
> +
> +#include <drm/drm_file.h>
> +
> +#ifdef CONFIG_DEBUG_FS
> +int qaic_bootlog_register(void);
> +void qaic_bootlog_unregister(void);
> +void qaic_debugfs_init(struct qaic_drm_device *qddev);
> +#else
> +int qaic_bootlog_register(void) { return 0; }
> +void qaic_bootlog_unregister(void) {}
> +void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
> +#endif /* CONFIG_DEBUG_FS */
> +#endif /* __QAIC_DEBUGFS_H__ */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index d1a632dbaec6..f072edb74f22 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -28,6 +28,7 @@
>  
>  #include "mhi_controller.h"
>  #include "qaic.h"
> +#include "qaic_debugfs.h"
>  #include "qaic_timesync.h"
>  
>  MODULE_IMPORT_NS(DMA_BUF);
> @@ -229,8 +230,12 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
>  	qddev->partition_id = partition_id;
>  
>  	ret = drm_dev_register(drm, 0);
> -	if (ret)
> +	if (ret) {
>  		pci_dbg(qdev->pdev, "drm_dev_register failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	qaic_debugfs_init(qddev);
>  
>  	return ret;
>  }
> @@ -380,6 +385,9 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>  	if (ret)
>  		return NULL;
>  	ret = drmm_mutex_init(drm, &qdev->cntl_mutex);
> +	if (ret)
> +		return NULL;
> +	ret = drmm_mutex_init(drm, &qdev->bootlog_mutex);
>  	if (ret)
>  		return NULL;
>  
> @@ -399,6 +407,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>  	qddev->qdev = qdev;
>  
>  	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
> +	INIT_LIST_HEAD(&qdev->bootlog);
>  	INIT_LIST_HEAD(&qddev->users);
>  
>  	for (i = 0; i < qdev->num_dbc; ++i) {
> @@ -639,6 +648,10 @@ static int __init qaic_init(void)
>  	if (ret)
>  		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
>  
> +	ret = qaic_bootlog_register();
> +	if (ret)
> +		pr_debug("qaic: qaic_bootlog_register failed %d\n", ret);
> +
>  	return 0;
>  
>  free_pci:
> @@ -664,6 +677,7 @@ static void __exit qaic_exit(void)
>  	 * reinitializing the link_up state after the cleanup is done.
>  	 */
>  	link_up = true;
> +	qaic_bootlog_unregister();
>  	qaic_timesync_deinit();
>  	mhi_driver_unregister(&qaic_mhi_driver);
>  	pci_unregister_driver(&qaic_pci_driver);

