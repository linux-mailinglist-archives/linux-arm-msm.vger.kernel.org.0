Return-Path: <linux-arm-msm+bounces-87341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B6CF1040
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 14:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96FC63011405
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 13:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E08C302753;
	Sun,  4 Jan 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lfFd75l9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1065C2356C6;
	Sun,  4 Jan 2026 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534315; cv=none; b=fAKG4/qhGPzxeN/DW+Z+A47/NC/3Jkrk+o1tRSMzvtpTI0bMkHI35N0rILA7v9k6wiOjSllrLY34v+GxpLJIKI3gkuQsmdWQtNKQM4OnU3Cxo3tghDC/cU0CTS/gFTL9GweEWoPNB7zGTudh2yNm4wL8T7mFInoLE53bKwRMsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534315; c=relaxed/simple;
	bh=XZ3R/YJtSkQd1AfSvp7ACeO11nJlPqKWbLdOmVl3KWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4hKWLdfpj19mbrdpjBL5WELrbHKnB7702g5H9IEmfTonr4aMJji5O9XjeCRGAyxjp31CvSEyZ/glVU8wBo1n9Yw17oWtBWxC97sGRY16VzlCLi0eriB1e0KmryjEhzJd3ujDlHqTmBKB4EC/cFmoM2D98En9Tgh9hRSiBpB74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lfFd75l9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6045SOhU1816848;
	Sun, 4 Jan 2026 13:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rtLGbugXO4c
	TLPEfK9HG1KCTJKXwLgwk3xT85wcYAr4=; b=lfFd75l9gbtL18lq1eU/M2nQTVs
	MtfLmP6ieaoalN2upSr2jWwjAgukUBymqKXBRPZ5t14jsPZmiQD/CPCy7QDNbgLu
	nvYv60mc4tKwDp4hKjBE2N1Act449B+0C/18gGaSdR4/zbzXICBGG+EiBl0JQHTg
	sCXcPuD5MZWGtwWhTxjTmgsBehjUt7dHp2Ehc9AgkXofcmwe4h8COxkvECqsHUce
	RDwLiZ1AKs7Kcw5hioGQA02GJ2YLwh2WnYBBFO4xSAX1CXAzAKBXIhNISdV5AmrR
	0/q+ZEuAj5Vo8IOTb5ZytW5UYJhwfjT1StDz27B4rXgJ+I0SqmTCkMIrQQw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd20w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 604DilfZ017232;
	Sun, 4 Jan 2026 13:44:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kkx3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 604DilGK017206;
	Sun, 4 Jan 2026 13:44:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 604Dilf8017201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 8C3915A1; Sun,  4 Jan 2026 19:14:46 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v5 2/5] dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
Date: Sun,  4 Jan 2026 19:14:39 +0530
Message-Id: <20260104134442.732876-3-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: f90j42qjBecRIVtR1gUyyeG_IZUU4utD
X-Proofpoint-GUID: f90j42qjBecRIVtR1gUyyeG_IZUU4utD
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695a6ed3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=kQsN5YHy2Fcxj8m6r_kA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDEyNiBTYWx0ZWRfX/YVpAqa1RVe5
 lBJ4nVRCoMiMxIVOCfodu67/HgBdDEBAo7r0MmOCGn2JvXjGqQf5rbBySkdUnMLU5tEnZP3JizH
 dS23beZT+d/hKMBfinOFfyJuuuiNixpLufX8Lg1Ym79Y25lYK0RSU51oMTrzn5/1c0aJRz0cKr5
 uWPrFvYrfe8JGsCJ2nGLuu/ixVdB/gXid7WxMesVs3qqxphLl4ThpZDNDiz7dsUR6gDihk4EyoR
 FOrXsXrGKxFe49M/wmyGVXfgapvsEaQXtJ5TasLGGg0K28Lco1iXSbDNcXYxJL6x8LYpvojfwaQ
 oXmw/rSWjM5HR2eWgrAj48nXJoAqkCdCYEPVzWrlSNltnFPGQr4N/+1mu2s6vZDWz7V2PpbwB/l
 1Zc8y3i1rD/Iok4j74gkkSy+B8FPc+hGl8vCPbtNTTvQf6CB+imvS/lBSoS1YN4WFVMNALpbcWM
 kZlB0D2cpR/wEwgfYxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040126

QCS8300 MDSS DSI controller reuses the same IP as SA8775P, with
identical register layout and programming model. Introduce a
QCS8300-specific compatible with a fallback to
`qcom,sa8775p-dsi-ctrl` to reflect this hardware reuse.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..6276350e582f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -45,6 +45,11 @@ properties:
               - qcom,sm8650-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-ctrl
+          - const: qcom,sa8775p-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
-- 
2.34.1


