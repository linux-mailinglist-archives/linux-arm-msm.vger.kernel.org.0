Return-Path: <linux-arm-msm+bounces-47402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A04A2E892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD373AA3D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306D01E3761;
	Mon, 10 Feb 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tz//8fAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752401E32BD;
	Mon, 10 Feb 2025 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181789; cv=none; b=LpoCJGUuM1qktFlfMCh6BdwUTLkAGRitLu/uIyuLQUQ45YLwBObVVq1pIOb763ZtOViANuqzr70gApPF/6z44mLk6/ADKdXXtNtIN/isfrW6y795O9+wstBcsgqMe8U1FokkP6AGYgq8bI+VivWECFDMwO99qzahWhUWOSEm/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181789; c=relaxed/simple;
	bh=EI18NcIKCnuMhNBX5qr5t3aERRB0/uQDwrnH2W1PyFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWCCtMaZqJxyCgO1FNiQOIWJt1DDMzVhi7gKgGUyRFvi8LjdNhGJlCTpIoyjZbF33M05hnto1ap0UI6hfOkm2t5RXl/22dQja3fYVIqK8zwFZeTrz+UnPjWIxRoVTInSKPhJ7Ef98mfJV/TZPpuWX0ORFHzUE5F+9Bi75W6Uvvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tz//8fAS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9p8AC018199;
	Mon, 10 Feb 2025 10:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxbfDse5WOybmMXuL95q47SDxJXP4H0yw1vLl+9WEXE=; b=Tz//8fASHeFEFdRq
	KxkXEO2dvB/44wFhEmOAx8i5IS6aU20A9xVfdq4se8K2mhDf1SOdA9ngx7GyF87G
	QczR57C6D0M8FiE2Q30Zje+/fyhjCp0kTbYHh/vuU73HpYRgY0pgzez+2XQfd0st
	Arj8yl9wEFkFR1JUMN9r/fBlaqL4dRNfbGpZsppRhY55lAHY6CdOp5SAjOnT/gaS
	eFFMekfLeD/5DbZKh++w55SqUd62LiJxpnejhRSMycIAgvCK96xd9sHt7i2GC8/H
	3nvLMQHHJmdk8AqKpBrrrcgRRhkHLDHFhSV2J0EZyJDhdLuRzSUrhImmojW6ohG/
	aaQwBw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxkxxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:48 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2Ha6011341;
	Mon, 10 Feb 2025 10:02:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkhyk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:45 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2jPr011430;
	Mon, 10 Feb 2025 10:02:45 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51AA2ils011429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:45 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id EC00A40BF7; Mon, 10 Feb 2025 18:02:43 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 7/8] scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed
Date: Mon, 10 Feb 2025 18:02:10 +0800
Message-Id: <20250210100212.855127-8-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sSQlad2BTlIyI63jAXbUEGmYMx_-44TD
X-Proofpoint-ORIG-GUID: sSQlad2BTlIyI63jAXbUEGmYMx_-44TD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100084

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
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
---

v1 - > v2:
Initialize the local variables "wb_en" as "false".
v3 -> v4:
1. Add comment for default initialized wb_gear.
2. Remove the unnecessary variable “wb_en" in function
   ufshcd_clock_scaling_unprepare().
---
 drivers/ufs/core/ufshcd.c | 12 ++++++++----
 include/ufs/ufshcd.h      |  3 +++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bd93119a177d..1276f4a987bd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1393,13 +1393,13 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	return ret;
 }
 
-static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool scale_up)
+static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 {
 	up_write(&hba->clk_scaling_lock);
 
-	/* Enable Write Booster if we have scaled up else disable it */
+	/* Enable Write Booster if current gear requires it else disable it */
 	if (ufshcd_enable_wb_if_scaling_up(hba) && !err)
-		ufshcd_wb_toggle(hba, scale_up);
+		ufshcd_wb_toggle(hba, hba->pwr_info.gear_rx >= hba->clk_scaling.wb_gear);
 
 	mutex_unlock(&hba->wb_mutex);
 
@@ -1461,7 +1461,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 	}
 
 out_unprepare:
-	ufshcd_clock_scaling_unprepare(hba, ret, scale_up);
+	ufshcd_clock_scaling_unprepare(hba, ret);
 	return ret;
 }
 
@@ -1821,6 +1821,10 @@ static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
 	if (!hba->clk_scaling.min_gear)
 		hba->clk_scaling.min_gear = UFS_HS_G1;
 
+	if (!hba->clk_scaling.wb_gear)
+		/* Use intermediate gear speed HS_G3 as the default wb_gear */
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


