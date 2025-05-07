Return-Path: <linux-arm-msm+bounces-57109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36CAAD8DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457821888C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3655C2236E0;
	Wed,  7 May 2025 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XEkdeg76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6822171C;
	Wed,  7 May 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603904; cv=none; b=c7S9zT34UpWGD5FRQgvxE0de96fTzV5REm1tM1zmEenlG8EMu++zQZqp+9b2KNMv5VAYiwE0r7XQ1RarncTr1D0YpI/PCVwtXm/xLuR9EfC13BIpd+TacIwOFhuUa3YaZniq00q/jKj2+x/xqSela19FwhFJTCqh6rzvMXrNaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603904; c=relaxed/simple;
	bh=6/jiacqs+BE5sKFVaJVl3pTOctY9aLG7bidxHyZlPAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6UexG9z1SJ/3j99LroW8tf07I7qFgVb89icWxrGTzNvAZiMN5YeqQK0WbivJ1CJIxEWKf0uJGkxabiLeSn2KwUEIKumwauXsFcJVZnGk/IsF5xfUzfJ6LUadLHRKh16dcI/STbyEr58IvNBwEL8UFisEA0ALw+2dk3yhVhaoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XEkdeg76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HIij010452;
	Wed, 7 May 2025 07:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xm1LHK0kQ39
	c6KYFcyxAeiWwAkXK7E7xXs4xpTTVT1w=; b=XEkdeg761BKI3IcoaL+sRg9v1/O
	xVwl+94MaBCpA+mF/6KLy1qA0kAZ1IWeAsfALzqGhqXYohFVga9QytXT7zBq0WA7
	4vHpu1xfojED5ShkeU7/dgOwyTew/NGE0406miyF/fjeEzqoav9H+hFfaJHKeFPG
	CwK46uoyAdoS6R2xfwZhVYM2GBm4wiXnjlyZSHdcW/jITj5pmkYAyBK+cdzUZPOE
	Us9ZOnz/IUhS1ccc/mJMS1Cj034wBAnwJwBChPaYVBGgFkp0407FPPg/idhcc1XF
	Ph7P43L+RhKoTzkr0kdX8DNoz3rhtsO4irHoSf+gSGZwzuh2eoXxTy659ow==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1j1wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:40 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5477icYG032586;
	Wed, 7 May 2025 07:44:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m7dyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:38 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5477ibbe032576;
	Wed, 7 May 2025 07:44:37 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5477ibYx032573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:37 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id BE20140CF7; Wed,  7 May 2025 15:44:35 +0800 (CST)
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
Subject: [PATCH v2 3/3] scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
Date: Wed,  7 May 2025 15:44:15 +0800
Message-Id: <20250507074415.2451940-4-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: f-_kt8j6LvkChmARA3htteSYhUZ8a9n_
X-Proofpoint-ORIG-GUID: f-_kt8j6LvkChmARA3htteSYhUZ8a9n_
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b0f68 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=x4qbwuVvB1nHrQTLSukA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX50Rj7anBldf3
 z7VbpkL2zdWm5N57Dgl+sC9336IUeF77vzVAeV6G/SweckCaZjIbTtvewP+KUCF017TOXY2cUpp
 2bKBIlre44cBnjwYU0GqOSwoTDXLDpUu0RnbfZI0/RvFhvWP7PCpH9yLTacW8j4tGDEgW4SRtmV
 HMQEedG/K0lo2ffSOPo4kYhgSyzqCI/kMq+L895gqa2yrjL/HS7q8O8Axurcj90WUxJkMYOwODW
 zn32TCJIdAZxSXCSdNMktNIM4n37YAkbRjG10wgM8etAwRRHkdh1Txex4gwPWMDCgcSwT+vyYrk
 udo3fKHjl9UTR/fYwIA5z8qmOCekTjsmENoMTd8c5V9JdIUP1VIW8ds7WvTXFJ0cUZy2Z9CUCne
 KAoPAXoobgcLTCeBvuU9FPWrp3DySS3N9RE5a5i2N0fpBuSjXb1pw6O2veTANN8dhd+eZDVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

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
index 804c8ccd8d03..e8fabf4a6d8a 100644
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


