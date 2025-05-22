Return-Path: <linux-arm-msm+bounces-58982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3EAAC025D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 04:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A164E58FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF5F13B293;
	Thu, 22 May 2025 02:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bmR2N3s2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EEA126BF7;
	Thu, 22 May 2025 02:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880179; cv=none; b=LpDjneGsRJTETU/sSf5rIZrmOjcP6suw7GeYNaMFG6aNzBvKkqvmn5PtpALFHpE1siT/AlnLVI5uBvo4/kpTsAlplz8toHNoePMBLl2gbzLtEjoexXTIffNK2lncAfdEqOshKQq+zvUVfgoYtzq/D5Hq60Opozf5+m/oaYaX4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880179; c=relaxed/simple;
	bh=ws4TNGGp8iFfuSqrpgS6OkRWQjbKfZqiZ+4W1Sd1vcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qRm8BkRu3AI2AMvgIhlh51Dgo18MjR/bEhiOvL5EhBvb89US+G0hfhmbCaAlJt4vGRi1ZDtWoDpwPlya8xtt5tSGSMopoK25X5J6DR2kaETkGLPOfR+sVQ3MsULmY+guz/PiW2QAfnrqeFHafnxLtOGXWpscTPMM7LxNzdc8EW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bmR2N3s2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIVO1J011326;
	Thu, 22 May 2025 02:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnwFKzuAFFOSDjvrWnxK5xRrmn9OhqoC5KT8/mYuo5M=; b=bmR2N3s242/SXXkG
	cLamFo9ywsM8gfWDIOA0pj/IYLg8G1wNJPfJ3rzEbRavnIemU6ESbHyJbD1gqf/I
	Gdn7ldBXBM+uwWJNegKJMBlwkpms+d+9hjcbzeb5AVmjp6VvP3NLAFZHDwk6p6ay
	BYVoc6/036mNXjv6xTKEHZKalDnvPTMPwcJ3fjcpc3mxh4isyiGzMscvhGNQwTG9
	PpeqVmyenP8uSrj//jxnjWzxrVrSGYZ8dbS0nVMe7VOlEX1j66he6ECmduxcOMJi
	g2Wz/1g8Fxw2xZhpbq8b4oThTw3yF3Ay/YRiQMJW9l9Vws6FuK5UC1Nd/A9+5747
	P1RWtw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb4p0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M2FiSL011754;
	Thu, 22 May 2025 02:15:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhn5p5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:46 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54M2Fkg0011788;
	Thu, 22 May 2025 02:15:46 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 54M2FjCK011784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:46 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 1AB6740C05; Thu, 22 May 2025 10:15:45 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
Date: Thu, 22 May 2025 10:15:37 +0800
Message-Id: <20250522021537.999107-4-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
References: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MOzyEFJxL0xakzpp8YEljGb59O844RP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAyMCBTYWx0ZWRfX1GnKnlcU8xdq
 Bc3pAtKiOnLLufQIou9I9W+8Hd9qZeFhAsCwsUcsUd8Es3Cf9t2zEC3J6utB3sRauAQzDuFfwli
 yfoDN09gOoqA9ShwNM6sHeshQym1bgxtyn188KIV++gy96LccENDr5SvjC4HdxfQ+Fs4rScyj2D
 VLFBG81rohMGvCPwl5lOvlJchA/PnrvP7QenZNeQcxwKqGt7O9JIRSsbuPXrGwPGF7UgPSMZhSG
 d8lHI/aZbuY8OkRqWik66yCPadE+H8+vYe+XUylp2IKmW0MhI1g8zcUv60Bf+RlV7biNCVzGJnm
 uLjRoso0nxkiHCRV8otGnIM3MUgiT3OIKa1pPpbgmYJ8WMNn74eMhCmUOpZli1EgSwfYXb+yv/H
 OAl8hpILeuBFRCjKU65oN487bMpN5M9/hV2XeuBgx/v2BZuId5cNNpUGb/LK+TnMCxyAgRnp
X-Proofpoint-GUID: MOzyEFJxL0xakzpp8YEljGb59O844RP8
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e88d5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=COk6AnOGAAAA:8 a=PY6Zn8H8AAAA:8 a=EUspDBNiAAAA:8 a=x4qbwuVvB1nHrQTLSukA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Soq9LBFxuPC4vsCAQt-j:22
 a=TjNXssC_j7lpFel5tvFf:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220020

From: Can Guo <quic_cang@quicinc.com>

ufs_qcom_cfg_timers() is clock freq dependent like ufs_qcom_set_core_clk_
ctrl(), hence move ufs_qcom_cfg_timers() call to clock scaling path. In
addition, do not assume the devfreq OPP freq is always the 'core_clock'
freq although 'core_clock' is the first clock phandle in device tree, use
ufs_qcom_opp_freq_to_clk_freq() to find the core clk freq.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com/
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Loïc Minier <loic.minier@oss.qualcomm.com>

---
V2 -> V3:
Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to avoid
usless error prints.

v3 -> v4:
Rebased to 6.15/scsi-queue which the relevant patch applied to.
---
 drivers/ufs/host/ufs-qcom.c | 49 ++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 0f30f057b870..8c93de8f8de2 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -540,13 +540,14 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
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
@@ -558,22 +559,34 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
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
@@ -593,7 +606,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, false)) {
+		if (ufs_qcom_cfg_timers(hba, false, ULONG_MAX)) {
 			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
 				__func__);
 			return -EINVAL;
@@ -849,17 +862,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
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
@@ -1394,7 +1396,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long f
 {
 	int ret;
 
-	ret = ufs_qcom_cfg_timers(hba, true);
+	ret = ufs_qcom_cfg_timers(hba, true, freq);
 	if (ret) {
 		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
 		return ret;
@@ -1431,6 +1433,13 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 
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


