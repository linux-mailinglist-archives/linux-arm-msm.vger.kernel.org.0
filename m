Return-Path: <linux-arm-msm+bounces-59368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8295AC38EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8794F171D52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B0219DF99;
	Mon, 26 May 2025 05:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L9KwI4o6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06879BE67;
	Mon, 26 May 2025 05:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236937; cv=none; b=WCZFHy3fgDJ6107274U18U4aWc5prIAMXpPNF6BMQYR7SAnXaZq48tSsg8dyDK6GA+gh9N7tTcCE29BPyOb73a8uJv7wAoTDiOhHHX7aQpXq3UOOJIW112j6+bLk9/QNB+kYx5VjDXcktbWj3jjFO6JdIBoKL+YMzK0tKFsUdtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236937; c=relaxed/simple;
	bh=0g4DHQcKSDzEZTkPKH3l3WqKQ7ey+IHFzp/DlYwmYyk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DHqUX8qLU0H7n3ZJBmfbcP1vwPWn5/JSNf7JuvTNgz3IqE1mLEGNN1qFqF2LHOaT51a8FcKBrANl9n5w223d+fQSxMtvPm+jfLuu8B2XgKBDa8GkO4jGDXyEgOotTKH2uZzLSYxSqJUljALXTHW98PEECI0b8TOzDjmoq7Pju+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L9KwI4o6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PMt2HU013982;
	Mon, 26 May 2025 05:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4rb3ds5ZLADpTj3BACLdXM
	bu2xBVCO5DQBDsa44BwKg=; b=L9KwI4o6+JrZngMWxH6N1gQtTcMKivmySqAuRK
	Jx6FP7o76uYBrbyHOTMDRBEN64lTB05ieoCy/4ExrBsHCOjVgCNoxqQsxlWPRtdF
	wGl/Ms/cRo99D6eQ24bfffUA0juAcymQ/JUK3xDB8jR3GswDEvmp2euZ9AwuF4b3
	O+rPbOsngOEbsszIZ29PDFQrW6+mEQV8eMS5U3bkJGybBkU62bJgWlfVRaQo7e6T
	8SPwkhi9krQPcoJtmR3rqquz3ENHU+x5JLEE5zjxx7N7ipRwQ/h3KAeIfwt3I+II
	Tr+SIUVqeJ11wndrR5Vq1ofB50ZWJblws8+G5xXCPawbZCIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5eju25e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MArt022630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:10 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:03 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v4 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP
 and CDSP
Date: Mon, 26 May 2025 13:21:46 +0800
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGr6M2gC/4XNwQ6CMAzG8VchOzuzFcfBk+9hCMGuSA+w0QHRE
 N7dSbx7/H9pft1UImFK6lpsSmjlxGHMcTkVCvt2fJJmn1uBAWccVLr1vpkwVdY1QkOYKUrAJi0
 xBpk1uEdZWgJvoVLZiEIdvw7/XufuOc1B3se71X7Xn2z/yWupTT6xgERt5725TQsjj3jGMKh63
 /cPvlhHs8wAAAA=
X-Change-ID: 20250526-add_qcs615_remoteproc_support-25b331e2d126
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kyle Deng
	<quic_chunkaid@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=2520;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=0g4DHQcKSDzEZTkPKH3l3WqKQ7ey+IHFzp/DlYwmYyk=;
 b=gMnhAo47tW3XYug8z0k6lJiRUIQ4g/EqZyLvbATBKYxdWxfN/qWsRVSFkreVed49kdgMpM9xm
 AZy5zkl7GruCau0dTvMpsOt86qDzqT9JF0uYf1C1pCjAQiR+WeDQOPh
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6833fa83 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=eEcmiD4-TXqWFoa6_GAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UI4xu6Sw0ObtvFDDFrIv7qktGnNK92bm
X-Proofpoint-GUID: UI4xu6Sw0ObtvFDDFrIv7qktGnNK92bm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfXyoGgWxKp5tC9
 mzUEu2WPvWXmjFCml23Wi2BzknaEgIIMIYzy49RCWsCnLW8EEj8Qd6gV8nmKGGBTNAnm9yTfV5y
 CxOV9bgkyl0s0OXHla5T7motJjK0DUA7kA/ibd606FyJCsYAcVUHr7x+1/n33cHhIgiblsGxabR
 2ZfHa+l3H536LgHC0LN+s2DNa7BRLqWtxFvm9FcAYvSflQ8+IVv8jDrc8Z5VrTBXzc1awdgGo85
 Esj+CT9RfNkeNyacPh+WwSW0m5huS+s33k/Eo/3+/Y5PZvbz3P8wJM08MVNWpT+jmSxR1tmRtVO
 ZdHKpK/bDgxuFv6RfMav/3RiYZizZOY83HtxmgCm+yOE6t3Ib3Y8FHg6yjowWKQWOca8huumALH
 FMzo3stPwOu3UEc194i9TVzZ/LGkTIkWl93Cl5rWb1z6r05b8F13erIu/CMdUTl7jc6TqVH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=963 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260042

Enable the remote processor PAS loader for QCS615 ADSP and CDSP
processors. This allows different platforms/architectures to control
(power on, load firmware, power off) those remote processors while
abstracting the hardware differences. Additionally, and add a PIL region
in IMEM so that post mortem debug tools can collect ramdumps.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Changes in v4:
- Updated the address within the SRAM node name.
- Collected Reviewed-by: tag.
- Link to v3: https://lore.kernel.org/r/20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com

Changes in v3:
- Updated base-commit to tag: next-20250515.
- Collected Reviewed-by: tag.
- Added a comment for SLPI 26 in the smp2p-adsp node.
- Updated the IMEM address to the starting address of the IMEM layout,
  and also update the offset address of pil-reloc.
- Link to v2: https://lore.kernel.org/r/20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com

Changes in v2:
- Removed the qcom prefix from smp2p node name.
- Removed the unnecessary property qcom,ipc from smp2p node.
- Removed the unused node apcs: syscon.
- Removed the unused nodes from smp2p node, such as
  sleepstate_smp2p_out/in, smp2p_rdbg2_out/in, smp2p_rdbg5_out/in.
- Updated the commit message for IMEM PIL info region.
- Updated the remoteproc node names.
- Corrected the size of register for remoteproc nodes.
- Added empty line before status properties.
- Link to v1: https://lore.kernel.org/r/20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com

---
Kyle Deng (1):
      arm64: dts: qcom: qcs615: Add mproc node for SEMP2P

Lijuan Gao (5):
      dt-bindings: remoteproc: qcom,sm8150-pas: Document QCS615 remoteproc
      dt-bindings: soc: qcom: add qcom,qcs615-imem compatible
      arm64: dts: qcom: qcs615: Add IMEM and PIL info region
      arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
      arm64: dts: qcom: qcs615-ride: enable remoteprocs

 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  65 ++++++----
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  12 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 144 +++++++++++++++++++++
 4 files changed, 195 insertions(+), 27 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250526-add_qcs615_remoteproc_support-25b331e2d126

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


