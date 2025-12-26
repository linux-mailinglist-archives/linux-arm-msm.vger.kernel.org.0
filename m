Return-Path: <linux-arm-msm+bounces-86631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09468CDE68B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 08:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F5E300994B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 07:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82CF2D640D;
	Fri, 26 Dec 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBoUKrBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8D212560;
	Fri, 26 Dec 2025 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766732752; cv=none; b=Y/65adIbeHeKBQ5dAtsXzyk2nPumxA6NMghAHnsUQ0+8bOd5vg3iupj0asGBDS9KVpIWyJMZISws0hVBms2t9T0rDCvkbAL9JjFT5FfvsZjFyzm4F+UKpiO/XgKoeuATQmGusHvsNO9abzEeOH07qFhkL6SotKtQrhMSsvBeeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766732752; c=relaxed/simple;
	bh=k+gqVIVCo5hukAUrG60UrUXFbWThlqre4SfmiKtSX1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7Zk54Lp9oNKJf8TVfeeC7HPxpKHv+pbWIRVVVZTkgbUE8fpaKK7tywychsleXZ1Zca5Z8V/B7aii2SxtakiW4U/v4aZPGJCvLPVkk230/1qULnACkI+o3enhTLnrI5HDPpArgMvx76NDazD10XV6zdGMJT2Dd6U2NgkFdAB0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBoUKrBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ2v56c3595689;
	Fri, 26 Dec 2025 07:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6Ey1mtSvMtA
	BSYNzjei1a6ESqne+7daOqxRwc6yQY5Q=; b=JBoUKrBaKL/TD5xV+LO5UpGjtb8
	wfkRtccdgQw+BOFKnTxid81vvgs+ubnO9LQzfRVwxzxUhOZIfjAfiNfVYNTKJ0cy
	wOcKjhXuJMD0xBKeU8PleS6edDJmVkZbJRRMkWeymy5CZobInZ8RmDmeI1kbmZub
	L9UQTmmtp7ugnCKDfh0gl35RJGZCUTiAvEqM2qlEjb+H+WEsIiJXqonqobs+nGoy
	BcEX7cWlOMTxt5bCXpqktdiDfroB3fn/oUS5XH5FIyHG6ypbRhZqh2+ypAiQ9V+9
	lZ1LSCsTAwi3WuFI7zJGlGJwd1vepkdR2GQdgFqGcLfQVkgx6upUMdjPaeg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9j1d8equ-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:05:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQ75dmV023349;
	Fri, 26 Dec 2025 07:05:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn69xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:05:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQ75dgu023351;
	Fri, 26 Dec 2025 07:05:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQ75dce023350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 07:05:39 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 8F7BE576; Fri, 26 Dec 2025 12:35:38 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: [PATCH v7 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
Date: Fri, 26 Dec 2025 12:35:31 +0530
Message-Id: <20251226070534.602021-2-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FN8oi5mtD574vY1NcBzdjWs9hnL1XITq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA2NCBTYWx0ZWRfX1HAketEDSb+n
 bcoA1w4uOafNA2VB4yjoDhFT3ro+ektWed6QuqTzj7pBIWx1VEqL/ZvHcAH5Bk8VC5XtOq4/Xta
 T25CR42UKINdPEg6NhIVxEpwqU+dJ6yy0KX8hstUWGV7ILGkgD1FOZ9atWOwTykPTU3SjnS4UJL
 4SAv3QM2d7vJMJwF8obXOhTBp7JRGP19sd28dy5vWxkCF4Jfp7D1fcjQDvcxt6uP/8iwd7LCrvL
 l21A1t/BuyCax2R6JzZlZNf48iPvSfJl3bblIkAIGL9FbDp3TB6xOpXd+HeZbMv7XkMwWWTMbnS
 SpiaY7XxaXZDGufkjqE1ezPTr8FmjF/A2GG5gm68mqOyz3Q7C10xoNT8+4NEAriBCgah+Dn1xKB
 5VTXq4HBsWHqmcTdNZTL8YoYv22rO6F5TzNMJqpYNzVNf5dpcrXZ9pBixSVtgFDDad8QlrQTWbQ
 9to3UQ5DEPErxWhBpOw==
X-Proofpoint-GUID: FN8oi5mtD574vY1NcBzdjWs9hnL1XITq
X-Authority-Analysis: v=2.4 cv=Z5zh3XRA c=1 sm=1 tr=0 ts=694e33c8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=YSQxBCvXrTrNkw4t54MA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260064

Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
that differ from previous SoCs. The SID field moves within the physical
address, and CDSP now supports a wider DMA range, requiring updated
sid_pos and DMA mask handling in the driver.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 3f6199fc9ae6..d8e47db677cc 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,fastrpc
+    enum:
+      - qcom,kaanapali-fastrpc
+      - qcom,fastrpc
 
   label:
     enum:
-- 
2.34.1


