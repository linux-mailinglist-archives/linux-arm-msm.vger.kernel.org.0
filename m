Return-Path: <linux-arm-msm+bounces-45454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E3A1556D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 18:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 437417A05DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EE91A7265;
	Fri, 17 Jan 2025 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osFXPM8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E331A0BF3;
	Fri, 17 Jan 2025 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133813; cv=none; b=drFu5Jfm7EMMG9g5eY++Lbl0+EzSiT0imX0zuVIBXCB2LYZohorhguAXw5o8rK4QRlCZMXg8fIXtFr5zcgTPpLk0uzsE+TBIW/rW9OzBmzPYuCk3nk+WxrY17BP7GyrZXCs+o9Qs4RUZx2GjjuiMz2GSIQzBpgh/7CY9E2F91V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133813; c=relaxed/simple;
	bh=KCJmYotnc8epKYKWJDa05vZA28yh/2JjDmzXGLrOy+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvsWpue2AGPSCHcS4GiYQGfHESq4A1N6T+6aLUsCWgPzRdRcR1fOM2hsx/35dgaxRMJWeXp0jRWWAYACVIRwi7s1DO16v3CwpDUMYixWiu8BDUkv2BQrXQ+tQoyvORvEXzLV1QBrqJ1aejDvxJTYTrgttGKL1zHASo3xoaeJ2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osFXPM8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HC8gMl006181;
	Fri, 17 Jan 2025 17:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dx5f0k50guFX2ZhBS659P6aUyMMwFbVn6Tp2BoAwzY0=; b=osFXPM8hVJmJc9gq
	8jgslqyQ5w38opZj/8T6j+xxFhF8C+0uyctR6Err2h6d+p5zImCUvVEqAkEIXreG
	DCL4+Sopd4NSxf2JpHCOlp/RUmKXwP194zyn4Z08sf4FdlffQcytK/6i2T4tR+IM
	0Mo0GfValfKMJskIIPUSk+QdfOZ+cOXTI3MmPmeHOv5aFbtFuzAolGB2QQd4gpaH
	Ggrfc4/i9jEaw35pf/0fpsylJi+xhk1KUN94CGmV7OPKB33PFDws/FG8UWmjOtXS
	bquEUpYvTaDC84zY/rpgP0gyMnQ9uxE9BIT8g9rYUYG9To6jFiOPdAk3RdEy9RSj
	sk+Hlg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447py0grcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:10:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HHA3Tg032655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:10:03 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:10:02 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH v2 2/7] bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL
Date: Fri, 17 Jan 2025 10:09:38 -0700
Message-ID: <20250117170943.2643280-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9SZK2lVk8sYjQ2g2Kl1USvs1-9OfzrxB
X-Proofpoint-GUID: 9SZK2lVk8sYjQ2g2Kl1USvs1-9OfzrxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170134

From: Matthew Leung <quic_mattleun@quicinc.com>

Currently, MHI host only performs firmware transfer via BHI in PBL and
BHIe from SBL. To support BHIe transfer directly from PBL, a policy
needs to be added.

With this policy, BHIe will be used to transfer firmware in PBL if the
MHI controller has BHIe regs, sets seg_len, and does not set
fbc_download. The intention is to transfer firmware using BHIe in PBL
without further BHIe transfers in SBL.

Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/bus/mhi/host/boot.c     | 73 ++++++++++++++++++++++++++-------
 drivers/bus/mhi/host/init.c     |  2 +-
 drivers/bus/mhi/host/internal.h |  7 ++++
 3 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 9fe13d3f09f0..a206c3f0fcfd 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -440,12 +440,59 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
 	}
 }
 
+static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
+{
+	if (mhi_cntrl->fbc_download) {
+		return MHI_FW_LOAD_FBC;
+	} else {
+		if (mhi_cntrl->seg_len)
+			return MHI_FW_LOAD_BHIE;
+		else
+			return MHI_FW_LOAD_BHI;
+	}
+}
+
+static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
+{
+	struct image_info *image;
+	int ret;
+
+	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
+	if (ret)
+		return ret;
+
+	/* Load the firmware into BHI vec table */
+	memcpy(image->mhi_buf->buf, fw_data, size);
+
+	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
+	mhi_free_bhi_buffer(mhi_cntrl, image);
+
+	return ret;
+}
+
+static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
+{
+	struct image_info *image;
+	int ret;
+
+	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
+	if (ret)
+		return ret;
+
+	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
+
+	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
+	mhi_free_bhie_table(mhi_cntrl, image);
+
+	return ret;
+}
+
 void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_fw_load_type fw_load_type;
 	enum mhi_pm_state new_state;
-	struct image_info *image;
 	const char *fw_name;
 	const u8 *fw_data;
 	size_t size, fw_sz;
@@ -506,21 +553,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_sz = firmware->size;
 
 skip_req_fw:
-	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
-	if (ret) {
-		release_firmware(firmware);
-		goto error_fw_load;
-	}
-	/* Load the firmware into BHI vec table */
-	memcpy(image->mhi_buf->buf, fw_data, size);
-
-	/* Download image using BHI */
-	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
-	mhi_free_bhi_buffer(mhi_cntrl, image);
+	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
+	if (fw_load_type == MHI_FW_LOAD_BHIE)
+		ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
+	else
+		ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
-		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
+		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
+			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
+			ret);
 		release_firmware(firmware);
 		goto error_fw_load;
 	}
@@ -539,7 +582,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * If we're doing fbc, populate vector tables while
 	 * device transitioning into MHI READY state
 	 */
-	if (mhi_cntrl->fbc_download) {
+	if (fw_load_type == MHI_FW_LOAD_FBC) {
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);
@@ -564,7 +607,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	return;
 
 error_ready_state:
-	if (mhi_cntrl->fbc_download) {
+	if (fw_load_type == MHI_FW_LOAD_FBC) {
 		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 		mhi_cntrl->fbc_image = NULL;
 	}
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index a9b1f8beee7b..13e7a55f54ff 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1144,7 +1144,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	}
 	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
-	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
+	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size || mhi_cntrl->seg_len) {
 		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
 				   &bhie_off);
 		if (ret) {
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 3134f111be35..ce566f7d2e92 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -29,6 +29,13 @@ struct bhi_vec_entry {
 	u64 size;
 };
 
+enum mhi_fw_load_type {
+	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
+	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
+	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
+	MHI_FW_LOAD_MAX,
+};
+
 enum mhi_ch_state_type {
 	MHI_CH_STATE_TYPE_RESET,
 	MHI_CH_STATE_TYPE_STOP,
-- 
2.34.1


