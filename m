Return-Path: <linux-arm-msm+bounces-69469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D2B297AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A50179505
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 04:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCAE2066DE;
	Mon, 18 Aug 2025 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bof6DCd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD821F1513;
	Mon, 18 Aug 2025 04:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490182; cv=none; b=IqHqRaSibKydL+l3zsRle1Il2eZSKveBbStx6r7PXlZouHt+JXMYc8DN3aRiU4FS8opsNf++V8a/C9ClYjkambCd61k/hmwfzMDdNyp2KZPBnGS+7mhHzWob/ZZ4w2A+cfWDjvsEA/stTQ0XlPTO4Oswd7JuwWE+nwnSUVA48PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490182; c=relaxed/simple;
	bh=Hml+Ha094zHzOQUjLW5lwQcO7fMMj/0YC5MRGzzYwDA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p9uFNMRD6/Pf1fmRytKKuxTiJCSKoK4AYQT27z9Am2SI7CddI41ZTgecFwHcR8lP+9/UQewMJX5SXanSMilIWhnDDaKImXd5DuDXpuMDQRu3yl7vZLJD+jUQpVHgLJfL+UPo68Up9o03Pxwj/Jb26L4W3s1q+WQJa4SBuKe1jEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bof6DCd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HL7uQP008998;
	Mon, 18 Aug 2025 04:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sY+EbChppw0FbK1I4gMzLy
	WucvwpBW1ypbYoZU1VZyc=; b=bof6DCd4V6qU22SsFQ4ExqFhaNj5QXQagqW30k
	4F19X1KfpP4SOjnqVCDsVifSV/u0ssbX4BongMeMOzK0ixaMIjJdv0U78vSAoT+V
	KKIJT2it3L1nbNpfTFwsiKr4in0LumYm+FJRtSeVPrEbne9C5YMi3L5YVE6o7To3
	ZO1sjvFy+6e6B3MCnHuyECN/HiDlDUnbMChzSYjc9QQ7PNNiACzeNU2lzzCGaAtj
	fo1KbWdiXxz5C5V8clNThUivKB+mnNbBsnpvELdd6Q3B8J1RNvQV3FH3yV6fxuLI
	Ftt51AR93TUlKtlrUenkaiBXXlFkabvWYi28rnBGaf/vcY4w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfu57j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 04:09:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I49XjW026418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 04:09:33 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 17 Aug 2025 21:09:30 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH v5] ufs: ufs-qcom: Align programming sequence of Shared ICE for  UFS controller v5
Date: Mon, 18 Aug 2025 09:39:05 +0530
Message-ID: <20250818040905.1753905-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jZgRcj5zGGVzf7gxF3FBrOrJnZnNfe6A
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2a77d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=A1Z4X6O0DLo03VmHrqwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX7bBLMxMuF9qF
 rv3XKWgAj8nlqrKkg8tP4UBCAHD2Sd3fGrOvHvQEofChHflx4vYLasQspkojnqbWiDBJny6a/q9
 Gml4rmNFnje8gWYW7HLHrk2msbBqoMV8hLc3l8iQlZrLyYKD0F54A0Wh/eu9cKL8GqTDSGdgCwR
 A9sHmgLi2GJOpZeHCa7WsDCmFhiWfT2gHEKQ4mqKiPN4jIHbWDYSGVo7pj65pit5i/6MDuU3oPd
 +lcFPTFmMSDINlH+N6RMeZWmB5lP+E3sLouULF+W20OXs5g3ArgOWfCWMn54fg7vSWSJ2T/5zoB
 VB5CePxkcK1eMAXXMV+erTirET9QvZ/MQeS4YQEolIlThBKbLKLtI9C/BeGTrAd26RyeLpZPIfB
 +jMzThox
X-Proofpoint-ORIG-GUID: jZgRcj5zGGVzf7gxF3FBrOrJnZnNfe6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

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

change from V4:
1) Addressed Konrad's comment and fixed reset bit to zero.
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 444a09265ded..242f8d479d4a 100644
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
@@ -751,11 +754,29 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int err;
+	u32 reg_val;
 
 	err = ufs_qcom_enable_lane_clks(host);
 	if (err)
 		return err;
 
+	if ((!ufs_qcom_is_link_active(hba)) &&
+	    host->hw_ver.major == 5 &&
+	    host->hw_ver.minor == 0 &&
+	    host->hw_ver.step == 0) {
+		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
+		reg_val = ufshcd_readl(hba, UFS_MEM_ICE_CFG);
+		reg_val &= ~(UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW);
+		/*
+		 * HW documentation doesn't recommend any delay between the
+		 * reset set and clear. But we are enforcing an arbitrary delay
+		 * to give flops enough time to settle in.
+		 */
+		usleep_range(50, 100);
+		ufshcd_writel(hba, reg_val, UFS_MEM_ICE_CFG);
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


