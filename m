Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253AB49CB7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 14:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241718AbiAZNya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 08:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241709AbiAZNya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 08:54:30 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B022C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:29 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h21so8380110wrb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2nHbX811lMqCMZbOayjjOG8Q/MWBZlI4FzSsfMzFNz4=;
        b=dE6toEKyUpNhNx2GMJajrpP4sFJ2uzAsadxvUXDsVzcFnQcy6AOVvcCLyMdrlm2pIs
         he+9Pz56wlteeJHPaR4Mrzy/aCV96Wid9v+YXICKrvk4qUSOfB6Jh6rG9/3q/lHmHdrx
         EpLgbqlIVpU8OdcoSi5tzTGek3S0Q3Z7dDkT8VybWvmXYOM+i7lwQifGxT/aI5OziQJA
         zp5QirX7PPeyR8VsmfHnoh0IAP4XRWWxLjsqcOIA/hMil9qLK1VtCUG9cZXBkpTxBZQF
         pHurfy/cRU4HYi0SfnoCVg5HuwgCjCi9prqgSmPp+Jaumd8YdmVCoP5Vjn89YiHndvG9
         lS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2nHbX811lMqCMZbOayjjOG8Q/MWBZlI4FzSsfMzFNz4=;
        b=x3nF98AdjlJtqsyodbwgp9o2+yFlLurz3esyEipi9txg3Py38Tu6uPhBlat/XQpz2l
         HG4aGnVD/Z7cDCPO4WpCgB3BTa7lZSdTUM8T+qTxBsahM/Bd8gGav78iLBvTPcnkqDOG
         VHL7Hsd4UD2TI9Wxto/lheTxQp9jstqfE82xV0BGfthPhpbfV2lFVYE84zq25uCYy7r1
         vf7T/zQOXrLkqtG9YQSeP+g14vC8v+81H0qh0AzNqPJD2ofK/44puu5l2RDy2BFdwvtp
         dzxa3/WKSBKfryZzs45zNaOSSGXYXrjlfL0KuGGcvKHQxrG6eSn8GpXJv5695fvIPNJs
         3zUw==
X-Gm-Message-State: AOAM5330CVqAK6KN7Ka4k4xbtta4J9cHxl4/p9I8L2jmn8SOFtlBFq4x
        I8U/9B3SMnIYre2N1E8/8ktEpw==
X-Google-Smtp-Source: ABdhPJzZZRXAfWMD6uuwEqMmbB9kx1qNb+w12mQxFH/gVjNAsjsbCeN5N+mSwK+oOHRHfWYbhPM+MQ==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr23280729wrj.118.1643205267623;
        Wed, 26 Jan 2022 05:54:27 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id n15sm3356593wmr.26.2022.01.26.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:54:27 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, Jeya R <jeyr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 02/12] misc: fastrpc: add support for FASTRPC_IOCTL_MEM_MAP/UNMAP
Date:   Wed, 26 Jan 2022 13:52:54 +0000
Message-Id: <20220126135304.16340-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeya R <jeyr@codeaurora.org>

Add support for IOCTL requests to map and unmap on DSP based on map
flags.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 155 ++++++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h |  51 ++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 00cf0dbb6084..a840b8dabf0e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -72,6 +72,8 @@
 #define FASTRPC_RMID_INIT_CREATE	6
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7
 #define FASTRPC_RMID_INIT_CREATE_STATIC	8
+#define FASTRPC_RMID_INIT_MEM_MAP      10
+#define FASTRPC_RMID_INIT_MEM_UNMAP    11
 
 /* Protection Domain(PD) ids */
 #define AUDIO_PD	(0) /* also GUEST_OS PD? */
@@ -108,12 +110,29 @@ struct fastrpc_mmap_req_msg {
 	s32 num;
 };
 
+struct fastrpc_mem_map_req_msg {
+	s32 pgid;
+	s32 fd;
+	s32 offset;
+	u32 flags;
+	u64 vaddrin;
+	s32 num;
+	s32 data_len;
+};
+
 struct fastrpc_munmap_req_msg {
 	s32 pgid;
 	u64 vaddr;
 	u64 size;
 };
 
+struct fastrpc_mem_unmap_req_msg {
+	s32 pgid;
+	s32 fd;
+	u64 vaddrin;
+	u64 len;
+};
+
 struct fastrpc_msg {
 	int pid;		/* process group id */
 	int tid;		/* thread id */
@@ -170,6 +189,7 @@ struct fastrpc_map {
 	u64 size;
 	void *va;
 	u64 len;
+	u64 raddr;
 	struct kref refcount;
 };
 
@@ -1493,6 +1513,135 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
+{
+	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_map *map = NULL, *m;
+	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
+	int err = 0;
+	u32 sc;
+	struct device *dev = fl->sctx->dev;
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(map, m, &fl->maps, node) {
+		if ((req->fd < 0 || map->fd == req->fd) && (map->raddr == req->vaddr))
+			break;
+		map = NULL;
+	}
+
+	spin_unlock(&fl->lock);
+
+	if (!map) {
+		dev_err(dev, "map not in list\n");
+		return -EINVAL;
+	}
+
+	req_msg.pgid = fl->tgid;
+	req_msg.len = map->len;
+	req_msg.vaddrin = map->raddr;
+	req_msg.fd = map->fd;
+
+	args[0].ptr = (u64) &req_msg;
+	args[0].length = sizeof(req_msg);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+	fastrpc_map_put(map);
+	if (err)
+		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+
+	return err;
+}
+
+static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_mem_unmap req;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	return fastrpc_req_mem_unmap_impl(fl, &req);
+}
+
+static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
+	struct fastrpc_mem_map_req_msg req_msg = { 0 };
+	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
+	struct fastrpc_mem_unmap req_unmap = { 0 };
+	struct fastrpc_phy_page pages = { 0 };
+	struct fastrpc_mem_map req;
+	struct device *dev = fl->sctx->dev;
+	struct fastrpc_map *map = NULL;
+	int err;
+	u32 sc;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	/* create SMMU mapping */
+	err = fastrpc_map_create(fl, req.fd, req.length, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
+
+	req_msg.pgid = fl->tgid;
+	req_msg.fd = req.fd;
+	req_msg.offset = req.offset;
+	req_msg.vaddrin = req.vaddrin;
+	map->va = (void *) req.vaddrin;
+	req_msg.flags = req.flags;
+	req_msg.num = sizeof(pages);
+	req_msg.data_len = 0;
+
+	args[0].ptr = (u64) &req_msg;
+	args[0].length = sizeof(req_msg);
+
+	pages.addr = map->phys;
+	pages.size = map->size;
+
+	args[1].ptr = (u64) &pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64) &pages;
+	args[2].length = 0;
+
+	args[3].ptr = (u64) &rsp_msg;
+	args[3].length = sizeof(rsp_msg);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
+	if (err) {
+		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
+			req.fd, req.vaddrin, map->size);
+		goto err_invoke;
+	}
+
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = rsp_msg.vaddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = rsp_msg.vaddr;
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		/* unmap the memory and release the buffer */
+		req_unmap.vaddr = (uintptr_t) rsp_msg.vaddr;
+		req_unmap.length = map->size;
+		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
+		return -EFAULT;
+	}
+
+	return 0;
+
+err_invoke:
+	if (map)
+		fastrpc_map_put(map);
+
+	return err;
+}
+
 static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg)
 {
@@ -1522,6 +1671,12 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MUNMAP:
 		err = fastrpc_req_munmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_MEM_MAP:
+		err = fastrpc_req_mem_map(fl, argp);
+		break;
+	case FASTRPC_IOCTL_MEM_UNMAP:
+		err = fastrpc_req_mem_unmap(fl, argp);
+		break;
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index 0a89f95463f6..d248eeb20e67 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -13,6 +13,37 @@
 #define FASTRPC_IOCTL_MMAP		_IOWR('R', 6, struct fastrpc_req_mmap)
 #define FASTRPC_IOCTL_MUNMAP		_IOWR('R', 7, struct fastrpc_req_munmap)
 #define FASTRPC_IOCTL_INIT_ATTACH_SNS	_IO('R', 8)
+#define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
+#define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+
+/**
+ * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
+ * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
+ * The driver is responsible for cache maintenance when passed
+ * the buffer to FastRPC calls. Same virtual address will be
+ * assigned for subsequent FastRPC calls.
+ * @FASTRPC_MAP_RESERVED: Reserved
+ * @FASTRPC_MAP_FD: Map memory pages with RW- permission and CACHE WRITEBACK.
+ * Mapping tagged with a file descriptor. User is responsible for
+ * CPU and DSP cache maintenance for the buffer. Get virtual address
+ * of buffer on DSP using HAP_mmap_get() and HAP_mmap_put() APIs.
+ * @FASTRPC_MAP_FD_DELAYED: Mapping delayed until user call HAP_mmap() and HAP_munmap()
+ * functions on DSP. It is useful to map a buffer with cache modes
+ * other than default modes. User is responsible for CPU and DSP
+ * cache maintenance for the buffer.
+ * @FASTRPC_MAP_FD_NOMAP: This flag is used to skip CPU mapping,
+ * otherwise behaves similar to FASTRPC_MAP_FD_DELAYED flag.
+ * @FASTRPC_MAP_MAX: max count for flags
+ *
+ */
+enum fastrpc_map_flags {
+	FASTRPC_MAP_STATIC = 0,
+	FASTRPC_MAP_RESERVED,
+	FASTRPC_MAP_FD = 2,
+	FASTRPC_MAP_FD_DELAYED,
+	FASTRPC_MAP_FD_NOMAP = 16,
+	FASTRPC_MAP_MAX,
+};
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
@@ -49,9 +80,29 @@ struct fastrpc_req_mmap {
 	__u64 vaddrout;	/* dsp virtual address */
 };
 
+struct fastrpc_mem_map {
+	__s32 version;
+	__s32 fd;		/* fd */
+	__s32 offset;		/* buffer offset */
+	__u32 flags;		/* flags defined in enum fastrpc_map_flags */
+	__u64 vaddrin;		/* buffer virtual address */
+	__u64 length;		/* buffer length */
+	__u64 vaddrout;		/* [out] remote virtual address */
+	__s32 attrs;		/* buffer attributes used for SMMU mapping */
+	__s32 reserved[4];
+};
+
 struct fastrpc_req_munmap {
 	__u64 vaddrout;	/* address to unmap */
 	__u64 size;	/* size */
 };
 
+struct fastrpc_mem_unmap {
+	__s32 vesion;
+	__s32 fd;		/* fd */
+	__u64 vaddr;		/* remote process (dsp) virtual address */
+	__u64 length;		/* buffer size */
+	__s32 reserved[5];
+};
+
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.21.0

