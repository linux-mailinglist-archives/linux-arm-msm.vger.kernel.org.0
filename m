Return-Path: <linux-arm-msm+bounces-57373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E8AB0C5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559C41633EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9A0270EAE;
	Fri,  9 May 2025 07:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GF9uAnVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A589E270EDB;
	Fri,  9 May 2025 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777107; cv=none; b=sG0WbK3gW4SzBBF+wXVOopSjzVpQ2gk3Lv1rjA1HnFLZRPe6idhvGP5Bc05vbX4wkF3qX3SeODtlGuOtS2qjk1YQaewuedqucDzRSX8aJAIH4Lmqpy/yGFo4PcvLseozoSg3jzzXCrHjUrp+IejfTEsicc3LXL9WZX9QgvQi8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777107; c=relaxed/simple;
	bh=O/Ke2H214saq6vdzkTVaNQBrFSVbUtSCC+bCYvqq7WM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqDs/ua08/RHpeTpN4g66z0UxIQ9nyfvQxTnp9IV20oZazysBT1ulBfDHC5k2aJhmjriQFSImRIwDIyYQDMvu6oWkobkNYZw8t168Q3p2t1CtHW8bcd6wc286ifqfaMSQoWHbLUd6KkuwZ2iubInB/LS5RPJ2sUr77uyyN+Mqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GF9uAnVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548IYIuw021197;
	Fri, 9 May 2025 07:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JlGs1DFa0Zz
	K/VwK9k2sHRKSQxN1aOlO7OsAseAiaHE=; b=GF9uAnVVdLPQsbwfW9dsxAs2fm9
	T/+06yKdlUHbKCQ9dgTvlaoDBlQZeTojAFlrwgy6OaknQm7zhyh/zexUgHlhQ9ZH
	Ts732RMxB+Zr4spSPgct+qDJu9VGHk4tOPveJsZMjYA792agSfX6XoAUsFlnhCTp
	LkDV7sj5nHByB9rMfgJ0LszNWu2NPSOaUXyb3DEgdOmHUcKBluy7JNrhvjfFrTEL
	zwoxPZx/bwMZ5FeadFsAo04YEn6qjnATPvIBunGhyhe0bDNneHgyTCwl23uyKjip
	g8XajXh38UhzE8uekmFv1rO8TfPoI1DoFv089dP792DGzicwnKm/IeGkjeA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj38he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5497ovWj024757;
	Fri, 9 May 2025 07:51:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mxnwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:18 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5497pIHc025525;
	Fri, 9 May 2025 07:51:18 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5497pHSW025524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:18 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 07DB840D81; Fri,  9 May 2025 15:51:17 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/3] scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
Date: Fri,  9 May 2025 15:50:29 +0800
Message-Id: <20250509075029.3776419-4-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681db3f9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=x4qbwuVvB1nHrQTLSukA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA3NCBTYWx0ZWRfXzjGnQLrkunFQ
 KSV+1zagd4/lQZAUsXnUMcoSIYcGJ0ZymhS6gvvKnVOtg4cC/8c+m/vkgF5t69atizj00Ktz6P1
 jmR/txGF0QhLsysxGM9KChUxrkyQKql8fJ2zeVohIeOXqaZByJIusPxtyFu9W447TgVLbpvhcH5
 +rqWKy3E9ENmaol/+nT+PByNaDoXfhHpwHiWkbpLozniQuP2BURai93X/Tl6JYByJGZoQHHLoeF
 2Lcpn0P/X2+1IMKGGnf8yIdSC75ZwddgG2EXJAZjv4QkvLV3iN1DYUuPNIQX8TNZueEoyX7JCOd
 WcP1/6R1bnhNZ2Dp0C2ic2TVkhGglCHCXDQWu9wmJk3VCsH42lGDtgmOuLJG6GTsC7S3MDcYHCL
 YBLyVODcV7Tp1OgcIoHt5XPsc8HAd3JPmNTUZGO6lsmqx50mY+8ZVdD6pD5EEDUpx2yBn6p6
X-Proofpoint-GUID: v_tgcNnqIyEdEqzNEyhh8udpWWFpcgQY
X-Proofpoint-ORIG-GUID: v_tgcNnqIyEdEqzNEyhh8udpWWFpcgQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090074

From: Can Guo <quic_cang@quicinc.com>

ufs_qcom_cfg_timers() is clock freq dependent like ufs_qcom_set_core_clk_
ctrl(), hence move ufs_qcom_cfg_timers() call to clock scaling path. In
addition, do not assume the devfreq OPP freq is always the 'core_clock'
freq although 'core_clock' is the first clock phandle in device tree, use
ufs_qcom_opp_freq_to_clk_freq() to find the core clk freq.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>

---
V2 -> V3:
Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to avoid
usless error prints.
---
 drivers/ufs/host/ufs-qcom.c | 49 ++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6c054727c3bc..d23ff912fda4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -599,13 +599,14 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
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
@@ -617,22 +618,34 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
 	if (host->hw_ver.major < 4 && !ufshcd_is_intr_aggr_allowed(hba))
 		return 0;
 
+	if (hba->use_pm_opp && freq != ULONG_MAX) {
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
@@ -652,7 +665,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, false)) {
+		if (ufs_qcom_cfg_timers(hba, false, ULONG_MAX)) {
 			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
 				__func__);
 			return -EINVAL;
@@ -930,17 +943,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
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
@@ -1492,7 +1494,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long f
 {
 	int ret;
 
-	ret = ufs_qcom_cfg_timers(hba, true);
+	ret = ufs_qcom_cfg_timers(hba, true, freq);
 	if (ret) {
 		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
 		return ret;
@@ -1529,6 +1531,13 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 
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


