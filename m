Return-Path: <linux-arm-msm+bounces-26525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFD9347E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D5D283478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151695579F;
	Thu, 18 Jul 2024 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HRxI4gcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB554662
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283260; cv=none; b=Arrd6JZgYzgJAzBI5tErySMct3KJWA1v8CIfX0YCkRFmfTpUZCW0Q4y6K1LNZ5k2nVCZiJGGIlsLgGrKRAMcghU8vKRdZNGYuq9l575sRZgE3Snhg/YyD3Pl4m7aI3dNxnOWUMcBo4ymr8wdDgKKHGkaXEhbF/ZR4HhYfXHuT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283260; c=relaxed/simple;
	bh=c1VowsgoVmKn4M0/SOC9oMksN+6XDSK/woAI/qeI6D4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+DhYS44Nw2GmyfrzkgJEIg6EVOTUF+McPpdooAnghs2immjRZQ8pr6UN5WKzj5NSCGgqfzItGuqRMus5IwmZpTIxXbF7+Bst+yeY0L1JEkahv7s+omkDlspQwa8N5S5rw2GdrqvFy+AIH5Im5OmGp6Vke32gWQvupLAVJM/j1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HRxI4gcH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I3fiOr025096;
	Thu, 18 Jul 2024 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8sbEIQeFrTEjEnmxl5B9IFDU7eD1+iSIaFcbSUVWto=; b=HRxI4gcH8fHPdHx2
	AvVm3AXjJ5FHibZtyPLz5OdRcpksOraodXZYezex5s6qKEIgGtAECBquXTWbGsn5
	lJCgU/OTctoKwsVPXTDE4PwDVzFD9kwMSJDgh/bxz+FCQAFz+NmRWxkfG5sEhd+S
	0drzu5SDw+xhPY3jstDD6FWyhoBcWlkBGco6Bl/wZ6DeA4CKuU7l/93eIUiP4lQz
	j+7x9g+BKYmkzL8GJPgr0cC6o0h0OfJMKvetGDCGu5Ea7jDwjOwoXp6xlhrjVSQx
	WCKouLnomRXXX9ZhgN2xVaFsFC1asAVALd9j5eRbJ/4osS/z7pNNlDnu3IF4Nq+9
	eb8n2g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpmhnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6EDDY017626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:13 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:10 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 4/6] bus: mhi: dump debug registers in critical sections
Date: Thu, 18 Jul 2024 11:43:42 +0530
Message-ID: <20240718061344.575653-5-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rHYlUKGpQLdpZ3IFrLx66KSftGj3SBSq
X-Proofpoint-GUID: rHYlUKGpQLdpZ3IFrLx66KSftGj3SBSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180040

ERRCODE and ERRDBG registers are dumped during BHI failure.
Extend this to BHIe and RDDM failures. Also, add additional status
registers essential for debug and make this debug function available
for client driver.

Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 53 +++++++++++++++++-------------
 drivers/bus/mhi/host/main.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c   |  4 ++-
 include/linux/mhi.h         |  5 +++
 4 files changed, 103 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 324510d2c7fd..b403890d873b 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -159,6 +159,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 error_exit_rddm:
 	dev_err(dev, "RDDM transfer failed. Current EE: %s\n",
 		TO_MHI_EXEC_STR(ee));
+	mhi_debug_reg_dump(mhi_cntrl);
 
 	return -EIO;
 }
@@ -168,6 +169,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	struct mhi_buf *mhi_buf = NULL;
 	u32 rx_status;
 	int ret;
@@ -217,6 +219,15 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 		dma_unmap_single(mhi_cntrl->cntrl_dev, mhi_buf->dma_addr,
 				 mhi_buf->len, DMA_TO_DEVICE);
 
+	if (ret) {
+		dev_err(dev, "RDDM transfer failed. RXVEC_STATUS: 0x%x\n",
+			rx_status);
+		read_lock_bh(pm_lock);
+		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+			mhi_debug_reg_dump(mhi_cntrl);
+		read_unlock_bh(pm_lock);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
@@ -263,8 +274,22 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 						   &tx_status) || tx_status,
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
-	    tx_status != BHIE_TXVECSTATUS_STATUS_XFER_COMPL)
+	    tx_status != BHIE_TXVECSTATUS_STATUS_XFER_COMPL) {
+		dev_err(dev, "Upper:0x%x Lower:0x%x len:0x%zx sequence:%u\n",
+			upper_32_bits(mhi_buf->dma_addr),
+			lower_32_bits(mhi_buf->dma_addr),
+			mhi_buf->len, sequence_id);
+
+		dev_err(dev, "MHI pm_state: %s tx_status: %d ee: %s\n",
+			to_mhi_pm_state_str(mhi_cntrl->pm_state), tx_status,
+			TO_MHI_EXEC_STR(mhi_get_exec_env(mhi_cntrl)));
+
+		read_lock_bh(pm_lock);
+		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+			mhi_debug_reg_dump(mhi_cntrl);
+		read_unlock_bh(pm_lock);
 		return -EIO;
+	}
 
 	return (!ret) ? -ETIMEDOUT : 0;
 }
@@ -273,21 +298,11 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 			   dma_addr_t dma_addr,
 			   size_t size)
 {
-	u32 tx_status, val, session_id;
-	int i, ret;
+	u32 tx_status, session_id;
+	int ret;
 	void __iomem *base = mhi_cntrl->bhi;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct {
-		char *name;
-		u32 offset;
-	} error_reg[] = {
-		{ "ERROR_CODE", BHI_ERRCODE },
-		{ "ERROR_DBG1", BHI_ERRDBG1 },
-		{ "ERROR_DBG2", BHI_ERRDBG2 },
-		{ "ERROR_DBG3", BHI_ERRDBG3 },
-		{ NULL },
-	};
 
 	read_lock_bh(pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -319,16 +334,8 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	if (tx_status == BHI_STATUS_ERROR) {
 		dev_err(dev, "Image transfer failed\n");
 		read_lock_bh(pm_lock);
-		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
-			for (i = 0; error_reg[i].name; i++) {
-				ret = mhi_read_reg(mhi_cntrl, base,
-						   error_reg[i].offset, &val);
-				if (ret)
-					break;
-				dev_err(dev, "Reg: %s value: 0x%x\n",
-					error_reg[i].name, val);
-			}
-		}
+		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+			mhi_debug_reg_dump(mhi_cntrl);
 		read_unlock_bh(pm_lock);
 		goto invalid_pm_state;
 	}
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 2f44f11fa5a6..26baa04badf4 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1707,3 +1707,68 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_state state;
+	enum mhi_ee_type ee;
+	int i, ret;
+	u32 val;
+	void __iomem *mhi_base = mhi_cntrl->regs;
+	void __iomem *bhi_base = mhi_cntrl->bhi;
+	void __iomem *bhie_base = mhi_cntrl->bhie;
+	void __iomem *wake_db = mhi_cntrl->wake_db;
+	struct {
+		const char *name;
+		int offset;
+		void *base;
+	} debug_reg[] = {
+		{ "MHI_CNTRL", MHICTRL, mhi_base},
+		{ "MHI_STATUS", MHISTATUS, mhi_base},
+		{ "MHI_WAKE_DB", 0, wake_db},
+		{ "BHI_EXECENV", BHI_EXECENV, bhi_base},
+		{ "BHI_STATUS", BHI_STATUS, bhi_base},
+		{ "BHI_ERRCODE", BHI_ERRCODE, bhi_base},
+		{ "BHI_ERRDBG1", BHI_ERRDBG1, bhi_base},
+		{ "BHI_ERRDBG2", BHI_ERRDBG2, bhi_base},
+		{ "BHI_ERRDBG3", BHI_ERRDBG3, bhi_base},
+		{ "BHIE_TXVEC_DB", BHIE_TXVECDB_OFFS, bhie_base},
+		{ "BHIE_TXVEC_STATUS", BHIE_TXVECSTATUS_OFFS, bhie_base},
+		{ "BHIE_RXVEC_DB", BHIE_RXVECDB_OFFS, bhie_base},
+		{ "BHIE_RXVEC_STATUS", BHIE_RXVECSTATUS_OFFS, bhie_base},
+		{ "BHIE_IMGTXDB", BHI_IMGTXDB, bhie_base},
+		{ NULL },
+	};
+
+	dev_info(&mhi_cntrl->mhi_dev->dev,
+		 "host pm_state:%s dev_state:%s ee:%s\n",
+		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		 mhi_state_str(mhi_cntrl->dev_state),
+		 TO_MHI_EXEC_STR(mhi_cntrl->ee));
+
+	state = mhi_get_mhi_state(mhi_cntrl);
+
+	if (!mhi_cntrl->bhi) {
+		dev_err(&mhi_cntrl->mhi_dev->dev,
+			"BHI not initialized, failed to dump debug registers\n");
+		return;
+	}
+
+	ee = mhi_get_exec_env(mhi_cntrl);
+
+	dev_info(&mhi_cntrl->mhi_dev->dev,
+		 "device ee:%s dev_state:%s\n", TO_MHI_EXEC_STR(ee),
+		 mhi_state_str(state));
+
+	for (i = 0; debug_reg[i].name; i++) {
+		if (!debug_reg[i].base)
+			continue;
+
+		ret = mhi_read_reg(mhi_cntrl, debug_reg[i].base,
+				   debug_reg[i].offset, &val);
+		dev_info(&mhi_cntrl->mhi_dev->dev,
+			 "reg:%s val:0x%x, ret:%d\n", debug_reg[i].name, val,
+			 ret);
+	}
+}
+EXPORT_SYMBOL_GPL(mhi_debug_reg_dump);
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 68524e27e76c..5db99e092dbe 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -1267,8 +1267,10 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
 			   msecs_to_jiffies(timeout_ms));
 
 	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
-	if (ret)
+	if (ret) {
+		mhi_debug_reg_dump(mhi_cntrl);
 		mhi_power_down(mhi_cntrl, false);
+	}
 
 	return ret;
 }
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index ce229a6a2b9a..c0c9bfc28e4a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -834,4 +834,9 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
  */
 int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
 
+/**
+ * mhi_debug_reg_dump - dump MHI registers for debug purpose
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
 #endif /* _MHI_H_ */
-- 
2.34.1


