Return-Path: <linux-arm-msm+bounces-25332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC2928432
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 10:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64FDF1F23B3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 08:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9F8146A60;
	Fri,  5 Jul 2024 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o7xokfJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB41465A5;
	Fri,  5 Jul 2024 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169565; cv=none; b=P9Ow/ud94u/K2JU3xPumVDB2et8ucCv44myNOSXRCoC3yFq41o0DUKQNyuYt5LvMouCW7gjhd3FNWDvVdvafG4T77IDbUVdcCvdENEGvpPzEm6h5OMq5wxittaBs2ZKYIqzmvN1kW9BzZqmT978Dzcp0FqNxuRofvI+d8GOGbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169565; c=relaxed/simple;
	bh=SIUGlLhRKeAIPZM7QHaGnWK9y015nY4Rn5oVChh2JoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oy+9IGZuFllW8Bne2+iiRXMrthlpGoP0RxkaSUgoPcHrgk4+yfG/5BMAC7wtkameKU9Rix6XH05QUTTX/icvKnc12X4gPMr5aNesVagEUcPKhCYumIWIu0t9W4kvP8fg8Cb8S3zSgmDc7ddn4al6j0xX9BbrmcoERqG+n8PZPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o7xokfJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464MQLbm003870;
	Fri, 5 Jul 2024 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Of0iC6wmtBTF5LgwlZ/weRxO
	RI5wtjHBJTrC8rZIsio=; b=o7xokfJEmXfOg0LPESHzzRvcO9o/XSgDVDFvTyr6
	9XmkLqrl0FNmss9hgh0L7DEX1lAARcD9zJpgz8Mq7Miv+OZ/5Q5UXVieiICidNK6
	TY5RibGNXcVi5pJZ7JcEegSIcdryBCadK/CUO0hxVgwmseWszA2BnMt7can+pLzc
	4P2UbzfnqeM/yeNXG4Sw5W0k5E4K3Ma7KmW8a1GfW7NNWZ0/AfQwVAFpajzE4XPO
	xr/aRT2b1/milFIiwwHy9uPgtPbCeWuTdokcWkH1graGrG+tcVjxMR9U31AtjIVv
	JljoZWFBU7IUxw0tughjnAIGATxduC2OO4fW0sfrZl4KxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe3r1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 08:52:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4658qUZv019661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 08:52:30 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 01:52:25 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
Date: Fri, 5 Jul 2024 16:51:50 +0800
Message-ID: <20240705085152.9063-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240705085152.9063-1-quic_taozha@quicinc.com>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IIThs8QiZmlXbcbqiQem81RmUIKR9UYW
X-Proofpoint-GUID: IIThs8QiZmlXbcbqiQem81RmUIKR9UYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050066

Add a new property "filter_src" to label the source corresponding
to the output connection for a static replicator. By combining
a funnel and a static replicator in devicetree, a new device that
supports multi-port input and multi-port output is implemented.
In order to match the output port with the input port and
successfully build the trace path, add this new property to
indicate the data source corresponding to this output port.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../arm/arm,coresight-static-replicator.yaml   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 1892a091ac35..d9538563f9c6 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -45,7 +45,21 @@ properties:
     patternProperties:
       '^port@[01]$':
         description: Output connections to CoreSight Trace bus
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              filter_src:
+                $ref: /schemas/types.yaml#/definitions/phandle
+                description:
+                  defines a phandle reference to an associated CoreSight trace device.
+                  When the associated trace device is enabled, then the respective
+                  trace path will be built and enabled.
+
+              remote-endpoint: true
 
 required:
   - compatible
@@ -72,6 +86,7 @@ examples:
                 reg = <0>;
                 replicator_out_port0: endpoint {
                     remote-endpoint = <&etb_in_port>;
+                    filter_src = <&tpdm_video>;
                 };
             };
 
@@ -79,6 +94,7 @@ examples:
                 reg = <1>;
                 replicator_out_port1: endpoint {
                     remote-endpoint = <&tpiu_in_port>;
+                    filter_src = <&tpdm_mdss>;
                 };
             };
         };
-- 
2.17.1


