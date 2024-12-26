Return-Path: <linux-arm-msm+bounces-43347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4C9FCA0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7061F162177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 09:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF6A1D4359;
	Thu, 26 Dec 2024 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mDuwlkqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E4C1D357A;
	Thu, 26 Dec 2024 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735206214; cv=none; b=BRYB/H/Pdne0ihLqGJEQxARuVfZ5R4zxJshCz86F0S/fOOjrvqIKyYe+PkpRBiAYgyB8KGLRXbsc4ETyrNgyXtHJq3RYbAzzTbZfEWbd2rlJlpskPQE9NVwOZXNKgil9gudDSOoknMeiqiCFWtbmNd67tfkTKF/NPDJ+O6Wgsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735206214; c=relaxed/simple;
	bh=Yz5mbbRx/l5OtEgJCihHFJIopo2WeMdlObPjTJ/mzRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ei074ARU4seOiGNgSGCl0mdorjYqUQfnnTBxEaXGAEJ2oAKM7CEZJtJQhPZ7EPDR2ziMyzZ45Cz0IZBHgnBCk33WgR0ve1Lv9oznLOv8wW0uKQfNciCl4kNezGqG2ZmMwaFu3YtSfjF6farbuWXJNYefr6ZOT6IqgS+fcqCSDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mDuwlkqD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ1w1wa002774;
	Thu, 26 Dec 2024 09:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kRW4MVmc8PbEsVjcA22SYdKdr/oF/FBaW+PrqLuWW0=; b=mDuwlkqDrynjA1gf
	t9ZWy8arubO4yI/FuL9BaFqAqpItYG73XLof9Yr5KDT7mFSXfM6FOqbO0nkZ2qCm
	EMMfuJcom69r3/5YV4ZTE7ivcmkp7SivBvxWm80adCc4KPbD9kAhIMFyGSGSY9Bm
	NTkUYGN6UEk8Fi8leOEIrh4R27Gn6+nkCw7QMCHhSNcuRrkx6Ubc6xvAYSKa7KQY
	cKD4mf4uJs7x9FtwZTbm/MRsRs6D9KDU/S3AKm323pcH8E74AJFnc8kaVB8zuRDL
	c8LlxK3x5iJgwDu6EouKZPjs7ijr2YUoWCo5BVlhofC1GxXOLR3+Jx0xqsfWs1x+
	tlgHmA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rwxja6c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:43:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ9hGKJ014028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:43:16 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 01:43:10 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Thu, 26 Dec 2024 17:40:45 +0800
Subject: [PATCH v2 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
In-Reply-To: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
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
        <linux-phy@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735206179; l=1168;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Yz5mbbRx/l5OtEgJCihHFJIopo2WeMdlObPjTJ/mzRY=;
 b=jjXCW56HlGGgm+J6q+/gQ4knMmty1JKVDI8F4j/saVSz8ayUfSHgm2qmYZsGhNiCkE3co0BuA
 uMKr/Xsd2uxA61E7lvP/JwQBt4Jd2KqC0wb8cgyZB3v/eGbAwsKQMFb
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MZlK6DhljzXIMcwVx_SabdLyhz-UNk7v
X-Proofpoint-GUID: MZlK6DhljzXIMcwVx_SabdLyhz-UNk7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260085

Document the DPU for Qualcomm QCS8300 platform.It use the same DPU
hardware with SA8775P and reuse it's driver.

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


