Return-Path: <linux-arm-msm+bounces-70143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E06B2F68F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF041C24EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0FE311584;
	Thu, 21 Aug 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b29EQwok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFDF30E852;
	Thu, 21 Aug 2025 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775514; cv=none; b=CaOPm/LB3Wf53Z/AsmBxgw7K4KfdTO/Tj1Fi7Nm9kjkwRqFAL/gTMIE4brM+xQWp0YPBmXjugt+ZpDpggI4p4VyKvPqeElpEoyTOv4+kAQOh3cyL2OXkUnWIzoYe2YYpyVqLxbXOxHugYyhBzpBlh46MP2Mo7q9FW1Gi5NM/Sf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775514; c=relaxed/simple;
	bh=npbsm5A6KYG+tJQ38ezsx5Nqrj3XqTxxvZXpg1ESH40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lf0gtd742QLCrTbruwwU5YAsYvRBbCEnCrauX68nKavU41WadhG6UaVRnvdlQlwlRd8Pf5HV4+A9rLaIQ8C6cfkerFijwh56If4hdo5VRdynm1pxohWnbpptrPdE0XiLnbzV+D3zrvFNMaNfr4PZzT8TYXeIOG6aWLW0qSny4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b29EQwok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bFbu031459;
	Thu, 21 Aug 2025 11:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTS1i/oxAzfSMT80K8a+mvjjWBjSImWla852eJkGETU=; b=b29EQwokxgcbOYJU
	XC2imbur39QsSTIFPxCfPAagifT7XvnyXXV19ZLWgL7Yn/7Sb5f+d/dyOMkyRVvh
	vfC5/XydNRcLXRy7HAHcNxND6DbwA7HnA+gKNS+5o3JQ1n/EOseqSKeh6ynCGaCy
	qENOUnI4I+sNCCvSPp3aKM2CYVyS3cGjF8sqgNKGH+ITCrc/pw8KyicXTrcCIgyD
	8bARWaTvMiMENfF8WVX4fsgWD9LRmBAAcIA8fUNGEDDJKJJt3k+LHFlNqizZrG/e
	199M+773W7V9fTXMoGe2VXqtz1+JUxSQHqXbc3Z99MzylSyijLxVR/XiGzhjoBzZ
	icWcog==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aw3pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBP75V032732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:07 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 04:25:03 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [PATCH V3 3/5] scsi: ufs: core: Remove unused ufshcd_res_info structure
Date: Thu, 21 Aug 2025 16:54:01 +0530
Message-ID: <20250821112403.12078-4-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/U7Ui/hqPtSW
 jQRHKRGJPsVEBQtgSYA0QBN122CKjy9kwvvPSfGGT6lx1L/4qUAsFhGqe9ryZs0mXod79g32LUi
 5mtyse7GpnkjgwekcBxZzr0+zXX5zwBx4yijxuyHW6DnGFP6TayzrKQ5p+J9msOl15QWtbLma2S
 asAjrZqJ8sIKRgkkoP+eLELxSipUGjr3DETgtjt1wbD1QX0eTPgW3JPQsdJjpQ5LoRShIuwh00X
 qdyixnhrUWV9N758Wv/GKiwO+WuqxJVz3WmZd9j+Ev3TVDRU0Fx96P5NUTFuoRRhA9ElpiE5Hnr
 zFn95A3OKA6C/ba3XOf4mPA1myAqhceMTgYuA1mCEQ1Jlbsqze3IBOIVkqfXIPHZ/sk41O9wJyK
 Sa31ZdKuIYlTgZRrbRYwdN3guw2xzQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a70214 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Xn2mOyx4QRrvjNsjBgYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: XGtxZdYQ7aVK0rrLIWJYaNB40Czaw_uD
X-Proofpoint-GUID: XGtxZdYQ7aVK0rrLIWJYaNB40Czaw_uD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Remove the ufshcd_res_info structure and associated enum ufshcd_res
definitions from the UFS host controller header. These were previously
used for MCQ resource mapping but are no longer needed following recent
refactoring to use direct base addresses instead of multiple separate
resource regions

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 include/ufs/ufshcd.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 1d3943777584..a7bcf7c7a1af 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -794,30 +794,6 @@ struct ufs_hba_monitor {
 	bool enabled;
 };
 
-/**
- * struct ufshcd_res_info_t - MCQ related resource regions
- *
- * @name: resource name
- * @resource: pointer to resource region
- * @base: register base address
- */
-struct ufshcd_res_info {
-	const char *name;
-	struct resource *resource;
-	void __iomem *base;
-};
-
-enum ufshcd_res {
-	RES_UFS,
-	RES_MCQ,
-	RES_MCQ_SQD,
-	RES_MCQ_SQIS,
-	RES_MCQ_CQD,
-	RES_MCQ_CQIS,
-	RES_MCQ_VS,
-	RES_MAX,
-};
-
 /**
  * struct ufshcd_mcq_opr_info_t - Operation and Runtime registers
  *
@@ -1127,7 +1103,6 @@ struct ufs_hba {
 	bool lsdb_sup;
 	bool mcq_enabled;
 	bool mcq_esi_enabled;
-	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
 	struct ufs_hw_queue *uhq;
 	struct ufs_hw_queue *dev_cmd_queue;
-- 
2.50.1


