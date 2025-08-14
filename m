Return-Path: <linux-arm-msm+bounces-69113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1DB25C6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1269E4D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB6825B687;
	Thu, 14 Aug 2025 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jz3+EI8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F9257440;
	Thu, 14 Aug 2025 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154737; cv=none; b=J69dC7WbSh4Z9Ckt77I6luB2M/EIxhP3eE7tMFvrN3DUkkwRTAYRTRfGkJnGTYn1tAMD9RjZTstWz+9ff4UVuiRZKLXxDqHmoG++FwfLTGHTQIL9O+VeVVKCW1QWZhGNxuXtaN+Q9/ySRfRcVtKOHeMmxphDKjcRayvd81rS2To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154737; c=relaxed/simple;
	bh=kgnF1eSBc0fn52azfO+TndvSvcrwNLGbQNmJ7Ezc5Lo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oNwhLiRliOl+XQA4epOFalr90TkxOaqhi25JWo4+7ScAI+kuk/X8TsZFxyEz88kodKdspX+LpqI2z1GScbxYIukwgt1wOyYEkIJxcGeQ68i50+7pVGFygzt2IGiBW7d5DCephbMfUnz+kzaLBJYzU6JG9HHPMyECqssgJopjCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jz3+EI8q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLPhDJ002871;
	Thu, 14 Aug 2025 06:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n+s47sJ1pj8VJGQnbZwzEn
	jnoPQtakZ92FkbgWqBUPU=; b=Jz3+EI8qgT9X4eL+JWoVdX42626Dt3zYga18zc
	x+/qSalcmIIK6WomIBoewqFkegvu3canht22zQnix/mPnoY6laGe2MlI79ZSVbQs
	Zubm4tdNKsDv8LoBa5ecV5RBUY+so6aLRZN3gBaMp2uipzAT9Kt/W9XI+CMQtwTY
	5HbSU8K82uG5tiQeEwCBbj/LK/ZuAyChM9Z2B7Zz4AsmUyHAFQfqeoZatvS2UOD2
	T55Mqj7hYa0SfMxPYpn6kRmLo/HVNVn5uc3BgqCDwlavgP5aPRmYVcVd0U8aXOxY
	cAtQNZdrc6kag/QJu+nNQv6EX3y6geD7Didhzem1Re6ap3ew==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv6pck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:58:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E6wnlv022261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:58:49 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 23:58:47 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH -v4] ufs: ufs-qcom: Align programming sequence of Shared ICE for  UFS controller v5
Date: Thu, 14 Aug 2025 12:28:30 +0530
Message-ID: <20250814065830.3393237-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d892a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=A1Z4X6O0DLo03VmHrqwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: frmt5VyHgWEQZu07uKyW1xr4CXNAfxts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5XyT3anFqZaz
 ecuvariEBgC5YCDTBsAVrK+AnnWNFykkj+q+DTNrpr2T9cLevKxDw6fof/szEYc9KL8tv21KANm
 4iukzZJjqWkmyAV+htWLeDkR0Te0S6356DoaLYZRsm7rrSSV/Ble/37Bvze1AUFXFntqzYUDjZZ
 llzbkj2CHBufJoL1xsxtQyzWdcbZWOLnrYZ7ZAd8Y8i8AZK/GiBSR3cG0i+Yk53Nuab7+/rau3s
 qt0kXMlDoIuANP2Yr8/MWPpMvg40ZIDIGtR6pML3GzqC9GPXp5zh3QcQiUxVH1L+K1IgDZ6P49t
 Q36q7gpBi9mfa3eaoKU4zzzYaeF2QmgMKRw3bx8H5sgwrVKUnekEooB86nnjcQ4zefXFMccPHkP
 nDQymYan
X-Proofpoint-GUID: frmt5VyHgWEQZu07uKyW1xr4CXNAfxts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Disabling the AES core in Shared ICE is not supported during power
collapse for UFS Host Controller v5.0, which may lead to data errors
after Hibern8 exit. To comply with hardware programming guidelines
and avoid this issue, issue a sync reset to ICE upon power collapse
exit.

Hence follow below steps to reset the ICE upon exiting power collapse
and align with Hw programming guide.

a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
   SYNC_RST_SW bits in UFS_MEM_ICE_CFG
b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>

---
changes from V1:
1) Incorporated feedback from Konrad and Manivannan by adding a delay
   between ICE reset assertion and deassertion.
2) Removed magic numbers and replaced them with meaningful constants.

changes from V2:
1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.

changes from V3:
1) Addressed Manivannan's comments and added bit field values and
   updated patch description.
---
 drivers/ufs/host/ufs-qcom.c | 19 +++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 444a09265ded..9195a5c695a5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -38,6 +38,9 @@
 #define DEEMPHASIS_3_5_dB	0x04
 #define NO_DEEMPHASIS		0x0
 
+#define UFS_ICE_SYNC_RST_SEL	BIT(3)
+#define UFS_ICE_SYNC_RST_SW	BIT(4)
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -756,6 +759,22 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (err)
 		return err;
 
+	if ((!ufs_qcom_is_link_active(hba)) &&
+	    host->hw_ver.major == 5 &&
+	    host->hw_ver.minor == 0 &&
+	    host->hw_ver.step == 0) {
+		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
+		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
+		/*
+		 * HW documentation doesn't recommend any delay between the
+		 * reset set and clear. But we are enforcing an arbitrary delay
+		 * to give flops enough time to settle in.
+		 */
+		usleep_range(50, 100);
+		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL, UFS_MEM_ICE_CFG);
+		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
+	}
+
 	return ufs_qcom_ice_resume(host);
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 6840b7526cf5..81e2c2049849 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -60,7 +60,7 @@ enum {
 	UFS_AH8_CFG				= 0xFC,
 
 	UFS_RD_REG_MCQ				= 0xD00,
-
+	UFS_MEM_ICE_CFG				= 0x2600,
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
 
-- 
2.34.1


