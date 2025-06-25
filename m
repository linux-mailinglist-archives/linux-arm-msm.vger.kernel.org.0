Return-Path: <linux-arm-msm+bounces-62432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CBAE80B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D77EE1BC3701
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E44C2BF3DB;
	Wed, 25 Jun 2025 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aYG3PsSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A37F2BEFFC;
	Wed, 25 Jun 2025 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850071; cv=none; b=GaRi4bhxLOAA3XqBvbKDepczPkxdzAwKlqmR1V3AkluiyEJV2zO5Ymryg4awHLj4iJKoeXOgxvwlg3jJ1DwgTCEEfU3rTNQwwJ6wbLfG4QWMrBbvv+5E1j81GE05V+4QXaaa3pqQMxsQLznXyIOOCdmAfy7km4vGcYOuwni0+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850071; c=relaxed/simple;
	bh=F9aw+M2A0XOl2cvlq+Dj0zzzF9TuStc3hA0w/gK6pLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Sz8277yzap2/tG40oqLVuDC62IjiZ7aknNIpk8ezK5xmomB39cpoEUULBAIyXiHTqY2IzcOFVIf2baFOIAOdDzXbEEONAsSBiZpwZOAD5qc6dIGSsu7gDgu0FCiMU0DxIAA0qyUaVr3QuukkiXvN9dIRc3IpJvxSs4dyfCn23aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aYG3PsSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAH8V6001108;
	Wed, 25 Jun 2025 11:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfAY1xYh35AyzP143dg0JapGVaCvTDRwPasaJr2uRl8=; b=aYG3PsSdXgIyG7Fo
	lVWS7cG/W8NMegK92PPZ6E3fEpJVGe8lqK8YFc4cedF1KZdgOYPV74a29nmeO/yg
	Q9RSA7Q+d0dBZVLghMk3RuUYKyOd8V3BN88yHx75RtscixuFrrJsRA84q68OJkQh
	ZtpzxvI2xwmtleym3uZ3UyRcZfRt29meTVfqTCxQLEuBebJuwDF4mOS/wwWNdrU9
	iyQ7YlDf+lqDQQBJ33vdGGOllVs38v2EsRYgwJh6DrcTeh+zBEZyUsjR8174mnW9
	9ixoJ6rxZlg+XfnGeySlBkMaQHXnKj/VI1cfe2rLRqfz9ZT3hACHCG0tIJBWjdjz
	9YSxcQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1x7d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PBEPUS012767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:25 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 04:14:21 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:44:00 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-cpu-dt-v4-v4-1-9ca880c53560@quicinc.com>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
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
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bda12 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=eX7r7zjc-4eniw70hzgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oeXgYCeTKFsMakJyaonn4qTyzeFNaQip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NCBTYWx0ZWRfX7ZGX3A5Myw5Z
 gD2Gvl3GjrSDm9VutiZmxRi7HAKhLWf49ZCMxb+22WV85NHvFeAqInu7kVVSYwLWOAm+W+WhekZ
 LTWPPNQLwYp4z/IRL4lRWNQWqGESCNyzKJlx3uGucsxXUrRBHxUzepmo7MfhX9YxONUT3kNtrZF
 8xd63jq/U679+4GqlOvqyecmtRi4mjIT8l+KCn+l3EDFpZX7MSkIjT4YIRyvR7/NfrcfPCQBSNC
 8Tvsce7pVqKORY8ywAbR9DWxjK/En+gTMhne0UfQ6JtY12w4aTmHq85bK3xs5Wf+DZ5ZtiC1czw
 lVPGH7eP+UFo+BA3u/QamQHCa37YvU4jflNZrT3lp8GXiW7pEfNT2ERKNDVKTmFPpn3iGm0eCyu
 lV3/VwY5qMXvGAgy0Fv55Hu/tpQWOQ9o+GX9wAUPEZdvViHDOuZXalcM8z/oF0H531um+DIE
X-Proofpoint-ORIG-GUID: oeXgYCeTKFsMakJyaonn4qTyzeFNaQip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250084

Add support for video, camera, display and gpu clock controller nodes
for QCS615 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bfbb210354922766a03fe05e6d117ea21d118081..5adf409d7ce7226042c759cc83ceca331097ae37 100644
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
@@ -1506,6 +1510,18 @@ data-pins {
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
@@ -3317,6 +3333,41 @@ gem_noc: interconnect@9680000 {
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
2.34.1


