Return-Path: <linux-arm-msm+bounces-76688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F9BC98ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2F33ABA3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628372EB858;
	Thu,  9 Oct 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTT2hTGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F41298CD5;
	Thu,  9 Oct 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020777; cv=none; b=U5/g/BPQlmdC80/+3duRA6aiZVTRbA3WauZmcVWOUFHa87MgKMLoAsd9tau4q6ymtoMEBCiRsYPgLMrQO587+dV2R9VmU4BJjksWSSamLi+juClTcVdW9Cd/JaO1jzUG+r0LFeNSwe9Wr7yWw/mtA+ZyALyizLlqhY6VymXkud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020777; c=relaxed/simple;
	bh=KH4GDbQbBovk77zO4RXctLr7e2sukLxmKtNWW/YOHL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NangcTyT3fo1dF5uC6OMKFaYYTOwCXNOdktLx+NxHp4Mi+4Fps17o0eECw2Og+ifML+s+Sa0Bn+Ootz8u90vDXJghCYN99np/3lkKlTkQ4TRhrcOKCUTRK8OXyS4AZIBHPxra62p6gAZaTxoOYEELN2Fv4sTnPST0gaGJkaYmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTT2hTGU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EIjeB004574;
	Thu, 9 Oct 2025 14:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jtg5NHdZhIW
	38/gS7syuUGjAtmp/clBK48J1dhUnjek=; b=PTT2hTGU8DTK1ym8dMuLg7NqZR+
	2AF0G2Wpx86NqA2Oib+GjTYJe94nKFhDKNlCI4IeqmIZg2M2+X3idpO0mKd3SekP
	15UT8vOqnwzuGAMLz2aEdHD7SbuYufxPHck1oGNnhs87ndvmXqJP6uhU3Vwvc2Lw
	zJfgVOHTr7EKMPRhIx9XgBVLH+swOM5s6DPOsJ0cdvvsnIIeEKyyob4JeeQ/kuUC
	WgA7Fzyc/XfMT+R+nOX3Z36/boALjNMNIMwWAdlVJlm9+GiPQ0N95ycPpXI9Vcro
	T3l1J/lsIFZB/UCX5xAxzuTO/4KU8ZbjZAUsIxzsOo3ToOUlIyloe68fSCQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j37se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdK51012505;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmddpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 599EdKon012480;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 599EdKcs012473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3F8F95D0; Thu,  9 Oct 2025 20:09:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com, kernel@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
Date: Thu,  9 Oct 2025 20:06:43 +0530
Message-Id: <20251009143644.3296208-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: sDPmi9Oy06NYcZiMbMXrDHQijMgXKfda
X-Proofpoint-ORIG-GUID: sDPmi9Oy06NYcZiMbMXrDHQijMgXKfda
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e7c91d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=O9amS0TZr_c9kjyk9PUA:9
 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0ASPOdI+QlTL
 5R5dr0+FQIU84s+pvZnKQ1/H3P1Hp2QnI1V6eod3G3WLPOUjaWTQtniwy9Kma8Fm5HTH9blvSMP
 AYUhZuJRSUqsSTLBNj6yhWhZn9OL+ZuBzK8pcLPFDWd5gRCYc9BNIqW7rwyarGShb6hJ7hMWc16
 iqIHo0vwH74fvOMMSqCJ/xaCT59KNmNyfOUBVtBT4EHIF9goKFMM/+RRBojuRAsyXbGUOEFhZJd
 eSeSrPcoZxHSpdOfc4yDTEEnDBHlev2B0pDPQ1JdyXwV5vdPpQqI+8w0HqrdRvIVxeRBtZd0CwH
 GlKjDv/Qc1SQ28VM/EOaPkO6hW0thE2sOFofMVjT1/av+xZR7P0mOZhQvyXdn2jqmXdYAxRrOAa
 5qyhBV9QazJyhbT4PqKm64ZHad0Y/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
SoundWire controller versions. This version falls back to
qcom,soundwire-v2.0.0 if not explicitly handled by the driver.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..1c4b0bdbb044 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
+              - qcom,soundwire-v2.2.0
           - const: qcom,soundwire-v2.0.0
 
   reg:
-- 
2.34.1


