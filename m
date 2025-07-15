Return-Path: <linux-arm-msm+bounces-65043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC6B05C9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C730A7BD440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECBE2E6D12;
	Tue, 15 Jul 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="ErFFBia0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE52E62D1;
	Tue, 15 Jul 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585981; cv=pass; b=Euvg4j7DqYAPhdEogYOHhTsetrkc+pfpnH4qXQU6DjCM7m9toKrL0D4ytiD3/t9XkBv9/R4qIBLYpPV7LlK/6Ol6iZDoI8iBas53ZfvDsmvsnJ8sBXXGeAL8Vmf5+NzW7SBsWOU6ddWMAc3E1kJaH0qWGs/CgXniRVOoCegXaNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585981; c=relaxed/simple;
	bh=lNP6j8FAExuphUY2GnzZpWUe4N42y+ooQuD66rTkNp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ls2G9orbX0WHj5ANO4pF2UpHGc9DZvFJV1mDDxexmzHyyb3vvQfT6uhtVyAXdGwHhNZwg2pulNbqGmSa8AQLV7vCqkA37W/KHMcHVjU/m/zK1fH2OpTOUSQ1VV2WSUvhjb+0AZ/X7Yb1JydVktgYJb6esJDi4yCFqIAkzFDDl94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=ErFFBia0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752585921; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T8d1pYrJdNmc7qeRah1Vnv7ySI5qe/c18r/1wuGBC3I8CIt06rFAbeIx9xd/lN2w5k52ZSlEGhaPdjbDn5h9q/Im6tlH0IvuCKKQYWo6mOfetduUarlX0ZaEptg2GF8tGayqoVVcRUlRugqnpcY8FMBXNjzHo3duaz/BXQzGTzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752585921; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g+nNKePYIp7l9bMZn9BgWi+OVDW4AE/CYs/TEIn87ls=; 
	b=Qcbb8GQ31Tj3nCZGPdbPYAJ1sACnEmyN5h2Q3PC0a2dYUb0oe2mK1kc88rbg05JeMrqzU1fg5+nQuKroUJ9IS1x0Emw4mS6zmXQeIINwOtDfh/26bbqv5fJjdQHr/vGg0nElHUJ73x43ZtNDE1lywIf4vldo2fj4myYS0ScZffE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752585921;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=g+nNKePYIp7l9bMZn9BgWi+OVDW4AE/CYs/TEIn87ls=;
	b=ErFFBia02nSQ9C2h/hlNUzlPl89J+vXJEUjgW6D/k0Tgq2YDgdWM+WFw1/ouk4f/
	T+3ZKSdUV/Gv5m4S6+Ozcn9wC7XuBkqm06/WBNCVKgphHFg4f8Wbbc4lBRdiJyU/e1i
	6f9cuqFqRu6sB72o/0eLKqiJd6nCBAR36cu61h7w=
Received: by mx.zohomail.com with SMTPS id 1752585918863968.9690914142641;
	Tue, 15 Jul 2025 06:25:18 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel@collabora.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] bus: mhi: host: keep bhi buffer through suspend cycle
Date: Tue, 15 Jul 2025 18:25:07 +0500
Message-Id: <20250715132509.2643305-2-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715132509.2643305-1-usama.anjum@collabora.com>
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When there is memory pressure, at resume time dma_alloc_coherent()
returns error which in turn fails the loading of firmware and hence
the driver crashes:

kernel: kworker/u33:5: page allocation failure: order:7,
mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
kernel: Call Trace:
kernel:  <TASK>
kernel:  dump_stack_lvl+0x4e/0x70
kernel:  warn_alloc+0x164/0x190
kernel:  ? srso_return_thunk+0x5/0x5f
kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
kernel:  __alloc_pages_noprof+0x321/0x350
kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
kernel:  dma_direct_alloc+0x70/0x270
kernel:  mhi_fw_load_handler+0x126/0x340 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi a96cb91daba500cc77f86bad60c1f332dc3babdf]
kernel:  ? srso_return_thunk+0x5/0x5f
kernel:  process_one_work+0x17e/0x330
kernel:  worker_thread+0x2ce/0x3f0
kernel:  ? __pfx_worker_thread+0x10/0x10
kernel:  kthread+0xd2/0x100
kernel:  ? __pfx_kthread+0x10/0x10
kernel:  ret_from_fork+0x34/0x50
kernel:  ? __pfx_kthread+0x10/0x10
kernel:  ret_from_fork_asm+0x1a/0x30
kernel:  </TASK>
kernel: Mem-Info:
kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
    active_file:359315 inactive_file:2487001 isolated_file:0
    unevictable:637 dirty:19 writeback:0
    slab_reclaimable:160391 slab_unreclaimable:39729
    mapped:175836 shmem:51039 pagetables:4415
    sec_pagetables:0 bounce:0
    kernel_misc_reclaimable:0
    free:125666 free_pcp:0 free_cma:0

In above example, if we sum all the consumed memory, it comes out
to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
Even though memory is present. But all of the dma memory has been
exhausted or fragmented.

Fix it by allocating it only once and then reuse the same allocated
memory. As we'll allocate this memory only once, this memory will stay
allocated.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Cc: stable@vger.kernel.org
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Reported here:
https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com

Still a lot of more fixes are required. Hence, I'm not adding closes tag.
Changes since v1:
- fix mhi_load_image_bhi()
- Cc stable and fix tested on tag
---
 drivers/bus/mhi/host/boot.c     | 25 +++++++++++++++----------
 drivers/bus/mhi/host/init.c     |  5 +++++
 drivers/bus/mhi/host/internal.h |  2 ++
 include/linux/mhi.h             |  1 +
 4 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index b3a85aa3c4768..9fc983bc12d49 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -302,8 +302,8 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	return -EIO;
 }
 
-static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
-				struct image_info *image_info)
+void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
+			 struct image_info *image_info)
 {
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
@@ -455,18 +455,23 @@ static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *m
 
 static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
 {
-	struct image_info *image;
+	struct image_info **image = &mhi_cntrl->bhi_image;
 	int ret;
 
-	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
-	if (ret)
-		return ret;
+	if (!(*image)) {
+		ret = mhi_alloc_bhi_buffer(mhi_cntrl, image, size);
+		if (ret)
+			return ret;
 
-	/* Load the firmware into BHI vec table */
-	memcpy(image->mhi_buf->buf, fw_data, size);
+		/* Load the firmware into BHI vec table */
+		memcpy((*image)->mhi_buf->buf, fw_data, size);
+	}
 
-	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
-	mhi_free_bhi_buffer(mhi_cntrl, image);
+	ret = mhi_fw_load_bhi(mhi_cntrl, &(*image)->mhi_buf[(*image)->entries - 1]);
+	if (ret) {
+		mhi_free_bhi_buffer(mhi_cntrl, *image);
+		*image = NULL;
+	}
 
 	return ret;
 }
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 6e06e4efec765..2e0f18c939e68 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1228,6 +1228,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->rddm_image = NULL;
 	}
 
+	if (mhi_cntrl->bhi_image) {
+		mhi_free_bhi_buffer(mhi_cntrl, mhi_cntrl->bhi_image);
+		mhi_cntrl->bhi_image = NULL;
+	}
+
 	mhi_deinit_dev_ctxt(mhi_cntrl);
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 1054e67bb450d..60b0699323375 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -324,6 +324,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info **image_info, size_t alloc_size);
 void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info *image_info);
+void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
+			 struct image_info *image_info);
 
 /* Power management APIs */
 enum mhi_pm_state __must_check mhi_tryset_pm_state(
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 4c567907933a5..593012f779d97 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -391,6 +391,7 @@ struct mhi_controller {
 	size_t reg_len;
 	struct image_info *fbc_image;
 	struct image_info *rddm_image;
+	struct image_info *bhi_image;
 	struct mhi_chan *mhi_chan;
 	struct list_head lpm_chans;
 	int *irq;
-- 
2.39.5


