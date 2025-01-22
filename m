Return-Path: <linux-arm-msm+bounces-45799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79FA18F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA293AC9C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCA921147A;
	Wed, 22 Jan 2025 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TS9OOSzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B5211290;
	Wed, 22 Jan 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540289; cv=none; b=r8k/YpLC7PBa4brqwrRcCgNo/pR5t1GGRJqkGShyrrCQVFELVU7UvvoOnCHJf5K/w+jarVKHTq2JebFN+/0AAU5H5Levc2tFZ03/bw/9Cvm53MpuBYRc5m0zyHpOArclIYtweOlXcPcpaXOoKmXZKurqtlXjzkqTxBFsjOh9+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540289; c=relaxed/simple;
	bh=v4NdYFDuN8k0IagO2GaVWJvfC96+HQe5NOiScgskqAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=anUtG2gnNH/9af9HRo4Zi+bHZKspHxDvD00H1LmDfn+6EnkOxh6IAriqTJN30xAFiIYv6fbdpWP55XBlYxR8XPtmg9EdUBB6hNh1jSWqCO4JxLpPJTMh9B3k2fAxobm7Q0wPhfXtgpFoyOt3diENYztzvP536nrezeaNHjxBRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TS9OOSzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4XW8P029466;
	Wed, 22 Jan 2025 10:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d5ounrJ3P7r
	0Vtsq+exzuosr783UajCDgZYtJL8yu5E=; b=TS9OOSzJHWOvF6tZ5pikt/oJKb4
	hI5DBIOg7Inf+MpE4EUHOWcu+tQVVL9dk3MOEtrtiSX1AkuKZgfWkz9gYfjvWWjq
	vnwdV5Bv2opMqrRJH5RgEcUdkycfWk3wiguZ03GRkoTBs3TFH5bYhQKbplyTCCJC
	P2zlhGDqCIX/hYs0v0g+OzWKrOMP3AD+s61N/IY4YyVYCrznYEvlOCkchbHuvioY
	6pq8rwRKTF0NjDNSFvF91h89zhm5lOzeyNDWHV+nboNEEhRgEJBhCUt4EzwYk0VO
	ByfKjdUq21j4goO17a1jFcH0Bv+BEwPShyFbMxt6rdAG/dWDjB8+1Yvgq4A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44asrnrrh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:32 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA3Uvt013456;
	Wed, 22 Jan 2025 10:03:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckuarb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:30 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA3Tvv013450;
	Wed, 22 Jan 2025 10:03:30 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50MA3Tg9013449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:29 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 9D68740CE9; Wed, 22 Jan 2025 18:03:28 +0800 (CST)
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
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 7/8] scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed
Date: Wed, 22 Jan 2025 18:02:13 +0800
Message-Id: <20250122100214.489749-8-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: jwrZ0UBkGqDvxG9hbRo_Rz6vjm8cRbk0
X-Proofpoint-ORIG-GUID: jwrZ0UBkGqDvxG9hbRo_Rz6vjm8cRbk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073

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
index 741ddf3a0cb5..ae825da00791 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1395,13 +1395,17 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
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
 
@@ -1456,7 +1460,7 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 	}
 
 out_unprepare:
-	ufshcd_clock_scaling_unprepare(hba, ret, scale_up);
+	ufshcd_clock_scaling_unprepare(hba, ret);
 	return ret;
 }
 
@@ -1816,6 +1820,9 @@ static void ufshcd_init_clk_scaling(struct ufs_hba *hba)
 	if (!hba->clk_scaling.min_gear)
 		hba->clk_scaling.min_gear = UFS_HS_G1;
 
+	if (!hba->clk_scaling.wb_gear)
+		hba->clk_scaling.wb_gear = UFS_HS_G3;
+
 	INIT_WORK(&hba->clk_scaling.suspend_work,
 		  ufshcd_clk_scaling_suspend_work);
 	INIT_WORK(&hba->clk_scaling.resume_work,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8c7c497d63d3..8e6c2eb68011 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -448,6 +448,8 @@ struct ufs_clk_gating {
  * @resume_work: worker to resume devfreq
  * @target_freq: frequency requested by devfreq framework
  * @min_gear: lowest HS gear to scale down to
+ * @wb_gear: enable Write Booster when HS gear scales above or equal to it, else
+ *		disable Write Booster
  * @is_enabled: tracks if scaling is currently enabled or not, controlled by
  *		clkscale_enable sysfs node
  * @is_allowed: tracks if scaling is currently allowed or not, used to block
@@ -468,6 +470,7 @@ struct ufs_clk_scaling {
 	struct work_struct resume_work;
 	unsigned long target_freq;
 	u32 min_gear;
+	u32 wb_gear;
 	bool is_enabled;
 	bool is_allowed;
 	bool is_initialized;
-- 
2.34.1


