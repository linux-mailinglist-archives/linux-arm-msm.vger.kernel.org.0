Return-Path: <linux-arm-msm+bounces-35303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5C9A93DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8EFF1C21ADB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A55D20012F;
	Mon, 21 Oct 2024 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzWeEsSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93417200138;
	Mon, 21 Oct 2024 23:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551922; cv=none; b=DEEPdGgeKSZzQF17D92qbozNGMsxbpj/pgNHnxl+fzTuJuyuUkRTHTzaF+7Ywa2UJHfFO9AP/ECFuri62VBKu6AmXDu0S+G+v/+QXK1LNS4GUW2myHSU4WBBfaMk2/LpJlqdS2EB8BG7XAI9Z6YD3uw2PTR/VEvXNBoZbeAUSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551922; c=relaxed/simple;
	bh=fOSlEmmEIsnWCUZBTKW0FFzejDbSeWWeNHIor66EZmU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h2vRHe9vxboqLm3RAPQpxDCNo2INFsEIqUpXGlEQelGetjkSYIz+MapDGZoqA3HG2O5rVYhdlEbZKHNbKdXDLbnicMOgOPOuMTlhfOsWYlwEI2m1m/eIB1/JeccyLOemzrW1e7ASdLSvwG2vIciuZtSoD6x+wGasQuS8PtqXsYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzWeEsSt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LEA2LM023030;
	Mon, 21 Oct 2024 23:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6vvPEYFiOnVRtcGe57Hx4w
	kUVRrQbOcvogOwjKr1r0A=; b=lzWeEsStBIdiSaVp2wsOmTe5IIypUqS+zE/5zs
	irE4cDWwQWf2HlOtqhEOE9zWRDr5Tzkf6v3eUBrIKpVFgamAY7ZJvdEZlp+enqYx
	yCe8rqUmYGNKP6HfTLhfaPs/WhsPscttSqgzsNjUvi4umtNHC0g9LmSZXafW9Y7N
	x8mQHs44Sa+Bb5ZTMcjPuhtQ/qD2n4d6F6LqTeFksgUq6vIkMUShlfNJe4att3Af
	pygYyUj0TgZWtPAOMYRDNBpZysLmKn5wqh+rgOkQ04w/mVVufXrTl7Tpug78EwnU
	A2QcPQXCcWoDAM38K51JSZyijDL0NjYNz3/P1fTq71mtQEIg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1p6wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:05:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LN4nOt001881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:49 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:04:49 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Document sm8750 PDC
Date: Mon, 21 Oct 2024 16:04:39 -0700
Message-ID: <20241021230439.2632480-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VENCjPLwvFp5K9esGiwW5UOqEqMcfMT-
X-Proofpoint-ORIG-GUID: VENCjPLwvFp5K9esGiwW5UOqEqMcfMT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=962 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210164

Document the PDC block on the sm8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0..01520995ab17 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,sm8450-pdc
           - qcom,sm8550-pdc
           - qcom,sm8650-pdc
+          - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
       - const: qcom,pdc
 

base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.46.1


