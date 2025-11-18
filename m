Return-Path: <linux-arm-msm+bounces-82372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F2C6AEF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 719772B274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFD931ED94;
	Tue, 18 Nov 2025 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDmp2ZFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903731ED96;
	Tue, 18 Nov 2025 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486354; cv=none; b=i9DPGKdn4HSymWahx+9KfPhFXP1oLnXyu3IVvTU72NqqLf/y1RmjbEGBfEEKnnwaB42ZN61Jtfz/w0kijXnHtuvL5QXjihAT42AcIWyN4qMcKNe4HXmjmI38+KsJr/hJ62d045Bny6v3MEKDcS2DU+KoVl1VLe6ySox57GgZ/wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486354; c=relaxed/simple;
	bh=I2i0qqoXBKX8pOqnQAYfgPCJ0mlqLM4twKODsxI/5kU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E6ZH2836afIG0xSfpFCCZ1e3QC1JtuSi944ejVwxmqvfs2e/fvG0RYuz+kUCQPvTR6GMbI48D7gth1VirvUyWNfldxaC+hY4ZRdzJ+lIhTuYx4Z/mR3WFWXAP8tZ9/p5SJx+fVgsr4bhr7O1OOg5qtwiTHpWc2nttGshGYClDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDmp2ZFR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQmJw2926673;
	Tue, 18 Nov 2025 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQmDCmeI6/bsQ4i+6/bcH4ArBxfNWE8Bq32
	UP/mRbaI=; b=ZDmp2ZFRqxoIIgftPcAdPMT0OzVaS1QAK7xrk0O49frIIb4O8Iw
	NCK+WkfJsuyNraF+mfi/6ljE3phz1I7q6fGi+8CiCInsg3QVCQY3lxnvwtStTwQm
	G4761F9BxYOhRetkoosBbSrb61apSNVNo1tiBKJJjgx5pBQ6Ru5UDK9WGPRtYcF0
	dhw09dbo6zjIKErq1mZgCfYoqHrBYr0qKQWakt3ElIwqJF+31ez4xS+5Z2/dQweW
	oWmU4Yn8q089qnV2OBl/xRU0cHZ8X2s7ID5Pb6kgctVorsg8QYZyoPpZ6IzG3z9i
	xxZJE9af9dMDc2T9sbjvbpKjSZu6DsuJ5dw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2915x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHIjTL018694;
	Tue, 18 Nov 2025 17:18:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aejkmtk5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AIHIjtS018687;
	Tue, 18 Nov 2025 17:18:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AIHIiOb018681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 0EDB25CC; Tue, 18 Nov 2025 22:48:44 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p platform
Date: Tue, 18 Nov 2025 22:48:22 +0530
Message-Id: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691caa79 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X4sqO_BnIXgP0qhT90oA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: b1hvGlTH4blTEgJUm6Qa2gw-cKcekBQs
X-Proofpoint-GUID: b1hvGlTH4blTEgJUm6Qa2gw-cKcekBQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0MCBTYWx0ZWRfX1YsNimS3xbcd
 l5MPCLMHpKZYav7nfr+Fz4LhGkTaT4v+aR2Ill6FS5V3lKwECw9ZLWNzqiXQ+O6vlpMb6Ry1Jhn
 3asiL1SmhcvvZpwNNcImrIp4eO/HQ1LFuZhK5BKhnoyN3TWq4EDQwrQdBEmHc7RCevCaQ1F8vFZ
 4KoFkuvv1JZGGF1BDlRHRCsSb8N70YYe8+wRS2MyXfJrYQYPsC1WTcrbvlBzOU2QOHLbEPu7V9Z
 K+ce1UKKGJ9HTMxpGfCGMH/gHVIG1q2as77fQN9WIoHxH8vl0VC7qp8muvSkQeqUijFpQ4i0AAp
 37fX7VZROZhGmPAR7aAo2IkaE+33CSctms5tUjvwxCrL8v5AoaB6iA2Nko/b00yalG+TZREXwPG
 mT7G4tdnpsVcOOR3ZmbUHbw8NcrRwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180140

Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
This is achieved by adding compatibility string for mdss in the actlr
client of match table.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---

Changed from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f645..0b400e22cb00 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
-- 
2.34.1


