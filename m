Return-Path: <linux-arm-msm+bounces-34676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679F9A18D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4066286CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 02:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C70762D2;
	Thu, 17 Oct 2024 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ni8FYcvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16F3B182;
	Thu, 17 Oct 2024 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133606; cv=none; b=OUsIHPDQR00bgH5YbA4gARqi2MG5bV0/nA/SpdEG/Towqmj9PZbdc4sZvZXho2ZojLxa1CLNRIRr5TCp1E2o6uKjwS8vgrTeWy3JggOWlppRaOSychtgDBUiehm96N4Xvo8CBIexdODwkiMUKdcLM4xsWIdaQLrETgNdBzcGlTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133606; c=relaxed/simple;
	bh=pCe+DRIqGojD1uxTS6li3Le9i7pO/VfTLpy+qPqO2PA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LBC57iSdJkL6menbPIl2mapw9CeXnykGoexC7kueEl6ZmS7PTX4sAvQFDXYBD9s4MqxzgdGdTX3yOgl/nP87IShBsYQREnBF+bMjzah1+py8PT4Lru3TRUgJ9JHRjpPty/5/UUNnE4SPVsYucA3Gtq2sFdeEHY1E/mVRzx2iuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ni8FYcvK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H0MrSM009999;
	Thu, 17 Oct 2024 02:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xy5WGyq1hpi
	TsN1rkSEAnzQ6a9t0/AnqroWcj7P+7rw=; b=Ni8FYcvKNLMxNVJGmFI1JfoVypn
	XbRvFoUF7/tzz7dWx4uqu4071zmsnwkcKaTTAe1qn2HJMaXVaKLsEbncG+WsimY9
	LpNk3n+rCA35B07upcXoiwiRPE7s0ggfDXAUF/CguP5f/v4nZ7NTVlUfiSTTT7M+
	aY8+oA/2qN1il4hLFbLAQsdSVWeAbEwbuYc59txqej8FWWtIezh/PjMoHNN7kyoY
	JYzd3zkYpgsdlC0cN8vmQ/gaQ2YRhzqCMmQfviaVaoGa95NkWjbMyRcvrC2Ouo8w
	4daCIOMmJ/geP0XKmFScKj4hp8yqxMx1lnrTkdWU9B+7SlZIkc8+KZXv7fQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar050a3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49H2rIu1023693;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 427j6kxfhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49H2rI3O023677;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49H2rH5C023674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 69C0A21C89; Thu, 17 Oct 2024 10:53:16 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, quic_jiegan@quicinc.com,
        Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH 2/3] dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
Date: Thu, 17 Oct 2024 10:53:12 +0800
Message-Id: <20241017025313.2028120-3-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-GUID: yuqc6Uo4QIlMs8zcy3AyLQp1NZuICvOT
X-Proofpoint-ORIG-GUID: yuqc6Uo4QIlMs8zcy3AyLQp1NZuICvOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=925
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170019

Document the Always-On Subsystem Qualcomm Message Potocol(AOSS_QMP)
on the Qualcomm qcs615 platform.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..ee3414a77e38 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-aoss-qmp
           - qcom,qdu1000-aoss-qmp
           - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp
-- 
2.34.1


