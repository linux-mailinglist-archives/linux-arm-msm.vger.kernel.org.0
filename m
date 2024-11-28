Return-Path: <linux-arm-msm+bounces-39391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630B9DB407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BD32816E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B548F155389;
	Thu, 28 Nov 2024 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DNpappgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04D15383E;
	Thu, 28 Nov 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783521; cv=none; b=XXJMg/3dhRnFNqLJLIMJdkQe7P/8q3bIv/X677qdt1lFbN9iO0NIF/1QRgxMtCsgirPpNrFwiEnpLIFJNSsgHFK1O2+L5kP82KpShJQn7gityCG/k6dFzw/hLDLUitEooM9mv4vBa5jlVt3cCBSkWqcAozwDOe/yPy6w25IgSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783521; c=relaxed/simple;
	bh=HS0w8xY+qgqg3sWzMteEUnmkeL0f9VGuApguOioLhXE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rNC+WY0fej1yCXkP13FvsAii0JxxXmNrk5x3wfYymFpPrNAraFzym9b/uDkgO19ki0IcIhGUF98mnJpMJBEwvr+A1CD2n8Hsim5R79gNYWoKp7WvA+3UBm8DtqQ52yJ0zxNvfD6OcG+C0MSZkBEIRGNgXzZNAsX6grgmAH0pc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DNpappgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8eHh4028707;
	Thu, 28 Nov 2024 08:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/wRuB2/opZ8soiATPqzoo/
	6CpobmYIIfoTNiZWu7tUU=; b=DNpappgn9AursR47bg2rxH7suHuMXAu3GZxzAP
	vg2xttS29nQVbYsMJxMCH+CvWRV+YEMyyaZUWR8EWl4sGJNfjE9JNuoVKl1nBpSF
	TABAMmBdR7FnoUVkzU7IzHcDL7+jkMIA76roIqyBvQ8slscEhgywlTfp1pewGLxi
	dh0OHmUwY0DfokKdPR/91T1gKN74Z/+penjI62403QjKHKY7eXG4aFGNfLtZdCi5
	tHa107e+O9IYaax7oVvvc6t4oGv5UTgvrEzgfcZyBPROQzjAVNdU18/PTO8Hd+yT
	2PUmNWcX2WstNVMRGzF5c9DEQkzprGnost7I81wrrKHZjErw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671e9v2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8j40q004885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:04 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 00:45:01 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v3 0/4] Add initial support for QCS8300 SoC and QCS8300
 RIDE board
Date: Thu, 28 Nov 2024 16:44:42 +0800
Message-ID: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHotSGcC/3XOTU4DMQwF4KuMsibI+WGSdMU9EKo8TkIt0Zk2C
 SNQ1buTTjcgwfI9y599ETUVTlXshosoaeXKy9yDeRgEHXB+S5Jjz0KDtkppL89UvQHY88yN8X0
 fW2WJ0WQVDCUVneirp5Iyf27sy2vPB65tKV/blVXd2g2EAPZvcFUSZISEAXMkAPd8/mDimR5pO
 YobueofjH76h9GdscGShYwarf7NXO+vltTbyu3+r5iwJtnnR267IVs/kkdU4+SV03k0U4zkQKk
 RgXxw6LLJoDt2/QbUhTBUTQEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732783501; l=2407;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=HS0w8xY+qgqg3sWzMteEUnmkeL0f9VGuApguOioLhXE=;
 b=ydMl5Ii4oCAf3+RcKLmIYUiB/pb14UaWkpeYUaRn8c5DQRR43NA+NG8nT4SBrwpcyYMiE6IbV
 ORjRY6Dq6IQCMJhVFKi6KeJdDBrQV3qPlfpf/zAUwRqxoB7KUXlcaZc
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JRKPUSoZKpnqHMZjoBzcLouGMhozeGLu
X-Proofpoint-GUID: JRKPUSoZKpnqHMZjoBzcLouGMhozeGLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280069

Introduce the Device Tree for the QCS8300 platform.

Features added and enabled:
- CPUs with PSCI idle states
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect
- QuP with uart
- SMMU
- QFPROM
- Rpmhpd power controller
- UFS
- Inter-Processor Communication Controller
- SRAM
- Remoteprocs including ADSP,CDSP and GPDSP
- BWMONs

binding dependencies:
- remoteproc: https://lore.kernel.org/linux-arm-msm/20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com/ - Reviewed
- qfprom: https://lore.kernel.org/all/20240911-qcs8300_qfprom_binding-v2-1-d39226887493@quicinc.com/ - Reviewed
- pdc: https://lore.kernel.org/all/20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com/ - Reviewed

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v3:
- Update title and cleanup signed-off-by tag(Bjorn)
- fix the INTID of EL2 non-secure physical timer(Cong)
- add reviewed-by tag(except for the dtsi patch for the code change)
- code rebase
- Link to v2: https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com

Changes in v2:
- decoupled from the original series
- Drop compatible for QCS8275
- fix property order and add line breaks
- move sleep_clk node to qcs8300-ride.dts
- move l3-cache nodes out of l2-cache nodes and remove cluster1/cluster2
- add BWMON nodes
- commit-msg update
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

---
Jingyi Wang (4):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300
      arm64: dts: qcom: add QCS8300 platform
      arm64: dts: qcom: add base QCS8300 RIDE board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts       |  267 +++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 1375 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    3 +
 5 files changed, 1652 insertions(+), 1 deletion(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241128-qcs8300_initial_dtsi-ad3f193ce1d7

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


