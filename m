Return-Path: <linux-arm-msm+bounces-65042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC227B05C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA9F1642C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2902E62DF;
	Tue, 15 Jul 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="OgQCcXgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C762E62D0;
	Tue, 15 Jul 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585980; cv=pass; b=NYkI0pJD6yZU9mLNWjRnAFda1x4Q6dyowWdcv3iWj4K9I+TUjolR/gLSAZlS8bPOtVfJ9EKksBgz66sxk1RRmr+beJcWn6a8aGgkCXzsAaIMxjXFhnwhQOEi7DEnI5FwThoD8wDdBrWfapOsIeVW8RncFSVDFBsZ2pU1kza7mQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585980; c=relaxed/simple;
	bh=M8j7JAndjW76gZkMNx9GjJJXm+NYfmI5q0z6lnV/IuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ClFjXx4hpQrT9+UV97h9592MyPhD8R6G2rUSV+SZ2l6Jt3ztH63QwSdosqp2687QR2ziEPVN7SF+a7Vp+N2XKK3vJZRtjHqq5rzq2YFT+6wP4tPs5NNAd/B8iuNwoKKwbsiZdHWtbJpO5SJb07G/CedusUWrEUgdq/Ip8zSbxL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=OgQCcXgz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752585926; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZdQxCDeWOHLEFuTlFqIixHgGjtzZ3Z9TLntiH3HWyPuPUbOhtv4uI5u+RDYgCEMMreis9h/DZWtZugtu1P2nhtmSrjbXgZVAaM4GJaWSir32zUpgxKmYrMqh2FClXXaYdm6cHqK92kkc4VojsYLAib6GvzTn/mTyRTYYcx7JeZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752585926; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yOrcLOG6tjcTjNDL4YHJ2yUTrv14txmB+F3Ap51joxo=; 
	b=PCUDKkJMbeHOvJw34GnomgTc4I8mySfgqK1EY6Tgf/ijFgRhapFs92BDJEjz4NEphtHSIcio8vUx0WxUFrzPE0E5Lc4+5JNiRqTtMsG13qElqoHPjPtZblHYOR7nhLD11466cYS+gXHCRJIiYN/FJdgnKOtUihvha315RRvMQvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752585926;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yOrcLOG6tjcTjNDL4YHJ2yUTrv14txmB+F3Ap51joxo=;
	b=OgQCcXgzCF37pcPDWJSJ2V3IqI7BfXU55+a6qazyknVajfRCbWZ+s6zocxnF3o6U
	8zOwgTVGkGZrEvU+Kvim4P4FEsQoK+JNJ1NnxmvIL/Oey8d2eDqY5tWk9Qp8qrGtAYl
	Hd/PUDbkG7d6zm5F+BU7c1ZA3HUmHoHQnzhJx8nY=
Received: by mx.zohomail.com with SMTPS id 1752585925284460.38188208462543;
	Tue, 15 Jul 2025 06:25:25 -0700 (PDT)
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
Subject: [PATCH v2 2/3] bus: mhi: host: keep bhie buffer through suspend cycle
Date: Tue, 15 Jul 2025 18:25:08 +0500
Message-Id: <20250715132509.2643305-3-usama.anjum@collabora.com>
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
returns error which in turn fails the loading of the firmware and hence
the driver crashes.

Fix it by allocating only once and then reuse the same allocated memory.
As we'll allocate this memory only once, this memory will stays
allocated.

Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Added in v2
---
 drivers/bus/mhi/host/boot.c | 19 ++++++++++++-------
 drivers/bus/mhi/host/init.c |  5 +++++
 include/linux/mhi.h         |  1 +
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 9fc983bc12d49..9f35ce9d670e7 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -478,17 +478,22 @@ static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_dat
 
 static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
 {
-	struct image_info *image;
+	struct image_info **image = &mhi_cntrl->bhie_image;
 	int ret;
 
-	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
-	if (ret)
-		return ret;
+	if (!(*image)) {
+		ret = mhi_alloc_bhie_table(mhi_cntrl, image, size);
+		if (ret)
+			return ret;
 
-	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
+		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, *image);
+	}
 
-	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
-	mhi_free_bhie_table(mhi_cntrl, image);
+	ret = mhi_fw_load_bhie(mhi_cntrl, &(*image)->mhi_buf[(*image)->entries - 1]);
+	if (ret) {
+		mhi_free_bhie_table(mhi_cntrl, *image);
+		*image = NULL;
+	}
 
 	return ret;
 }
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 2e0f18c939e68..46ed0ae2ac285 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1228,6 +1228,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->rddm_image = NULL;
 	}
 
+	if (mhi_cntrl->bhie_image) {
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->bhie_image);
+		mhi_cntrl->bhie_image = NULL;
+	}
+
 	if (mhi_cntrl->bhi_image) {
 		mhi_free_bhi_buffer(mhi_cntrl, mhi_cntrl->bhi_image);
 		mhi_cntrl->bhi_image = NULL;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 593012f779d97..77986cd66fda3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -391,6 +391,7 @@ struct mhi_controller {
 	size_t reg_len;
 	struct image_info *fbc_image;
 	struct image_info *rddm_image;
+	struct image_info *bhie_image;
 	struct image_info *bhi_image;
 	struct mhi_chan *mhi_chan;
 	struct list_head lpm_chans;
-- 
2.39.5


