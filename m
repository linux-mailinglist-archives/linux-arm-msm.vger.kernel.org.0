Return-Path: <linux-arm-msm+bounces-46290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC2DA2002C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06EFC188675C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 21:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697051A83E4;
	Mon, 27 Jan 2025 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="NL+52OP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9DF1991CF;
	Mon, 27 Jan 2025 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738015145; cv=none; b=AOCAZ9aCSw92q3IoJ5iIka2RxAhYXD3SqcIvlNVyGsDWoeF/Sn7IyUZvaXKhW/CybAp4QT79/7c1jrf4RIQobV6f4VlaX3JmmYlzh/RJ6zyBmVhWGX6Y4dFaeGKZ11vmZUdaB9ptV48y3/r17BWjEMmRDY/9z6c+HQEMYFuH5Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738015145; c=relaxed/simple;
	bh=PMkpOegTG/d9Nyv5JURrxQZncb/KgqOh+eXpwX0jzBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofFN9aU7L6WcEI8wFTBaTJeTksP3Wz4uLnQfhYVpxNvbfstLHTNJPYAbjzHEGcszIqxrLOOxo9QhVSXE+gPhf4lmUDb1cpa7UuYa6JSSQ6wZ516RtISXsWGsZU/U8k5bxhA++bkS9ZYxcvcHxG1PeKAvHsExM1IDJUlW5bBEOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=NL+52OP4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=rZLWol2r1Mh9j/j92jlfWF1iD5OxdPBmaaTsEP71MwI=; b=NL+52OP4ipm6rnP6
	yQko0reZB7lIDsMJXfebWrTtI3uaX962Nf+FT/KVVLMyW08MCQ4d9cujK/fBqnvkLhL4sxfNPTeie
	UxXAjfss1afVY7rpusV5wK/FReha9SkU/Vx9r4CriVs/6swBxKzK/q5wweLmJ0PtCQKnUzkNOh/uK
	TgWNgiCjn+Aigp0iZTxZMDYcwwJh0gUbh1y3Uo86/NBGPgvAD4tJNtU5co+qaZqn8FyY9nYyfJb1H
	SgMBMDtocwSkAkkQQU+YVIq1cMM88ntoWsoklOE8jvuPQIAgg8Fb5afPHdHcNHMU8CAX2IOgmZ84e
	R6++OUGCbQ9Xd9jxCg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tcX8G-00CMx1-1m;
	Mon, 27 Jan 2025 21:59:00 +0000
From: linux@treblig.org
To: manivannan.sadhasivam@linaro.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] bus: mhi: Remove unused functions
Date: Mon, 27 Jan 2025 21:58:59 +0000
Message-ID: <20250127215859.261105-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
added them.

Remove them.

Note that mhi_queue_dma_sync() is used and has been left.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/bus/mhi/host/main.c | 19 -------------------
 drivers/bus/mhi/host/pm.c   | 14 --------------
 include/linux/mhi.h         | 18 ------------------
 3 files changed, 51 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4de75674f193..4c91ffd6ed0e 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1181,25 +1181,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
 }
 EXPORT_SYMBOL_GPL(mhi_queue_skb);
 
-int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
-		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
-{
-	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
-							     mhi_dev->dl_chan;
-	struct mhi_buf_info buf_info = { };
-
-	buf_info.p_addr = mhi_buf->dma_addr;
-	buf_info.cb_buf = mhi_buf;
-	buf_info.pre_mapped = true;
-	buf_info.len = len;
-
-	if (unlikely(mhi_chan->pre_alloc))
-		return -EINVAL;
-
-	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
-}
-EXPORT_SYMBOL_GPL(mhi_queue_dma);
-
 int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 			struct mhi_buf_info *info, enum mhi_flags flags)
 {
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..2fb27e6f8f88 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1296,20 +1296,6 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
 
-void mhi_device_get(struct mhi_device *mhi_dev)
-{
-	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-
-	mhi_dev->dev_wake++;
-	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
-
-	mhi_cntrl->wake_get(mhi_cntrl, true);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
-}
-EXPORT_SYMBOL_GPL(mhi_device_get);
-
 int mhi_device_get_sync(struct mhi_device *mhi_dev)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 059dc94d20bb..dd372b0123a6 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -720,12 +720,6 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
  */
 void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
 
-/**
- * mhi_device_get - Disable device low power mode
- * @mhi_dev: Device associated with the channel
- */
-void mhi_device_get(struct mhi_device *mhi_dev);
-
 /**
  * mhi_device_get_sync - Disable device low power mode. Synchronously
  *                       take the controller out of suspended state
@@ -776,18 +770,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
  */
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 
-/**
- * mhi_queue_dma - Send or receive DMA mapped buffers from client device
- *                 over MHI channel
- * @mhi_dev: Device associated with the channels
- * @dir: DMA direction for the channel
- * @mhi_buf: Buffer for holding the DMA mapped data
- * @len: Buffer length
- * @mflags: MHI transfer flags used for the transfer
- */
-int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
-		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags);
-
 /**
  * mhi_queue_buf - Send or receive raw buffers from client device over MHI
  *                 channel
-- 
2.48.1


