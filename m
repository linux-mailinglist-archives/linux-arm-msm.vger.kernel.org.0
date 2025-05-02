Return-Path: <linux-arm-msm+bounces-56442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B521AA69C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A757D3A8E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9688718BBAE;
	Fri,  2 May 2025 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nk8po4EF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAA19B5B4;
	Fri,  2 May 2025 04:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746159967; cv=none; b=iUgO1jGcMS0lXQZhYQNlNcKZaBsTb0Kq43JW+ft/xykafc5N8Gya32ZBT2K0mimbEfc6Qo/ETPeOdWAXQY99Ylzlm0d6y8SYEg1i1yYSNJ19PEdYHH3/G2Wt6dQivWIIOyaHLNOvEtJXj5uZkSPwladvRpmo4i/8g5pH14RSfS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746159967; c=relaxed/simple;
	bh=f4vNzUEcSaREQwr9TW6UIyQCTA10f4GBEcIb6FbCqI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XpyDoS1wcbsf5NyWLua45UiUhwqzgaS9JmgltIMkYp4rYl9dD4ZLrqkoOavDNM8zjHnjQIcCjG2CcJya1N10eZv0Km+KA+DT0or0d9PQhBSmhQuN7qv05eDbpeZ17OIhdPxymAF7Yj/ohU2qvCldIzRrQg9GfkgpRSWcKe9ql3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nk8po4EF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NRSP017611;
	Fri, 2 May 2025 04:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MdRlaOIje/3
	JGoOBlBUvUOgnx07LfEMQaommixnG1HQ=; b=nk8po4EFB3MR56DgNFbZENaHkEc
	bQi4bACuYdEOIgEy4u5uUvi3ux/oemnejdVkprG1dmtn3sTh1wpee8WnOwj1zVUd
	oS1Bzf1zUEhUliGAPv8qu6QZl7J1+U6kMegYRZ2hBiipMSueILRWHYCQxbt7Ze7O
	GhwX34yjaSFdKwXNXmB5lutAOvC+xX7rLW7KBg82TukRKA8EYIk8InRlkTwYzCOC
	tyJfSFI6KEPoPACsdYewHaYiFvEiaALTK/wY7gouNIuRecCUiW5fdoIMifAViJyn
	jEzLzCQWwCf+64JIFSCP1UJ/HrVNcjvsaro2xYw9AMm6g8RkaK9yZPM+vAA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u776ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5424PerM008363;
	Fri, 2 May 2025 04:25:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 468rjme1at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:40 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5424Pd1n008354;
	Fri, 2 May 2025 04:25:40 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5424Pd9g008352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:25:39 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 94D4640C11; Fri,  2 May 2025 12:25:38 +0800 (CST)
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
Subject: [PATCH 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
Date: Fri,  2 May 2025 12:24:31 +0800
Message-Id: <20250502042432.88434-3-quic_ziqichen@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAzMSBTYWx0ZWRfX+fOc7drnTC9k NZ6LJwgChGK/S2cjYduG8+4kEycS0LUtJNbey+2abJ9HMS0ZYTKPC1P7/pcbpVLwL2Be6YaPVSN MKsYc7zaQOVnR04AaRxifYRbF4nL1/Ys/zDN1zFb4GuccWgHiHnJItbRYAz9hWbNw+uirhOw0Lv
 EeuA4xGxxbJJ1INOpbEoaKcEggnAPDuOevGYpNZuEKhvrmw2k6nI1Vuwmmm4wg4aLP73s+fbBk6 NnL9RKuVbQ4iab2IT9+DFE+2QkXMvq5ucB7inSAIHlQRSvocq5VkH/fKFsvRqXrk+qjeRyWJSjN eR+Hz3Oz0hLl330uI3YeVxU645vH9Qav9rlZOj5wItM774xTZ/PD7c6/FELl1IzPH3lLhebF9ky
 NWJ0zWomPGGdC0NofS1N2ASg8uxjh8pI0PADwL8kWw032gCtMJZbcIoKWoqu/TPbAyjklMdD
X-Proofpoint-GUID: TG6v3di6vDIWZMVGKGiwOQzHUdaJEpPL
X-Proofpoint-ORIG-GUID: TG6v3di6vDIWZMVGKGiwOQzHUdaJEpPL
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=68144946 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=fTclbksgIu1b3d37_U8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020031

From: Can Guo <quic_cang@quicinc.com>

On some platforms, the devfreq OPP freq may be different than the unipro
core clock freq. Implement ufs_qcom_opp_freq_to_clk_freq() and use it to
find the unipro core clk freq.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 81 ++++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index f5ea703d8ef5..00ca0b577c96 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -99,7 +99,9 @@ static const struct __ufs_qcom_bw_table {
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
+static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba, unsigned long freq,
+												   char *name);
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up, unsigned long freq);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -633,7 +635,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 			return -EINVAL;
 		}
 
-		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
+		err = ufs_qcom_set_core_clk_ctrl(hba, true, ULONG_MAX);
 		if (err)
 			dev_err(hba->dev, "cfg core clk ctrl failed\n");
 		/*
@@ -1352,29 +1354,46 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
 	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
 }
 
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
 	struct ufs_clk_info *clki;
 	u32 cycles_in_1us = 0;
 	u32 core_clk_ctrl_reg;
+	unsigned long clk_freq;
 	int err;
 
+	if (hba->use_pm_opp) {
+		clk_freq = ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unipro");
+		if (clk_freq) {
+			cycles_in_1us = ceil(clk_freq, HZ_PER_MHZ);
+			goto set_core_clk_ctrl;
+		}
+	}
+
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk) &&
 		    !strcmp(clki->name, "core_clk_unipro")) {
-			if (!clki->max_freq)
+			if (!clki->max_freq) {
 				cycles_in_1us = 150; /* default for backwards compatibility */
-			else if (freq == ULONG_MAX)
+				break;
+			}
+
+			if (freq == ULONG_MAX) {
 				cycles_in_1us = ceil(clki->max_freq, HZ_PER_MHZ);
-			else
-				cycles_in_1us = ceil(freq, HZ_PER_MHZ);
+				break;
+			}
 
+			if (is_scale_up)
+				cycles_in_1us = ceil(clki->max_freq, HZ_PER_MHZ);
+			else
+				cycles_in_1us = ceil(clk_get_rate(clki->clk), HZ_PER_MHZ);
 			break;
 		}
 	}
 
+set_core_clk_ctrl:
 	err = ufshcd_dme_get(hba,
 			    UIC_ARG_MIB(DME_VS_CORE_CLK_CTRL),
 			    &core_clk_ctrl_reg);
@@ -1417,7 +1436,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long f
 		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, freq);
+	return ufs_qcom_set_core_clk_ctrl(hba, true, freq);
 }
 
 static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
@@ -1449,7 +1468,7 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsigned long freq)
 {
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, freq);
+	return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
 }
 
 static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
@@ -1914,11 +1933,53 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	return ret;
 }
 
+static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba,
+												   unsigned long freq, char *name)
+{
+	struct ufs_clk_info *clki;
+	struct dev_pm_opp *opp;
+	unsigned long clk_freq;
+	int idx = 0;
+	bool found = false;
+
+	opp = dev_pm_opp_find_freq_exact_indexed(hba->dev, freq, 0, true);
+	if (IS_ERR(opp)) {
+		dev_err(hba->dev, "Failed to find OPP for exact frequency %lu\n", freq);
+		return 0;
+	}
+
+	list_for_each_entry(clki, &hba->clk_list_head, list) {
+		if (!strcmp(clki->name, name)) {
+			found = true;
+			break;
+		}
+
+		idx++;
+	}
+
+	if (!found) {
+		dev_err(hba->dev, "Failed to find clock '%s' in clk list\n", name);
+		dev_pm_opp_put(opp);
+		return 0;
+	}
+
+	clk_freq = dev_pm_opp_get_freq_indexed(opp, idx);
+
+	dev_pm_opp_put(opp);
+
+	return clk_freq;
+}
+
 static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 {
 	u32 gear = 0;
+	unsigned long unipro_freq;
+
+	if (!hba->use_pm_opp)
+		return gear;
 
-	switch (freq) {
+	unipro_freq = ufs_qcom_opp_freq_to_clk_freq(hba, freq, "core_clk_unipro");
+	switch (unipro_freq) {
 	case 403000000:
 		gear = UFS_HS_G5;
 		break;
-- 
2.34.1


