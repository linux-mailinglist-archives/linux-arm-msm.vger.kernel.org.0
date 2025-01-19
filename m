Return-Path: <linux-arm-msm+bounces-45509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A12E1A16185
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 13:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0133A563D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE241DED6B;
	Sun, 19 Jan 2025 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gFlETzhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF31DED4C;
	Sun, 19 Jan 2025 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737288058; cv=none; b=P5HF/XBi95SFrRyYCnU+4YCjNlWAC35iX2lCmLmGk8apHALI4rYxqF8wm1Wx4o8Lp5ax02Zf6xwuK4pCRqhiOzLdy+KqfApm1ecwAkxt1mchOTgOeoeRZPzdslrl3blZTFDbZ0VaU5gaCnxYsx8seIwqyUO1x25hSOhEYQBQ0Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737288058; c=relaxed/simple;
	bh=XW2SnmyYtp0wfTHJXg4iNREj8zb5kT9XDQEg8Ev1Zas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GoWBdEK1UMOUKbt9VHhqsj4/1rPgckG5nfycSk/vXBs5s6cPQ8ZOQ9bJVZqt3/pUQvIzFalAiBJCeARFzSa5aP2GDNnSjN4cXPj31UM6WXYLIKV87Xew1TgQ6f1BWy3IXao1/NR7HiVuwIQkxJ5A+yV9SyBZ2LKvOPtVAzlRkgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gFlETzhm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JBUs0m024523;
	Sun, 19 Jan 2025 12:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8aZ7TZUZ1JW226GfiFKNBgOnW5gwzUV05vQysbC1wE=; b=gFlETzhmsHGQyEK2
	jIR8Fow/SwH591RAHFvlpaq743N0skn8SpFTvTP374bp5KTWCnUMSDaV3N640F1B
	svPAEVByTED0hLXOFUQcJhu29nrgrwGHluKyogs+W5LVUoxFapUpbGLUM3KqWBwO
	U3MCJDqmlcN3iiO/wT0r1wZR/N0QobamuznPIktE0bti62rPba9XQ4qubX5V8Upj
	xFnDPX2vH8gfAqYIuRAlB5P9Wqi8E7Nsfix0E7VKLgnVuIzokxvPvlyzeMTlcOG8
	BIOxZIj4UGl3WNy+P0JO/E6ULxKjJ5eI1i/7yyUAIJGArBB/0GZg4yzm5azipaWT
	KVz/7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448wnf073s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 12:00:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JC0pjM019482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 12:00:51 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 04:00:48 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Sun, 19 Jan 2025 17:30:27 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IOBc58Td_DZA77-36cZb9p-9i8FQt89c
X-Proofpoint-ORIG-GUID: IOBc58Td_DZA77-36cZb9p-9i8FQt89c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=998
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190093

Add support for video, camera, display and gpu clock controller nodes
for QCS615 platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
 #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+#include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -1418,6 +1422,18 @@ data-pins {
 			};
 		};
 
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,qcs615-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GPLL0>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,
@@ -3187,6 +3203,41 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,qcs615-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,qcs615-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,qcs615-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,

-- 
2.45.2


