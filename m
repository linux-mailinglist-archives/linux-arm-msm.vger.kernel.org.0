Return-Path: <linux-arm-msm+bounces-37200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30259BFFA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30C58B2105E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF981D7998;
	Thu,  7 Nov 2024 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQ2voKJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A41940AA;
	Thu,  7 Nov 2024 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966722; cv=none; b=trMOMBp/wk84JiK/Ao6PkNQcj93z8MgNAiJNtbm2z/S406yhP2dXVoItpgfO9KVqvMJzPEruV4BX3Shqrcc4Qr14+AQUhS3jzk/7Qqu4vgRWY1e/FtbFt8ajjDkqhkQF/D4c3MFt7aLMl7wkQVruXhiuuAgkpjl5q/Hkv0+mtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966722; c=relaxed/simple;
	bh=GLmTUcYPw4pbNYmT3E03uu9pnXnKM46hoZT26/ON8B4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V3W3qy1k5xzKuhj2yOxmwVQYVnG9SrbMqxsua/LsCxC/SEm5xmaT86pyOAgsilCxNPSDmb7tQq/NbQ0T4FduzdcHFnEJ2uLXMkHS8XT+n1vjyQ7JzB5uVn8InpvPHBLeshEx0GZTk8iUo2WZ8VfKxxoIS9UeOpd0G+ie0K8kamQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQ2voKJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A750soN031719;
	Thu, 7 Nov 2024 08:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=7PQYx5IpkhZkNsQ7e0vwVnMVVhNCA7qjIYald4fu3oo=; b=dQ
	2voKJQf4sLd8zvXh83vDS2elGRzNJYaNCjSI4kw+vNtPaoyQdCspYJ/VWUatA2zy
	Ty7XERAyGSUekVSoErvsKvW5SXiB8EzlBluIyoEnoIZad+lNT6QL2aN91tm5AgFM
	7eaBmWnNdjXz/TjSd7JIKpFg5n12skAZTFD9LRdx6KLJj6QLPhwBuj5A7uTmhqsq
	WsTbefLKXItlh9lq++gDhmP0+4+rldQseqXTJ2/y+wIOb+COVDN6QIgOwwYbX8z2
	ZYGWnc6stMpFmvjFQ6h3zrJSLLuEzn59F1gm7Ij7GrsBtY7FkgOlCgfqUHtll413
	Kcs2l2qPHo4g4qAdktVg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx6t3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 08:05:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A785CUF004490;
	Thu, 7 Nov 2024 08:05:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5mu5ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 07 Nov 2024 08:05:12 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A785CWX004484;
	Thu, 7 Nov 2024 08:05:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4A785BTQ004463;
	Thu, 07 Nov 2024 08:05:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 65F4B5013D2; Thu,  7 Nov 2024 13:35:11 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_narepall@quicinc.com, kernel@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter flag for SD card
Date: Thu,  7 Nov 2024 13:35:03 +0530
Message-Id: <20241107080505.29244-2-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JvrNl5VErNbgcvviwDdhmQ1PeBAtB0Z5
X-Proofpoint-ORIG-GUID: JvrNl5VErNbgcvviwDdhmQ1PeBAtB0Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070060
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Introduce a flag to indicate if the Qualcomm platform has a level
shifter for SD cards. With level shifter addition some extra delay is
seen on RX data path leading to CRC errors. To compensate these delays
and avoid CRC errors below things needs to be done:

1) Enable tuning for SDR50 mode
2) Limit HS mode frequency to 37.5MHz from 50MHz

Add this flag for all targets with a level shifter to handle these
issues for SD card.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index b32253c60919..14f1ec9ae5bd 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -131,6 +131,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,use-level-shifter:
+    description: Flag to indicate if platform has level shifter for SD card.
+
   iommus:
     minItems: 1
     maxItems: 8
-- 
2.17.1


