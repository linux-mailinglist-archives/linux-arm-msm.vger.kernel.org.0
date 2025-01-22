Return-Path: <linux-arm-msm+bounces-45797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554FA18F32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B5C63ACB8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED51211A02;
	Wed, 22 Jan 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GuJPGuiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B5210F5A;
	Wed, 22 Jan 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540272; cv=none; b=hjvRU23/2Ci3Hh+lPN8H48rMdBHnEOw/mzeV8dwpiew5vaM8zzcAsGhonT6qzEARV88a5AK6Ym810778lNeFx0GBf5ksu7AqUKL5/pno3NJc9qOQxAbvHEw/OKu1IxsaxfHGwlb0BCFjX9uUC+1hWGfpM3vbUfL12JomNZnfxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540272; c=relaxed/simple;
	bh=9ikyaq1ydonS6i25dFnoV3UcSqD8hOnoTdh7vjRv4b0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2tk3XhCylBBJhDHKUPf7cx2HIbel81R9PD/hC5pNIqZIqoVwLDqEXnxjIhIH+dAJldAvKxq8xVVEogzY/maY8vmly4ozIGDt+EffINw19z9afRsHpczcwL5OuaYaoHqQakDT0Wx88w+62syB9ZZEGmN4g2iv1HPrBsUeHLBTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GuJPGuiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4ZMj0020657;
	Wed, 22 Jan 2025 10:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qOlMdmMC2sm
	9Hw2RgXYAfXvONOCsNyaOcdFExt+M+Jo=; b=GuJPGuiRhpWFMvkLmVhNYNcT9sQ
	sIGoFBbPCL+yubn05xGctfJ6U2PPtcsN3zSGNhUZOLI0noxKRgX83XKT0tFmHkne
	/hKtcrMt+kAz5S7VqrG08XRPRl42G8A25Hu20/QGWjOZLfzD83EPVty52rhgHFqW
	VryqDFpnIXyizImfXnLz4eogAMLQV1bD10pBaSEa9nb+MJFAAaQpju5qRqAsimcG
	gIaunyuzy+XYV3x1NB1T98v/t34U+nTF4mqoKbtSukqIoh3N/UXob3kuOm8LApzn
	wiwSkYa6wcrcnA7ZBoFHEwvBSpUE2QD9S+x09Mu7ef767dr6gmpQcXrikCA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ass6grft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:16 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA3Egn013421;
	Wed, 22 Jan 2025 10:03:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckuaqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:14 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA3ENo013415;
	Wed, 22 Jan 2025 10:03:14 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50MA3D1E013411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:14 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 003E340CE9; Wed, 22 Jan 2025 18:03:12 +0800 (CST)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/8] scsi: ufs: core: Enable multi-level gear scaling
Date: Wed, 22 Jan 2025 18:02:11 +0800
Message-Id: <20250122100214.489749-6-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: K3W8gRsrlaRHZbJwbdLAVuIZlZQHHwi9
X-Proofpoint-ORIG-GUID: K3W8gRsrlaRHZbJwbdLAVuIZlZQHHwi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220073

From: Can Guo <quic_cang@quicinc.com>

With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
plans. However, the gear speed is only toggled between min and max during
clock scaling. Enable multi-level gear scaling by mapping clock frequencies
to gear speeds, so that when devfreq scales clock frequencies we can put
the UFS link at the appropraite gear speeds accordingly.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Rename the lable "do_pmc" to "config_pwr_mode".
---
 drivers/ufs/core/ufshcd.c | 46 ++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8d295cc827cc..e0fc198328a5 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1308,16 +1308,28 @@ static int ufshcd_wait_for_doorbell_clr(struct ufs_hba *hba,
 /**
  * ufshcd_scale_gear - scale up/down UFS gear
  * @hba: per adapter instance
+ * @target_gear: target gear to scale to
  * @scale_up: True for scaling up gear and false for scaling down
  *
  * Return: 0 for success; -EBUSY if scaling can't happen at this time;
  * non-zero for any other errors.
  */
-static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
+static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear, bool scale_up)
 {
 	int ret = 0;
 	struct ufs_pa_layer_attr new_pwr_info;
 
+	if (target_gear) {
+		memcpy(&new_pwr_info, &hba->pwr_info,
+		       sizeof(struct ufs_pa_layer_attr));
+
+		new_pwr_info.gear_tx = target_gear;
+		new_pwr_info.gear_rx = target_gear;
+
+		goto config_pwr_mode;
+	}
+
+	/* Legacy gear scaling, in case vops_freq_to_gear_speed() is not implemented */
 	if (scale_up) {
 		memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info,
 		       sizeof(struct ufs_pa_layer_attr));
@@ -1338,6 +1350,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
 		}
 	}
 
+config_pwr_mode:
 	/* check if the power mode needs to be changed or not? */
 	ret = ufshcd_config_pwr_mode(hba, &new_pwr_info);
 	if (ret)
@@ -1408,15 +1421,19 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool sc
 static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 				bool scale_up)
 {
+	u32 old_gear = hba->pwr_info.gear_rx;
+	u32 new_gear = 0;
 	int ret = 0;
 
+	ufshcd_vops_freq_to_gear_speed(hba, freq, &new_gear);
+
 	ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
 	if (ret)
 		return ret;
 
 	/* scale down the gear before scaling down clocks */
 	if (!scale_up) {
-		ret = ufshcd_scale_gear(hba, false);
+		ret = ufshcd_scale_gear(hba, new_gear, false);
 		if (ret)
 			goto out_unprepare;
 	}
@@ -1424,13 +1441,13 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 	ret = ufshcd_scale_clks(hba, freq, scale_up);
 	if (ret) {
 		if (!scale_up)
-			ufshcd_scale_gear(hba, true);
+			ufshcd_scale_gear(hba, old_gear, true);
 		goto out_unprepare;
 	}
 
 	/* scale up the gear after scaling up clocks */
 	if (scale_up) {
-		ret = ufshcd_scale_gear(hba, true);
+		ret = ufshcd_scale_gear(hba, new_gear, true);
 		if (ret) {
 			ufshcd_scale_clks(hba, hba->devfreq->previous_freq,
 					  false);
@@ -1723,6 +1740,8 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
+	struct ufs_clk_info *clki;
+	unsigned long freq;
 	u32 value;
 	int err = 0;
 
@@ -1746,14 +1765,21 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 
 	if (value) {
 		ufshcd_resume_clkscaling(hba);
-	} else {
-		ufshcd_suspend_clkscaling(hba);
-		err = ufshcd_devfreq_scale(hba, ULONG_MAX, true);
-		if (err)
-			dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
-					__func__, err);
+		goto out_rel;
 	}
 
+	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
+	freq = clki->max_freq;
+
+	ufshcd_suspend_clkscaling(hba);
+	err = ufshcd_devfreq_scale(hba, freq, true);
+	if (err)
+		dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
+				__func__, err);
+	else
+		hba->clk_scaling.target_freq = freq;
+
+out_rel:
 	ufshcd_release(hba);
 	ufshcd_rpm_put_sync(hba);
 out:
-- 
2.34.1


