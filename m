Return-Path: <linux-arm-msm+bounces-67832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B289CB1BF31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157AE17C64D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B420E1E766E;
	Wed,  6 Aug 2025 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T9zSBSOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03F1E2823;
	Wed,  6 Aug 2025 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754450289; cv=none; b=V+9N4zNC/hiS9KuL1MW2jremtYC/oEi4aQwc4QJ28kUoMYwq01WnXiIeXSazCJYPwTGafO+KO2hy3rE5KdR1KS0KfzBR8AGtywE17HtomkbU1yfulybLwHpPBc1i35XMXxC8/KqAVEB9dIPqWBRt7AC7Q6rq3T/ps3mPPtRC4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754450289; c=relaxed/simple;
	bh=3LEyTrzFTxMFIabd2SmtMTJaVgRTXiMoCpeUw7sZfZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=prDlv36Po5qBcp+viIMv4IckrnArt6jO7AKgOFQr2GIezvGug5nSNCl6hMP9eKU5TjptdI2nI/+PVaUY6DU3w4reqRgdlHBRrq7Cya73xQvpdAIyQ7KY2Vzs95qfxTeVMt8+XayfYmMg7wX5yZGinQTT5Ld7ns0imwS25G1v+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T9zSBSOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761fDCx023878;
	Wed, 6 Aug 2025 03:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkGvSIYaTQPMbIW+IZr/VThNStS26OGk66UC1ih+rpY=; b=T9zSBSOY+8gjxArX
	7lr5S6clIXFEw5WiaRv61h1f1p4k+T6qMekz2qHYiWmg3xG40tbjromWYlWT4w6W
	fmi/XJD8Uvm3TLg15Vb5PyTm5PfWRKfqzwwHAPC9GWz10A7fC/b6OpJhCpeULHQR
	fpPqkp1Xso/WI7PQfzWkUO9gbC4m7rb1Y02QebWSQ4ZOIR6l6OI2za4nzq9S7NaK
	3dAFuFPnAaLbZ7QJ6q6nqTqGVlcB4+dRBf6jMuiPqcERLNLSxrxS4K+APh+qmRkf
	Y0otR1NtXEBLGm5tFZ/Go2DNUqOQ7jsUaCULJPHOGRTN0GojzK/L9RP3gWeDGA/Y
	GCyj7Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpya98fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 03:17:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5763HmWH017362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 03:17:48 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 Aug 2025 20:17:42 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 6 Aug 2025 11:16:45 +0800
Subject: [PATCH v6 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-mdssdt_qcs8300-v6-1-dbc17a8b86af@quicinc.com>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
In-Reply-To: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754450254; l=1226;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=3LEyTrzFTxMFIabd2SmtMTJaVgRTXiMoCpeUw7sZfZw=;
 b=hfDlRsTT2Y6H0Qw0yOt7G68jCwt1Hvf1cG3AcXvwKzeAhyUKLINaZu3MDKEYWaGfSWHQWBkPi
 eVaPyY9SLLDBgKtCtoACJJSwteDlbQnmszxAQgdsfL1mByt2RstEAWZ
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J0_y4R-8ZNZwd0GqeufYbv8G-PcVxYHS
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=6892c95d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/FhO1tvsdZQY
 DNYXT4gBwfg4sKWKcuXKbGKCL8ILwat60wL+k3d9DVhuj4V09rOHb60R/VBehM7WJRzxObvSfBV
 a3mUEkIempaodWxUpmV4Ep4/batl5Rsk80LFWHSwJ8hp4sVEUqtQGyfhLQdzIOOX+Nz7uP3dSEX
 czDUJvpq/2s9m5xjSRfLzPXGqEVsr7/NlASQyAA8PuD2eEWRrQmMIJ6dgXpXqQFgy20Ng4N8C0u
 u6wYKnA206WBiYV3NC8kLf7Y8uj166xLEW6gDyRdSzsm4+LPGV1un8UYtN5i0RPeEpcEkKjxbAc
 ol90dUz/p4jztIP1CxcsQ0C8Trhnxu93gE5qZZl6/lzD80OFdD22u8qPpQjEXm1+/8uTHznrEgm
 ZfXUMITH
X-Proofpoint-GUID: J0_y4R-8ZNZwd0GqeufYbv8G-PcVxYHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1


