Return-Path: <linux-arm-msm+bounces-60752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A061AD33B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 903F63A776C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAE828CF77;
	Tue, 10 Jun 2025 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CfqZg+pt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CDE28CF4C;
	Tue, 10 Jun 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551739; cv=none; b=qBB9e+Z64F6oiof1OcpVDP5JcqJVf+0E+ZctEi10j3TOyl214RzVSnq2ZfBk3mKUoKO0dngHXd1AhUftDTgkLcw0fY4dl1YQGMjhah8EY9tiKYJwqFkIwoPtWgDIihRtbwAHRhFCN4366/BScE6bpnTB+EZFy4rpLRgDnZJbMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551739; c=relaxed/simple;
	bh=yKSYYG1hvQaCDDTDk/ZyHno5uu4Cbxpv4vynBlE0k6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iB/7iQJSUaCYhQpOzKyTejsSFkpw1C/X5NMZpnmDTJctp4Ujee+7D/sUlq4JDYxgapqmT3TjA4Fv+Mdoinkv4jp5HN3w5R9YJTEkpZQ1xxDOz/lhPCrVl1mZEkCfx5Lis/5BZJimRYSQ4jv4dApfHYn5uJFSQrjylBCk2eAVNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CfqZg+pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9FRO1029821;
	Tue, 10 Jun 2025 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l51cla9D1veQybqZHPeA/O0l6AcEUsL8jLVLgpI8TJQ=; b=CfqZg+ptyRrnzu+9
	4c02sXWK37kpwO6c907xov7mqUW2RuQn5N7DKKETK6JqMM0A9Vaqp3vulN8id0IH
	oWlZR2yYf/hb7sBTeRAlp3Z9Hq+3b3eul9mvtT12GfZAkH/s4thmcW0SdMiGEw4K
	cUKTOmIc/72+ewzoHKIOixC6sD4DpcuYAUfb3DJGruL5Z/mCaXa/ZEEklSpYTw30
	oP+DvrccY76+q3m49FnCT4ZXRyUplaCxFCSDNsr3nEeX6AHd96RipfQpBgYKZkvb
	I87ZUR6ornreBjq1UVzYmY8UwiyQW1GHz5tJ8XC00J3t0Fr9P7O3ALMvncbmW35T
	wa7SKw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1216ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AAZXuW028434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:33 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 03:35:29 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 10 Jun 2025 18:35:18 +0800
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-qcom_ipq5424_cmnpll-v3-1-ceada8165645@quicinc.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749551725; l=2040;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=yKSYYG1hvQaCDDTDk/ZyHno5uu4Cbxpv4vynBlE0k6A=;
 b=/MIJdIXFWx9/GpuDVLgPfN/e74EmorLe2zwzqT+osUOi3zaFKFV4KEsb5LP+NhWdqI8EWAKDe
 2tmpWZrektQDX8rIYzgD0lmuNuHaAUAt2qrRLHGzhSdyIgOqgQ/naKX
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S8MZJ98cBPVRxlZQizVxIw3wPkh1itJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MiBTYWx0ZWRfX4fu46M6YZjpg
 ATwDi91IH5phlCPbFzdVNi7+lbsITdlMpcJJlxxUiTFdLAzFHk85WO26jv/+JqVt0YiwXWIfcDP
 3B3kClqffOiMyzyFpkYjOxpsZpkqdEtZJTbQI/5wgDxprlNoi7iXfKeDTgPqpuQ6CB4L8ljnWSO
 lER/oF0r4E8hXipPq9p+MWVLDBVo5tB8QNj13aI7oT1XeW8SrZR3ZhmeSjqqox7IRpnI5y5xEro
 cZLvWie+1AGYJfFJ09XjVtLM+9FL/IwFEmp6DiT0rzpowYAxg3cjjtNS2L7NbfDBMIQMM9Q+oCc
 rsO/9TFS/FMNKOdFL5TLCoCCA0SCyQvvWqmEiaiEEJwfHenhjHyP/Z9Gpl4xRNE5F5RkUBnsdEC
 njsyIQFlAXfLyFcdfPPvlgRJi8cOap7ne8uEM3LYbA0sLbV4FUoiWzorxKliOQ1pg95KD0KR
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68480a76 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=leb7mbaFTONhKzR9nrMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S8MZJ98cBPVRxlZQizVxIw3wPkh1itJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100082

The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
input clock. The output clocks are the same as IPQ9574 SoC, except
for the clock rate of output clocks to PPE and NSS.

Also, add the new header file to export the CMN PLL output clock
specifiers for IPQ5424 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index f869b3739be8..cb6e09f4247f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -24,6 +24,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h
new file mode 100644
index 000000000000..f643c2668c04
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5424_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5424_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ5424_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ5424. */
+#define IPQ5424_XO_24MHZ_CLK			1
+#define IPQ5424_SLEEP_32KHZ_CLK			2
+#define IPQ5424_PCS_31P25MHZ_CLK		3
+#define IPQ5424_NSS_300MHZ_CLK			4
+#define IPQ5424_PPE_375MHZ_CLK			5
+#define IPQ5424_ETH0_50MHZ_CLK			6
+#define IPQ5424_ETH1_50MHZ_CLK			7
+#define IPQ5424_ETH2_50MHZ_CLK			8
+#define IPQ5424_ETH_25MHZ_CLK			9
+#endif

-- 
2.34.1


