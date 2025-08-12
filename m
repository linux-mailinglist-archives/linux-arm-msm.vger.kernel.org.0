Return-Path: <linux-arm-msm+bounces-68714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34845B222E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE63E189F289
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0092E92B0;
	Tue, 12 Aug 2025 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lV4eq8Yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4111C5D46;
	Tue, 12 Aug 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990258; cv=none; b=UxKKZ5VixcQVlPV7uaOcDzJ/4HrgVyC10hF7CCibhNmf4+p4ebyMdKbXVqaKDIq05L4UcwKv5zargwCCt2jeHQMohTVzjCrrljWYixIxdTnnyxusctwxtDUbP2rfz4ORqoMAi5IamX2ppc3M+yNgBo9hgScq+rJ3lCDqOIuehJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990258; c=relaxed/simple;
	bh=l+JPmVSGkKQNgqZW0QHP1wnt+nmYWZ0r+uotxr/gTtg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hGCkrEtCUO0QpExteV3/GYxR7XRzppne+ENOJUVTpBJ7/lz1J0XHQeRvwpdeS9l6eBH3d/HKw7jfok/hRBI3jrEm18RTMRAexsF2gDhDvPr8Nf8wyOyA+cfyjAX1yoXFv4Etdoj6I4CBdlza1OIqJz066fXm7j1QNc6QHG4s+vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lV4eq8Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C7FhQh008171;
	Tue, 12 Aug 2025 09:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iyvIoy5EeZGmERvcNtqAnD
	yjt7Kpu0kI1S5BLe32aXY=; b=lV4eq8YziAKVw/fUM4WBmrihYxmoRGo74IOT9T
	9CdNrMAPjyGTtXkc8kKiLKARCkUN7zuCO2lSseYn0ePwjyOYzlJbXXLI9altO0Rw
	+1WhLE7KMaKXxu/IIU5QWaQQXi7updx3VuPemzfPETfWVBUe1+h2urVMrDPRNFZN
	dG7Kz5wRUskFCporkoQ/1B8aB64Q64WhjPmh3V4CcRrD+v+Nt8tQNpuUNDZuW9Tu
	Y5lAXQTkDQOTVxkqfZjHIzaKKCuEuLzxHViGv5pDmlGlMtLHClPO5l4efRCC+eKd
	L9Q0QLAWYAqLJCUuQVQczmrDrt7O5lNdTleAqjGL72Ed2PLA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkchf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:17:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9HUrm026331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:17:30 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 02:17:28 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH v3] ufs: ufs-qcom: Align programming sequence of Shared ICE for  UFS controller v5
Date: Tue, 12 Aug 2025 14:47:14 +0530
Message-ID: <20250812091714.774868-1-quic_pkambar@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX4FjLjF4dWYWU
 6S/HLygM0xSiydTRfPCINc4a91DPxUzwsUWO0gkv7YECR2qvX8rgk5iCZzVqIQy219Js6WbPe8s
 bzI/87dP3VkMeFZzePEAhNzOEGsh/sH6aLaRjNUhCtAK8LuC6pdKTPl9X2bQ1xDpKMutGv4qz1B
 7GNi2OBPVl0Rs2vVMX97fkvdiDNkapZA0QipWoOJp2QQgfFf4p+KEuvLw9+dZEdJjyRwZcBD9h5
 VaiuY3KKxeB98ykz7aYikR5yowP46CYa2P+Sdl314qNEoOFYnIQnxnZ8VFcswTdsV+SMTwXneeC
 pDJxrJD7yFeXi49ktlfdRDHHqEv9ZWWNTikzxtbhI3kL5Ko5t5Jqptkyt65N7JV2nEHfJzIaERu
 4BUMkgjp
X-Proofpoint-GUID: 7WUXzIBLcuq0cE-PQirWhe3mnPo-VcFU
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b06ac cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VXgbpkJe1Aw4WB-MpbAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7WUXzIBLcuq0cE-PQirWhe3mnPo-VcFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Disable of AES core in Shared ICE is not supported during power
collapse for UFS Host Controller V5.0.

Hence follow below steps to reset the ICE upon exiting power collapse
and align with Hw programming guide.

a. Write 0x18 to UFS_MEM_ICE_CFG
b. Write 0x0 to UFS_MEM_ICE_CFG

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>

---
changes from V1:
1) Incorporated feedback from Konrad and Manivannan by adding a delay
   between ICE reset assertion and deassertion.
2) Removed magic numbers and replaced them with meaningful constants.

changes from V2:
1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
---
 drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 444a09265ded..60bf5e60b747 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -38,6 +38,9 @@
 #define DEEMPHASIS_3_5_dB	0x04
 #define NO_DEEMPHASIS		0x0
 
+#define UFS_ICE_RESET_ASSERT_VALUE	0x18
+#define UFS_ICE_RESET_DEASSERT_VALUE	0x00
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -756,6 +759,17 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (err)
 		return err;
 
+	if ((!ufs_qcom_is_link_active(hba)) &&
+	    host->hw_ver.major == 5 &&
+	    host->hw_ver.minor == 0 &&
+	    host->hw_ver.step == 0) {
+		ufshcd_writel(hba, UFS_ICE_RESET_ASSERT_VALUE, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+		usleep_range(50, 100);
+		ufshcd_writel(hba, UFS_ICE_RESET_DEASSERT_VALUE, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+	}
+
 	return ufs_qcom_ice_resume(host);
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 6840b7526cf5..cc1324ce05c7 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -60,7 +60,7 @@ enum {
 	UFS_AH8_CFG				= 0xFC,
 
 	UFS_RD_REG_MCQ				= 0xD00,
-
+	UFS_MEM_ICE				= 0x2600,
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
 
-- 
2.34.1


