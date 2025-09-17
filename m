Return-Path: <linux-arm-msm+bounces-73946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC533B7FE6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18308720C47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C512EAB6A;
	Wed, 17 Sep 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gl1abHEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA72EAB61;
	Wed, 17 Sep 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118221; cv=none; b=uqXtPMiUUPFF35shHJFNT5YGt+Sxk3+21bfGXWYYFuk7cJBawBbjegacwnjoF7t3JvZYGyRFomcKKi20NhZvfn8Wcg0bQSdbpTW2/trtmXbvOZieaLpXJfMk5SaBQuWYPUgL9H9TdzMXOkPv7Ibtr6IJuoFC8v1BzyWPAnh1rQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118221; c=relaxed/simple;
	bh=RDwQVEI2JEcFxqNQXhzD3P747ZK6ijW0oZ10/EpoiiY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffzlTNpAodUNqV22dKhIrk18ug2QNEMsmT0g26kVoaEL6BXitHULrrvEhFEo8RyMP0FOHW2yU6+RfRsobxVQS9R3JDJZn4JLhs9xzXPaBqsTLRdS9QRss1XbaQN7/uer44luK0cg3ov6fsw7e3bIh1tijql0FC4a0hO4dONWm5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gl1abHEt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xe7o027278;
	Wed, 17 Sep 2025 14:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D84G9Ja/8bUnpt3WKsXjeE+aNpUyizA/nJyKRQt1WoE=; b=gl1abHEtyfd0R0vj
	PSpTPNxQlY+RqFIbZ0crILz2FwJx9UeOFBLT5529/rZO0xnw5DGO7Nmz4mKqA8HG
	CgCl0wTHvige6iCcOUmo4rbqmcVj+r3Vsi4dMqKpLcH9x1yfZdJrUGi+Op5fKIyQ
	13sCv1L2cxu3YjNBdFgpHd+vRNo6ZWZT3M/1dpRXxdwcHI7oFyQh1ahjoxuKQA1k
	glJHRX/ev3lovliaMAEm6SMOojOclrOmySNGvf4/9x6ryrnjoZ9XoPGATzsuRxd8
	rIMcPHiP3/F7wkoX/W8Uqzp999EPl4BJw8gSZAYhsWPyRP4pXDomVwj/YG8Q6umR
	618lkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjn3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEA0X7032339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:00 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 07:09:56 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V6 1/4] ufs: dt-bindings: Document gear and rate limit properties
Date: Wed, 17 Sep 2025 19:39:30 +0530
Message-ID: <20250917140933.2042689-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5b9yG6+gUiXw
 UT+gfLEj5QuOZMXND/UQaqooZtN7a8Vn2tYs3mo71YchF9q+SupzQoST5t1m8h4hKihc6Pfu0C4
 ik7UZCAc1OHxfSlMMVzVgfFG+KpM4nD11ZTxqGo0OCMIzPpIP2dHZFTngcZAZ6LvHrdkfWDxkgW
 5wTvP3tq/fSYmlef7mbC2jh8LHq/zze4eu0EHHqebKQ0Fgt4uOgOomiFDFTCVIemlMhizT11MA8
 T6umOQevIFPE8D0XghbR1Pqn5xAgKWmcCPPiE/LgfnlmQoPdeIqrtCFyO+FUqpH9ktQl9B60o0e
 NFA4RP3sUTlR7c4jfbVElyRsa6QruWat/dk4vbLny+4zPTHymlGT/L1a95UvxHDgDCptsm022NI
 PTclFdhp
X-Proofpoint-GUID: TEoo1fIM5AZW2B_75ybZ9R0y8TeJfUro
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cac139 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=ch6uAJVby9jpsUUvIWoA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TEoo1fIM5AZW2B_75ybZ9R0y8TeJfUro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Add optional "limit-hs-gear" and "limit-rate" properties to the
UFS controller common binding. These properties allow limiting
the maximum HS gear and rate.

This is useful in cases where the customer board may have signal
integrity, clock configuration or layout issues that prevent reliable
operation at higher gears. Such limitations are especially critical in
those platforms, where stability is prioritized over peak performance.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/ufs-common.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 31fe7f30ff5b..9f04f34d8c5a 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -89,6 +89,22 @@ properties:
 
   msi-parent: true
 
+  limit-hs-gear:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 6
+    default: 6
+    description:
+      Restricts the maximum HS gear used in both TX and RX directions.
+
+  limit-gear-rate:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [rate-a, rate-b]
+    default: rate-b
+    description:
+      Restricts the UFS controller to rate-a or rate-b for both TX and
+      RX directions.
+
 dependencies:
   freq-table-hz: [ clocks ]
   operating-points-v2: [ clocks, clock-names ]
-- 
2.50.1


