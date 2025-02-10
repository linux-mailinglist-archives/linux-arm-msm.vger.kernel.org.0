Return-Path: <linux-arm-msm+bounces-47399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DAA2E886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C38161E81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125011C6F70;
	Mon, 10 Feb 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SUxKNedX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3CB1C5F35;
	Mon, 10 Feb 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181781; cv=none; b=J6lJhwsvFH22R+4hWQ5vzOYPgVPiAAf7QeG8kr2ylqwwLPBEVz4Nbd2R+PKNBvXlxyoA6NTF3rYpKeF4JNa/mQnBd/yU2BzC3hGlt0gQF2/Nc2ns5i+1Ku6l1xdvQYUt2vBe7bKMZ1kkhzyOnA2kGedJWpfQ8uZ47+KtY3BaGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181781; c=relaxed/simple;
	bh=4K8Umj66WIqGrvO2Qm2V3+NijhC1gTTK7lwlXUeHsXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzIQoFcDFhwUIve9fnmqGgFRldeK+HsDNi9HGkmK1cEr7iDIQTUKqQ5x1T2LDMk2mJ73eXuHAWkv9l2eBl1JJ2mdY/rmi3p2qEamTYebxiI8bWzAjSbwA0bWr7Zdp4kPLKKEQm1z5W79KGIv14N1KAyygTa2odGvk/+NonnKUMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SUxKNedX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8esM5006137;
	Mon, 10 Feb 2025 10:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ejY83V2KXKv
	MN9Zev51x2IPEtdlmGrPgu+4rSMl7BK0=; b=SUxKNedXrFCPA/lhE6QoeK8kld5
	ptMckGJDvrO/oUZg7oHhNoEIR/Jtv54KTSjDLR4IElB0X55x0onsXQF6Eve03ZfS
	Io5NOYeMQVuG083XJy/InyciNZFY9XMNsgpIXMwZ52p4JpHKJ6K516k8kkDgtJCe
	j07wRlrOUkImcjuEvdx9nm+q9B0uLNeR9om0+uCwqJgRbkU8blblAj4lcI46LhCU
	gwLhT2HjveQBl/Us953cxCudagUvheXxrnpzhNLoKBq8v7Il/EvWzOwrHfD89Bhz
	FsZPe7fhtQWrHbitf4K09ZJhpC5LFLDGOqpuBOSYubVlbgKSDgsbcK5frXw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mr8f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2Ha5011341;
	Mon, 10 Feb 2025 10:02:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkhyjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:37 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2aqP011409;
	Mon, 10 Feb 2025 10:02:36 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51AA2a5M011408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:36 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 4863740BF7; Mon, 10 Feb 2025 18:02:35 +0800 (CST)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/8] scsi: ufs: core: Enable multi-level gear scaling
Date: Mon, 10 Feb 2025 18:02:08 +0800
Message-Id: <20250210100212.855127-6-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: 9oxbQ6AMhLxd-yG1kA00tAhJ3_OPaQH3
X-Proofpoint-ORIG-GUID: 9oxbQ6AMhLxd-yG1kA00tAhJ3_OPaQH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100084

From: Can Guo <quic_cang@quicinc.com>

With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
plans. However, the gear speed is only toggled between min and max during
clock scaling. Enable multi-level gear scaling by mapping clock frequencies
to gear speeds, so that when devfreq scales clock frequencies we can put
the UFS link at the appropriate gear speeds accordingly.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
---

v1 -> v2:
Rename the lable "do_pmc" to "config_pwr_mode".

v2 -> v3:
Use assignment instead memcpy() in function ufshcd_scale_gear().

v3 -> v4:
Typo fixed for commit message.
---
 drivers/ufs/core/ufshcd.c | 51 +++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8d295cc827cc..ebab897080a6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1308,16 +1308,26 @@ static int ufshcd_wait_for_doorbell_clr(struct ufs_hba *hba,
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
+		new_pwr_info = hba->pwr_info;
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
@@ -1338,6 +1348,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
 		}
 	}
 
+config_pwr_mode:
 	/* check if the power mode needs to be changed or not? */
 	ret = ufshcd_config_pwr_mode(hba, &new_pwr_info);
 	if (ret)
@@ -1408,15 +1419,26 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool sc
 static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
 				bool scale_up)
 {
+	u32 old_gear = hba->pwr_info.gear_rx;
+	int new_gear = 0;
 	int ret = 0;
 
+	new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
+	if (new_gear < 0)
+		/*
+		 * return negative value means that the vops_freq_to_gear_speed() is not
+		 * implemented or didn't find matched gear speed, assign '0' to new_gear
+		 * to switch to legacy gear scaling sequence in ufshcd_scale_gear().
+		 */
+		new_gear = 0;
+
 	ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
 	if (ret)
 		return ret;
 
 	/* scale down the gear before scaling down clocks */
 	if (!scale_up) {
-		ret = ufshcd_scale_gear(hba, false);
+		ret = ufshcd_scale_gear(hba, (u32)new_gear, false);
 		if (ret)
 			goto out_unprepare;
 	}
@@ -1424,13 +1446,13 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
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
+		ret = ufshcd_scale_gear(hba, (u32)new_gear, true);
 		if (ret) {
 			ufshcd_scale_clks(hba, hba->devfreq->previous_freq,
 					  false);
@@ -1723,6 +1745,8 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
+	struct ufs_clk_info *clki;
+	unsigned long freq;
 	u32 value;
 	int err = 0;
 
@@ -1746,14 +1770,21 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 
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


