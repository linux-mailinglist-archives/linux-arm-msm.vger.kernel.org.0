Return-Path: <linux-arm-msm+bounces-31452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78D974B78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303271F248C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 07:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5713D524;
	Wed, 11 Sep 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kO+CdVOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602013C9C7;
	Wed, 11 Sep 2024 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040075; cv=none; b=Q4G2AqOyCeJoxZZgotso2OgW8+KI6IUxlDyYb+lDCbnHRcqKf1XY2ezCwPUbGHBqnXk6bkrg1P12LivSakVy5Ohgl/8L0IGDpejrPBZnb58M1iZJkbiMwWMCqnrMhoEQpMGhmgA+vm0U+SM08gZvNoFDmPnbvQr11sNcS40E5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040075; c=relaxed/simple;
	bh=Wr4P+XgFo7R1G9bIw6dm9qp8Tyt5MNc/Y5lFNnCEPUw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1U8PEGgYiZa5aSO0UWvbm+C9KLKgHW0RMvDk1tT/lDE+8oyfbmQYDoZogGRZ9Fe5I38iS6s3rjsWK0CsChM7PBj58kTa5Gr/WkP38+McZQ6pketj9zTgU253iJ9R1QK1Z1OUSaD9bSvvqn1EP5LBVLhyWpVrtezVDKn2bEDB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kO+CdVOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3BbV6020198;
	Wed, 11 Sep 2024 07:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3uOJ8kobtALPW9xgvY5dj9s681gKQ0AKTWjBUM/Mek=; b=kO+CdVOlZ2gHHACP
	wfG50JctD5MkgyoGeVzp8YdaJseu+XGE34q7//75DYjmm4g4mnRgQ3gluAqH105E
	HeM1FC4q+fBI6F4Kh/QTH2/U6Baduz56s2ncXkVuMWqlgKv+fsNJTMXSdSO/YdKx
	PRLsCsD9qkkVhe+K/0Err7xeRA3oT3EYB57PRT3lSoFlq7sKj28wCJ2YTmGWR0DZ
	hZHHYi2LzaMMS40QKZqAwvkAEsjjBD3j7g7HagL98W4MAeTGDqle0HujkfW3ITGH
	KCaezavTf4nJTgnlHvEednHqBXFJGhS/ujRnbGj1fHEoN4JKHYappmFa8NA2d5FL
	H2QjUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dyxt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B7YUgq018617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:34:30 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 00:34:26 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
Date: Wed, 11 Sep 2024 13:03:36 +0530
Message-ID: <20240911073337.90577-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911073337.90577-1-quic_sibis@quicinc.com>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wxM-l47ebqbOiX6c9pfWUbmpidiFcVFF
X-Proofpoint-GUID: wxM-l47ebqbOiX6c9pfWUbmpidiFcVFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=956 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110056

X1E001DE is the speed binned variant of X1E80100 that supports turbo
boost up to 4.3 Ghz.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..6a8fc031e51f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1049,6 +1049,12 @@ properties:
               - qcom,sm8650-qrd
           - const: qcom,sm8650
 
+      - items:
+          - enum:
+              - qcom,x1e001de-devkit
+          - const: qcom,x1e001de
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s
-- 
2.34.1


