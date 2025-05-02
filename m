Return-Path: <linux-arm-msm+bounces-56443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4FAA69CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7402D4A5EEE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24C71AA1E4;
	Fri,  2 May 2025 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l3dgVddx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C51A76D4;
	Fri,  2 May 2025 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746159969; cv=none; b=V0+swZ29ruD2BslaSMA5fZp4BKEZWytRPTfbUbG/0dGqet6iSYUTXpgFGqBQEThykupdHvPCAo6vM53KZ/nP73urvtJIglcbyQXRki5B2svOFdtG/GUIxXgyeGubtfqacVUSX6IpF6HI6vPPJ9lhtxgUvG26K4ioKp/EpZs898k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746159969; c=relaxed/simple;
	bh=MP6X8oZ/HCfDxv0UGiL7pN6uF31TtuorjUjMOtsayMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQkZTg34TW8asBuHTYDxNKT1BrEvVGNf8I8La4TKMQTPolCp5klLoit69gNRBo7Tv7zSid05dmovwSM7/SQK4tMH3yflnxorHHNLfZTbkmdPbaJMsbdk9WFwVF4npTvalFnFMA9winBGt9E8JVhaIecf76r85aNTe1zELkMuS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l3dgVddx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NRRF002845;
	Fri, 2 May 2025 04:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f0uLVQEcMPr
	9w0vrBu44PUAyErdqFuRXCZrXz7cCOZE=; b=l3dgVddx2j64Sb9dUBTQXWjfonk
	S4QMlhDEZs92WjBNSFEUGpvptx3mwmAx8IMbaZfYW/1dIi1GbsL1QKSzOf7rAhPS
	FvZiS3aSAt3f2mkP1Rnenk8bghcBZyyRyRuKxucU2gb9+R4TA26JeiMoD2p34pnt
	c5DLeInAiNYfL4kuQ1hm0h+8Fak2NBQ23nJko7Hp4dC8BO5shqzZcCz9YE6GeI1/
	fzlzsB22YEvBQtEh+LL6EDMKkwVq0U2hSmH7b73yghz4z9adNV9RVHWaSbkLnrNv
	9FQ7e2V53fZHeiihNq/uxFpIb1HuWPH5j19SsTSwQBWvpXOICkT86dl1X2Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u778qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5424PgU7018318;
	Fri, 2 May 2025 04:25:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 468rjmp38m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:42 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5424PgJk018309;
	Fri, 2 May 2025 04:25:42 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5424PfCS018308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:42 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id D5C7240C11; Fri,  2 May 2025 12:25:40 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
Date: Fri,  2 May 2025 12:24:32 +0800
Message-Id: <20250502042432.88434-4-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
References: <20250502042432.88434-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAzMSBTYWx0ZWRfX+kqfcAqD8AlV txHr9Dy3Hoqa/4L8dCukqcelWAsJ9gbl/QjgGlBhfgDeshVP7IanNDmgXEuQHkOvfynUOyceR5j e48cX1RlSLKrP1MNTzw4JaxsxZEzwvFQi3+uQKNy12bibi4nkT/ON0wQ2prZxxW+VAgiJ8EQzv4
 4RtyvHaQ2dB8KxK73NWEIJXrC14ombX5FjfbOjRjgM0ATTcPpA2HM4Jf8ZpS7d1Ezi72C4l3zSo mfAhT9XGsx8Xex9bkQD0D3pV4DlHG/u7Ei1D374z0Ft6/p50owAMXEiS9z1HBloVsMKMRDHBzhm jBvVx2XFESXEGlsh94Kb7Ba3MZWmNmRY3ScXExRGnrxRXIOc7dK/gmIVGFUus2WFjylc0Qemhb1
 YhOoul2ubzn7NHiYU7DHq4LYHct0sgm+XKWQP/tfRPMOEPD+zmwTWUfqSfOV4k1QsGHk55cj
X-Proofpoint-GUID: sJ9BF59YfxsZiMTieOfMAJeBwQBXcSgK
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=68144948 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=x4qbwuVvB1nHrQTLSukA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sJ9BF59YfxsZiMTieOfMAJeBwQBXcSgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020031

From: Can Guo <quic_cang@quicinc.com>

ufs_qcom_cfg_timers() is clock freq dependent like ufs_qcom_set_core_clk_
ctrl(), hence move ufs_qcom_cfg_timers() call to clock scaling path. In
addition, do not assume the devfreq OPP freq is always the 'core_clock'
freq although 'core_clock' is the first clock phandle in device tree, use
ufs_qcom_opp_freq_to_clk_freq() to find the core clk freq.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 49 ++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 00ca0b577c96..895972bf44c0 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -576,13 +576,14 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
  *
  * @hba: host controller instance
  * @is_pre_scale_up: flag to check if pre scale up condition.
+ * @freq: target opp freq
  * Return: zero for success and non-zero in case of a failure.
  */
-static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
+static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_clk_info *clki;
-	unsigned long core_clk_rate = 0;
+	unsigned long clk_freq = 0;
 	u32 core_clk_cycles_per_us;
 
 	/*
@@ -594,22 +595,34 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
 	if (host->hw_ver.major < 4 && !ufshcd_is_intr_aggr_allowed(hba))
 		return 0;
 
+	if (hba->use_pm_opp) {
+		clk_freq = ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk");
+		if (clk_freq)
+			goto cfg_timers;
+	}
+
 	list_for_each_entry(clki, &hba->clk_list_head, list) {
 		if (!strcmp(clki->name, "core_clk")) {
+			if (freq == ULONG_MAX) {
+				clk_freq = clki->max_freq;
+				break;
+			}
+
 			if (is_pre_scale_up)
-				core_clk_rate = clki->max_freq;
+				clk_freq = clki->max_freq;
 			else
-				core_clk_rate = clk_get_rate(clki->clk);
+				clk_freq = clk_get_rate(clki->clk);
 			break;
 		}
 
 	}
 
+cfg_timers:
 	/* If frequency is smaller than 1MHz, set to 1MHz */
-	if (core_clk_rate < DEFAULT_CLK_RATE_HZ)
-		core_clk_rate = DEFAULT_CLK_RATE_HZ;
+	if (clk_freq < DEFAULT_CLK_RATE_HZ)
+		clk_freq = DEFAULT_CLK_RATE_HZ;
 
-	core_clk_cycles_per_us = core_clk_rate / USEC_PER_SEC;
+	core_clk_cycles_per_us = clk_freq / USEC_PER_SEC;
 	if (ufshcd_readl(hba, REG_UFS_SYS1CLK_1US) != core_clk_cycles_per_us) {
 		ufshcd_writel(hba, core_clk_cycles_per_us, REG_UFS_SYS1CLK_1US);
 		/*
@@ -629,7 +642,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, false)) {
+		if (ufs_qcom_cfg_timers(hba, false, ULONG_MAX)) {
 			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
 				__func__);
 			return -EINVAL;
@@ -885,17 +898,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		}
 		break;
 	case POST_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, false)) {
-			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
-				__func__);
-			/*
-			 * we return error code at the end of the routine,
-			 * but continue to configure UFS_PHY_TX_LANE_ENABLE
-			 * and bus voting as usual
-			 */
-			ret = -EINVAL;
-		}
-
 		/* cache the power mode parameters to use internally */
 		memcpy(&host->dev_req_params,
 				dev_req_params, sizeof(*dev_req_params));
@@ -1430,7 +1432,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long f
 {
 	int ret;
 
-	ret = ufs_qcom_cfg_timers(hba, true);
+	ret = ufs_qcom_cfg_timers(hba, true, freq);
 	if (ret) {
 		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
 		return ret;
@@ -1467,6 +1469,13 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 
 static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsigned long freq)
 {
+	int ret;
+
+	ret = ufs_qcom_cfg_timers(hba, false, freq);
+	if (ret) {
+		dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",	__func__);
+		return ret;
+	}
 	/* set unipro core clock attributes and clear clock divider */
 	return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
 }
-- 
2.34.1


