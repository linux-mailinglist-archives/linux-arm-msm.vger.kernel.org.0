Return-Path: <linux-arm-msm+bounces-80928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8093C4532F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738213A2B13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BC328B7D7;
	Mon, 10 Nov 2025 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhE/Zrnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF221D3F8;
	Mon, 10 Nov 2025 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762759484; cv=none; b=HR6eLS5hjAGLNOam3OB5SbtlQrKiJ7+JSEobp4afTHR4WQ9BF9hEeDrymcmmY+fx14VgQSWBAeZPk2MfjqdRo7HKqe9SHxCeN+jNZJRhr6z/SxXZmPcnzytV8HjYlbbLRvP3Lf3jj5BGCHpvSkdA+sjG0AdCVKUgReYQkrXqwIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762759484; c=relaxed/simple;
	bh=18MWcfsgxmBDoj9N5R3R2o6T3RjE2Z+XkAXjE+2iIpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hBjc1zF6ZZ66lPOZdpSR8THTvhZAlOmPcoLQUVn4AGjigtdA49BdsmRiJ/ZMMP2zYAiGMQNPTi6aLraSc67lPseodwLMR3Pyg52522z4jbJG2lzX73Bymte6jNds7kS1zBsmNAuNMdJno72g+8hZmEKlH181jcbZ4/56sfIdI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhE/Zrnr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LCrMn1365169;
	Mon, 10 Nov 2025 07:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=myrIhdNs+vtr1YWjneE3T/3OnrXrV9rJ476
	LkbbEJFE=; b=AhE/ZrnrC2mBhP9pirI2q5S9vgSaexKo4VdQ41XhrjgOtbKgKSI
	4IiQ/uQ3iK1j86KxCvPJeHjGvbteFAQ7b1Uw6/jdzuzL3uoL3z5xB30RcFms8jSC
	glpszPHaQQXxz/3BPmPUAjx95cY06h9q268PinnQ404XQzndYUz5agzmp0G2QUAx
	UOsRsb9iBD7zd1OPlFQW1mLRl0pPlzMCD5ZAq62T5xb0UrB/kDyR1fDX0CElv9Yp
	+ChBRV0DcPzO6rbT9tOnx+/n2/Q0hf8mRS7co/HnxioigM8XqZfH0+5WBuvsIXdQ
	YGUCYE/HDwz5ZPwI5VPcCWB5qkQuEit3SIw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab2nxh3jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 07:24:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA7OYl7015982;
	Mon, 10 Nov 2025 07:24:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkp55w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 07:24:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AA7OXiU015977;
	Mon, 10 Nov 2025 07:24:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-bvisredd-hyd.qualcomm.com [10.147.240.98])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AA7OXRS015976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 07:24:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4559132)
	id A59EA517; Mon, 10 Nov 2025 12:54:32 +0530 (+0530)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        =linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH] media: iris: Change psc properties message to debug level
Date: Mon, 10 Nov 2025 12:54:29 +0530
Message-Id: <20251110072429.1474615-1-busanna.reddy@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: IJN0sKQd_vERlKT7RGtVIMwpqXJM4Lfm
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69119335 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FkQ0o8-owYvCWldT1V4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: IJN0sKQd_vERlKT7RGtVIMwpqXJM4Lfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA2MyBTYWx0ZWRfX3ipVdNAxA1Wa
 cF2E1LQuQzb9bQUdKHzxFDZ5/y3+IKZO279SeKciwHn+Rds9iCgAH3mvYA2hrsMowfcu8qlbglp
 XazRJS6zRXkcE+JJlgoVfQ8juvi49kYsZZLkejPhhHP/aK1RLUA1iPHSvE0GRAY1eu0GjCnZoZ2
 Nr4WY/BiUzpQxn6K3jSgbA28ONlVfK7VzuCrRaAiZxXLsR4Ig4W5sPOuqZrEx3t84piupn+X6wR
 oF7N1aODoEFXs+s5Wue9hztWleVsaBW/QCPrRaPtqz3m/WP/bpvCxWz7XHN/Psug8gYDgnuKsyf
 yCBcbrmZu7FGr54BhgjbDRwKbue4HK/E3nzCBDkEBQa/IhMWy/RoZDyIt+vGJTS1YpggKmJvs4T
 OTXXc2u/8kbj6Mn3tI7+MD8u/N/Kmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100063

The message for attempting to set already configured input or output
parameter subscribe change properties is not an error condition.
Move it from error to debug level and make it more descriptive by
indicating which specific input or output psc was already set.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33..ff29e8a4808e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -760,7 +760,7 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
 	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
-		dev_err(core->dev, "invalid plane\n");
+		dev_dbg(core->dev, "%cPSC already set\n", V4L2_TYPE_IS_OUTPUT(plane) ? 'I' : 'O');
 		return 0;
 	}
 
-- 
2.34.1


