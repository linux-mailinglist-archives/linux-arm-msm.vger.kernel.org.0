Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BCFD1183
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731400AbfJIOlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46640 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJIOlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so3309066wrv.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5nBXWrU6aXm7J3BteGnTL1p5DiTQVhK5l9RgM79wd9Q=;
        b=Pp/82ul4P/+RGjIomCpUJ4eu9DMl7AC6QuLhmdhJSlAy4pqSVzACr3MFk0Kpfk9hD2
         jBrFkVIrdaUzgStNzi01a+MUimxAkCQ5NGzFvOSAHvV7xNx1naxnLKICvuQJegHInhM/
         46Fzhfqqk+yKIbVEwSwkcDuMD773pXrQwrr3LYpvbIri3/t4XHgvOVLhskQqVI1lUHTJ
         v7fNp9LupQaX5mYOO/S4LLEXxJMiK4IWY/psBVHhdXjwmMsI0Wr9PPm3UVIvGyB2TqLS
         VSH//ViPVSBfJmxxu5yVkUswa+JZmA0WpwiRYAb+a+Zm5lXgtfZ5GPRd02KTsE6A9YNE
         4aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5nBXWrU6aXm7J3BteGnTL1p5DiTQVhK5l9RgM79wd9Q=;
        b=UugJwKlgupy4qL8FcZDmkEXd6wPPQHt8KkORXNJqYtN3VevaEwoyPIr4n8clDImJrt
         0tucploUB2o7FusEF0q9+yIx84YH0ajE3ifEwmLD8z21p7l/fcXQ2WCn6sznKjdlX1FE
         O7ui3+YsTkivMie2C8IXlsd2IOELwx99Y7k8wmK9O0OJ3th0dpRMBKFITjwsw0DDkSL9
         Q27CjcKEAwneYh7NwMNibW2qLHbI+652USBtAsOraiUKl8xh0u85/OpuG3SPOBh8DU3r
         t/GEDRzPKorSG6Gd5caECcn0hAZ1B8oHWNqnVpozdpJ4RYZXSr+ltDR6xIVmcgM0rhzq
         Ds6A==
X-Gm-Message-State: APjAAAWGi7LiXJ7qQE/OraCJe/vur8+OO2pTQesRTFUfVs9LC2a5WO8c
        kn2BsKOEKP5Qie2TZYaaS7/FvplCUwM=
X-Google-Smtp-Source: APXvYqz6WwcJLNCcwHhrC05NpHyoYQ2ZOcydG3Q673puKdgzfQGng6gTjOT1R+QnInk4c3So81EoRw==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr3240033wrc.15.1570632090761;
        Wed, 09 Oct 2019 07:41:30 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:30 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/5] misc: fastrpc: add mmap/unmap support
Date:   Wed,  9 Oct 2019 15:41:19 +0100
Message-Id: <20191009144123.24583-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
References: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Support the allocation/deallocation of buffers mapped to the DSP.

When the memory mapped to the DSP at process creation is not enough,
the fastrpc library can extend it at runtime. This avoids having to do
large preallocations by default.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c      | 181 ++++++++++++++++++++++++++++++++++++
 include/uapi/misc/fastrpc.h |  15 +++
 2 files changed, 196 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47ae84afac2e..aa1249bb581a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,7 @@
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (64 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
+#define ADSP_MMAP_ADD_PAGES 0x1000
 
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
@@ -66,6 +67,8 @@
 /* Remote Method id table */
 #define FASTRPC_RMID_INIT_ATTACH	0
 #define FASTRPC_RMID_INIT_RELEASE	1
+#define FASTRPC_RMID_INIT_MMAP		4
+#define FASTRPC_RMID_INIT_MUNMAP	5
 #define FASTRPC_RMID_INIT_CREATE	6
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7
 #define FASTRPC_RMID_INIT_CREATE_STATIC	8
@@ -89,6 +92,23 @@ struct fastrpc_remote_arg {
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
@@ -123,6 +143,9 @@ struct fastrpc_buf {
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
@@ -1130,6 +1156,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	struct fastrpc_channel_ctx *cctx = fl->cctx;
 	struct fastrpc_invoke_ctx *ctx, *n;
 	struct fastrpc_map *map, *m;
+	struct fastrpc_buf *buf, *b;
 	unsigned long flags;
 
 	fastrpc_release_current_dsp_process(fl);
@@ -1151,6 +1178,11 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 		fastrpc_map_put(map);
 	}
 
+	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
+		list_del(&buf->node);
+		fastrpc_buf_free(buf);
+	}
+
 	fastrpc_session_free(cctx, fl->sctx);
 	fastrpc_channel_ctx_put(cctx);
 
@@ -1179,6 +1211,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	mutex_init(&fl->mutex);
 	INIT_LIST_HEAD(&fl->pending);
 	INIT_LIST_HEAD(&fl->maps);
+	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
 	fl->tgid = current->tgid;
 	fl->cctx = cctx;
@@ -1284,6 +1317,148 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
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
+	args[0].ptr = (u64) (uintptr_t) &req_msg;
+	args[0].length = sizeof(req_msg);
+
+	pages.addr = buf->phys;
+	pages.size = buf->size;
+
+	args[1].ptr = (u64) (uintptr_t) &pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
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
@@ -1304,6 +1479,12 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
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
2.21.0

