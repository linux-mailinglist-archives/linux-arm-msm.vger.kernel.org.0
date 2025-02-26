Return-Path: <linux-arm-msm+bounces-49474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4FA45C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728B91892E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0918CC10;
	Wed, 26 Feb 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cuLzNA6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D7748D;
	Wed, 26 Feb 2025 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567993; cv=none; b=a+Wnw6kF20+/C6SKANmRO4nKMNd6AHJiTc4HqC7//mWJpfmFDfetyCrl5rRPPbfzsaorJchbPB2QqSv2iGzxQnrTn24ibpnIriXRFebomDv7rMcYY8Z7U6BOkS4kTvmZdhxk3HL35hzLU1W55IfGKhZ/d+3iJJJv6LiGZB3gugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567993; c=relaxed/simple;
	bh=FQYvJmCRCA7xFIZl39uidCW3qpJzmCptnuF6lejLsHU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=X6VTsrBK/fTVeBDBfkvtM+7Id2e+pYQMpZQuxWaT26P0FQ/GqUEmw6+UEqfr676tGlfz6MZiO/AkPGXmZnsFsiNSVWLriU7BS4LpkKFPb9Xaef2meuDLg3Et03VC2CUoPIrAXAR1AxC/4NR6JQVhwNp8R6kGPXy6ZvQ5eMcwF5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cuLzNA6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9fVvq025290;
	Wed, 26 Feb 2025 11:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UHeFYe470Ck4ihLYqujzsW
	aQj02e2yaQUWT3JtZwOXw=; b=cuLzNA6n3RTbgd/qOM0ap5Yjsq23wRQEAbVeHP
	qwjXqzm3cSy5fm6gsuc+63+6T0WvYChSy4EOIRxj6n3n1cvmxsF8oqhfu5Z6Zi1u
	Fm1dE27jc9E4Ljg+kBezWdTn4AsVNLU+ZT2Rwgd1fvMDQJxhEXZduM0PJ2SeGWPJ
	1FZRpkfg3u0InI9nBOZco2zwNyQr2XNgidLl9PUSbXIqhpVD9p1AgwaHFqpxOJc3
	OqlrUW0VTd9Yz3pGfHSAMWCJgugtP97UpGXEbe8mtSKqjWbZTK66C2s+2uDCSrp7
	jKexOIgs+9jIdozaXZBAbnTFIPyRSGmT2mXrDl7dZH+oCKpg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmhqk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QB6JHg021051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:19 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:06:12 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v2 0/5] coresight: Add Coresight Trace NOC driver
Date: Wed, 26 Feb 2025 19:05:49 +0800
Message-ID: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI71vmcC/3WNQQ6CMBBFr2K6tqYzgKAr72FY1HaQWdhqi42Gc
 HcLYWOMy/eT9/4oIgWmKI6bUQRKHNm7DLjdCNNrdyXJNrNAhZVCQDkEbUg6b6QNnCjIA9WVrRu
 AstMia/dAHb+W5LnN3HMcfHgvDwnmdY2h+o0lkErC3LvYsiHA0+PJhp3ZGX+b66sKf1SlsejMv
 iwQ6i+1nabpA7n4JFntAAAA
X-Change-ID: 20250212-trace-noc-driver-9e75d78114fa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740567972; l=3637;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=FQYvJmCRCA7xFIZl39uidCW3qpJzmCptnuF6lejLsHU=;
 b=RjEdyCqHfy3FAb9RMDmesCWWPvgaPfFE2QrgS1cqg823DzuTmjv3FVVp69f1UQpDyBwFAjA8E
 FwZr2FtAsFqD86LAfo43FILAiNWsvC4ppIZcZ6sg0oV3Vr8OF0FrLTI
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8TWwD2wNAm1Potk5ZnxQsqBVIeWTVbGr
X-Proofpoint-ORIG-GUID: 8TWwD2wNAm1Potk5ZnxQsqBVIeWTVbGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260088

The Trace NoC is an integration hierarchy which is a replacement of
Dragonlink configuration. It brings together debug component like TPDA,
funnel and interconnect Trace Noc which collects trace from subsystems
and transfers to QDSS sink.

Compared to DL, it has the following advantages:
1. Reduce wires between subsystems.
2. Continue cleaning the infrastructure.
3. Reduce Data overhead by transporting raw data from source to target.

    +--------------+                                         +-------------+     
    | SDCC5 TPDM   |                                         |  SDCC5 TPDM |     
    +--------------+                                         +-------------+     
           |                                                        |            
           |                                                        |            
+----------|-------------------+                                    |            
|          v                   |                                    |            
|  +----v----+     Dragon Link |                                    v            
|  |DLNT TPDA|     North       |                         +----------------------+
|  +---------+                 |                         |    TRACE NOC AG      |
|       |                      |                         |                      |
|       v-------------+        |                         +----------------------+
|                     |        |                                   |             
|              +------v-----+  |                                   |             
|              | DLNT Funnel|  |                                   |             
|              +------------+  |                                   |             
|                   |          |                                   |             
+-------------------|----------+                                   |             
              <-----+                                              |             
             |                                                     |             
             |                                                     |             
             v                                                     v             
    +----------------+                                      +---------------+    
    |     QDSS       |                                      |    QDSS       |    
    +----------------+                                      +---------------+
    

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
---
Changes in v2:
1. Modified the format of DT binging file.
2. Fix compile warnings.
- Link to v1: https://lore.kernel.org/r/20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com

---
Yuanfang Zhang (5):
      dt-bindings: arm: Add Coresight device Trace NOC definition
      coresight: add coresight Trace NOC driver
      coresight-tnoc: add nodes to configure flush
      coresight-tnoc: add node to configure flag type
      coresight-tnoc: add nodes to configure freq packet

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 116 ++++++
 drivers/hwtracing/coresight/Kconfig                |  13 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 400 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  57 +++
 5 files changed, 587 insertions(+)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250212-trace-noc-driver-9e75d78114fa

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


