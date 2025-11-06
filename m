Return-Path: <linux-arm-msm+bounces-80634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F172C3C2C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 16:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433A93B8D54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABAD3446AF;
	Thu,  6 Nov 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bcMBnse3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F133BBBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762443906; cv=none; b=ZL7SisKIK1ZXcKLswjtM4jv8xxds91OkjIJ/UAzNHAukrFYMuGEJ/LZoS+6RqRb+Lj12V3gVyXVN3skFolszjkTgy8uH45HpgDgpuEi6CxR2YJWHEHOdy4Y5Wc63sgmMaulHs7M2uDIVVcwk4TjyiEFS1/iJdhvdR8zm+KyUCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762443906; c=relaxed/simple;
	bh=KMXtcGywPA0XXbonnk/C4InSA219MMkomUCla9TEJSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKHQawo829db2aR2su2rRjCH5ZDMlNN76kOQHGPCm8aS5ugkenLR4ScPm1T2nQujYHHZbeb3EjOKHk0WLucwmnm4kDdY6QWm1Yr/VTSQhXjffEqhEk2WN4x4KpdigDoyu2Ro6Kfviun0ALPxP6c+Y1xPpp59cjMhmRJWVus+V8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bcMBnse3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632d45c9so6516315e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762443902; x=1763048702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbd9T49zUds3GM17Wvqrp3KhIc2FjSNyODbZEdWX+EA=;
        b=bcMBnse3pQwe/Li0FKttYtNtYmwBk8XLSXNxOHwsq/ZUAN9lL74z79a7LWXPBSkUOu
         de85+hcTTjtezeMHH2ar+Nz6ITsWeoQ+FWkJKLnJPiPGZMBiDipe9NyPwWBkjXJm2UML
         EcMY+x6Or5uVQvyTq1ePhKPYiLgZwbwI/A8h6lUI7kLr64WB2UFLLUT0hBTgtVi1Irpq
         aM289SDAWPn/XcudK0gISBhG1Sr0tJB3+oXTyohfuR+dl1sehXW4cBwQCvhkF/phVxvi
         heBYPmj9WftFNJ8SeYYb6BLtkwyL2VPv3YhzR/zD2oNHjPB8sIHPh8cMIUttrujvg0O3
         LyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443902; x=1763048702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbd9T49zUds3GM17Wvqrp3KhIc2FjSNyODbZEdWX+EA=;
        b=kaIGWjjfRVBbmNRSgar6oJaAufip/kOZx85U/XYy8O1b03VeL8ubtIcwSM11TcLS2a
         UdXG7ZVT+Is0KA8q09iEWhrr/i5/YTEL9q0GSzk4uptr/53VyVHhIgqQrDZuuWNM5PBy
         KOr4ZM20VsgzXZ7E1SD8wCeHyXUNIvULZpDdH7W5/yVgNLfK6q4KZSqIZb3f4yEoToRg
         H/BlCmFTjnKqq4CWY/sF4Q6zGYTxh0aYoXnzjzKNw+oRbNEE9nu981tUV0X4japXLQE4
         EO/vkKA9eV+0H7J3yEivDe8m8Kml4fb5lYYHFfjuI0nWorZLgg8t+V6G4783nfOvlqbz
         WB0w==
X-Gm-Message-State: AOJu0YzgtrJpAaiDzXy3Ff3RI14TOmrVErILkshqQuxGYbTdWGOsB4rJ
	Do+H+n5aO8+kcoqmIwxIz12AzLGseEPdEpHaQmLtgNIexs+T4KjvZpWyEozqj5PjJPbQWWkx638
	mp/67o1g=
X-Gm-Gg: ASbGncsNZgY4j56Z8NWWTOb1XtO60uWb57iBG04wp/6tQpdNCkCEgyWusZfhVWCaz4G
	AE1/JvWJlHQaPx6E0En22w4kyr3brW7cohaAu8nFqYASTpfZ0xz+1JP1Fls+jyc3g0cJXtUJ9n3
	YpwfPxyl2sf0k+1vBLOtdhzDcGjV6rtVABOd+GFCUT8DaRK2GO/mE7TIFowUKnO1jxeR/13ZBzh
	yr0mXPfT65LHOeQ5j2dox+Qi/tPGxt/lq0Bov3stOU7tyA8ZAzGzVL2jmKZg+Q0NRACKb/bJwox
	n/YYLghRvYkz9BgIU6kOmSIT9ip4jY1QWMwnIEkL4Dw/v0eGsLUMLLJbRYYPJRFt67cNrjNk1wn
	3PLqPpSodHo++9T4UYddV3P5T196dwN6uggQ+OOQNMmkeSadoxFlK4QekR79tqdzT0/+RtPMCg7
	aAOZB5mZMEQ1Ncn1s=
X-Google-Smtp-Source: AGHT+IFtov35GCVOXR/cS2r0f57fAWevPV2mc2aIOXdGAl6CDTHBexQAmH0Z6e5W7UJqLLDk8tfqlQ==
X-Received: by 2002:a05:600c:348f:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-4775cd3bec8mr84554855e9.0.1762443901568;
        Thu, 06 Nov 2025 07:45:01 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e66b1fsm20621705e9.1.2025.11.06.07.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:44:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 16:44:51 +0100
Subject: [PATCH 2/3] dmaengine: qcom: bam_dma: use lock guards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-bam-dma-refactor-v1-2-0e2baaf3d81a@linaro.org>
References: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
In-Reply-To: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9493;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jVKoP2X4Ilas0P+Aru4xMP9CmE2OcT/z1vHvPmMV1IY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDMJ3QxjixXJYDZtvzP0lI/Ab8pWxSPTwbk9l3
 boYrMwZy9uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQzCdwAKCRARpy6gFHHX
 ct3tEACy4NodtdxxVrv8D1R3dE+7+U9W8fFhuKuYrSk8woF7W9kGalbFZnntkUxP/KySQa//0qQ
 8HoLpQC3W3UlwCw3fCHe3GxocCw8rxfvrA2tmRoo54qTPdcFYsmHQy/oCE9/Pf0lxQcEMgKdPi1
 a9rOSZunGa7SGGFDJnEMCGikAl/l59O7QCTHzNa7GABT1xNdMDjSylT8ICBfGmx9bYmifYimmse
 qRNlPxUvo/ZuIZHG8LBywbXER0lBjXnWFZXKsyFScEqRqEGzNKgP42DcOXIShOC8mF2ZaBlVGEH
 ywuALvHyVwOew4Ihl975+P1cwcHlUAuhGnf41CvEJPhFlTkf7+k0fubUfykR+4l9LbE5Ct7NtR1
 HpTMGMskua9l0tlbH05DG5XNLi9tIkHcBb7Aq0lLOLP4SUB7peNGeclfdEQTh/1lSSiycrXI13p
 xqgZLmO+8/QyVfxUwe8wRI1hlqSYtP/M2HFfn/wMyMhory1wb+VafKxb932FadIFbmfccfTKqkp
 Ls3/Zk2QUMZj/rtgLq9nJB2EyJKeFgyWYi1GCz2Ov2TryOa6Yh0V47Kuyqt6JzQR3SP4YmrpDh3
 X30MmR924dwNRzzUcFdEjsW26BzJ/NCv+cCsdTkR26hoXgKorCHnQ6mui8rGxeallsHTCmdZZFn
 n4gdfR42E8nfi+A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify locking across the driver with lock guards from cleanup.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/dma/qcom/bam_dma.c | 124 ++++++++++++++++++++-------------------------
 1 file changed, 55 insertions(+), 69 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2f1f295d3e1ff910a5051c20dc09cb1e8077df82..bcd8de9a9a12621a36b49c31bff96f474468be06 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/circ_buf.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -570,7 +571,6 @@ static void bam_free_chan(struct dma_chan *chan)
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
 	u32 val;
-	unsigned long flags;
 	int ret;
 
 	ret = pm_runtime_get_sync(bdev->dev);
@@ -584,9 +584,8 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
-	spin_lock_irqsave(&bchan->vc.lock, flags);
-	bam_reset_channel(bchan);
-	spin_unlock_irqrestore(&bchan->vc.lock, flags);
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+		bam_reset_channel(bchan);
 
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
@@ -624,12 +623,11 @@ static int bam_slave_config(struct dma_chan *chan,
 			    struct dma_slave_config *cfg)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
-	unsigned long flag;
 
-	spin_lock_irqsave(&bchan->vc.lock, flag);
+	guard(spinlock_irqsave)(&bchan->vc.lock);
+
 	memcpy(&bchan->slave, cfg, sizeof(*cfg));
 	bchan->reconfigure = 1;
-	spin_unlock_irqrestore(&bchan->vc.lock, flag);
 
 	return 0;
 }
@@ -726,38 +724,37 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_async_desc *async_desc, *tmp;
-	unsigned long flag;
 	LIST_HEAD(head);
 
 	/* remove all transactions, including active transaction */
-	spin_lock_irqsave(&bchan->vc.lock, flag);
-	/*
-	 * If we have transactions queued, then some might be committed to the
-	 * hardware in the desc fifo.  The only way to reset the desc fifo is
-	 * to do a hardware reset (either by pipe or the entire block).
-	 * bam_chan_init_hw() will trigger a pipe reset, and also reinit the
-	 * pipe.  If the pipe is left disabled (default state after pipe reset)
-	 * and is accessed by a connected hardware engine, a fatal error in
-	 * the BAM will occur.  There is a small window where this could happen
-	 * with bam_chan_init_hw(), but it is assumed that the caller has
-	 * stopped activity on any attached hardware engine.  Make sure to do
-	 * this first so that the BAM hardware doesn't cause memory corruption
-	 * by accessing freed resources.
-	 */
-	if (!list_empty(&bchan->desc_list)) {
-		async_desc = list_first_entry(&bchan->desc_list,
-					      struct bam_async_desc, desc_node);
-		bam_chan_init_hw(bchan, async_desc->dir);
-	}
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
+		/*
+		 * If we have transactions queued, then some might be committed to the
+		 * hardware in the desc fifo.  The only way to reset the desc fifo is
+		 * to do a hardware reset (either by pipe or the entire block).
+		 * bam_chan_init_hw() will trigger a pipe reset, and also reinit the
+		 * pipe.  If the pipe is left disabled (default state after pipe reset)
+		 * and is accessed by a connected hardware engine, a fatal error in
+		 * the BAM will occur.  There is a small window where this could happen
+		 * with bam_chan_init_hw(), but it is assumed that the caller has
+		 * stopped activity on any attached hardware engine.  Make sure to do
+		 * this first so that the BAM hardware doesn't cause memory corruption
+		 * by accessing freed resources.
+		 */
+		if (!list_empty(&bchan->desc_list)) {
+			async_desc = list_first_entry(&bchan->desc_list,
+						      struct bam_async_desc, desc_node);
+			bam_chan_init_hw(bchan, async_desc->dir);
+		}
 
-	list_for_each_entry_safe(async_desc, tmp,
-				 &bchan->desc_list, desc_node) {
-		list_add(&async_desc->vd.node, &bchan->vc.desc_issued);
-		list_del(&async_desc->desc_node);
-	}
+		list_for_each_entry_safe(async_desc, tmp,
+					 &bchan->desc_list, desc_node) {
+			list_add(&async_desc->vd.node, &bchan->vc.desc_issued);
+			list_del(&async_desc->desc_node);
+		}
 
-	vchan_get_all_descriptors(&bchan->vc, &head);
-	spin_unlock_irqrestore(&bchan->vc.lock, flag);
+		vchan_get_all_descriptors(&bchan->vc, &head);
+	}
 
 	vchan_dma_desc_free_list(&bchan->vc, &head);
 
@@ -773,17 +770,16 @@ static int bam_pause(struct dma_chan *chan)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
-	unsigned long flag;
 	int ret;
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
 		return ret;
 
-	spin_lock_irqsave(&bchan->vc.lock, flag);
-	writel_relaxed(1, bam_addr(bdev, bchan->id, BAM_P_HALT));
-	bchan->paused = 1;
-	spin_unlock_irqrestore(&bchan->vc.lock, flag);
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
+		writel_relaxed(1, bam_addr(bdev, bchan->id, BAM_P_HALT));
+		bchan->paused = 1;
+	}
 	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
@@ -799,17 +795,16 @@ static int bam_resume(struct dma_chan *chan)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
 	struct bam_device *bdev = bchan->bdev;
-	unsigned long flag;
 	int ret;
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
 		return ret;
 
-	spin_lock_irqsave(&bchan->vc.lock, flag);
-	writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_HALT));
-	bchan->paused = 0;
-	spin_unlock_irqrestore(&bchan->vc.lock, flag);
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
+		writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_HALT));
+		bchan->paused = 0;
+	}
 	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
@@ -826,7 +821,6 @@ static int bam_resume(struct dma_chan *chan)
 static u32 process_channel_irqs(struct bam_device *bdev)
 {
 	u32 i, srcs, pipe_stts, offset, avail;
-	unsigned long flags;
 	struct bam_async_desc *async_desc, *tmp;
 
 	srcs = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
@@ -846,7 +840,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 
 		writel_relaxed(pipe_stts, bam_addr(bdev, i, BAM_P_IRQ_CLR));
 
-		spin_lock_irqsave(&bchan->vc.lock, flags);
+		guard(spinlock_irqsave)(&bchan->vc.lock);
 
 		offset = readl_relaxed(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
 				       P_SW_OFSTS_MASK;
@@ -885,8 +879,6 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			}
 			list_del(&async_desc->desc_node);
 		}
-
-		spin_unlock_irqrestore(&bchan->vc.lock, flags);
 	}
 
 	return srcs;
@@ -950,7 +942,6 @@ static enum dma_status bam_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 	int ret;
 	size_t residue = 0;
 	unsigned int i;
-	unsigned long flags;
 
 	ret = dma_cookie_status(chan, cookie, txstate);
 	if (ret == DMA_COMPLETE)
@@ -959,23 +950,22 @@ static enum dma_status bam_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 	if (!txstate)
 		return bchan->paused ? DMA_PAUSED : ret;
 
-	spin_lock_irqsave(&bchan->vc.lock, flags);
-	vd = vchan_find_desc(&bchan->vc, cookie);
-	if (vd) {
-		residue = container_of(vd, struct bam_async_desc, vd)->length;
-	} else {
-		list_for_each_entry(async_desc, &bchan->desc_list, desc_node) {
-			if (async_desc->vd.tx.cookie != cookie)
-				continue;
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
+		vd = vchan_find_desc(&bchan->vc, cookie);
+		if (vd) {
+			residue = container_of(vd, struct bam_async_desc, vd)->length;
+		} else {
+			list_for_each_entry(async_desc, &bchan->desc_list, desc_node) {
+				if (async_desc->vd.tx.cookie != cookie)
+					continue;
 
-			for (i = 0; i < async_desc->num_desc; i++)
-				residue += le16_to_cpu(
-						async_desc->curr_desc[i].size);
+				for (i = 0; i < async_desc->num_desc; i++)
+					residue += le16_to_cpu(
+							async_desc->curr_desc[i].size);
+			}
 		}
 	}
 
-	spin_unlock_irqrestore(&bchan->vc.lock, flags);
-
 	dma_set_residue(txstate, residue);
 
 	if (ret == DMA_IN_PROGRESS && bchan->paused)
@@ -1116,17 +1106,16 @@ static void dma_tasklet(struct tasklet_struct *t)
 {
 	struct bam_device *bdev = from_tasklet(bdev, t, task);
 	struct bam_chan *bchan;
-	unsigned long flags;
 	unsigned int i;
 
 	/* go through the channels and kick off transactions */
 	for (i = 0; i < bdev->num_channels; i++) {
 		bchan = &bdev->channels[i];
-		spin_lock_irqsave(&bchan->vc.lock, flags);
+
+		guard(spinlock_irqsave)(&bchan->vc.lock);
 
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
-		spin_unlock_irqrestore(&bchan->vc.lock, flags);
 	}
 
 }
@@ -1140,15 +1129,12 @@ static void dma_tasklet(struct tasklet_struct *t)
 static void bam_issue_pending(struct dma_chan *chan)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
-	unsigned long flags;
 
-	spin_lock_irqsave(&bchan->vc.lock, flags);
+	guard(spinlock_irqsave)(&bchan->vc.lock);
 
 	/* if work pending and idle, start a transaction */
 	if (vchan_issue_pending(&bchan->vc) && !IS_BUSY(bchan))
 		bam_start_dma(bchan);
-
-	spin_unlock_irqrestore(&bchan->vc.lock, flags);
 }
 
 /**

-- 
2.51.0


