Return-Path: <linux-arm-msm+bounces-46707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8144FA25416
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58E43A574A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D563B1FAC4B;
	Mon,  3 Feb 2025 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H8ujxQE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFE1FCD11;
	Mon,  3 Feb 2025 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570369; cv=none; b=UIvpK1sIBKrdE0CZL4Sc233a5EZaV6Ozm5oAll0aBNW5Tpcyk5Ai2QsAH4gi9tt61OtVkipJXTKwesQym+Rr0W1c0G0xF1KXvP8I94F3R+OyFZknpkaYIFzP6IXu72yzqxclkp61Jf8kelslhnXMyTEUi1iXAn6Ie7PaG/h31vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570369; c=relaxed/simple;
	bh=R0vwedfdvuA1j/fvO0pYLe1WIw1zXwTSzjp9ReBKT94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6WEzkn1qCnm0pN2l5H7o1pEBiii7H2UWOguaLP3GChi8I1v8/W6exGBAW9zQCW8OPatZCuIMktTtdHA0jqEp/EPompW/eETilp5O5i5oHb5xPv219v+LPxxYqS399j7Ih9ECOWT9Hrw9dAB/pUIneFR0V2jTGMFIAzyv4qEero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H8ujxQE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5132cSeu019825;
	Mon, 3 Feb 2025 08:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SGlJcbPdGzm
	uNXuU3hZ7dvJVSPR7dSm68zsJ3o5mZ5I=; b=H8ujxQE+3GLR0CIMajdLFIUvEsB
	ls3sTCMAbR8Wk1FERcExYrnqAj/J0Ve2+AOB5AF8nNZ1mvtPd5xMGXXyE9i0FKXD
	Yme6PSCdmZJ14/0Syed+TqYSTM8kD7DLoD8tboaYrg0LBPKoETdZGXgczs0j8tVk
	Y+xwOvZk9QdLnL3pS+NXOhyRqwgq61fpL3IMeHwClphtn9P/dhKgWNM9TPGF/uPk
	Zjzks0aQtnQpfp8BggjNOtUwA9Dx9IIH5rVKLJDekG1sBk2L48+YYWbr2uzNDr9p
	3IXMGrj9GjqSw4U7I0tfF4k1UTYODFq3YLIirKV1MPW4FTMLCxQ2YmiaEZA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jn5vgjjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BXHY026288;
	Mon, 3 Feb 2025 08:11:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:33 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BWDg026222;
	Mon, 3 Feb 2025 08:11:32 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138BWQx026181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:32 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 9E51C40BFE; Mon,  3 Feb 2025 16:11:31 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
Date: Mon,  3 Feb 2025 16:11:03 +0800
Message-Id: <20250203081109.1614395-3-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: R1YwsJqd2w7Gp1fi4-xIX_OZpa4Z1u8O
X-Proofpoint-GUID: R1YwsJqd2w7Gp1fi4-xIX_OZpa4Z1u8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

From: Can Guo <quic_cang@quicinc.com>

Instead of only two frequencies, if OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies. In the case of
scaling up, the devfreq may decide to scale the clock to an intermediate
freq base on load, but the clock scale up pre change operation uses
settings for the max clock freq unconditionally. Fix it by passing the
target_freq to clock scale up pre change so that the correct settings for
the target_freq can be used.

In the case of scaling down, the clock scale down post change operation
is doing fine, because it reads the actual clock rate to tell freq, but to
keep symmetry with clock scale up pre change operation, just use the
target_freq instead of reading clock rate.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
1. Modify commit message to make it more clear.
2. Use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl().

v2 -> v3:
Commit message typo fixed.
---
 drivers/ufs/host/ufs-qcom.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b6eef975dc46..a1eb3cab45e4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/time.h>
+#include <linux/units.h>
 
 #include <soc/qcom/ice.h>
 
@@ -97,7 +98,7 @@ static const struct __ufs_qcom_bw_table {
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -524,7 +525,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 			return -EINVAL;
 		}
 
-		err = ufs_qcom_set_core_clk_ctrl(hba, true);
+		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
 		if (err)
 			dev_err(hba->dev, "cfg core clk ctrl failed\n");
 		/*
@@ -1231,7 +1232,7 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
 	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
 }
 
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
@@ -1245,10 +1246,11 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 		    !strcmp(clki->name, "core_clk_unipro")) {
 			if (!clki->max_freq)
 				cycles_in_1us = 150; /* default for backwards compatibility */
-			else if (is_scale_up)
-				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
+			else if (freq == ULONG_MAX)
+				cycles_in_1us = ceil(clki->max_freq, HZ_PER_MHZ);
 			else
-				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
+				cycles_in_1us = ceil(freq, HZ_PER_MHZ);
+
 			break;
 		}
 	}
@@ -1285,7 +1287,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 	return ufs_qcom_set_clk_40ns_cycles(hba, cycles_in_1us);
 }
 
-static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
+static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_pa_layer_attr *attr = &host->dev_req_params;
@@ -1298,7 +1300,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
 		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, true);
+	return ufs_qcom_set_core_clk_ctrl(hba, freq);
 }
 
 static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
@@ -1327,10 +1329,10 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 	return err;
 }
 
-static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
+static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsigned long freq)
 {
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, false);
+	return ufs_qcom_set_core_clk_ctrl(hba, freq);
 }
 
 static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
@@ -1349,7 +1351,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (err)
 			return err;
 		if (scale_up)
-			err = ufs_qcom_clk_scale_up_pre_change(hba);
+			err = ufs_qcom_clk_scale_up_pre_change(hba, target_freq);
 		else
 			err = ufs_qcom_clk_scale_down_pre_change(hba);
 
@@ -1361,7 +1363,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_post_change(hba);
 		else
-			err = ufs_qcom_clk_scale_down_post_change(hba);
+			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
 
 		if (err) {
-- 
2.34.1


