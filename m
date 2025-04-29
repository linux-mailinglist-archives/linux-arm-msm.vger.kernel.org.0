Return-Path: <linux-arm-msm+bounces-56013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25FAA01FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1AD53AB30C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2306626B96E;
	Tue, 29 Apr 2025 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m/7IowXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164D17C21B;
	Tue, 29 Apr 2025 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745905760; cv=none; b=VXHh204bSpVEu9cQszb2i0h3+EsvC4TPGz6f637Efav6GwtEFROVhhhLiARDKMkeCFKIzCglAuKQV9/7G6OO1W8W17VeOrV98Ulf1+7qmhPJ37EJjhlb+V/LjzhjvXP8fXM2C1mpBH6CFQLWV86ya8DFBhsjySDMC5Y0G94qgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745905760; c=relaxed/simple;
	bh=wTHla6lUkJhpBWGS88wEwpkLEaR75vDhNRcey4lS0wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkG5zIGeD/mVY99Wf2EjOyzDwlST/+rKYxQgkdq++nTQV7KeQmjLsO+Um9TOMSe+mya76D2A3Xi2P/FhpOCe6kIY29So5vV8a2YlqCXCzZvlMg5gZFS1waW1haOBDHFBSIE1s92wnn2DUN9W2/S1AUrak3SQCFKGtfPb1XXyDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m/7IowXR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNrr8I014932;
	Tue, 29 Apr 2025 05:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2mvYhY4cXE3
	pGemUoOJ2q++sYW/b2dkSXtsse3LCD7U=; b=m/7IowXR4Fir/Uk2yXXGI+5xT0/
	RDxYbIcXKtGwT0xPBHl7+Qvno3vcipleDmpYIkldZGVe38SzFhDo2U3hvfTSjCdd
	tAhzukSS1gVBE180zmBNgLjBVst+nN32aImPP0ciSarv1TJBJ3vn82nEY2GgMC5g
	KsjMCOOlweBZ6UjBkemvVhIzzPPOG4nCFF5IfU7LZVuedzwShIOPWZHWxNltwGfj
	o53R1nBUXqrZFzu5ewId0fQ8N/YPbtzzmjnZVsxvpkCy9ZwdJWOD1eQCZkhzz4zM
	jJwswQH2q8Xg1S5XKu2L/XKONXMnwF1rrL5XIjFvSMrRhSSaB9Qv+/gxDVA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn29ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5nChs030270;
	Tue, 29 Apr 2025 05:49:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 468rjmfqun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T5nBt0030234;
	Tue, 29 Apr 2025 05:49:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53T5nBs9030226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:49:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 9F2EB50C; Tue, 29 Apr 2025 11:19:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
Date: Tue, 29 Apr 2025 11:19:01 +0530
Message-ID: <20250429054906.113317-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429054906.113317-1-quic_wasimn@quicinc.com>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: chqzamUCceNv8Nk5GfBMlkENHwd32MCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0MiBTYWx0ZWRfXwAefaWZ0jlqe 4L3qYpANnarr3/q4GnGuiILDV5asdtM+lyNYb/4bgiGa/c7oAUOsDSOlFx+2L/yymZN+6Ak9i09 GtuiW9ZFesV6aOETFFN9nIs6Haco/2RAWDOHcdN+SUtp2hItX0TQJO3+Al/PcrLj+QeZ4LOXeEc
 OC7ngxHHkWiKcV2NsJA/0gQ74tjKfzq2C1F9Wt7R3EVZvvJ3oXt9CoBEjvhinUrYKOgD6+vNeU6 uGU668mcWBOvXE3Z9PFpnsL2OgrewSRv3yk2Up4qWgvo32YGPWg5PmYQoQpC/+viwyZp+lL5ukk Wge0JtaeKgoqWpmOzwTPuyIyOTQWNFXidEn/i8dMMy+w/oifNGvgvjaLpPD/NrHOhfe4tgNwwDD
 HX26fzxZoyYmCa0PpdNxxwTpjqxTsv5IicQA1YpcBg5qwisCOXyTk0o0rksrdhMjYoU40q8f
X-Proofpoint-GUID: chqzamUCceNv8Nk5GfBMlkENHwd32MCB
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810685b cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GSGDit3c0nHYkW1XmsAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290042

QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

QCS9075M SOM is based on QCS9075 SOC and also it has PMICs, DDR
along with memory-map updates.

qcs9075-iq-9075-evk board is based on QCS9075M SOM.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..713d7b471883 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -58,6 +58,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -960,6 +961,13 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-iq-9075-evk
+          - const: qcom,qcs9075-som
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.49.0


