Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F348B1D3237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgENOIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:46524 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727910AbgENOIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465312; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BUlaTRsTz1NITBKje+KUCdzS1lVYjOwVNM9Cj/PSYlE=; b=JvqDJawfj4ND1ItlnWPazj6IkDtBMmAqUWoEuKPGEnHxPaQkmsWz8udPtnDBPjJoZztQI/s6
 HDSiCE/71qtianlzaw7z5jYyXJEqUTPLy9LfxvDJue543jgJFMOy/6S84Tudc7A/XQrdFenZ
 u7zkgBErGC4aHkCCM+FuptBbc8c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50d6.7f386c4f3500-smtp-out-n01;
 Thu, 14 May 2020 14:08:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9129EC44798; Thu, 14 May 2020 14:08:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 902D6C4478F;
        Thu, 14 May 2020 14:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 902D6C4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 4/8] qaic: Implement control path
Date:   Thu, 14 May 2020 08:07:42 -0600
Message-Id: <1589465266-20056-5-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Once a qaic device is fully booted, the control path is available for use.
The control path allows the host to use a MHI channel to send requests to
the device.  The canonical usecase for the control path is allowing
userspace to configure the device for a workload.  This is accomplished
via the manage ioctl.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/Makefile       |    3 +-
 drivers/misc/qaic/qaic.h         |   61 +++
 drivers/misc/qaic/qaic_control.c | 1015 ++++++++++++++++++++++++++++++++++++++
 drivers/misc/qaic/qaic_drv.c     |  159 +++++-
 include/uapi/misc/qaic.h         |  117 +++++
 5 files changed, 1343 insertions(+), 12 deletions(-)
 create mode 100644 drivers/misc/qaic/qaic_control.c
 create mode 100644 include/uapi/misc/qaic.h

diff --git a/drivers/misc/qaic/Makefile b/drivers/misc/qaic/Makefile
index b5fd819..7a5513b 100644
--- a/drivers/misc/qaic/Makefile
+++ b/drivers/misc/qaic/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_QAIC)	:= qaic.o
 
 qaic-y := \
 	qaic_drv.o \
-	mhi_controller.o
+	mhi_controller.o \
+	qaic_control.o
diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
index 58ca167..c35a4e1 100644
--- a/drivers/misc/qaic/qaic.h
+++ b/drivers/misc/qaic/qaic.h
@@ -7,11 +7,21 @@
 #define QAICINTERNAL_H_
 
 #include <linux/cdev.h>
+#include <linux/idr.h>
 #include <linux/kref.h>
 #include <linux/mhi.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/spinlock.h>
 #include <linux/srcu.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#define QAIC_NUM_DBC		16
+#define QAIC_DBC_BASE		0x20000
+#define QAIC_DBC_SIZE		0x1000
+
+#define QAIC_DBC_OFF(i)		((i) * QAIC_DBC_SIZE + QAIC_DBC_BASE)
 
 struct qaic_user {
 	pid_t			handle;
@@ -21,17 +31,68 @@ struct qaic_user {
 	struct kref		ref_count;
 };
 
+struct dma_bridge_chan {
+	struct qaic_device	*qdev;
+	unsigned int		id;
+	/* also the base of the entire memory allocation */
+	void			*req_q_base;
+	void			*rsp_q_base;
+	dma_addr_t		dma_addr;
+	u32			total_size;
+	u32			nelem;
+	struct mutex		mem_lock;
+	struct idr		mem_handles;
+	struct qaic_user	*usr;
+	u16			next_req_id;
+	void __iomem		*dbc_base;
+	spinlock_t		xfer_lock;
+	struct list_head	xfer_list;
+	struct srcu_struct	ch_lock;
+	struct dentry		*debugfs_root;
+	bool			in_use;
+	wait_queue_head_t	dbc_release;
+};
+
 struct qaic_device {
 	struct pci_dev		*pdev;
 	int			bars;
 	void __iomem		*bar_0;
+	void __iomem		*bar_2;
 	struct mhi_controller	*mhi_cntl;
 	struct mhi_device	*cntl_ch;
+	struct list_head	cntl_xfer_list;
+	u32			next_seq_num;
+	struct mutex		cntl_mutex;
+	bool			cntl_lost_buf;
 	struct cdev		*cdev;
 	struct device		*dev;
+	struct dma_bridge_chan	dbc[QAIC_NUM_DBC];
+	struct workqueue_struct	*cntl_wq;
 	bool			in_reset;
 	struct srcu_struct	dev_lock;
 	struct list_head	users;
 	struct mutex		users_mutex;
 };
+
+int get_dbc_req_elem_size(void);
+int get_dbc_rsp_elem_size(void);
+int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr,
+		     u16 *major, u16 *minor);
+int qaic_manage_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
+		      unsigned long arg);
+
+void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result);
+
+void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result);
+
+int qaic_control_open(struct qaic_device *qdev);
+void qaic_control_close(struct qaic_device *qdev);
+void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr);
+
+int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
+void release_dbc(struct qaic_device *qdev, u32 dbc_id);
+
+void wake_all_cntl(struct qaic_device *qdev);
 #endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_control.c b/drivers/misc/qaic/qaic_control.c
new file mode 100644
index 0000000..00ac5fc
--- /dev/null
+++ b/drivers/misc/qaic/qaic_control.c
@@ -0,0 +1,1015 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
+#include <linux/wait.h>
+#include <uapi/misc/qaic.h>
+
+#include "qaic.h"
+
+#define MANAGE_MAGIC_NUMBER	0x43494151 /* "QAIC" in little endian */
+#define QAIC_DBC_Q_GAP		0x100
+#define QAIC_DBC_Q_BUF_ALIGN	0x1000
+#define RESP_TIMEOUT		(60 * HZ)
+
+/*
+ * Wire encoding structures for the manage protocol.
+ * All fields are little endian on the wire
+ */
+struct _msg_hdr {
+	u32 magic_number;
+	u32 sequence_number;
+	u32 len; /* length of this message */
+	u32 count; /* number of transactions in this message */
+	u32 handle; /* unique id to track the resources consumed */
+} __packed;
+
+struct _msg {
+	struct _msg_hdr hdr;
+	u8 data[QAIC_MANAGE_MAX_MSG_LENGTH];
+} __packed;
+
+struct wrapper_msg {
+	struct kref ref_count;
+	struct _msg msg;
+};
+
+struct _trans_hdr {
+	u32 type;
+	u32 len;
+} __packed;
+
+struct _trans_passthrough {
+	struct _trans_hdr hdr;
+	u8 data[0];
+} __packed;
+
+struct _addr_size_pair {
+	u64 addr;
+	u64 size;
+} __packed;
+
+struct _trans_dma_xfer {
+	struct _trans_hdr hdr;
+	u32 tag;
+	u32 count;
+	struct _addr_size_pair data[0];
+} __packed;
+
+struct _trans_activate_to_dev {
+	struct _trans_hdr hdr;
+	u32 buf_len;
+	u64 req_q_addr;
+	u32 req_q_size;
+	u64 rsp_q_addr;
+	u32 rsp_q_size;
+	u32 reserved;
+} __packed;
+
+struct _trans_activate_from_dev {
+	struct _trans_hdr hdr;
+	u32 status;
+	u32 dbc_id;
+} __packed;
+
+struct _trans_deactivate_from_dev {
+	struct _trans_hdr hdr;
+	u32 status;
+	u32 dbc_id;
+} __packed;
+
+struct _trans_terminate_to_dev {
+	struct _trans_hdr hdr;
+	u32 handle;
+} __packed;
+
+struct _trans_terminate_from_dev {
+	struct _trans_hdr hdr;
+	u32 status;
+} __packed;
+
+struct _trans_status_to_dev {
+	struct _trans_hdr hdr;
+} __packed;
+
+struct _trans_status_from_dev {
+	struct _trans_hdr hdr;
+	u16 major;
+	u16 minor;
+	u32 status;
+} __packed;
+
+struct xfer_queue_elem {
+	struct list_head list;
+	u32 seq_num;
+	struct completion xfer_done;
+	void *buf;
+};
+
+struct dma_xfer {
+	struct list_head list;
+	struct sg_table *sgt;
+	struct page **page_list;
+	unsigned long nr_pages;
+};
+
+struct ioctl_resources {
+	struct list_head dma_xfers;
+	void *buf;
+	dma_addr_t dma_addr;
+	u32 total_size;
+	u32 nelem;
+	void *rsp_q_base;
+	u32 status;
+	u32 dbc_id;
+};
+
+struct resp_work {
+	struct work_struct work;
+	struct qaic_device *qdev;
+	void *buf;
+};
+
+static void free_wrapper(struct kref *ref)
+{
+	struct wrapper_msg *wrapper = container_of(ref, struct wrapper_msg,
+						   ref_count);
+
+	kfree(wrapper);
+}
+
+static void save_dbc_buf(struct qaic_device *qdev,
+			 struct ioctl_resources *resources,
+			 struct qaic_user *usr)
+{
+	u32 dbc_id = resources->dbc_id;
+
+	if (resources->buf) {
+		wait_event_interruptible(qdev->dbc[dbc_id].dbc_release,
+					 !qdev->dbc[dbc_id].in_use);
+		qdev->dbc[dbc_id].req_q_base = resources->buf;
+		qdev->dbc[dbc_id].rsp_q_base = resources->rsp_q_base;
+		qdev->dbc[dbc_id].dma_addr = resources->dma_addr;
+		qdev->dbc[dbc_id].total_size = resources->total_size;
+		qdev->dbc[dbc_id].nelem = resources->nelem;
+		qdev->dbc[dbc_id].usr = usr;
+		qdev->dbc[dbc_id].in_use = true;
+		resources->buf = 0;
+	}
+}
+
+static void free_dbc_buf(struct qaic_device *qdev,
+			 struct ioctl_resources *resources)
+{
+	if (resources->buf)
+		dma_free_coherent(&qdev->pdev->dev, resources->total_size,
+				  resources->buf, resources->dma_addr);
+	resources->buf = 0;
+}
+
+static void free_dma_xfers(struct qaic_device *qdev,
+			   struct ioctl_resources *resources)
+{
+	struct dma_xfer *xfer;
+	struct dma_xfer *x;
+	int i;
+
+	list_for_each_entry_safe(xfer, x, &resources->dma_xfers, list) {
+		dma_unmap_sg(&qdev->pdev->dev, xfer->sgt->sgl, xfer->sgt->nents,
+			     DMA_TO_DEVICE);
+		sg_free_table(xfer->sgt);
+		kfree(xfer->sgt);
+		for (i = 0; i < xfer->nr_pages; ++i)
+			put_page(xfer->page_list[i]);
+		kfree(xfer->page_list);
+		list_del(&xfer->list);
+		kfree(xfer);
+	}
+}
+
+static int encode_passthrough(struct qaic_device *qdev, void *trans,
+			      struct _msg *msg, u32 *user_len)
+{
+	struct qaic_manage_trans_passthrough *in_trans = trans;
+	struct _trans_passthrough *out_trans = (void *)msg + msg->hdr.len;
+
+	if (msg->hdr.len + in_trans->hdr.len > sizeof(*msg))
+		return -ENOSPC;
+
+	memcpy(out_trans, in_trans, in_trans->hdr.len);
+	msg->hdr.len += in_trans->hdr.len;
+	*user_len += in_trans->hdr.len;
+	out_trans->hdr.type = cpu_to_le32(TRANS_PASSTHROUGH_TO_DEV);
+	out_trans->hdr.len = cpu_to_le32(out_trans->hdr.len);
+
+	return 0;
+}
+
+static int encode_dma(struct qaic_device *qdev, void *trans, struct _msg *msg,
+		      u32 *user_len, struct ioctl_resources *resources)
+{
+	struct qaic_manage_trans_dma_xfer *in_trans = trans;
+	struct _trans_dma_xfer *out_trans = (void *)msg + msg->hdr.len;
+	struct dma_xfer *xfer;
+	unsigned long nr_pages;
+	struct page **page_list;
+	struct scatterlist *last;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	unsigned int dma_len;
+	int nents;
+	int dmas;
+	int ret;
+	int i;
+
+	if (in_trans->addr + in_trans->size < in_trans->addr ||
+	    !in_trans->size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
+	if (!xfer) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	nr_pages = PAGE_ALIGN(in_trans->size + offset_in_page(in_trans->addr))
+								>> PAGE_SHIFT;
+
+	page_list = kmalloc_array(nr_pages, sizeof(*page_list), GFP_KERNEL);
+	if (!page_list) {
+		ret = -ENOMEM;
+		goto free_resource;
+	}
+
+	ret = get_user_pages_fast(in_trans->addr, nr_pages, 0, page_list);
+	if (ret < 0 || ret != nr_pages) {
+		ret = -EFAULT;
+		goto free_page_list;
+	}
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		ret = -ENOMEM;
+		goto put_pages;
+	}
+
+	ret = sg_alloc_table_from_pages(sgt, page_list, nr_pages,
+					offset_in_page(in_trans->addr),
+					in_trans->size, GFP_KERNEL);
+	if (ret) {
+		ret = -ENOMEM;
+		goto free_sgt;
+	}
+
+	nents = dma_map_sg(&qdev->pdev->dev, sgt->sgl, sgt->nents,
+			   DMA_TO_DEVICE);
+	if (!nents) {
+		ret = -EFAULT;
+		goto free_table;
+	}
+
+	/*
+	 * It turns out several of the iommu drivers don't combine adjacent
+	 * regions, which is really what we expect based on the description of
+	 * dma_map_sg(), so lets see if that can be done.  It makes our message
+	 * more efficent.
+	 */
+	dmas = 0;
+	last = sgt->sgl;
+	for_each_sg(sgt->sgl, sg, nents, i) {
+		if (sg_dma_address(last) + sg_dma_len(last) !=
+		    sg_dma_address(sg))
+			dmas++;
+		last = sg;
+	}
+
+	/*
+	 * now that we finally know how many memory segments we will be encoding
+	 * we can check to see if we have space in the message
+	 */
+	if (msg->hdr.len + sizeof(*out_trans) + dmas * sizeof(*out_trans->data)
+							> sizeof(*msg)) {
+		ret = -ENOSPC;
+		goto dma_unmap;
+	}
+
+	msg->hdr.len += sizeof(*out_trans) + dmas * sizeof(*out_trans->data);
+
+	out_trans->hdr.type = cpu_to_le32(TRANS_DMA_XFER_TO_DEV);
+	out_trans->hdr.len = cpu_to_le32(sizeof(*out_trans) +
+					 dmas * sizeof(*out_trans->data));
+	out_trans->tag = cpu_to_le32(in_trans->tag);
+	out_trans->count = cpu_to_le32(dmas);
+
+	i = 0;
+	last = sgt->sgl;
+	dma_len = 0;
+	for_each_sg(sgt->sgl, sg, nents, dmas) {
+		/* hit a discontinuity, finalize segment and start new one */
+		if (sg_dma_address(last) + sg_dma_len(last) !=
+		    sg_dma_address(sg)) {
+			out_trans->data[i].size = cpu_to_le64(dma_len);
+			if (dma_len)
+				i++;
+			dma_len = 0;
+			out_trans->data[i].addr =
+						cpu_to_le64(sg_dma_address(sg));
+		}
+		dma_len += sg_dma_len(sg);
+		last = sg;
+	}
+	/* finalize the last segment */
+	out_trans->data[i].size = cpu_to_le64(dma_len);
+
+	*user_len += in_trans->hdr.len;
+
+	xfer->sgt = sgt;
+	xfer->page_list = page_list;
+	xfer->nr_pages = nr_pages;
+	list_add(&xfer->list, &resources->dma_xfers);
+	return 0;
+
+dma_unmap:
+	dma_unmap_sg(&qdev->pdev->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
+free_table:
+	sg_free_table(sgt);
+free_sgt:
+	kfree(sgt);
+put_pages:
+	for (i = 0; i < nr_pages; ++i)
+		put_page(page_list[i]);
+free_page_list:
+	kfree(page_list);
+free_resource:
+	kfree(xfer);
+out:
+	return ret;
+}
+
+static int encode_activate(struct qaic_device *qdev, void *trans,
+			   struct _msg *msg, u32 *user_len,
+			   struct ioctl_resources *resources)
+{
+	struct qaic_manage_trans_activate_to_dev *in_trans = trans;
+	struct _trans_activate_to_dev *out_trans = (void *)msg + msg->hdr.len;
+	dma_addr_t dma_addr;
+	void *buf;
+	u32 nelem;
+	u32 size;
+
+	if (msg->hdr.len + sizeof(*out_trans) > sizeof(*msg))
+		return -ENOSPC;
+
+	if (!in_trans->queue_size)
+		return -EINVAL;
+
+	if (in_trans->resv)
+		return -EINVAL;
+
+	nelem = in_trans->queue_size;
+	size = (get_dbc_req_elem_size() + get_dbc_rsp_elem_size()) * nelem;
+	if (size / nelem != get_dbc_req_elem_size() + get_dbc_rsp_elem_size())
+		return -EINVAL;
+
+	if (size + QAIC_DBC_Q_GAP + QAIC_DBC_Q_BUF_ALIGN < size)
+		return -EINVAL;
+
+	size = ALIGN((size + QAIC_DBC_Q_GAP), QAIC_DBC_Q_BUF_ALIGN);
+
+	buf = dma_alloc_coherent(&qdev->pdev->dev, size, &dma_addr, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	out_trans->hdr.type = cpu_to_le32(TRANS_ACTIVATE_TO_DEV);
+	out_trans->hdr.len = cpu_to_le32(sizeof(*out_trans));
+	out_trans->buf_len = cpu_to_le32(size);
+	out_trans->req_q_addr = cpu_to_le64(dma_addr);
+	out_trans->req_q_size = cpu_to_le32(nelem);
+	out_trans->rsp_q_addr = cpu_to_le64(dma_addr + size - nelem *
+					    get_dbc_rsp_elem_size());
+	out_trans->rsp_q_size = cpu_to_le32(nelem);
+
+	*user_len += in_trans->hdr.len;
+	msg->hdr.len += sizeof(*out_trans);
+
+	resources->buf = buf;
+	resources->dma_addr = dma_addr;
+	resources->total_size = size;
+	resources->nelem = nelem;
+	resources->rsp_q_base = buf + size - nelem * get_dbc_rsp_elem_size();
+	return 0;
+}
+
+static int encode_deactivate(struct qaic_device *qdev, void *trans,
+			     u32 *user_len, struct qaic_user *usr)
+{
+	struct qaic_manage_trans_deactivate *in_trans = trans;
+
+	if (in_trans->dbc_id >= QAIC_NUM_DBC || in_trans->resv)
+		return -EINVAL;
+
+	*user_len += in_trans->hdr.len;
+
+	return disable_dbc(qdev, in_trans->dbc_id, usr);
+}
+
+static int encode_status(struct qaic_device *qdev, void *trans,
+			 struct _msg *msg, u32 *user_len)
+{
+	struct qaic_manage_trans_status_to_dev *in_trans = trans;
+	struct _trans_status_to_dev *out_trans = (void *)msg + msg->hdr.len;
+
+	if (msg->hdr.len + in_trans->hdr.len > sizeof(*msg))
+		return -ENOSPC;
+
+	out_trans->hdr.type = cpu_to_le32(TRANS_STATUS_TO_DEV);
+	out_trans->hdr.len = cpu_to_le32(in_trans->hdr.len);
+	msg->hdr.len += in_trans->hdr.len;
+	*user_len += in_trans->hdr.len;
+
+	return 0;
+}
+static int encode_message(struct qaic_device *qdev,
+			  struct qaic_manage_msg *user_msg, struct _msg *msg,
+			  struct ioctl_resources *resources,
+			  struct qaic_user *usr)
+{
+	struct qaic_manage_trans_hdr *trans_hdr;
+	u32 user_len = 0;
+	int ret;
+	int i;
+
+	msg->hdr.len = sizeof(msg->hdr);
+	for (i = 0; i < user_msg->count; ++i) {
+		if (user_len >= user_msg->len) {
+			ret = -EINVAL;
+			break;
+		}
+		trans_hdr = (struct qaic_manage_trans_hdr *)
+						(user_msg->data + user_len);
+		if (user_len + trans_hdr->len > user_msg->len) {
+			ret = -EINVAL;
+			break;
+		}
+
+		switch (trans_hdr->type) {
+		case TRANS_PASSTHROUGH_FROM_USR:
+			ret = encode_passthrough(qdev, trans_hdr, msg,
+						 &user_len);
+			break;
+		case TRANS_DMA_XFER_FROM_USR:
+			ret = encode_dma(qdev, trans_hdr, msg, &user_len,
+					 resources);
+			break;
+		case TRANS_ACTIVATE_FROM_USR:
+			ret = encode_activate(qdev, trans_hdr, msg, &user_len,
+					      resources);
+			break;
+		case TRANS_DEACTIVATE_FROM_USR:
+			ret = encode_deactivate(qdev, trans_hdr, &user_len,
+						usr);
+			break;
+		case TRANS_STATUS_FROM_USR:
+			ret = encode_status(qdev, trans_hdr, msg, &user_len);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ret)
+			break;
+	}
+
+	if (user_len != user_msg->len)
+		ret = -EINVAL;
+
+	if (ret) {
+		free_dma_xfers(qdev, resources);
+		free_dbc_buf(qdev, resources);
+		return ret;
+	}
+
+	msg->hdr.count = user_msg->count;
+	return 0;
+}
+
+static int decode_passthrough(struct qaic_device *qdev, void *trans,
+			      struct qaic_manage_msg *user_msg, u32 *msg_len)
+{
+	struct _trans_passthrough *in_trans = trans;
+	struct qaic_manage_trans_passthrough *out_trans;
+	u32 len;
+
+	out_trans = (void *)user_msg->data + user_msg->len;
+
+	len = le32_to_cpu(in_trans->hdr.len);
+	if (user_msg->len + len > QAIC_MANAGE_MAX_MSG_LENGTH)
+		return -ENOSPC;
+
+	memcpy(out_trans, in_trans, len);
+	user_msg->len += len;
+	*msg_len += len;
+	out_trans->hdr.type = le32_to_cpu(out_trans->hdr.type);
+	return 0;
+}
+
+static int decode_activate(struct qaic_device *qdev, void *trans,
+			   struct qaic_manage_msg *user_msg, u32 *msg_len,
+			   struct ioctl_resources *resources,
+			   struct qaic_user *usr)
+{
+	struct _trans_activate_from_dev *in_trans = trans;
+	struct qaic_manage_trans_activate_from_dev *out_trans;
+	u32 len;
+
+	out_trans = (void *)user_msg->data + user_msg->len;
+
+	len = le32_to_cpu(in_trans->hdr.len);
+	if (user_msg->len + len > QAIC_MANAGE_MAX_MSG_LENGTH)
+		return -ENOSPC;
+
+	user_msg->len += len;
+	*msg_len += len;
+	out_trans->hdr.type = le32_to_cpu(in_trans->hdr.type);
+	out_trans->hdr.len = len;
+	out_trans->status = le32_to_cpu(in_trans->status);
+	out_trans->dbc_id = le32_to_cpu(in_trans->dbc_id);
+
+	if (!resources->buf)
+		/* how did we get an activate response without a request? */
+		return -EINVAL;
+
+	if (out_trans->dbc_id >= QAIC_NUM_DBC)
+		/*
+		 * The device assigned an invalid resource, which should never
+		 * happen.  Inject an error so the user can try to recover.
+		 */
+		out_trans->status = -ENODEV;
+
+	resources->status = out_trans->status;
+	resources->dbc_id = out_trans->dbc_id;
+	if (!resources->status)
+		save_dbc_buf(qdev, resources, usr);
+	return 0;
+}
+
+static int decode_deactivate(struct qaic_device *qdev, void *trans,
+			     u32 *msg_len)
+{
+	struct _trans_deactivate_from_dev *in_trans = trans;
+	u32 dbc_id = le32_to_cpu(in_trans->dbc_id);
+	u32 status = le32_to_cpu(in_trans->status);
+
+	if (dbc_id >= QAIC_NUM_DBC)
+		/*
+		 * The device assigned an invalid resource, which should never
+		 * happen.  Inject an error so the user can try to recover.
+		 */
+		return -ENODEV;
+
+	if (status)
+		/*
+		 * Releasing resources failed on the device side, which puts
+		 * us in a bind since they may still be in use, so be safe and
+		 * do nothing.
+		 */
+		return -ENODEV;
+
+	release_dbc(qdev, dbc_id);
+	*msg_len += sizeof(*in_trans);
+	return 0;
+}
+
+static int decode_status(struct qaic_device *qdev, void *trans,
+			 struct qaic_manage_msg *user_msg, u32 *user_len)
+{
+	struct _trans_status_from_dev *in_trans = trans;
+	struct qaic_manage_trans_status_from_dev *out_trans;
+	u32 len;
+
+	out_trans = (void *)user_msg->data + user_msg->len;
+
+	len = le32_to_cpu(in_trans->hdr.len);
+	if (user_msg->len + len > QAIC_MANAGE_MAX_MSG_LENGTH)
+		return -ENOSPC;
+
+	out_trans->hdr.type = le32_to_cpu(TRANS_STATUS_FROM_DEV);
+	out_trans->hdr.len = len;
+	out_trans->major = le32_to_cpu(in_trans->major);
+	out_trans->minor = le32_to_cpu(in_trans->minor);
+	*user_len += in_trans->hdr.len;
+	user_msg->len += len;
+
+	return 0;
+}
+
+static int decode_message(struct qaic_device *qdev,
+			  struct qaic_manage_msg *user_msg, struct _msg *msg,
+			  struct ioctl_resources *resources,
+			  struct qaic_user *usr)
+{
+	struct _trans_hdr *trans_hdr;
+	u32 msg_len = 0;
+	int ret;
+	int i;
+
+	if (msg->hdr.len > sizeof(*msg))
+		return -EINVAL;
+
+	user_msg->len = 0;
+	user_msg->count = le32_to_cpu(msg->hdr.count);
+
+	for (i = 0; i < user_msg->count; ++i) {
+		trans_hdr = (struct _trans_hdr *)(msg->data + msg_len);
+		if (msg_len + trans_hdr->len > msg->hdr.len)
+			return -EINVAL;
+
+		switch (trans_hdr->type) {
+		case TRANS_PASSTHROUGH_FROM_DEV:
+			ret = decode_passthrough(qdev, trans_hdr, user_msg,
+						 &msg_len);
+			break;
+		case TRANS_ACTIVATE_FROM_DEV:
+			ret = decode_activate(qdev, trans_hdr, user_msg,
+					      &msg_len, resources, usr);
+			break;
+		case TRANS_DEACTIVATE_FROM_DEV:
+			ret = decode_deactivate(qdev, trans_hdr, &msg_len);
+			break;
+		case TRANS_STATUS_FROM_DEV:
+			ret = decode_status(qdev, trans_hdr, user_msg,
+					    &msg_len);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (ret)
+			return ret;
+	}
+
+	if (msg_len != (msg->hdr.len - sizeof(msg->hdr)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void *msg_xfer(struct qaic_device *qdev, struct wrapper_msg *wrapper,
+		      u32 seq_num, bool ignore_signal)
+{
+	struct xfer_queue_elem elem;
+	struct _msg *out_buf;
+	size_t in_len;
+	long ret;
+
+	if (qdev->in_reset) {
+		mutex_unlock(&qdev->cntl_mutex);
+		return ERR_PTR(-ENODEV);
+	}
+
+	in_len = sizeof(wrapper->msg);
+
+	elem.seq_num = seq_num;
+	elem.buf = NULL;
+	init_completion(&elem.xfer_done);
+	if (likely(!qdev->cntl_lost_buf)) {
+		out_buf = kmalloc(sizeof(*out_buf), GFP_KERNEL);
+		if (!out_buf) {
+			mutex_unlock(&qdev->cntl_mutex);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		ret = mhi_queue_buf(qdev->cntl_ch, DMA_FROM_DEVICE,
+				    out_buf, sizeof(*out_buf), MHI_EOT);
+		if (ret) {
+			mutex_unlock(&qdev->cntl_mutex);
+			return ERR_PTR(ret);
+		}
+	} else {
+		/*
+		 * we lost a buffer because we queued a recv buf, but then
+		 * queuing the corresponding tx buf failed.  To try to avoid
+		 * a memory leak, lets reclaim it and use it for this
+		 * transaction.
+		 */
+		qdev->cntl_lost_buf = false;
+	}
+
+	kref_get(&wrapper->ref_count);
+	ret = mhi_queue_buf(qdev->cntl_ch, DMA_TO_DEVICE, &wrapper->msg, in_len,
+			    MHI_EOT);
+	if (ret) {
+		qdev->cntl_lost_buf = true;
+		kref_put(&wrapper->ref_count, free_wrapper);
+		mutex_unlock(&qdev->cntl_mutex);
+		return ERR_PTR(ret);
+	}
+
+	list_add_tail(&elem.list, &qdev->cntl_xfer_list);
+	mutex_unlock(&qdev->cntl_mutex);
+
+	if (ignore_signal)
+		ret = wait_for_completion_timeout(&elem.xfer_done,
+						  RESP_TIMEOUT);
+	else
+		ret = wait_for_completion_interruptible_timeout(&elem.xfer_done,
+								RESP_TIMEOUT);
+	/*
+	 * not using _interruptable because we have to cleanup or we'll
+	 * likely cause memory corruption
+	 */
+	mutex_lock(&qdev->cntl_mutex);
+	if (!list_empty(&elem.list))
+		list_del(&elem.list);
+	if (!ret && !elem.buf)
+		ret = -ETIMEDOUT;
+	else if (ret > 0 && !elem.buf)
+		ret = -EIO;
+	mutex_unlock(&qdev->cntl_mutex);
+
+	if (ret < 0) {
+		kfree(elem.buf);
+		return ERR_PTR(ret);
+	}
+
+	return elem.buf;
+}
+
+static int qaic_manage(struct qaic_device *qdev, struct qaic_user *usr,
+		       struct qaic_manage_msg *user_msg)
+{
+	struct ioctl_resources resources;
+	struct wrapper_msg *wrapper;
+	struct _msg *msg;
+	struct _msg *rsp;
+	int ret;
+
+	INIT_LIST_HEAD(&resources.dma_xfers);
+	resources.buf = NULL;
+
+	if (user_msg->len > QAIC_MANAGE_MAX_MSG_LENGTH ||
+	    user_msg->count >
+	    QAIC_MANAGE_MAX_MSG_LENGTH / sizeof(struct qaic_manage_trans_hdr)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
+	if (!wrapper) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	kref_init(&wrapper->ref_count);
+	msg = &wrapper->msg;
+
+	ret = encode_message(qdev, user_msg, msg, &resources, usr);
+	if (ret)
+		goto encode_failed;
+
+	ret = mutex_lock_interruptible(&qdev->cntl_mutex);
+	if (ret)
+		goto lock_failed;
+	msg->hdr.magic_number = MANAGE_MAGIC_NUMBER;
+	msg->hdr.sequence_number = cpu_to_le32(qdev->next_seq_num++);
+	msg->hdr.len = cpu_to_le32(msg->hdr.len);
+	msg->hdr.count = cpu_to_le32(msg->hdr.count);
+	if (usr)
+		msg->hdr.handle = cpu_to_le32(usr->handle);
+	else
+		msg->hdr.handle = 0;
+
+	/* msg_xfer releases the mutex */
+	rsp = msg_xfer(qdev, wrapper, qdev->next_seq_num - 1, false);
+	if (IS_ERR(rsp)) {
+		ret = PTR_ERR(rsp);
+		goto lock_failed;
+	}
+
+	ret = decode_message(qdev, user_msg, rsp, &resources, usr);
+
+	kfree(rsp);
+lock_failed:
+	free_dma_xfers(qdev, &resources);
+	free_dbc_buf(qdev, &resources);
+encode_failed:
+	kref_put(&wrapper->ref_count, free_wrapper);
+out:
+	return ret;
+}
+
+int qaic_manage_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
+		      unsigned long arg)
+{
+	struct qaic_manage_msg *user_msg;
+	int ret;
+
+	user_msg = kmalloc(sizeof(*user_msg), GFP_KERNEL);
+	if (!user_msg) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (copy_from_user(user_msg, (void __user *)arg, sizeof(*user_msg))) {
+		ret = -EFAULT;
+		goto copy_from_user_failed;
+	}
+
+	ret = qaic_manage(qdev, usr, user_msg);
+	if (ret)
+		goto copy_from_user_failed;
+
+	if (copy_to_user((void __user *)arg, user_msg, sizeof(*user_msg)))
+		ret = -EFAULT;
+
+copy_from_user_failed:
+	kfree(user_msg);
+out:
+	return ret;
+}
+
+int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr,
+		     u16 *major, u16 *minor)
+{
+	int ret;
+	struct qaic_manage_msg *user_msg;
+	struct qaic_manage_trans_status_to_dev *status_query;
+	struct qaic_manage_trans_status_from_dev *status_result;
+
+	user_msg = kmalloc(sizeof(*user_msg), GFP_KERNEL);
+	if (!user_msg) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	user_msg->len = sizeof(*status_query);
+	user_msg->count = 1;
+
+	status_query = (struct qaic_manage_trans_status_to_dev *)user_msg->data;
+	status_query->hdr.type = TRANS_STATUS_FROM_USR;
+	status_query->hdr.len = sizeof(status_query->hdr);
+
+	ret = qaic_manage(qdev, usr, user_msg);
+	if (ret)
+		goto kfree_user_msg;
+	status_result =
+		(struct qaic_manage_trans_status_from_dev *)user_msg->data;
+	*major = status_result->major;
+	*minor = status_result->minor;
+
+kfree_user_msg:
+	kfree(user_msg);
+out:
+	return ret;
+}
+
+static void resp_worker(struct work_struct *work)
+{
+	struct resp_work *resp = container_of(work, struct resp_work, work);
+	struct qaic_device *qdev = resp->qdev;
+	struct _msg *msg = resp->buf;
+	struct xfer_queue_elem *elem;
+	struct xfer_queue_elem *i;
+	bool found = false;
+
+	if (msg->hdr.magic_number != MANAGE_MAGIC_NUMBER) {
+		kfree(msg);
+		kfree(resp);
+		return;
+	}
+
+	mutex_lock(&qdev->cntl_mutex);
+	list_for_each_entry_safe(elem, i, &qdev->cntl_xfer_list, list) {
+		if (elem->seq_num == le32_to_cpu(msg->hdr.sequence_number)) {
+			found = true;
+			list_del_init(&elem->list);
+			elem->buf = msg;
+			complete_all(&elem->xfer_done);
+			break;
+		}
+	}
+	mutex_unlock(&qdev->cntl_mutex);
+
+	if (!found)
+		/* request must have timed out, drop packet */
+		kfree(msg);
+
+	kfree(resp);
+}
+
+void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result)
+{
+	struct _msg *msg = mhi_result->buf_addr;
+	struct wrapper_msg *wrapper = container_of(msg, struct wrapper_msg,
+						   msg);
+
+	kref_put(&wrapper->ref_count, free_wrapper);
+}
+
+void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct _msg *msg = mhi_result->buf_addr;
+	struct resp_work *resp;
+
+	if (mhi_result->transaction_status) {
+		kfree(msg);
+		return;
+	}
+
+	resp = kmalloc(sizeof(*resp), GFP_ATOMIC);
+	if (!resp) {
+		pci_err(qdev->pdev, "dl_xfer_cb alloc fail, dropping message\n");
+		kfree(msg);
+		return;
+	}
+
+	INIT_WORK(&resp->work, resp_worker);
+	resp->qdev = qdev;
+	resp->buf = msg;
+	queue_work(qdev->cntl_wq, &resp->work);
+}
+
+int qaic_control_open(struct qaic_device *qdev)
+{
+	if (!qdev->cntl_ch)
+		return -ENODEV;
+
+	return mhi_prepare_for_transfer(qdev->cntl_ch);
+}
+
+void qaic_control_close(struct qaic_device *qdev)
+{
+	mhi_unprepare_from_transfer(qdev->cntl_ch);
+}
+
+void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr)
+{
+	struct _trans_terminate_to_dev *trans;
+	struct wrapper_msg *wrapper;
+	struct _msg *msg;
+	struct _msg *rsp;
+
+	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
+	if (!wrapper)
+		return;
+
+	kref_init(&wrapper->ref_count);
+	msg = &wrapper->msg;
+
+	trans = (struct _trans_terminate_to_dev *)msg->data;
+
+	trans->hdr.type = cpu_to_le32(TRANS_TERMINATE_TO_DEV);
+	trans->hdr.len = cpu_to_le32(sizeof(*trans));
+	trans->handle = cpu_to_le32(usr->handle);
+
+	mutex_lock(&qdev->cntl_mutex);
+	msg->hdr.magic_number = MANAGE_MAGIC_NUMBER;
+	msg->hdr.sequence_number = cpu_to_le32(qdev->next_seq_num++);
+	msg->hdr.len = cpu_to_le32(sizeof(msg->hdr) + sizeof(*trans));
+	msg->hdr.count = cpu_to_le32(1);
+	msg->hdr.handle = cpu_to_le32(usr->handle);
+
+	/*
+	 * msg_xfer releases the mutex
+	 * We don't care about the return of msg_xfer since we will not do
+	 * anything different based on what happens.
+	 * We ignore pending signals since one will be set if the user is
+	 * killed, and we need give the device a chance to cleanup, otherwise
+	 * DMA may still be in progress when we return.
+	 */
+	rsp = msg_xfer(qdev, wrapper, qdev->next_seq_num - 1, true);
+	if (!IS_ERR(rsp))
+		kfree(rsp);
+	kref_put(&wrapper->ref_count, free_wrapper);
+}
+
+void wake_all_cntl(struct qaic_device *qdev)
+{
+	struct xfer_queue_elem *elem;
+	struct xfer_queue_elem *i;
+
+	mutex_lock(&qdev->cntl_mutex);
+	list_for_each_entry_safe(elem, i, &qdev->cntl_xfer_list, list) {
+		list_del_init(&elem->list);
+		complete_all(&elem->xfer_done);
+	}
+	mutex_unlock(&qdev->cntl_mutex);
+}
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index 6e4b936..6feecc0 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -12,6 +12,11 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/wait.h>
+#include <uapi/misc/qaic.h>
 
 #include "mhi_controller.h"
 #include "qaic.h"
@@ -21,6 +26,8 @@
 #define QAIC_NAME			"Qualcomm Cloud AI 100"
 #define QAIC_MAX_MINORS			256
 
+static u16 cntl_major;
+static u16 cntl_minor = 3;
 static int qaic_major;
 static struct class *qaic_class;
 static DEFINE_IDR(qaic_devs);
@@ -29,11 +36,14 @@ static bool link_up;
 
 static int qaic_device_open(struct inode *inode, struct file *filp);
 static int qaic_device_release(struct inode *inode, struct file *filp);
+static long qaic_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 
 static const struct file_operations qaic_ops = {
 	.owner = THIS_MODULE,
 	.open = qaic_device_open,
 	.release = qaic_device_release,
+	.unlocked_ioctl = qaic_ioctl,
+	.compat_ioctl = qaic_ioctl,
 };
 
 static void free_usr(struct kref *kref)
@@ -106,6 +116,7 @@ static int qaic_device_release(struct inode *inode, struct file *filp)
 		if (!qdev->in_reset) {
 			pci_dbg(qdev->pdev, "%s pid:%d\n", __func__,
 								current->pid);
+			qaic_release_usr(qdev, usr);
 		}
 		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 
@@ -123,12 +134,59 @@ static int qaic_device_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static long qaic_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct qaic_user *usr = filp->private_data;
+	struct qaic_device *qdev = usr->qdev;
+	unsigned int nr = _IOC_NR(cmd);
+	int qdev_rcu_id;
+	int usr_rcu_id;
+	int ret;
+
+	usr_rcu_id = srcu_read_lock(&usr->qdev_lock);
+	if (!qdev) {
+		srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+		return -ENODEV;
+	}
+
+	qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+		srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+		return -ENODEV;
+	}
+
+	if (_IOC_TYPE(cmd) != 'Q') {
+		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+		srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+		return -ENOTTY;
+	}
+
+	switch (nr) {
+	case QAIC_IOCTL_MANAGE_NR:
+		if (_IOC_DIR(cmd) != (_IOC_READ | _IOC_WRITE) ||
+		    _IOC_SIZE(cmd) != sizeof(struct qaic_manage_msg)) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = qaic_manage_ioctl(qdev, usr, arg);
+		break;
+	default:
+		ret = -ENOTTY;
+	}
+
+	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+	srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+	return ret;
+}
+
 static int qaic_mhi_probe(struct mhi_device *mhi_dev,
 			  const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev;
 	dev_t devno;
 	int ret;
+	u16 major, minor;
 
 	/*
 	 * Invoking this function indicates that the control channel to the
@@ -150,13 +208,26 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev,
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	qdev->cntl_ch = mhi_dev;
 
+	ret = qaic_control_open(qdev);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: control_open failed %d\n", __func__, ret);
+		goto err;
+	}
+
+	ret = get_cntl_version(qdev, NULL, &major, &minor);
+	if (ret || major != cntl_major || minor > cntl_minor) {
+		pci_dbg(qdev->pdev, "%s: Control protocol version (%d.%d) not supported.  Supported version is (%d.%d). Ret: %d\n", __func__, major, minor, cntl_major, cntl_minor, ret);
+		ret = -EINVAL;
+		goto close_control;
+	}
+
 	mutex_lock(&qaic_devs_lock);
 	ret = idr_alloc(&qaic_devs, qdev, 0, QAIC_MAX_MINORS, GFP_KERNEL);
 	mutex_unlock(&qaic_devs_lock);
 
 	if (ret < 0) {
 		pci_dbg(qdev->pdev, "%s: idr_alloc failed %d\n", __func__, ret);
-		goto err;
+		goto close_control;
 	}
 
 	devno = MKDEV(qaic_major, ret);
@@ -198,6 +269,8 @@ static int qaic_mhi_probe(struct mhi_device *mhi_dev,
 	mutex_lock(&qaic_devs_lock);
 	idr_remove(&qaic_devs, MINOR(devno));
 	mutex_unlock(&qaic_devs_lock);
+close_control:
+	qaic_control_close(qdev);
 err:
 	return ret;
 }
@@ -206,16 +279,6 @@ static void qaic_mhi_remove(struct mhi_device *mhi_dev)
 {
 }
 
-static void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
-				struct mhi_result *mhi_result)
-{
-}
-
-static void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
-				struct mhi_result *mhi_result)
-{
-}
-
 void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 {
 	struct qaic_user *usr;
@@ -223,6 +286,8 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 	dev_t devno;
 
 	qdev->in_reset = true;
+	/* wake up any waiters to avoid waiting for timeouts at sync */
+	wake_all_cntl(qdev);
 	synchronize_srcu(&qdev->dev_lock);
 
 	/*
@@ -255,10 +320,46 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 	}
 }
 
+inline int get_dbc_req_elem_size(void)
+{
+	return 64;
+}
+
+inline int get_dbc_rsp_elem_size(void)
+{
+	return 4;
+}
+
+int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
+{
+	if (!qdev->dbc[dbc_id].usr ||
+	    qdev->dbc[dbc_id].usr->handle != usr->handle)
+		return -EPERM;
+
+	qdev->dbc[dbc_id].usr = NULL;
+	synchronize_srcu(&qdev->dbc[dbc_id].ch_lock);
+	return 0;
+}
+
+void release_dbc(struct qaic_device *qdev, u32 dbc_id)
+{
+	dma_free_coherent(&qdev->pdev->dev, qdev->dbc[dbc_id].total_size,
+			  qdev->dbc[dbc_id].req_q_base,
+			  qdev->dbc[dbc_id].dma_addr);
+	qdev->dbc[dbc_id].total_size = 0;
+	qdev->dbc[dbc_id].req_q_base = NULL;
+	qdev->dbc[dbc_id].dma_addr = 0;
+	qdev->dbc[dbc_id].nelem = 0;
+	qdev->dbc[dbc_id].usr = NULL;
+	qdev->dbc[dbc_id].in_use = false;
+	wake_up(&qdev->dbc[dbc_id].dbc_release);
+}
+
 static int qaic_pci_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
 	int ret;
+	int i;
 	int mhi_irq;
 	struct qaic_device *qdev;
 
@@ -270,11 +371,28 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 		goto qdev_fail;
 	}
 
+	qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
+	if (!qdev->cntl_wq) {
+		ret = -ENOMEM;
+		goto wq_fail;
+	}
 	pci_set_drvdata(pdev, qdev);
 	qdev->pdev = pdev;
+	mutex_init(&qdev->cntl_mutex);
+	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
 	init_srcu_struct(&qdev->dev_lock);
 	INIT_LIST_HEAD(&qdev->users);
 	mutex_init(&qdev->users_mutex);
+	for (i = 0; i < QAIC_NUM_DBC; ++i) {
+		mutex_init(&qdev->dbc[i].mem_lock);
+		spin_lock_init(&qdev->dbc[i].xfer_lock);
+		idr_init(&qdev->dbc[i].mem_handles);
+		qdev->dbc[i].qdev = qdev;
+		qdev->dbc[i].id = i;
+		INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
+		init_srcu_struct(&qdev->dbc[i].ch_lock);
+		init_waitqueue_head(&qdev->dbc[i].dbc_release);
+	}
 
 	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
 
@@ -308,6 +426,15 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 		goto ioremap_0_fail;
 	}
 
+	qdev->bar_2 = pci_ioremap_bar(pdev, 2);
+	if (!qdev->bar_2) {
+		ret = -ENOMEM;
+		goto ioremap_2_fail;
+	}
+
+	for (i = 0; i < QAIC_NUM_DBC; ++i)
+		qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
+
 	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
 	if (ret < 0)
 		goto alloc_irq_fail;
@@ -339,6 +466,8 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 invalid_msi_config:
 	pci_free_irq_vectors(pdev);
 alloc_irq_fail:
+	iounmap(qdev->bar_2);
+ioremap_2_fail:
 	iounmap(qdev->bar_0);
 ioremap_0_fail:
 dma_mask_fail:
@@ -349,7 +478,11 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 enable_fail:
 	pci_set_drvdata(pdev, NULL);
 bar_fail:
+	for (i = 0; i < QAIC_NUM_DBC; ++i)
+		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
 	cleanup_srcu_struct(&qdev->dev_lock);
+	destroy_workqueue(qdev->cntl_wq);
+wq_fail:
 	kfree(qdev);
 qdev_fail:
 	return ret;
@@ -358,6 +491,7 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 static void qaic_pci_remove(struct pci_dev *pdev)
 {
 	struct qaic_device *qdev = pci_get_drvdata(pdev);
+	int i;
 
 	pci_dbg(pdev, "%s\n", __func__);
 	if (!qdev)
@@ -365,6 +499,9 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
+	for (i = 0; i < QAIC_NUM_DBC; ++i)
+		cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
+	destroy_workqueue(qdev->cntl_wq);
 	pci_free_irq_vectors(pdev);
 	iounmap(qdev->bar_0);
 	pci_clear_master(pdev);
diff --git a/include/uapi/misc/qaic.h b/include/uapi/misc/qaic.h
new file mode 100644
index 0000000..9bcc33f
--- /dev/null
+++ b/include/uapi/misc/qaic.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QAIC_H_
+#define QAIC_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define QAIC_MANAGE_MAX_MSG_LENGTH 16364
+
+enum qaic_manage_transaction_type {
+	TRANS_UNDEFINED =		0,
+	TRANS_PASSTHROUGH_FROM_USR =	1,
+	TRANS_PASSTHROUGH_TO_USR =	2,
+	TRANS_PASSTHROUGH_FROM_DEV =	3,
+	TRANS_PASSTHROUGH_TO_DEV =	4,
+	TRANS_DMA_XFER_FROM_USR =	5,
+	TRANS_DMA_XFER_TO_DEV =		6,
+	TRANS_ACTIVATE_FROM_USR =	7,
+	TRANS_ACTIVATE_FROM_DEV =	8,
+	TRANS_ACTIVATE_TO_DEV =		9,
+	TRANS_DEACTIVATE_FROM_USR =	10,
+	TRANS_DEACTIVATE_FROM_DEV =	11,
+	TRANS_STATUS_FROM_USR =		12,
+	TRANS_STATUS_TO_USR =		13,
+	TRANS_STATUS_FROM_DEV =		14,
+	TRANS_STATUS_TO_DEV =		15,
+	TRANS_TERMINATE_FROM_DEV =	16,
+	TRANS_TERMINATE_TO_DEV =	17,
+	TRANS_MAX =			18
+};
+
+struct qaic_manage_trans_hdr {
+	__u32 type; /* value from enum manage_transaction_type */
+	__u32 len;  /* length of this transaction, including the header */
+};
+
+struct qaic_manage_trans_passthrough {
+	struct qaic_manage_trans_hdr hdr;
+	u8 data[0]; /* userspace must encode in little endian */
+};
+
+struct qaic_manage_trans_dma_xfer {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 tag;
+	__u32 count;
+	__u64 addr;
+	__u64 size;
+};
+
+struct qaic_manage_trans_activate_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 queue_size; /* in number of elements */
+	__u32 eventfd;
+	__u64 resv; /* reserved for future use, must be 0 */
+};
+
+struct qaic_manage_trans_activate_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 status;
+	__u32 dbc_id; /* Identifier of assigned DMA Bridge channel */
+};
+
+struct qaic_manage_trans_deactivate {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 dbc_id; /* Identifier of assigned DMA Bridge channel */
+	__u32 resv;   /* reserved for future use, must be 0 */
+};
+
+struct qaic_manage_trans_status_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+};
+
+struct qaic_manage_trans_status_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u16 major;
+	__u16 minor;
+	__u32 status;
+};
+
+struct qaic_manage_msg {
+	__u32 len;   /* Length of valid data - ie sum of all transactions */
+	__u32 count; /* Number of transactions in message */
+	__u8 data[QAIC_MANAGE_MAX_MSG_LENGTH];
+};
+
+#define QAIC_IOCTL_MANAGE_NR	0x01
+
+/*
+ * Send Manage command to the device
+ *
+ * A manage command is a message that consists of N transactions.  The set
+ * of transactions consititues a single operation.  In most cases, a manage
+ * command is a request for the device to do something.  The entire command
+ * must be encoded into a single message.
+ *
+ * The command will be encoded into the wire format, and sent to the device.
+ * the process will then be blocked until the device responds to the message
+ * or a timeout is reached.  If a response is successfully received, it will
+ * be encoded into the provided message structure.
+ *
+ * The return value is 0 for success, or a standard error code.  Some of the
+ * possible errors:
+ *
+ * EINTR     - Kernel waiting was interrupted (IE received a signal for user)
+ * ETIMEDOUT - Timeout for response from device expired
+ * EINVAL    - Invalid message
+ * ENOSPC    - Ran out of space to encode the message into the wire protocol
+ * ENOMEM    - Unable to obtain memory while processing message
+ * EFAULT    - Error in accessing memory from user
+ */
+#define QAIC_IOCTL_MANAGE _IOWR('Q', QAIC_IOCTL_MANAGE_NR, struct manage_msg)
+
+#endif /* QAIC_H_ */
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
