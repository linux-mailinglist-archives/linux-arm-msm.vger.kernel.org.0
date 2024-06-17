Return-Path: <linux-arm-msm+bounces-22824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727D90A9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDEB91F2669F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7011940AD;
	Mon, 17 Jun 2024 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GKasLyQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00D1940A5;
	Mon, 17 Jun 2024 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616943; cv=none; b=XQAcu8kpYHfVEeflpE7Dq6+UH8BoJBTK+1q4gnSL1LmlFSwJqFV1E/UBG4ulFhlpeNZjcjFDNHbdwDXWwgN8B/5X/wKUG8ZLwB7rMdBg1g4oNOCPfzmi4uqiErxh1iIl3FXP3S6BjmajpwVapLgCREBQzAnlLJsgiW3mYqSDkRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616943; c=relaxed/simple;
	bh=LALBUUvW8Kse4AhvQYhuI96Q8Xbsr3W50ZfHimcXO+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgSp1oWP8wEwE507xApayJN5P6IbsXJ9e7/+lJ9Mz5GQ/miw8hdWG/14AhhTREUdhQx3aWtvM0n5Y5zDspdoNBvFg534RIqayca3sOIEccqm6bDoGEOgymd0AhSo8vuKahNb+SeOeppimVu2NJZBdhyjOiL7htp5drrsp2m2FpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GKasLyQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H1U0IH022935;
	Mon, 17 Jun 2024 09:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+1LjJSyI+pTyeP5ZzKsfVjGJZOz9Q+/39izIqoC8ek=; b=GKasLyQh4Bz7a2BD
	xan6yGKkZmqg9Wdz1xg4pa+lnyV80VrZmvCB0VXoWmzBAr95uK53x1rCKdgX07xG
	PjXYQOYSOqlsbpY8RcZKTkmpsYyIf9T4oj3NQGlyJ1uZtP9bvvCpaVZvA6GmQ01c
	lA+GqMi3sUcpx/680mMNL2CIzicqacYN3WoxCwu/Su4NVFJJyKq6hRastMePHSIR
	g2JXBtMBBhMz0JJIwod0BjBl1icUaiDD3f4j4U80l5Nkj/fyMmQEK5aIbCxIZvW7
	4DJgJBfMOIYEDylh4a9Ru2nknyOE7F6lelY07xj6/+rcqsP/fOmFnrZidrOSDo9o
	B35qEw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1wr38v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H9Zc0s021033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:35:38 GMT
Received: from hu-nainmeht-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 02:35:34 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
Date: Mon, 17 Jun 2024 15:04:24 +0530
Message-ID: <20240617093428.3616194-2-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fHScYGxBslwZBNFIELgQaYFkzAmwrzuu
X-Proofpoint-ORIG-GUID: fHScYGxBslwZBNFIELgQaYFkzAmwrzuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170073

Document the MPSS Peripheral Authentication Service on SDX75 platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 73fda7565cd1..d7fad7b3c2c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sdx75-mpss-pas
       - qcom,sm8550-adsp-pas
       - qcom,sm8550-cdsp-pas
       - qcom,sm8550-mpss-pas
@@ -113,6 +114,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sdx75-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
       properties:
@@ -146,6 +148,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
-- 
2.34.1


