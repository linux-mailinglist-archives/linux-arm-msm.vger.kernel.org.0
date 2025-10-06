Return-Path: <linux-arm-msm+bounces-75995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED0BBCF2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 03:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FAC04E6005
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 01:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7F21B87F2;
	Mon,  6 Oct 2025 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UzUMGmta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0341946DA;
	Mon,  6 Oct 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759714788; cv=none; b=Pdr+MIP4hJjQuy3DFFNY8bSNv7wFghVZ8s1wA7YRsf/kMTCFfSF+iNjfkhoWQI5K4y0a53UN6AQPktR7zgICSspHs0www6IwM/Nevql02IAshuPkq1LiTjK2k24utOxV3GgASFPc0M/yz6+LT0w4JYSk8nbU/0HnsWelyLZrkgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759714788; c=relaxed/simple;
	bh=zWDohBuHGCbVaynzSRDxQlI7G7QUQywTDw5l360oR4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WLaZBsN8o2EIG6x4SiwQmM2Vtt0PNiku0Q3gV2TYLyCbEn+s/PFUdmtylJ+a0LCXTBIMyQDEglnFbTa6Wn9jukVMEA1ALns38fAGM8by3MYK0E5ygrpTrdz3zEdl1RPtu1zeNtdXUsX8lf04rlxyO1rI5QFJw3oozOief2CJZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UzUMGmta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NM5sL010692;
	Mon, 6 Oct 2025 01:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jW7f0AdjkTz
	8mnJHXkYkYMzOGrGE8Ug51QiY10kxrQ8=; b=UzUMGmtaDKm3R5jAOmegaJE+Oys
	42v9kjrWQ7bLS5DkwJD512eQxiR+aZCiklf9UVo5T7dUEdOcOAN3pgajCY1zj+3m
	MayggKr7+pJNqBNyUiUDa6Uet3ndPtQotyeZTZZJXhHZslnaEuSnDx6aRo+uZjvW
	Ha1JOhSM64QF4wzIb/WvfuNfJsNSWyTqp4xbQmazer5Ys+0y01qPGZsMBxwG3m8C
	C7eOvjfMGS6kdpo8/1o6YzVExZXB9SWFPM7Hx/eWRD5LKujtgx5Z+yW8Np8Te1Me
	zqd6V0bbcBaqIpTMrQcZiu4BoVj2DSGqzmlHKRwmQqeJ+NBBs3qW9102XJg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn302e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRWj003773;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRN2003742;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dQ9O003735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 44933404; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
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
Subject: [PATCH v2 1/7] dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
Date: Mon,  6 Oct 2025 07:09:18 +0530
Message-Id: <20251006013924.1114833-2-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXxoD3qVsVJgtH
 TrxAx5WSLynxtALgIW1b+1i0Q7DUVKzPQ5BCi2vqWz03MnTURU+LQWXWwGpCKPC6JZNTbqFz8Ga
 Fv9O73T04L+ma+rGEHDdmhlybg28eWLaTI3BIVzZhP4RuTkhZpDPqES3ZHmhdLAXerGl/mC2zXe
 kh061jo6BXdzYJ8M4Fxem2DggZGxPQ0SjxU3vQvDoStRawOkxoGcxj009nM9MF6Hz69bH0M95Jg
 dCMUs8TEdGjI1uovdI+cvNT/kaldUaFnBDWOXp4qH6HNqd5pyjUlz5lmfVre0QdcjGMOwugbWhZ
 NH0CVDslyiz6+rE+LRa421JMpbMJRZL7QpddPV393yTrUV9S6A/aqhkhj8dqos5dphJrTJP1JS+
 Sa0MvuY5JLo/fB6FBXCggINJ2oj9AA==
X-Proofpoint-GUID: NKYkSRcIrvo0DKYLejSkUhZLN-7PDPar
X-Proofpoint-ORIG-GUID: NKYkSRcIrvo0DKYLejSkUhZLN-7PDPar
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e31dd3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Zt1aTBg4y79HU88dGMIA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

Document the DSI PHY on the QCS8300 Platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..7a83387502da 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -14,18 +14,24 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,dsi-phy-7nm
-      - qcom,dsi-phy-7nm-8150
-      - qcom,sa8775p-dsi-phy-5nm
-      - qcom,sar2130p-dsi-phy-5nm
-      - qcom,sc7280-dsi-phy-7nm
-      - qcom,sm6375-dsi-phy-7nm
-      - qcom,sm8350-dsi-phy-5nm
-      - qcom,sm8450-dsi-phy-5nm
-      - qcom,sm8550-dsi-phy-4nm
-      - qcom,sm8650-dsi-phy-4nm
-      - qcom,sm8750-dsi-phy-3nm
+    oneOf:
+      - items:
+          - enum:
+              - qcom,dsi-phy-7nm
+              - qcom,dsi-phy-7nm-8150
+              - qcom,sa8775p-dsi-phy-5nm
+              - qcom,sar2130p-dsi-phy-5nm
+              - qcom,sc7280-dsi-phy-7nm
+              - qcom,sm6375-dsi-phy-7nm
+              - qcom,sm8350-dsi-phy-5nm
+              - qcom,sm8450-dsi-phy-5nm
+              - qcom,sm8550-dsi-phy-4nm
+              - qcom,sm8650-dsi-phy-4nm
+              - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-phy-5nm
+          - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
     items:
-- 
2.34.1


