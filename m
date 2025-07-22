Return-Path: <linux-arm-msm+bounces-66116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA9B0DF9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE233177724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9772ECD06;
	Tue, 22 Jul 2025 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moIYHtoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94442E406;
	Tue, 22 Jul 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195798; cv=none; b=BfjtSL9yDuY/hpVAa2p3mTzMxDsRcwsJizV/tQGE0gg8MAectqj6hi5Y1clBfjYghKMbIfqezxLL8qgdzeaXgs4ZdGx1vFQ/hy2e+XIsRcX/j9zY658onJH7CHv/C0/MErG7F3UxBIswUT8CAYTiwl8L1QDFU8VZb/fUyEq/hX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195798; c=relaxed/simple;
	bh=H0DHi2Ayr85MLLjcI9cg68R/51EB+mkdsZl2gRfKZ0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8CKDX+vJhXaHiDXIsanJX6mjz7Zi6bw+g91f/9XBPWZhAyh3oGjo8efNCEL5ito2hdf4YajVwA3qgQicvU5GGOhpZdpTdzmfy6Va1nYt8uE4+GTaM6gjxj5FxRjaPSRZo90R1ugrhN20BV5IoOk2m496fvo04QFuZwzi+ikyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moIYHtoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7P0g4013299;
	Tue, 22 Jul 2025 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jNQNcG9max6
	s0FJRouqtkJdxm2srAvnF/3oi/2A5GQQ=; b=moIYHtoyC/QeeKo4VrckvfhN1ry
	8DuAaDxmPeNMSk4HbxtMSod7lY4wYAu0qaKfN35VclK1B6fE1Nd3JtmKIf9t/FAB
	gI6ixJ9zkvwZnOFK+QNslwDIUHiwwDAbfj8a7MWbxQ0atS8EqQTRwbwY+QN+sC+X
	rf1zzxHxYDGF6yGrIOAhFfNHs3tCmoYYgHrKXqbX9EuTlAUqJMkPu2s9gG29jHQk
	4V5wMgwYjvmDTX7YCDs3prnlJ6T6NS6L3V1N28BYUuix/be/QDmwuCOMQZcHiSex
	X0bjbvKl1Hu08u13yM+K64EZMB6qgeUKirs7GJR3ueLSaBS+oBOiYbCdXDw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3emmwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnl3A023795;
	Tue, 22 Jul 2025 14:49:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgevy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnms7023812;
	Tue, 22 Jul 2025 14:49:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnmY5023808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E940C5E9; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 6/7] dt-bindings: arm: qcom: Refactor QCS9100 and SA8775P board names to reflect Lemans variants
Date: Tue, 22 Jul 2025 20:19:25 +0530
Message-ID: <20250722144926.995064-7-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2ao_Fmx1o6l43KCIXBDk9l0_J0MLXACC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX1wrSAaPRxILa
 smUuXZKs5eH9mgl3jeCqsp/lAOOakgAf4Q45TNObLVAXlNDdroA2sm6FJ7iNRD8kXnVaimyh3Ep
 76Gj/dPu4CLkpTX5CsKk7e9joK+dV2vflijTBoC2UNXX9NYrI+8g++QGVlUe2PSuhmAkCqwCAp/
 oy/a3jFiwfJQ+wRSkPMflHABzGrIfwdOXK5AjF/OxA/xkE8ednGM6e3yj7Zt+ji3snB6fZ4vukC
 /0h8+72dIyC7m/Tu4YjLnuOoz7ROxZMaUoopMKYnHYxlxPa9mLjubsyQCpYXYVf5xMVpcIRQYa3
 Z31UnFDnIwTQiX9FGXNZs6codqBZSO5PmqtprlqX8e5shoesSjcU9dw+vi37cPZrUdcz8rugNQL
 AZOJg750N5hvf6BQ0/ChKu+IHvU6Ti1DPpmW2oN+/n4/vjv+iE6Rir98AVMH8okGiOLcxCV2
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687fa511 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HatfvUxMQJORWfWOivQA:9
X-Proofpoint-GUID: 2ao_Fmx1o6l43KCIXBDk9l0_J0MLXACC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123

Remove qcs9100 SoC and rename its associated boards to "lemans-*",
to represent the IoT variants.
Rename sa8775p based boards to "lemans-auto-*", derived from "lemans",
to represent boards which uses old automotive memory-map.

Preserve sa8775p SoC definition to maintain backward compatibility.

Both "lemans" and "lemans-auto" are essentially the same non-safe chips,
since the safety monitoring feature of Safety Island (SAIL) subsystem is
not supported, but they differ in memory-map.

Introduce new bindings for the Lemans Evaluation Kit (EVK), an
additional IoT board without safety features.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac..174ef6924906 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -59,14 +59,13 @@ description: |
         qcs8550
         qcm2290
         qcm6490
-        qcs9100
         qdu1000
         qrb2210
         qrb4210
         qru1000
         sa8155p
         sa8540p
-        sa8775p
+        sa8775p    # lemans
         sar2130p
         sc7180
         sc7280
@@ -972,15 +971,10 @@ properties:

       - items:
           - enum:
-              - qcom,sa8775p-ride
-              - qcom,sa8775p-ride-r3
-          - const: qcom,sa8775p
-
-      - items:
-          - enum:
-              - qcom,qcs9100-ride
-              - qcom,qcs9100-ride-r3
-          - const: qcom,qcs9100
+              - qcom,lemans-evk
+              - qcom,lemans-ride-r3
+              - qcom,lemans-auto-ride
+              - qcom,lemans-auto-ride-r3
           - const: qcom,sa8775p

       - items:
--
2.49.0


