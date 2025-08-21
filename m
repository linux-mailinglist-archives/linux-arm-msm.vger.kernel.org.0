Return-Path: <linux-arm-msm+bounces-70142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085AB2F68B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64824189CBB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E130EF7A;
	Thu, 21 Aug 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="llIAUbQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF330E0FE;
	Thu, 21 Aug 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775513; cv=none; b=N2YSe+q5zmFdPTvLgvPT0D/MY1o58jjHrwET7KToHH0MR03/57YNEZfk4IZbbHnGynr1jjjxkK7HnNk4TDp4VlieEaxbmzH989psUFTKuJLJCgWQ9r9X30Q79a0TVKgBnrCbArRECkhdjkZNia/N/E9ry7W7WNQRovI/CBdiPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775513; c=relaxed/simple;
	bh=9fLz/0EJUf1D+W0RO7aA3gG/BTB2/qPw/yFuFcXdTug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGisAY+OAFhWGgVCNVVu4+6qUVSg6IBBlOL08seC+hisKdsKaM2oA18nkoFwGPja9DBTERF3VjI32Jxyd56Fm9HTidjKcc3W0bIkD9rpCUCn0CPqQ+Y5qqgwTpGFnWpEjPdtDFFA0teoSYwiltwrN3TVTO0Z8J+aRfQZWjz41jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=llIAUbQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDJI015771;
	Thu, 21 Aug 2025 11:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RqhEkxhh6ijqQbopW+zI+dTTIwU26kur4nx1huj1W8=; b=llIAUbQQwpnHMvWG
	RW7YjKusxeqVOPDgB/vRtGM0OD9pGfiHQ9aazNb0l7epFkD3F4z4klmYjoWFmtzq
	yuVmYQaXcLXoOQ4/3rP+PKA/jzpWneQNYPpzl3D0Eot3goGZPYrQuQRA6nzZ/7l9
	8b0lD+bzkmpe5pP2fdCKAxIwIlJsvg+2yraYabGrOMco1WCIes2vzzHFWfvHAxsd
	9gnZo5fu3PLjUxOcyRddwvx6zRS7VtqM/uGaScxtbgPH514vkrSVpDnPQNUsvsgx
	kjmsmX66B4f5F6K2JoKeNSh6nmqIRycaPRap8ePseONJieubPZ6R/yoB5ZT7gTdD
	T4UNpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52955jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBP3tr032633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:03 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 04:24:59 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [PATCH V3 2/5] ufs: ufs-qcom: Refactor MCQ register dump logic
Date: Thu, 21 Aug 2025 16:54:00 +0530
Message-ID: <20250821112403.12078-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a70210 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=_Q0QRU3yDPudEj8UWRIA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ZDpALnPG-TLpso6JAqVbJB3FeSvHIOu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7giKxcHaaxiC
 RDF2iJ/XUwEKEwNNC0KIBpzKqKO/NLv4qG2/tuGIPA68/9xnNoC60pbKRsWPI2R3KWQIn6ehZIL
 j/VR9MwG/SuiFpo8qXe/xgBhGjypOsm16sQXcH/R6ao7B2s9Dt15QlbdTr/8sasiIAa6h9OE6w0
 uvGWSLE6HmTnpGAZ+CvbeS1E0i+WmG/s2OAAzgyyjdW88n1VjHFCOooRqR1u5XrOIoZP3x1ZfJS
 l7rxl8xxf65Q8dZN7/Ofzo2Xe46a2bwac/MjrVAZqtH8NEpmxBoDqXEfl+4pCobzOBDULm6PGmf
 GjoV2hqkMTfX/Bv0d+yNkMBaMU2OCp46H/g3bVKLY39XreyiBJX3EF+oEyood+VSKXMNk3ts9ti
 MaIH1VUoufUilHkhDGcd3YvXzNxN5g==
X-Proofpoint-GUID: ZDpALnPG-TLpso6JAqVbJB3FeSvHIOu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Refactor MCQ register dump to align with the new resource mapping.
As part of refactor, below changes are done:

- Update ufs_qcom_dump_regs() function signature to accept direct
  base address instead of resource ID enum
- Modify ufs_qcom_dump_mcq_hci_regs() to use hba->mcq_base and
  calculated addresses from MCQ operation info
- Replace enum ufshcd_res with direct memory-mapped I/O addresses

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6c6a385543ef..c1915f426ef8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1742,7 +1742,7 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
 }
 
 static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
-			      const char *prefix, enum ufshcd_res id)
+			      const char *prefix, void __iomem *base)
 {
 	u32 *regs __free(kfree) = NULL;
 	size_t pos;
@@ -1755,7 +1755,7 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		return -ENOMEM;
 
 	for (pos = 0; pos < len; pos += 4)
-		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
+		regs[pos / 4] = readl(base + offset + pos);
 
 	print_hex_dump(KERN_ERR, prefix,
 		       len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
@@ -1766,30 +1766,34 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 
 static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
 {
+	struct ufshcd_mcq_opr_info_t *opr = &hba->mcq_opr[0];
+	void __iomem *mcq_vs_base = hba->mcq_base + UFS_MEM_VS_BASE;
+
 	struct dump_info {
+		void __iomem *base;
 		size_t offset;
 		size_t len;
 		const char *prefix;
-		enum ufshcd_res id;
 	};
 
 	struct dump_info mcq_dumps[] = {
-		{0x0, 256 * 4, "MCQ HCI-0 ", RES_MCQ},
-		{0x400, 256 * 4, "MCQ HCI-1 ", RES_MCQ},
-		{0x0, 5 * 4, "MCQ VS-0 ", RES_MCQ_VS},
-		{0x0, 256 * 4, "MCQ SQD-0 ", RES_MCQ_SQD},
-		{0x400, 256 * 4, "MCQ SQD-1 ", RES_MCQ_SQD},
-		{0x800, 256 * 4, "MCQ SQD-2 ", RES_MCQ_SQD},
-		{0xc00, 256 * 4, "MCQ SQD-3 ", RES_MCQ_SQD},
-		{0x1000, 256 * 4, "MCQ SQD-4 ", RES_MCQ_SQD},
-		{0x1400, 256 * 4, "MCQ SQD-5 ", RES_MCQ_SQD},
-		{0x1800, 256 * 4, "MCQ SQD-6 ", RES_MCQ_SQD},
-		{0x1c00, 256 * 4, "MCQ SQD-7 ", RES_MCQ_SQD},
+		{hba->mcq_base, 0x0, 256 * 4, "MCQ HCI-0 "},
+		{hba->mcq_base, 0x400, 256 * 4, "MCQ HCI-1 "},
+		{mcq_vs_base, 0x0, 5 * 4, "MCQ VS-0 "},
+		{opr->base, 0x0, 256 * 4, "MCQ SQD-0 "},
+		{opr->base, 0x400, 256 * 4, "MCQ SQD-1 "},
+		{opr->base, 0x800, 256 * 4, "MCQ SQD-2 "},
+		{opr->base, 0xc00, 256 * 4, "MCQ SQD-3 "},
+		{opr->base, 0x1000, 256 * 4, "MCQ SQD-4 "},
+		{opr->base, 0x1400, 256 * 4, "MCQ SQD-5 "},
+		{opr->base, 0x1800, 256 * 4, "MCQ SQD-6 "},
+		{opr->base, 0x1c00, 256 * 4, "MCQ SQD-7 "},
+
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(mcq_dumps); i++) {
 		ufs_qcom_dump_regs(hba, mcq_dumps[i].offset, mcq_dumps[i].len,
-				   mcq_dumps[i].prefix, mcq_dumps[i].id);
+				   mcq_dumps[i].prefix, mcq_dumps[i].base);
 		cond_resched();
 	}
 }
-- 
2.50.1


