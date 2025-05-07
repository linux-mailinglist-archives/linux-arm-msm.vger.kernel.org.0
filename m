Return-Path: <linux-arm-msm+bounces-57107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15CAAD8CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4894C3247
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346DA22128B;
	Wed,  7 May 2025 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hc2AFVaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84656221286;
	Wed,  7 May 2025 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603896; cv=none; b=sP2zh9APOLYJFze+OAuat59IlKCUgsvVNt7tHvNhftCCr87emvNqTLabiTvGzUdaCrqazf/kfW96Rd9ZYTDYbaYmMrk0RfTr4SKKZ26CXDdy+2dEgyjwqKtkcPFfvOOCBWpsbR8BhjKfIV4DuyWQqG8LThx4SzuBU3g1XHvfCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603896; c=relaxed/simple;
	bh=AQtVaMtOQ60EhgxOqoxrpVH2gEPBlylvC2mNTiBh5bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VivrZDJj6+KF3/65Ah64iInfWoVXB2VdX0WFXDPEPx87PaE7ZqsoyrlCPwHRfsYp+mQchjUgL/vz9NPqLwtTPbv9m7DitqA2M8I4IXL6i8YXia5ESNNh9K1AwiGDAlLy/+OIzpP8xqDr0UXb7W5OWxU/tgnSwyQJnWDnggQecVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hc2AFVaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GYW5002391;
	Wed, 7 May 2025 07:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UwJ3wPvCVIK
	9S/g6wHLATd8vrOD7WtHRwGs4ybzgfyk=; b=hc2AFVaA4zaSngl7Li8fZia5awS
	awzA3hs/QW6nyYs6M0ZsWehyf/wBl7DzMWH1/s7YL3FeVAHhXBrNEWzpzX8cOM2c
	jq8TtK3WQziunv7QbhPe5f9jdufB0WrxBBAYIceUa6AdpEYz5sAoluaBXnx6YD3x
	Lj6J3YxrQalERE+nIheAtVFYhDbtMRJcm7/B6b1g9oCHP1TSbIaLrLaw51SZ2CJT
	Oi1uMQt5CCxXjt525GDyLCCKOkOyjPL7npDwVWkq91v+h8DaNz8CRkPIb7Knlo7M
	yK4AygfRYM/KlHRNxqbQALpP8N3hJ7eJ37Vq4oNoiZ41mf2UkX1UaGFGJbw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt1c0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:37 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5477iZPv032556;
	Wed, 7 May 2025 07:44:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m7dya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:35 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5477iZnv032547;
	Wed, 7 May 2025 07:44:35 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5477iYub032545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:35 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 381BB40CF7; Wed,  7 May 2025 15:44:34 +0800 (CST)
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
Subject: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
Date: Wed,  7 May 2025 15:44:14 +0800
Message-Id: <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681b0f65 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=fTclbksgIu1b3d37_U8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rThAV2EL5jSfoDF0iYdCWLxYvc1tl4zL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX9S2x75Pb4FrR
 28fw2BoE4GTKFHzq0Oa0VOeeZbVcqA1S66tFmUx5YpfJR7/vKFYo/AXF7SuhNTbJ8sdZOXlSrk0
 L/UKNj+nR6RMG7MkWiJK+G8HS+R1g37iVYpAkYlYXzfHjA5Ko4ek74A+qdFB2dP1tgamaC/s/Ao
 URd5SehunAfkDiPhjJAUKYuPSYyASfG04MjPUJWtkOCbtjC5gzj8uEUWCBFk2FEm26tI2iY+khk
 g9eohI/2uIJBDXxdScXLdSEFLX5bTigzn9zYz7THSYH8kD3Lw7UIUCiT01qwqrph48LW3uUNrlR
 pm4FRGqmmapeUyWrVnqCNL1dDvh58eKzH9YvvnVllD1iSF9z3EMqT8dMFRLzV53M2OcRAktn5qb
 YKowwlAPKs408SNZJWMMcCWMpodgHJGXI9F7e30lMCwx6Dot/6c35xV33DtniiRL+tVByl33
X-Proofpoint-ORIG-GUID: rThAV2EL5jSfoDF0iYdCWLxYvc1tl4zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070070

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
index 7f10926100a5..804c8ccd8d03 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -122,7 +122,9 @@ static const struct {
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
+static unsigned long ufs_qcom_opp_freq_to_clk_freq(struct ufs_hba *hba, unsigned long freq,
+												   char *name);
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up, unsigned long freq);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -656,7 +658,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 			return -EINVAL;
 		}
 
-		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
+		err = ufs_qcom_set_core_clk_ctrl(hba, true, ULONG_MAX);
 		if (err)
 			dev_err(hba->dev, "cfg core clk ctrl failed\n");
 		/*
@@ -1414,29 +1416,46 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
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
@@ -1479,7 +1498,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long f
 		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, freq);
+	return ufs_qcom_set_core_clk_ctrl(hba, true, freq);
 }
 
 static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
@@ -1511,7 +1530,7 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsigned long freq)
 {
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, freq);
+	return ufs_qcom_set_core_clk_ctrl(hba, false, freq);
 }
 
 static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
@@ -2081,11 +2100,53 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
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


