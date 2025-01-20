Return-Path: <linux-arm-msm+bounces-45535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7035A165D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 04:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41BC1651F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 03:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B08137C35;
	Mon, 20 Jan 2025 03:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lm98by8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE292770C;
	Mon, 20 Jan 2025 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345095; cv=none; b=grz1kqrK68lMggOLLF1TXEQlttiR9eHLoCZZpSEryqFskxooXNmTiNW674YefnPQDFFyPWwwnDRQQyPpjF1mKVTCenHbFxWdln/6PHBv5U0ksybRciDbET2yNvmrOCbNNVfOzv54OjUmQvA1WkVEacdyotWI6XiZVT5GVKntFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345095; c=relaxed/simple;
	bh=pDBDW7388d5Jc2gVIHgPOyRuznOSxCB+WVvYtk1JGMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EIBaW2qIjwCj1+RfVeCvXQw7CkuM3adbYXHKCW8MfVIUMxf+B2YW2BqhqPi2tFvoMJSzAfsT9ZcFx3RNrRqCCPz4io60ulFoZXG7ME1bidx3tttIor+lFbkkrm1I2od0nw+dc1s3++AuT8NV3GxTh5TyY7idMyEwtFCpMlB7lfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lm98by8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JLJ9Uj029367;
	Mon, 20 Jan 2025 03:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Ume0aKEsc2ZytmyXy2R2oq6t9nzlQWfujU8T2wiVg=; b=lm98by8tbbBkOO6C
	55Z1D6ECbWEthtmB96O0WTFgexkMa2jvlJLy1oTDZ/2m2sHFA0CyRZPguSpPe23N
	WoMd/esod8iQdskCPQigwgR/aZOfxaZC5CITXOG+BOMyIAfq8gQSRkeJ3TH/B7x4
	jaRIq6B7zb+giA1TL4AWBexk9uUdk7BpgK2ZcJl79eQbDTLwiMnA6AKTYsG+EYpL
	DnCoFvZAoDApuHFy++T8r2FxKaVpfYE6GfBW1yjnpEN9TE/JdmZkZV0sa3GrysMl
	HMKgd9prDX8EgrnFUwq73hSYSkfzeeAT8Jkzv7KenJr3nZL3EexCZSVrXWQeBCk8
	uOo9dQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448vv419mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 03:51:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K3pKlD001910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 03:51:20 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 19:51:13 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 20 Jan 2025 11:49:18 +0800
Subject: [PATCH v4 1/4] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-mdssdt_qcs8300-v4-1-1687e7842125@quicinc.com>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
In-Reply-To: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: Yongxing Mou <quic_yongmou@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737345063; l=1236;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=pDBDW7388d5Jc2gVIHgPOyRuznOSxCB+WVvYtk1JGMM=;
 b=shOo182b0bQe3NtNyuaqQikglXMRgbzxx5mdZ+lWZ17h6cpDfxG5ev63b0AygX66iCx10+z2K
 kvTlANGCDHFDVZj1mQemXu5yyaR0FXrY9uNHl0UW8XD4ujT7z6x8vSt
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FLilSESnK3H0mOofgUrVsE3DpETzit6T
X-Proofpoint-ORIG-GUID: FLilSESnK3H0mOofgUrVsE3DpETzit6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200027

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml    | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..61ec4dd029a8de3b0e78fc97c6c0a602f84027ff 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,10 +13,15 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


