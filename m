Return-Path: <linux-arm-msm+bounces-75713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72ABB1B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 22:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09A1D2A6CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 20:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913CE3019B6;
	Wed,  1 Oct 2025 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pj9k67d5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DE2D6401;
	Wed,  1 Oct 2025 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759352273; cv=none; b=hC7otZrH9pVCbIC62HypcYrzjWWYL68+8zeO0uxsOgfzJOJ9EvgeGR+L6GfNqLoAgUnwnbovQKRkNwMVMSyhAcfZfDSi6kZfIP0TFfg2KE1KG/BW6ALNy+rFz4hzY84VubaSLnKH3NKd9/rUdg7YJs4liWzQWWayMUNuIEntFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759352273; c=relaxed/simple;
	bh=4bp+ljG1ekdGQkOL2AMswRVzFqz7Mw66nucoo9Ketf8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEfNdaF/JWNBzjK6wTCZ00Lxi1CeRIDPD/vHbiBXAIr+GzDH0phfrULE5bJ6HEQ6DNG6xjexe9K1k/ROFfJOMG/PMDgprkB7AKF6zhLFtpyWWQlMOrQ2HFfbYyAdUGFAeZojRkqyUMbdgXyU7UdjUntlCqJbI5U5z/+zp6n4Yag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pj9k67d5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic3jY005924;
	Wed, 1 Oct 2025 20:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqsHg9/ZHWQkNpx2myRvt4U3
	iO0xTHj7Lm9Ij3e6qTo=; b=Pj9k67d5qBOayulEEkoZyVrH5nl+WrKsUvM2GIKt
	s6T6Zl+iX7YF21irsYS45Erl2JnAp5Z+1YxILzzkMvhyK4Cnc50S1QSqiCQfLEwS
	gscnIY+FYscrvY+llWEBUBXn8z/hjpYhW7XnYcrJf0ns1rv8tjPdr2vnIjwrW/Df
	anhLqGHXTEQF7yvFJFg+aOL79AFFWdSJs746nl/xHhFDXR13cF9kN6HR9ynZmzOb
	LWJt0H1B+mrS+k76PFwpXB1sDLGPfaWbmc9okjUSBAhNUKbnHb2j2oVySo7WNh9N
	f8WxAdJKVLsYvNVg8P4ph5f9e+SDQ5BaWm96UDDovteSQw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdnm7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 20:57:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 591KvWYN015417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Oct 2025 20:57:32 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 1 Oct 2025 13:57:31 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <manivannan.sadhasivam@linaro.org>, <adrian.hunter@intel.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Bean Huo <beanhuo@micron.com>, Manish Pandey <quic_mapa@quicinc.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
        "open
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 1/2] scsi: ufs: core: Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Date: Wed, 1 Oct 2025 13:57:11 -0700
Message-ID: <0f0a7d5518d29fc384aace558d2bf098d792e0db.1759348507.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1759348507.git.quic_nguyenb@quicinc.com>
References: <cover.1759348507.git.quic_nguyenb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JP-wVxPNdg5HUjr8rw5OZnyU5yEWkoyC
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dd95bc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=SKyd_0MEfDjhs0-DTAYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: JP-wVxPNdg5HUjr8rw5OZnyU5yEWkoyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXxCim+kId29u0
 G6h6qP7hZRaTVYB6u8Q2/Qhi3psaKF0d4NkQcHqPHDntL/2MgOhVXs2DLgnD87LCSD4GxTBZGvj
 4jEzwInMnO04KNtF8vfVSkR8KOGoQZlKYiikTxs5KDbm3lS8X87Oquo26+OIqthYUiURPL2w87z
 yR/+Vwsyywf34ty0sCN1wl9n757Gnri7dp1uEell5fvZ7fobgvWXWaM9FWuF8HiqeLwcKIXLnnh
 Bqm7hA4EPYK+0QNGiU6oiU5JXU2jVyNSaQjo/0N2b6Xh8Mg7aQaZIUfd3mBYbf6fxDgcxyWMrWB
 u2WBM7/VhKvdh+ltwXu+1wW2ng6ioqHDlt4aDepyYpTn/876w6ZSu/kazrwvWlDHHnqHxS4//Rc
 ObTCIr3L+0z5HFmLtrt0+ZKv5gpSAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

After the ufs device vcc is turned off, all the ufs device
manufacturers require a period of power-off time before the
vcc can be turned on again. This requirement has been confirmed
with all the ufs device manufacturer's datasheets.

Remove the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the ufs
core driver and implement a universal delay that is required by
all the ufs device manufacturers. In addition, remove the
support for this quirk in the platform drivers.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
---
 drivers/ufs/core/ufshcd.c       |  5 ++---
 drivers/ufs/host/ufs-mediatek.c | 11 ++++-------
 drivers/ufs/host/ufs-qcom.c     |  3 ---
 include/ufs/ufs_quirks.h        |  7 -------
 4 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 2e1fa8c..45e509b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9738,10 +9738,9 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	}
 
 	/*
-	 * Some UFS devices require delay after VCC power rail is turned-off.
+	 * All UFS devices require delay after VCC power rail is turned-off.
 	 */
-	if (vcc_off && hba->vreg_info.vcc &&
-		hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
+	if (vcc_off && hba->vreg_info.vcc)
 		usleep_range(5000, 5100);
 }
 
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index f902ce0..5c204d1 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -40,8 +40,7 @@ static int  ufs_mtk_config_mcq(struct ufs_hba *hba, bool irq);
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_ANY_VENDOR,
 	  .model = UFS_ANY_MODEL,
-	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM |
-		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = "H9HQ21AFAMZDAR",
 	  .quirk = UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES },
@@ -1713,15 +1712,13 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
 
-	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc &&
-	    (hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)) {
+	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc) {
 		hba->vreg_info.vcc->always_on = true;
 		/*
 		 * VCC will be kept always-on thus we don't
-		 * need any delay during regulator operations
+		 * need any delay before putting device's VCC in LPM mode.
 		 */
-		hba->dev_quirks &= ~(UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
-			UFS_DEVICE_QUIRK_DELAY_AFTER_LPM);
+		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM;
 	}
 
 	ufs_mtk_vreg_fix_vcc(hba);
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index d15f1a1..15a9ffc8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1025,9 +1025,6 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
-	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
-	  .model = UFS_ANY_MODEL,
-	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
 	{ .wmanufacturerid = UFS_VENDOR_WDC,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE },
diff --git a/include/ufs/ufs_quirks.h b/include/ufs/ufs_quirks.h
index f52de5e..1b26932 100644
--- a/include/ufs/ufs_quirks.h
+++ b/include/ufs/ufs_quirks.h
@@ -101,13 +101,6 @@ struct ufs_dev_quirk {
 #define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
 
 /*
- * Some UFS devices require delay after VCC power rail is turned-off.
- * Enable this quirk to introduce 5ms delays after VCC power-off during
- * suspend flow.
- */
-#define UFS_DEVICE_QUIRK_DELAY_AFTER_LPM        (1 << 11)
-
-/*
  * Some ufs devices may need more time to be in hibern8 before exiting.
  * Enable this quirk to give it an additional 100us.
  */
-- 
2.7.4


