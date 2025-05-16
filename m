Return-Path: <linux-arm-msm+bounces-58162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0FCAB94AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A55E77AD953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A853020F087;
	Fri, 16 May 2025 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TSvm+F0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2777187332;
	Fri, 16 May 2025 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366074; cv=none; b=JsBGuCBpvSiSXmXhP8Aw0Wm9mm2SJsTr0k/MiOqRdlDS21XEVtf0RAl+bcnFOAej6BGY56VvzQm6h+YGqWmuOVXwXuUCEQr22EBH12kDbnHhKC2+v5tc6QBGWBR4c2KYZDj1pGNXtp02XyNlsLRsG7znDr+P+G4Im5JR84TSNDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366074; c=relaxed/simple;
	bh=JyZW1Cxzaw1r7YuxagGQU7MxHIA9QmEfNg9oJ//91wg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rhoDC7eKpQe41HhtCqNH/fO6dhkTlEHMKhECW5rONUvEBj9BWBzKO4yhNyGq/dou2dEzNjn1K2fMya6q5hoM/2j76+5BTtpZvveZzCwZ5zSSYzJTAPEY86jljIZnN6uQMaif69+AaIJ3w4g+u6Wxvx2Sgpg91+dpeUWQ3A2M6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TSvm+F0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FLURHT025636;
	Fri, 16 May 2025 03:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a/drtQ/nJYpUA5OfXfYqwm
	u4bq2l/AVDnsaBMZDy4oY=; b=TSvm+F0ONd+qjsAuTH/byrJdQOKwURCj7hnZRI
	3/9+hZU91Uf9FipOOcTo9Zjg6tYO2a8vvVuKPPdqQHUrtZ1HoGpDSaaxMt4kjNL7
	rDQsXZW2vR472gS/o0qLRNR8Hlcc5/OKVEtHz9dCc+ydooldtx5dxCZvm4yC7k/R
	JjkiJU2Ut4m7P8NTNU9n7uTMKdTgKQljvdde7yOrvpWSj3dFdOmgzr73twvT5nrk
	w5HqMmEc+G0xCKvTNl03yatG68xc0GoxWKi5aU/Ab43rS+N6DiSMZit8IhhjqjnP
	OktMNKwNFfcug/LD4OmY8aKY4MWhd6oTycYD26g3GbSCDyOw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq0d4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3RkME018484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:47 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:39 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v3 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP
 and CDSP
Date: Fri, 16 May 2025 11:27:01 +0800
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIawJmgC/x3MSwqDMBAA0KvIrBuIn4TQq5QSYjK2s6hJZ1QE8
 e4Gl2/zDhBkQoFncwDjRkJ5rugfDcRvmD+oKFVDpzujTWtVSMn/o9jWeMZfXrBwjl7WUjIvanQ
 mBqtxcMFBPQrjRPv9v97neQHxlJ1tbwAAAA==
X-Change-ID: 20250516-add_qcs615_remoteproc_support-b85ca60e48a8
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=2297;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=JyZW1Cxzaw1r7YuxagGQU7MxHIA9QmEfNg9oJ//91wg=;
 b=uTXg2MhxtRZNolzc+UcknoaEhax+2YN+IAgZaKw/QlNBoIIgoCiI6/kqGQOzd8XBnsxRiU2e7
 d6a0jTU7MF2AvynI99/kYOt18psLnc+mk6ubaOp1wMwNgJLFr0MduE9
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PsXAk9mtwXWMpSwbbsnsmuE1JUTflhsw
X-Proofpoint-ORIG-GUID: PsXAk9mtwXWMpSwbbsnsmuE1JUTflhsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfX3TzZO79QNpnO
 yczeJC29xI7mtSb3namggz29HByW43tY4+CwlY3kz7+m6Gy7YD6gun7aP9V8AeMz5C2h8SRfrg0
 PVvM8hYOgyUbdxVY4DpOOvjX2brvVEZpfBKRgHck6Heby4B6f+FXa6C4jO1Wn4uSJPo9g7xB4EW
 bT5ib3m5xhPH9HVOwsc/nqIOzSk3z43O/rYuwot5MK+hw+LhKUgTWhmkh+uEA1NoSuW2izborof
 Kmq4ngz4wujmGRFwC85pcUryIjW2bB68z23iB4XldqITfNG+5qLP1D2jEWLkVSJKt0bag6wleIu
 506P1G9JZ6p/GGfktDoMhm105VGAKp87/n8OY2Kj/v39cgc8fBilEFPk5krhIvMbqKQpnxv0dKt
 KzZ74BVWqSiV/4cj9x4+VaKH9PuMJrimJYKBe3ar9RtJDU9EZ19G4itk1h1URVlKe0PugpO4
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6826b0b4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=rOYcFei1Rj9JNN2iA38A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=869 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160031

Enable the remote processor PAS loader for QCS615 ADSP and CDSP
processors. This allows different platforms/architectures to control
(power on, load firmware, power off) those remote processors while
abstracting the hardware differences. Additionally, and add a PIL region
in IMEM so that post mortem debug tools can collect ramdumps.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Changes in v3:
- Update base-commit to tag: next-20250515.
- Collected Reviewed-by: tag.
- Add a comment for SLPI 26 in the smp2p-adsp node.
- Update the IMEM address to the starting address of the IMEM layout,
  and also update the offset address of pil-reloc.
- Link to v1: https://lore.kernel.org/r/20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com

Changes in v2:
- Remove the qcom prefix from smp2p node name.
- Remove the unnecessary property qcom,ipc from smp2p node.
- Remove the unused node apcs: syscon.
- Remove the unused nodes from smp2p node, such as
  sleepstate_smp2p_out/in, smp2p_rdbg2_out/in, smp2p_rdbg5_out/in.
- Update the commit message for IMEM PIL info region.
- Update the remoteproc node names.
- Correct the size of register for remoteproc nodes.
- Add empty line before status properties.
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
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250516-add_qcs615_remoteproc_support-b85ca60e48a8

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


