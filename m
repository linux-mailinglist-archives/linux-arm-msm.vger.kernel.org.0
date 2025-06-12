Return-Path: <linux-arm-msm+bounces-61103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5198AD6CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E0F3B0D2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A123823BF9B;
	Thu, 12 Jun 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Owv0P13b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417023C4E1;
	Thu, 12 Jun 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722236; cv=none; b=s00guLiF1+o4kqb8KHvY3wNZdfAsHMasHHsySx41esmP84NThpOOq9Z0Q8Yg+FmrPnhPn4VEmlX8QeVRSnSlwgkOWth/GrB98wJt/+pVfilIpabFlCun9Thw56GwQLUH5xkHbzNlkQZQSPlMViWQ0S/JnYURAeIGAeY/hd+6DF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722236; c=relaxed/simple;
	bh=fxAj18puHXITqpfnTsxajy+ctigCAtgWkdiBJUOGJQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eyzZaQ05VVFlyPnbEw6Af2IvWGrvX4giLM730c72tDTJW1Q8eJiSM86LCfLbdTgBkm/lCN0J3lsbLCJeNgOnAaBSv3eWbWix6VGDbxDPlYbxiM43fZxI+oI6FZ5TA3VZrT0Zf+znJNYcUYVcp8ZPMGw0rNhiPcRPxAz/cwoiRFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Owv0P13b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C84vkH010994;
	Thu, 12 Jun 2025 09:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QalHrlU7YcD8oOdsGh5RRx8431p71ZkRhDu+SD6/BX4=; b=Owv0P13bzzDOoTlG
	PgYZiiiG9v4klxMX+94rIZnvqJ/VGx7MjmG6B0BSME79cr3bGqRIYWT4bK1+hBTO
	GyV8Ez5WfmdQuxhbx8997BHAbb97eobXP807WTT08DoRz20GiNamzj9E56My+CJ5
	SNGyH5dEsOGu4D7HOuCAQNI+JZ20zD5p0hW21Ivcq0FC3oVPoGC7J3/51TnhbpUY
	4VwVzypkGxyP28jZ/KHIWzUmhaM2oye14fxb3XEAQKdzduFJiDkRmc0EJ60SzgqN
	vhgl5GpsUpicu2baMqgLbuLAIgg1g5ORa5k46pj/UuOH8tX9UANv0/F6IkzC/3Wc
	xbha9g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyrjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:57:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9v5Y4001759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:57:05 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:57:00 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 12 Jun 2025 15:25:12 +0530
Subject: [PATCH v9 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-qcs615-mm-v9-clock-controllers-v9-8-b34dc78d6e1b@quicinc.com>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon
	<will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684aa472 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX43fODzVmRfMU
 M2QXzPuCRpYusiphfI7JOD9/Tm8V4H6meCR8BGW9/Fls5ORd0qZMp4101hMNS1AHQIHekRfcfX5
 viiLxNUvdZDvsm0nnHLO6tKgwRuMjDlC6Js9WTbhqqBVRaW8QjRdRWicT0BvV3xN2oz6V2qV0Wd
 kWJ+u5FSmnWx+hqKFQOWpv9B82iofQ3jw4aWRQAQi7RvsGhs1jx93klqS5vsC20o7lhlv8qRzBv
 PiBuujSOd7S/TrcpKjza713Z1GzU7rIt3lUzlePPx6f/CvZ9AfJfZUNmIyDdG86kP0kbmUwZ6El
 i9nSXEa5wx5OCn2ca/CBIsV0hWCvVFtsqRP+8T8Vkn6OoQJ0JTDFukiBMv3GGIlU2VVNAlUj3TB
 a6LeKm6ITJIzIEbqHNN5pVjTnRyg58i4/6JSh5/eu+RRDFxJXnFWR+vQmxid3qRbXKhPL6cg
X-Proofpoint-GUID: 479DRh9l_EYPx_I1QruY_30RXAHSOH_2
X-Proofpoint-ORIG-GUID: 479DRh9l_EYPx_I1QruY_30RXAHSOH_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120076

Add DT bindings for the Video clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-videocc.yaml        | 47 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f51b69de10478d1fcc246e4324dc74bc87b435eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides clocks, resets and power
+  domains on QCS615 Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-videocc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+
+    clock-controller@ab00000 {
+      compatible = "qcom,qcs615-videocc";
+      reg = <0xab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-videocc.h b/include/dt-bindings/clock/qcom,qcs615-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0ca3efb21103d7e0b09ab9c042be761bcbc5960d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-videocc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_SLEEP_CLK					0
+#define VIDEO_CC_SLEEP_CLK_SRC					1
+#define VIDEO_CC_VCODEC0_AXI_CLK				2
+#define VIDEO_CC_VCODEC0_CORE_CLK				3
+#define VIDEO_CC_VENUS_AHB_CLK					4
+#define VIDEO_CC_VENUS_CLK_SRC					5
+#define VIDEO_CC_VENUS_CTL_AXI_CLK				6
+#define VIDEO_CC_VENUS_CTL_CORE_CLK				7
+#define VIDEO_CC_XO_CLK						8
+#define VIDEO_PLL0						9
+
+/* VIDEO_CC power domains */
+#define VCODEC0_GDSC						0
+#define VENUS_GDSC						1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_VCODEC0_BCR					1
+#define VIDEO_CC_VENUS_BCR					2
+
+#endif

-- 
2.34.1


