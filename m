Return-Path: <linux-arm-msm+bounces-62431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2135AAE80B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C91416C382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C79E29ACF9;
	Wed, 25 Jun 2025 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TKxOXR7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A461C07C4;
	Wed, 25 Jun 2025 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850067; cv=none; b=SkOJ2dTEk9MjwdiG9FqFcY8hgWKCD5nZvdqRCL3sxHbFI46bzLwM75OU5SxF6tVY8Bjuac2a27gsxPJijlLZiFRp/u3T5rAeZnQchNhjBCPxsRNwcqvlzto+hRW+320B6x8GNkkBdMb37l4bGQoGQKngbndXwPbbh1KJhgZlNDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850067; c=relaxed/simple;
	bh=LOPv5WqptweOmR1yymCn5oKhJpo7RUAOzx3z/ZgZlNA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=C6P/P4N3E3k6SmVfeYHkWIsXqjgfoy5TgNAGe1WOXu3prYyAQfJ0gZBcM8A1FFR1iI+qHTPV3C5lXb8vDhhi+m38qYEkuopgeAKojqLmZDISyYQ9efUIX0R/bZF2wpIQ9uYjIhc45bC2Cb+1io8ks6qDI5DPIgmVOH/2dfb4VH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TKxOXR7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3hUel012128;
	Wed, 25 Jun 2025 11:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6bbj0+aXCCnzJm3pnpDXir
	ltoLKCrKhW0s2kjapC1xE=; b=TKxOXR7ofdLYU0mHogunLZNNZ2MGeTLmEfJhtz
	HiBwbOZslBaKGyl/4sqJM9PiUKxExGT408OiC1ikYv4CD91fkp0TIH1dUsB6G2ie
	X5WapHT1R8K7xSteb9N9xH0Ze65XwgWW1aEjc8EVJAGxbargWqmjuyRbeIpdUTGD
	yl88+9PLnvlzJz7lMRC+7Yo/+b9u23lC9vIoo5tFVMThHyTbRzCLn/kd7ckBV+Q+
	fT7gAQZt3DHjTHRj58m6xQO52qnu1/UlwAT8F5X/EQ7D/P5V/wDnqYkBWWz6nA/5
	zuXEKDzKXypdwmClEdgnJI4MyMTKtxSBtzyfpYOMXhtUL8DA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1x7cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PBELME022236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:21 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 04:14:17 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v4 0/2] Add support for clock controllers and CPU scaling
 for QCS615
Date: Wed, 25 Jun 2025 16:43:59 +0530
Message-ID: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfZW2gC/22Ny27DIBBFf8Vi3anwGPBDUdX/qLKA8dCiGpOAY
 1WK8u+lzrbLc6R77l0UzoGLmJq7yLyHEtJaQb00gr7s+skQ5soCJWppUMOVimk1xAh0ucG8wa7
 AGTc66ueOtRF1ecnsw89R/Tg/OfP1VuPbU4rIpdgjPjWnf9p7K4GWRN9Aad1yWhbO5bASmNSAW
 vtRzsN7rVJY6ZVSfPu7drZw3cQYtqlBy2it9Q5bpZVX/dBSJ/tOjXokj9hZpwbDXpwfj19ANTq
 ZCgEAAA==
X-Change-ID: 20250625-qcs615-mm-cpu-dt-v4-b6b9bc7d3e56
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bda0e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=a7MBU3iHR-4UK4nVPLsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q0OVEKoZW4_pfs_snn061a9E1jagyYTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NCBTYWx0ZWRfX7SHlwq9twNO1
 ecWiKmWZx0X0UxB3y6euylxZEps3uae1yqGlBrnnsvWbA2fQM5/cqtIn1fRiCQvQ9er7L3atTaM
 788/C17VBqjIbCqrnL4LO8oPyu9B/BNRD51LOXf5nfZBmRGtcaw+qgUyDVqBFFd+d4pPX3ufkUb
 MQUOCpZtVw7edK9y9RElfFIVFcv7SiVyfkkhl87Cwy4tGFlsUsKJfwqMboRWXhbCrkZ00nkXbdP
 6PI9ZUh+/wda6tas3qM+bTRbPpdb/oD/4dGbB+vn1aQWl9OZqdS9HrFJm6C3L0F3h9ekxv5HMU8
 rdWoVm12WYfVZeho8FGLpFV8xLaAs14tqNs/9kCrG9InrBslDRtCejfa066/nH5md2NUM84EdE2
 KVA+3wdCGpVLkeAxZdA2uC+R6hncTbD8/xqT8NBv5xXrHoH1rkh8xruYr59FIdTOi5ykOU8p
X-Proofpoint-ORIG-GUID: Q0OVEKoZW4_pfs_snn061a9E1jagyYTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=785
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250084

Add the video, camera, display and gpu clock controller nodes and the
cpufreq-hw node to support cpu scaling.

Clock Dependency:
https://lore.kernel.org/lkml/20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com

Changes in v4:
- Fix the typo(removal of "") from cpufreq-hw node
- Link to v3: https://lore.kernel.org/r/20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com

Changes in v3:
- Move the cpufreq-hw node under /soc {}
- Add the RB-tag on (v2) from [Konrad]

Changes in v2:
- pad address field to 8 digits [Dmitry]
- Replace cpu/CPU in commit [Dmitry]
- Update the binding to use SC7180 compatible, as QCS615 uses the same
  hardware version.
- Link to v1: https://lore.kernel.org/r/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      arm64: dts: qcom: qcs615: Add clock nodes for multimedia clock
      arm64: dts: qcom: qcs615: Add CPU scaling clock node

 arch/arm64/boot/dts/qcom/qcs615.dtsi | 80 ++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250625-qcs615-mm-cpu-dt-v4-b6b9bc7d3e56
prerequisite-message-id: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
prerequisite-patch-id: 932a0fe6ddfcc9720eea7e2b29e1bd6ed21fbfca
prerequisite-patch-id: 6414e91724ba90fe820c3d2bb5caa720c99cf3be
prerequisite-patch-id: e4e24f3dc507891b70936c9587ee1416f1a53e6f
prerequisite-patch-id: 23062409b23977940c958bf22a215ae5dc45e93a
prerequisite-patch-id: c35335d37fdf9a7f665f1c6d79d34b091d45e291
prerequisite-patch-id: 9a0caaaa8d25634dd0db5edffbc939eb7e734c6c
prerequisite-patch-id: 66386f8e3c0b0594dad7794f8ff04e6eea2ffb5d
prerequisite-patch-id: 2327271def3656283d53dadb2ce9f8cd561249d1
prerequisite-patch-id: c97840c551e081b0b9bf6c0e77b551935454f62d
prerequisite-patch-id: 71f0eb0fb98c3177dcbe6736c120cba4efef0c33

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


