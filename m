Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD845B2348
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388354AbfIMPZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33208 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389457AbfIMPZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so2124224wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=viZTAWPErx527r3fiNEC4gxd7nWs91ZnvKtAXTam2GA=;
        b=E/SFIH6fW1fnH2EEAJq0b/dMFmOLuZiHHNk3slp9yVsTlQoM1zVnuYLxdeFW1aoSZO
         HCaZtSFkFh3vzR5bC6I/gN/HwaN7zLxYwIAl5k5bn1nYxqOj62MQVL70HcPPkL0DRSNL
         QVOfCyZdAH7nJJReFF3ETVIXqsU3EYQWGtDIhE+83jZPwiaN5HVl04OtQrziQ+Jhxfg3
         dssm36pOoxw+4yTFPP4wmpEX0uzNGEqiFZXKEx2TCHlGSX689NssaocOFz/OoisG5S0k
         nV0WKfXwwpHIUmIIrpc9e2rj7AGV2cWJbQaZiSwQiRXt1nZMwrX3t81Km0g0ikUcT+TX
         6eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=viZTAWPErx527r3fiNEC4gxd7nWs91ZnvKtAXTam2GA=;
        b=Vd9O7NfK/0FKXodwxFCSbnspr/hniUlopdtOjBSK/6wseOb1bDWO9ycutJwW0T+Dlp
         wbY6GC72XRBpbrvb34/PiCGzTKnFsqaHugmEZ0QEirNwzNUTYbP7Il04X0C63LQT4QnA
         FXfisKLS8WzGH9xXp6KYWJ/mlNXVKsXTBqmKGYLarpA5OVI7G2+dctB5104kLkl+vSk5
         Eq5tR85zg0RiX+bddKFU4hR+PeJWhi3dl2dx8DUnDVpceSrIHpKjv/3YYHXTejnPzU5d
         a0Jf7jDYh3oj9UVSVwST0cLnbUPNyVHaQx9M7WyblKgfxt/qHnEtxMu0v1iGvWMuzKFd
         iYDw==
X-Gm-Message-State: APjAAAWvPPpAXB6Jf1yeRs33/sL1jBUrk1aiN0C61Aa01rZBFptaxS9Q
        XwLZHodN+/w6bZT26kFCA5MFpQ==
X-Google-Smtp-Source: APXvYqzBbMY69x/3y6YMXRkfjDujbkfsCIDtUMhu8w5dx2JkAh4VAvs9Ym5DnA1ACx88qODecxL8nA==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr3777899wma.165.1568388337669;
        Fri, 13 Sep 2019 08:25:37 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:37 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] misc: fastrpc: add mmap/unmap support
Date:   Fri, 13 Sep 2019 17:25:28 +0200
Message-Id: <20190913152532.24484-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support the allocation/deallocation of buffers mapped to the DSP.

When the memory mapped to the DSP at process creation is not enough,
the fastrpc library can extend it at runtime. This avoids having to do
large preallocations by default.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 181 ++++++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h |  15 +++
 2 files changed, 196 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 98603e235cf0..8903388993d3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -35,6 +35,7 @@
 #define INIT_FILELEN_MAX (64 * 1024 * 1024)
 #define INIT_MEMLEN_MAX  (8 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
+#define ADSP_MMAP_ADD_PAGES 0x1000
 
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
@@ -67,6 +68,8 @@
 /* Remote Method id table */
 #define FASTRPC_RMID_INIT_ATTACH	0
 #define FASTRPC_RMID_INIT_RELEASE	1
+#define FASTRPC_RMID_INIT_MMAP		4
+#define FASTRPC_RMID_INIT_MUNMAP	5
 #define FASTRPC_RMID_INIT_CREATE	6
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7
 #define FASTRPC_RMID_INIT_CREATE_STATIC	8
@@ -90,6 +93,23 @@ struct fastrpc_remote_arg {
 	u64 len;
 };
 
+struct fastrpc_mmap_rsp_msg {
+	u64 vaddr;
+};
+
+struct fastrpc_mmap_req_msg {
+	s32 pgid;
+	u32 flags;
+	u64 vaddr;
+	s32 num;
+};
+
+struct fastrpc_munmap_req_msg {
+	s32 pgid;
+	u64 vaddr;
+	u64 size;
+};
+
 struct fastrpc_msg {
 	int pid;		/* process group id */
 	int tid;		/* thread id */
@@ -124,6 +144,9 @@ struct fastrpc_buf {
 	/* Lock for dma buf attachments */
 	struct mutex lock;
 	struct list_head attachments;
+	/* mmap support */
+	struct list_head node; /* list of user requested mmaps */
+	uintptr_t raddr;
 };
 
 struct fastrpc_dma_buf_attachment {
@@ -192,6 +215,7 @@ struct fastrpc_user {
 	struct list_head user;
 	struct list_head maps;
 	struct list_head pending;
+	struct list_head mmaps;
 
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sctx;
@@ -269,6 +293,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&buf->attachments);
+	INIT_LIST_HEAD(&buf->node);
 	mutex_init(&buf->lock);
 
 	buf->fl = fl;
@@ -276,6 +301,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf->phys = 0;
 	buf->size = size;
 	buf->dev = dev;
+	buf->raddr = 0;
 
 	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
 				       GFP_KERNEL);
@@ -1098,6 +1124,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	struct fastrpc_invoke_ctx *ctx, *n;
 	struct fastrpc_map *map, *m;
+	struct fastrpc_buf *buf, *b;
 	unsigned long flags;
 
 	fastrpc_release_current_dsp_process(fl);
@@ -1119,6 +1146,11 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 		fastrpc_map_put(map);
 	}
 
+	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
+		list_del(&buf->node);
+		fastrpc_buf_free(buf);
+	}
+
 	fastrpc_session_free(cctx, fl->sctx);
 
 	mutex_destroy(&fl->mutex);
@@ -1143,6 +1175,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	mutex_init(&fl->mutex);
 	INIT_LIST_HEAD(&fl->pending);
 	INIT_LIST_HEAD(&fl->maps);
+	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
@@ -1270,6 +1303,148 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl,
+				   struct fastrpc_req_munmap *req)
+{
+	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
+	struct fastrpc_buf *buf, *b;
+	struct fastrpc_munmap_req_msg req_msg;
+	struct device *dev = fl->sctx->dev;
+	int err;
+	u32 sc;
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
+		if ((buf->raddr == req->vaddrout) && (buf->size == req->size))
+			break;
+		buf = NULL;
+	}
+	spin_unlock(&fl->lock);
+
+	if (!buf) {
+		dev_err(dev, "mmap not in list\n");
+		return -EINVAL;
+	}
+
+	req_msg.pgid = fl->tgid;
+	req_msg.size = buf->size;
+	req_msg.vaddr = buf->raddr;
+
+	args[0].ptr = (u64) (uintptr_t) &req_msg;
+	args[0].length = sizeof(req_msg);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+	if (!err) {
+		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		spin_lock(&fl->lock);
+		list_del(&buf->node);
+		spin_unlock(&fl->lock);
+		fastrpc_buf_free(buf);
+	} else {
+		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
+	}
+
+	return err;
+}
+
+static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_munmap req;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	return fastrpc_req_munmap_impl(fl, &req);
+}
+
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
+	struct fastrpc_buf *buf = NULL;
+	struct fastrpc_mmap_req_msg req_msg;
+	struct fastrpc_mmap_rsp_msg rsp_msg;
+	struct fastrpc_req_munmap req_unmap;
+	struct fastrpc_phy_page pages;
+	struct fastrpc_req_mmap req;
+	struct device *dev = fl->sctx->dev;
+	int err;
+	u32 sc;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if (req.flags != ADSP_MMAP_ADD_PAGES) {
+		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+		return -EINVAL;
+	}
+
+	if (req.vaddrin) {
+		dev_err(dev, "adding user allocated pages is not supported\n");
+		return -EINVAL;
+	}
+
+	err = fastrpc_buf_alloc(fl, fl->sctx->dev, req.size, &buf);
+	if (err) {
+		dev_err(dev, "failed to allocate buffer\n");
+		return err;
+	}
+
+	req_msg.pgid = fl->tgid;
+	req_msg.flags = req.flags;
+	req_msg.vaddr = req.vaddrin;
+	req_msg.num = sizeof(pages);
+
+	args[0].ptr = (u64) &req_msg;
+	args[0].length = sizeof(req_msg);
+
+	pages.addr = buf->phys;
+	pages.size = buf->size;
+
+	args[1].ptr = (u64) &pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64) &rsp_msg;
+	args[2].length = sizeof(rsp_msg);
+
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+	if (err) {
+		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
+		goto err_invoke;
+	}
+
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = rsp_msg.vaddr;
+
+	spin_lock(&fl->lock);
+	list_add_tail(&buf->node, &fl->mmaps);
+	spin_unlock(&fl->lock);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		/* unmap the memory and release the buffer */
+		req_unmap.vaddrout = buf->raddr;
+		req_unmap.size = buf->size;
+		fastrpc_req_munmap_impl(fl, &req_unmap);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
+		buf->raddr, buf->size);
+
+	return 0;
+
+err_invoke:
+	fastrpc_buf_free(buf);
+
+	return err;
+}
+
 static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 				 unsigned long arg)
 {
@@ -1293,6 +1468,12 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
 		err = fastrpc_dmabuf_alloc(fl, argp);
 		break;
+	case FASTRPC_IOCTL_MMAP:
+		err = fastrpc_req_mmap(fl, argp);
+		break;
+	case FASTRPC_IOCTL_MUNMAP:
+		err = fastrpc_req_munmap(fl, argp);
+		break;
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index fb792e882cef..07de2b7aac85 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -10,6 +10,8 @@
 #define FASTRPC_IOCTL_INVOKE		_IOWR('R', 3, struct fastrpc_invoke)
 #define FASTRPC_IOCTL_INIT_ATTACH	_IO('R', 4)
 #define FASTRPC_IOCTL_INIT_CREATE	_IOWR('R', 5, struct fastrpc_init_create)
+#define FASTRPC_IOCTL_MMAP              _IOWR('R', 6, struct fastrpc_req_mmap)
+#define FASTRPC_IOCTL_MUNMAP            _IOWR('R', 7, struct fastrpc_req_munmap)
 
 struct fastrpc_invoke_args {
 	__u64 ptr;
@@ -38,4 +40,17 @@ struct fastrpc_alloc_dma_buf {
 	__u64 size;	/* size */
 };
 
+struct fastrpc_req_mmap {
+	__s32 fd;
+	__u32 flags;	/* flags for dsp to map with */
+	__u64 vaddrin;	/* optional virtual address */
+	__u64 size;	/* size */
+	__u64 vaddrout;	/* dsp virtual address */
+};
+
+struct fastrpc_req_munmap {
+	__u64 vaddrout;	/* address to unmap */
+	__u64 size;	/* size */
+};
+
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.23.0

