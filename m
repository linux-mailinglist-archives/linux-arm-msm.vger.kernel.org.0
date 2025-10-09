Return-Path: <linux-arm-msm+bounces-76735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B052BCAC3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DC573535FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F522698A2;
	Thu,  9 Oct 2025 20:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oAj/l8Xg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D199264FB5;
	Thu,  9 Oct 2025 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760040700; cv=none; b=Ptuq8SFXSioGBjfsILQkcjPy3TFVUpxnCz/xU8XwnBlf7c/eV1BUjA/jgKCZcWrV3hE4J8cUxaY9fCyvzomIDY796H+BEh+jadHl7Lp2jYYCki76qagtMfEJcGbwUWb+IJw1Gz2DeN4WQXi8jqNvmFizLrn5wJo1xGtnOfwspSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760040700; c=relaxed/simple;
	bh=dXEWI+NR30J5p+hTIFox9PrJ7WBLNV8LF5iNeg4ZxZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAp4Tql8ee90irYuxeO5xyNO2OR48Gx8A3qT8ZKKsgY5JUFP5p0OqN83qQDUTeRjP9K+dJRNsuGLLhafKLH+IESbjWsOyG1ASzTCVIYdGAF/R/0iQYwIDSRsbUVJimOxqXg+J/bm7aHcR6LZo6zpcIMbSmRMWKzlwMORHztO5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oAj/l8Xg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EfqWt029314;
	Thu, 9 Oct 2025 20:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CA+i/6Qb3/gQyWyzsa6UvjgP
	bY8h3JvsLFGQrqpNEy0=; b=oAj/l8XgYn7BYezYVXUG5Iuoxjjgd5TOnmMeWy9w
	K0q5CUS0zaOX0FdG7N97k+orqgux3CxybpClSZy6yOuQCjIeHHcD1b1fbKxFlaCd
	oF6LP3kTgadpajGBgoJhjh+pflD9ivdbwyzZoUZe/RZdqzapoJtQT1yPkVNT/WbI
	ZjWScZvEAhnC/daCNy0D8SIZKEHXJt7uwtQ6NiZ3lI9n1WUfly4bKvf1F9v48tJs
	5KdFE4YemkvEcmgNqsTrlYQhC3bRtTY0PQ0XHoS7OPQx8TBHhbr6/tBjl5kt8eYc
	7MdAtJmE44Iy5RbQ3M1HWzEnW3CYl1WS/+LPxSe018nDgQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nm6g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 20:11:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599KBEaq004992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 20:11:14 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 13:11:14 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <adrian.hunter@intel.com>, <martin.petersen@oracle.com>
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
Subject: [PATCH v2 1/2] scsi: ufs: core: Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Date: Thu, 9 Oct 2025 13:10:58 -0700
Message-ID: <3abb389ac7ca807e82263ab344e755db8498de81.1760039554.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1760039554.git.quic_nguyenb@quicinc.com>
References: <cover.1760039554.git.quic_nguyenb@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxmOTFxm7GArJ
 epIhmj0pwbh7en1ntUeKew5InN+LzXTrbx/IXK02fqZdEKDpVk7N3dF8PLNlZbAFg99gdeQ9hiC
 M7ak0czd3Y5L3nghyrg2Ux57yGVJs4fwKzhlUAkiTlE9aezmURFwrg36oZmBau1X45FkcRZgSTZ
 qigiIa0fq5zFYCMA2f+B0lh5LMtA7Pv0K69cJfCLdrm05ufC9qUlZMmPwQfPiG29nNWSaQm8KiY
 fnt7QGTeFRp1h/e3EyNFRlOVn70YcJJo5UDvksD7kVA1jRQ8yLEkdGCXuXY63hZk64s4panEnO8
 V1w8shVVF73bfzP5lJhulosdL+SOTFkTno92pPq4cOAjcAxfXuYEPyVKFs6qXGToPNd6g/x+Qz0
 HO1eY2PNQaSwX/9wGmYk4lTJgYE2qQ==
X-Proofpoint-ORIG-GUID: 7gCCAehqAhvUlzxiXBfiFTh1v9Kr4oLP
X-Proofpoint-GUID: 7gCCAehqAhvUlzxiXBfiFTh1v9Kr4oLP
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e816e4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=SKyd_0MEfDjhs0-DTAYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

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
index 2e1fa8c..e8842dc 100644
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
+	if (vcc_off && hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
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


