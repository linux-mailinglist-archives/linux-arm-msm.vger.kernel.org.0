Return-Path: <linux-arm-msm+bounces-2376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E87FD0D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40911C20C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 08:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C98125A5;
	Wed, 29 Nov 2023 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fGtRWFp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645D0C1;
	Wed, 29 Nov 2023 00:29:30 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4sIlI011615;
	Wed, 29 Nov 2023 08:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=hnbaBV7NRZsw8Qyg+8uzlhKy7+Qppv7x7UAEm8vuB9s=;
 b=fGtRWFp1fdHWgxcbaSJXjAXywrPdKU9r3noKg9pbDCiRf63Y+cbmA9KLWArZBgNIFLlH
 8aujwY93jvbv05YX7BcB0avLlhBqp4Cn77aS34tZECyrHNa/Xmu1R7V3udu7gz6AdnHJ
 h3mKuKflieqwQXIKjKvXADe9CkB3t2RcgAdIoC+m6uqleaNiDrWruUACJSY+HQLN/11Y
 D/S3HWx0yw6E6kJxEAzi1nJvJhdXKPYFLARnOCG8kHtKpBdDg2dSGYDzBeJo4F+KCOEa
 PhHbnvLe3nkiI9lQKt83gSdnhmBr2FxSkpfBeCK/5YNLx6Zvjs8tZJP/F9eOlf/ZSf/a 5g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unfn4txxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:28:53 +0000
Received: from pps.filterd (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AT8SpNx020758;
	Wed, 29 Nov 2023 08:28:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3unmew6x6d-1;
	Wed, 29 Nov 2023 08:28:51 +0000
Received: from NASANPPMTA04.qualcomm.com (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT8Spn3020751;
	Wed, 29 Nov 2023 08:28:51 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3AT8So5K020745;
	Wed, 29 Nov 2023 08:28:51 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 0A45120A5D; Wed, 29 Nov 2023 00:28:50 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Brian Masney <bmasney@redhat.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
        linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
        linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...)
Subject: [PATCH v6 01/10] scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
Date: Wed, 29 Nov 2023 00:28:26 -0800
Message-Id: <1701246516-11626-2-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qhBpwFqSGvE2Y2KIttaciGfYJHsQ_hTp
X-Proofpoint-GUID: qhBpwFqSGvE2Y2KIttaciGfYJHsQ_hTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Structure ufs_dev_params is actually used in UFS host vendor drivers to
declare host specific power mode parameters, like ufs_<vendor>_params or
host_cap, which makes the code not very straightforward to read. Rename the
structure ufs_dev_params to ufs_host_params and unify the declarations in
all vendor drivers to host_params.

In addition, rename the two functions ufshcd_init_pwr_dev_param() and
ufshcd_get_pwr_dev_param() which work based on the ufs_host_params to
ufshcd_init_host_params() and ufshcd_negotiate_pwr_params() respectively to
avoid confusions.

This change does not change any functionalities or logic.

Acked-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-exynos.c    |  7 ++--
 drivers/ufs/host/ufs-hisi.c      | 11 +++----
 drivers/ufs/host/ufs-mediatek.c  | 12 +++----
 drivers/ufs/host/ufs-qcom.c      | 12 +++----
 drivers/ufs/host/ufshcd-pltfrm.c | 69 ++++++++++++++++++++--------------------
 drivers/ufs/host/ufshcd-pltfrm.h | 10 +++---
 6 files changed, 57 insertions(+), 64 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 71bd6db..734d40f 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -765,7 +765,7 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
-	struct ufs_dev_params ufs_exynos_cap;
+	struct ufs_host_params host_params;
 	int ret;
 
 	if (!dev_req_params) {
@@ -774,10 +774,9 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 		goto out;
 	}
 
-	ufshcd_init_pwr_dev_param(&ufs_exynos_cap);
+	ufshcd_init_host_params(&host_params);
 
-	ret = ufshcd_get_pwr_dev_param(&ufs_exynos_cap,
-				       dev_max_params, dev_req_params);
+	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
 		pr_err("%s: failed to determine capabilities\n", __func__);
 		goto out;
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 0229ac0..5ee73ff 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -293,9 +293,9 @@ static int ufs_hisi_link_startup_notify(struct ufs_hba *hba,
 	return err;
 }
 
-static void ufs_hisi_set_dev_cap(struct ufs_dev_params *hisi_param)
+static void ufs_hisi_set_dev_cap(struct ufs_host_params *host_params)
 {
-	ufshcd_init_pwr_dev_param(hisi_param);
+	ufshcd_init_host_params(host_params);
 }
 
 static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
@@ -365,7 +365,7 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 				       struct ufs_pa_layer_attr *dev_max_params,
 				       struct ufs_pa_layer_attr *dev_req_params)
 {
-	struct ufs_dev_params ufs_hisi_cap;
+	struct ufs_host_params host_params;
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -377,9 +377,8 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufs_hisi_set_dev_cap(&ufs_hisi_cap);
-		ret = ufshcd_get_pwr_dev_param(&ufs_hisi_cap,
-					       dev_max_params, dev_req_params);
+		ufs_hisi_set_dev_cap(&host_params);
+		ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 		if (ret) {
 			dev_err(hba->dev,
 			    "%s: failed to determine capabilities\n", __func__);
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index fc61790..776bca4 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -996,16 +996,14 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 				  struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct ufs_dev_params host_cap;
+	struct ufs_host_params host_params;
 	int ret;
 
-	ufshcd_init_pwr_dev_param(&host_cap);
-	host_cap.hs_rx_gear = UFS_HS_G5;
-	host_cap.hs_tx_gear = UFS_HS_G5;
+	ufshcd_init_host_params(&host_params);
+	host_params.hs_rx_gear = UFS_HS_G5;
+	host_params.hs_tx_gear = UFS_HS_G5;
 
-	ret = ufshcd_get_pwr_dev_param(&host_cap,
-				       dev_max_params,
-				       dev_req_params);
+	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
 		pr_info("%s: failed to determine capabilities\n",
 			__func__);
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 96cb8b5..197c5a5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct ufs_dev_params ufs_qcom_cap;
+	struct ufs_host_params host_params;
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -908,15 +908,13 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
-		ufs_qcom_cap.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
+		ufshcd_init_host_params(&host_params);
+		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
 
 		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
-		ufs_qcom_cap.hs_tx_gear = ufs_qcom_cap.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
+		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
 
-		ret = ufshcd_get_pwr_dev_param(&ufs_qcom_cap,
-					       dev_max_params,
-					       dev_req_params);
+		ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 		if (ret) {
 			dev_err(hba->dev, "%s: failed to determine capabilities\n",
 					__func__);
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index da2558e..1633edc 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -285,61 +285,60 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
 }
 
 /**
- * ufshcd_get_pwr_dev_param - get finally agreed attributes for
- *                            power mode change
- * @pltfrm_param: pointer to platform parameters
+ * ufshcd_negotiate_pwr_params - find power mode settings that are supported by
+				both the controller and the device
+ * @host_params: pointer to host parameters
  * @dev_max: pointer to device attributes
  * @agreed_pwr: returned agreed attributes
  *
  * Return: 0 on success, non-zero value on failure.
  */
-int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
-			     const struct ufs_pa_layer_attr *dev_max,
-			     struct ufs_pa_layer_attr *agreed_pwr)
+int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
+				const struct ufs_pa_layer_attr *dev_max,
+				struct ufs_pa_layer_attr *agreed_pwr)
 {
-	int min_pltfrm_gear;
+	int min_host_gear;
 	int min_dev_gear;
 	bool is_dev_sup_hs = false;
-	bool is_pltfrm_max_hs = false;
+	bool is_host_max_hs = false;
 
 	if (dev_max->pwr_rx == FAST_MODE)
 		is_dev_sup_hs = true;
 
-	if (pltfrm_param->desired_working_mode == UFS_HS_MODE) {
-		is_pltfrm_max_hs = true;
-		min_pltfrm_gear = min_t(u32, pltfrm_param->hs_rx_gear,
-					pltfrm_param->hs_tx_gear);
+	if (host_params->desired_working_mode == UFS_HS_MODE) {
+		is_host_max_hs = true;
+		min_host_gear = min_t(u32, host_params->hs_rx_gear,
+					host_params->hs_tx_gear);
 	} else {
-		min_pltfrm_gear = min_t(u32, pltfrm_param->pwm_rx_gear,
-					pltfrm_param->pwm_tx_gear);
+		min_host_gear = min_t(u32, host_params->pwm_rx_gear,
+					host_params->pwm_tx_gear);
 	}
 
 	/*
-	 * device doesn't support HS but
-	 * pltfrm_param->desired_working_mode is HS,
-	 * thus device and pltfrm_param don't agree
+	 * device doesn't support HS but host_params->desired_working_mode is HS,
+	 * thus device and host_params don't agree
 	 */
-	if (!is_dev_sup_hs && is_pltfrm_max_hs) {
+	if (!is_dev_sup_hs && is_host_max_hs) {
 		pr_info("%s: device doesn't support HS\n",
 			__func__);
 		return -ENOTSUPP;
-	} else if (is_dev_sup_hs && is_pltfrm_max_hs) {
+	} else if (is_dev_sup_hs && is_host_max_hs) {
 		/*
 		 * since device supports HS, it supports FAST_MODE.
-		 * since pltfrm_param->desired_working_mode is also HS
+		 * since host_params->desired_working_mode is also HS
 		 * then final decision (FAST/FASTAUTO) is done according
 		 * to pltfrm_params as it is the restricting factor
 		 */
-		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_hs;
+		agreed_pwr->pwr_rx = host_params->rx_pwr_hs;
 		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
 	} else {
 		/*
-		 * here pltfrm_param->desired_working_mode is PWM.
+		 * here host_params->desired_working_mode is PWM.
 		 * it doesn't matter whether device supports HS or PWM,
-		 * in both cases pltfrm_param->desired_working_mode will
+		 * in both cases host_params->desired_working_mode will
 		 * determine the mode
 		 */
-		agreed_pwr->pwr_rx = pltfrm_param->rx_pwr_pwm;
+		agreed_pwr->pwr_rx = host_params->rx_pwr_pwm;
 		agreed_pwr->pwr_tx = agreed_pwr->pwr_rx;
 	}
 
@@ -349,9 +348,9 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
 	 * the same decision will be made for rx
 	 */
 	agreed_pwr->lane_tx = min_t(u32, dev_max->lane_tx,
-				    pltfrm_param->tx_lanes);
+				    host_params->tx_lanes);
 	agreed_pwr->lane_rx = min_t(u32, dev_max->lane_rx,
-				    pltfrm_param->rx_lanes);
+				    host_params->rx_lanes);
 
 	/* device maximum gear is the minimum between device rx and tx gears */
 	min_dev_gear = min_t(u32, dev_max->gear_rx, dev_max->gear_tx);
@@ -364,26 +363,26 @@ int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
 	 * what is the gear, as it is the one that also decided previously what
 	 * pwr the device will be configured to.
 	 */
-	if ((is_dev_sup_hs && is_pltfrm_max_hs) ||
-	    (!is_dev_sup_hs && !is_pltfrm_max_hs)) {
+	if ((is_dev_sup_hs && is_host_max_hs) ||
+	    (!is_dev_sup_hs && !is_host_max_hs)) {
 		agreed_pwr->gear_rx =
-			min_t(u32, min_dev_gear, min_pltfrm_gear);
+			min_t(u32, min_dev_gear, min_host_gear);
 	} else if (!is_dev_sup_hs) {
 		agreed_pwr->gear_rx = min_dev_gear;
 	} else {
-		agreed_pwr->gear_rx = min_pltfrm_gear;
+		agreed_pwr->gear_rx = min_host_gear;
 	}
 	agreed_pwr->gear_tx = agreed_pwr->gear_rx;
 
-	agreed_pwr->hs_rate = pltfrm_param->hs_rate;
+	agreed_pwr->hs_rate = host_params->hs_rate;
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(ufshcd_get_pwr_dev_param);
+EXPORT_SYMBOL_GPL(ufshcd_negotiate_pwr_params);
 
-void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
+void ufshcd_init_host_params(struct ufs_host_params *host_params)
 {
-	*dev_param = (struct ufs_dev_params){
+	*host_params = (struct ufs_host_params){
 		.tx_lanes = UFS_LANE_2,
 		.rx_lanes = UFS_LANE_2,
 		.hs_rx_gear = UFS_HS_G3,
@@ -398,7 +397,7 @@ void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
 		.desired_working_mode = UFS_HS_MODE,
 	};
 }
-EXPORT_SYMBOL_GPL(ufshcd_init_pwr_dev_param);
+EXPORT_SYMBOL_GPL(ufshcd_init_host_params);
 
 /**
  * ufshcd_pltfrm_init - probe routine of the driver
diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
index a86a3ad..df387be 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.h
+++ b/drivers/ufs/host/ufshcd-pltfrm.h
@@ -10,7 +10,7 @@
 #define UFS_PWM_MODE 1
 #define UFS_HS_MODE  2
 
-struct ufs_dev_params {
+struct ufs_host_params {
 	u32 pwm_rx_gear;        /* pwm rx gear to work in */
 	u32 pwm_tx_gear;        /* pwm tx gear to work in */
 	u32 hs_rx_gear;         /* hs rx gear to work in */
@@ -25,10 +25,10 @@ struct ufs_dev_params {
 	u32 desired_working_mode;
 };
 
-int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *dev_param,
-			     const struct ufs_pa_layer_attr *dev_max,
-			     struct ufs_pa_layer_attr *agreed_pwr);
-void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param);
+int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
+				const struct ufs_pa_layer_attr *dev_max,
+				struct ufs_pa_layer_attr *agreed_pwr);
+void ufshcd_init_host_params(struct ufs_host_params *host_params);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
 int ufshcd_populate_vreg(struct device *dev, const char *name,
-- 
2.7.4


