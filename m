Return-Path: <linux-arm-msm+bounces-27196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE3893EE41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5772812D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 07:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB44F84E11;
	Mon, 29 Jul 2024 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D4D9EzsK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB084DFE;
	Mon, 29 Jul 2024 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237307; cv=none; b=eS5QdDEjFZv4RAfjfYU3K1z4mCk/8Em/NTFuE53IMenx+PfOLQwMg7wRrtW53RxwCx1ljrtBEqOve7u+G8R4pxjug5AMgOz+I7urnVOiRBmuWezIo74TM3K+/SdnSGL8V/gkIbSOXDLgKz06eJ2XuU8obfEBtbNoumRWByx+XJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237307; c=relaxed/simple;
	bh=p+kMYoCqopIqjB0ZnWzHMo14l+bO+m/GWLd7efYkFOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1y/oYV4GYGisdIO6aCsPH5n8k+hOzxlPxuJWWJIr4M/jrL8xURztqoFlYYYjsdkVKqxQLkwdL4uMgd9ankKxi9SDdkCRFAQ07acHXEZaRdBS5AdOxt2CfwocaG5pgEMEOT29dfaD23eS1xpTzqKhxQhJN6fmIspms076AKrunE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D4D9EzsK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNjtmx030100;
	Mon, 29 Jul 2024 07:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fiogdyaFFXZ2IJKfAL7IwKeAd+42F1oUuYPu/hb3wmo=; b=D4D9EzsKzmUVboTf
	/Tgu6lPHlbqcoM1v5T7wY2uANrpQyT2GOJP+cDelOBVHJBS65ETii+YOOq0xpxTS
	TXRxrw15w7QHv5MKH8ZVGnnaR8gY3u/Hq15SwnKblmtWXVzUli9CvrVfBv8C4cI1
	+oiI/o3pQ3C8erI4vPIqAtJQn8RB/zTCIOE+x3yFFRYlgIxidNq2TYB1e0mLIFqF
	Dd8c9hBJXqEOZones/xW3TLizylDUqc8DXxKZGgC5xlq4piCBjKoNpJxvV8aTDlh
	12or8qutv7GOuhRQ0wtVd30ux/TaFKE8em9wxWasDOfROh/qu4XyugWlRJkDA6GS
	rUgSJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqurkb78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T7EP0C024951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:25 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 00:14:25 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: arm: Add arm,trace-id for coresight dummy source
Date: Mon, 29 Jul 2024 00:14:09 -0700
Message-ID: <20240729071414.5410-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
References: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AdPKRj-fwVXCvPmNIVtKLJfmnPFTKnih
X-Proofpoint-ORIG-GUID: AdPKRj-fwVXCvPmNIVtKLJfmnPFTKnih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_05,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=942 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290048

Some dummy source HW has static trace id which cannot be changed via
software programming. Add arm,trace-id for static id support to
coresight dummy source.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 6745b4cc8f1c..ecf3ba9cdd22 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,12 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  arm,static-trace-id:
+    description: If dummy source needs static id support, use this to set trace id.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 111
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.41.0


