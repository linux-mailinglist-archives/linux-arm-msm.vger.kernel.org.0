Return-Path: <linux-arm-msm+bounces-46713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FBA2542E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFE33A5AA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA4F214A64;
	Mon,  3 Feb 2025 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IbJ95X7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD6204F62;
	Mon,  3 Feb 2025 08:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570398; cv=none; b=tEQ7EPd5Jb47OffPmdV1iZeOcbUB3WufChU9+LjyRyxtRQGceiXIw5kCsCv6DoKGx4MsxXT99/XGfHGRU1ophnay7sYdq+ZZT5yxZmGuToT72OKtKaJAe3+2iX6bFPSX1/BU1EnM9GGsArbs1yIHEcLXHQkqvDYYPMwkXtLlPbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570398; c=relaxed/simple;
	bh=Io8749sULxR3+6fFKCAAUk227SjB1qysNLT6wKcy74E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktNtJJx2PU61PK+LayEIAJMsEhaQ4b9uKXEtgOkZbyUj51G/X1cIWkm2mxgIqF8Nd0aTTt3MyNN+U7Wqt+rTqlfMVvaeZaiQEMBvcX+pNRLOMSlLqo1fiKJN0S57xb4lP6d+lgGYrxRXlvdHjKgKVOGPESOGRLS+Slh9Dl28ybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IbJ95X7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5137GBNq003911;
	Mon, 3 Feb 2025 08:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iEV0QAZTG4K
	vVurs4Ns+1jUS8dOAwtNz55Yk77nJaf4=; b=IbJ95X7S5f4E666I96kasUL9RjI
	OJNZOu7tv+xuz0YdgyMX10PvHK8wvkPKnXHeXU32dinQg3jQ9/pT/O6QieKMrwhD
	iqb9yu6s5u5GaO1Js1TTuEs72T5wy3twaT2+K5XBjPFURCFEktvf7cfysABJc5z7
	qZN32VO2j2w4OM9PEkDBrj0zm/XBb3ubjKSXQmiXXvw+L8pCZbwXEAGzNjqsWyua
	eRugrupg/R9Q+JsOtnFj/YbljKU/pgB7wQKbNqSvmuy3+uRiqSwWuEnx/IDV+6fp
	Q48gzTwv5u+z/1I4jXcKXP30Fu95Wzw7Z4NiDD8cS/tubOPb41tweSXNVAw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44js8tr3j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:59 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BLE0013128;
	Mon, 3 Feb 2025 08:11:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpkhsbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:56 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138Bues013458;
	Mon, 3 Feb 2025 08:11:56 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5138BuT7013457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:56 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 33D8540BFE; Mon,  3 Feb 2025 16:11:55 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/8] scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed
Date: Mon,  3 Feb 2025 16:11:08 +0800
Message-Id: <20250203081109.1614395-8-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0ohLy7UyUA661EF6Q_IBDbN7_d8tYE2L
X-Proofpoint-ORIG-GUID: 0ohLy7UyUA661EF6Q_IBDbN7_d8tYE2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030065

From: Can Guo <quic_cang@quicinc.com>

During clock scaling, Write Booster is toggled on or off based on
whether the clock is scaled up or down. However, with OPP V2 powered
multi-level gear scaling, the gear can be scaled amongst multiple gear
speeds, e.g., it may scale down from G5 to G4, or from G4 to G2. To provide
flexibilities, add a new field for clock scaling such that during clock
scaling Write Booster can be enabled or disabled based on gear speeds but
not based on scaling up or down.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 - > v2:
Initialize the local variables "wb_en" as "false".
---
 drivers/ufs/core/ufshcd.c | 17 ++++++++++++-----
 include/ufs/ufshcd.h      |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bd93119a177d..83fd38c78467 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1393,13 +1393,17 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	return ret;
 }
 
-static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool scale_up)
+static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 {
 	up_write(&hba->clk_scaling_lock);
 
-	/* Enable Write Booster if we have scaled up else disable it */
-	if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
-		ufshcd_wb_toggle(hba, scale_up);
+	/* Enable Write Booster if current gear requires it else disable it */
+	if (ufshcd_enable_wb_if_scaling_up(hba) && !err) {
+		bool wb_en = false;
+
+		wb_en = hba->pwr_info.gear_rx >= hba->clk_scaling.wb_gear ? true : false;
+		ufshcd_wb_toggle(hba, wb_en);
+	}
 
 	mutex_unlock(&hba->wb_mutex);
 
@@ -1461,7 +1465,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 	}
 
 out_unprepare:
-	ufshcd_clock_scaling_unprepare(hba, ret, scale_up);
+	ufshcd_clock_scaling_unprepare(hba, ret);
 	return ret;
 }
 
@@ -1821,6 +1825,9 @@ static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
 	if (!hba->clk_scaling.min_gear)
 		hba->clk_scaling.min_gear = UFS_HS_G1;
 
+	if (!hba->clk_scaling.wb_gear)
+		hba->clk_scaling.wb_gear = UFS_HS_G3;
+
 	INIT_WORK(&hba->clk_scaling.suspend_work,
 		  ufshcd_clk_scaling_suspend_work);
 	INIT_WORK(&hba->clk_scaling.resume_work,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index cdb853f5b871..efca700d0520 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -447,6 +447,8 @@ struct ufs_clk_gating {
  * @resume_work: worker to resume devfreq
  * @target_freq: frequency requested by devfreq framework
  * @min_gear: lowest HS gear to scale down to
+ * @wb_gear: enable Write Booster when HS gear scales above or equal to it, else
+ *		disable Write Booster
  * @is_enabled: tracks if scaling is currently enabled or not, controlled by
  *		clkscale_enable sysfs node
  * @is_allowed: tracks if scaling is currently allowed or not, used to block
@@ -467,6 +469,7 @@ struct ufs_clk_scaling {
 	struct work_struct resume_work;
 	unsigned long target_freq;
 	u32 min_gear;
+	u32 wb_gear;
 	bool is_enabled;
 	bool is_allowed;
 	bool is_initialized;
-- 
2.34.1


