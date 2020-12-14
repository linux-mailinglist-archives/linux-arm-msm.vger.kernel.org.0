Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D70C2D9875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 14:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439397AbgLNM5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 07:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394599AbgLNM5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 07:57:54 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19631C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 04:57:14 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id m6so2253682pfm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 04:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9TgwqK+6YHCGDt5sdTZEGgJJQwq7o9D8sbNO5uuAlB8=;
        b=US6343rUbnXBSnK6v4im+jogHrt9LMQSEZkWdz8bceaE14KX06pP1AW3eogEfRbA1t
         RBOh4PQu5QAENbJbCzsJSH3a5wa6k4WoHV0Ifc5OxbAvl3EokvEPlLDGt1mhhYzWL6ZG
         PpJls9j4khO4ueX1atDWmzMYRV3+wmZGDO98M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9TgwqK+6YHCGDt5sdTZEGgJJQwq7o9D8sbNO5uuAlB8=;
        b=oT4WRPf7sW8oQ+dz2tiIUTvQLGe26BOo5LgdsHPlGGa7itBkzEOai1m40Wfooyw14x
         IDk54H4czTTZ/IxHaeH9dWiYzX4WnsXU1DfSgZv+mmxMX3kZIxp+sbW4R69OEb+S0u+/
         60kHEDnxE4nY0hLVKd7gWJgjWAQ1aMKJ8m4/Wl99TKy8EjatljMdVWSb+FCWjOWRTtCK
         wiCWDcU7SxvrKe4kc8XfiJ0IcUxxSJPDE2V1aPJUFWNOloQDuZ4cyQgWqvWUVozyAvkA
         RqLpNGi67qb2u25bHdzKfwlAyC7Xa6HV2PtTjJlh8tt+6z1z30Easph4elWue3E7qTth
         L7/g==
X-Gm-Message-State: AOAM530vfDKXO7PRw+BwLmDxCHKJoHxhTY36SQe1Gbmu3TfLqL3buP3S
        KeWm68EtMo+DR2nSyd/yZtgMGw==
X-Google-Smtp-Source: ABdhPJxUwopXyMFYvpCFB3CfpluhEL9Lmg63a7Y4IEwV9vVitLFiUaU8PW7lyXPDsbBleIjxDe1UHw==
X-Received: by 2002:a62:68c7:0:b029:197:c7e0:6d8f with SMTP id d190-20020a6268c70000b0290197c7e06d8fmr23802812pfc.74.1607950633633;
        Mon, 14 Dec 2020 04:57:13 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id v6sm20943241pgk.2.2020.12.14.04.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:57:12 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: venus: use contig vb2 ops
Date:   Mon, 14 Dec 2020 21:57:03 +0900
Message-Id: <20201214125703.866998-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver uses the SG vb2 ops, but effectively only ever accesses the
first entry of the SG table, indicating that it expects a flat layout.
Switch it to use the contiguous ops to make sure this expected invariant
is always enforced. Since the device is supposed to be behind an IOMMU
this should have little to none practical consequences beyond making the
driver not rely on a particular behavior of the SG implementation.

Reported-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
Hi everyone,

It probably doesn't hurt to fix this issue before some actual issue happens.
I have tested this patch on Chrome OS and playback was just as fine as with
the SG ops.

 drivers/media/platform/Kconfig              | 2 +-
 drivers/media/platform/qcom/venus/helpers.c | 9 ++-------
 drivers/media/platform/qcom/venus/vdec.c    | 6 +++---
 drivers/media/platform/qcom/venus/venc.c    | 6 +++---
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 35a18d388f3f..d9d7954111f2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
 	depends on INTERCONNECT || !INTERCONNECT
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
 	  This is a V4L2 driver for Qualcomm Venus video accelerator
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 50439eb1ffea..859d260f002b 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -7,7 +7,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-mem2mem.h>
 #include <asm/div64.h>
 
@@ -1284,14 +1284,9 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct venus_buffer *buf = to_venus_buffer(vbuf);
-	struct sg_table *sgt;
-
-	sgt = vb2_dma_sg_plane_desc(vb, 0);
-	if (!sgt)
-		return -EFAULT;
 
 	buf->size = vb2_plane_size(vb, 0);
-	buf->dma_addr = sg_dma_address(sgt->sgl);
+	buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		list_add_tail(&buf->reg_list, &inst->registeredbufs);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8488411204c3..3fb277c81aca 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "hfi_venus_io.h"
 #include "hfi_parser.h"
@@ -1461,7 +1461,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = &vdec_vb2_ops;
-	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct venus_buffer);
 	src_vq->allow_zero_bytesused = 1;
@@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = &vdec_vb2_ops;
-	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
 	dst_vq->allow_zero_bytesused = 1;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 1c61602c5de1..a09550cd1dba 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -10,7 +10,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <media/v4l2-mem2mem.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
@@ -1001,7 +1001,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->ops = &venc_vb2_ops;
-	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct venus_buffer);
 	src_vq->allow_zero_bytesused = 1;
@@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->ops = &venc_vb2_ops;
-	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
 	dst_vq->allow_zero_bytesused = 1;
-- 
2.29.2.684.gfbc64c5ab5-goog

