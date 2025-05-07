Return-Path: <linux-arm-msm+bounces-57134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F257DAADC71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C1A1C04247
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7372139B0;
	Wed,  7 May 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftx4P80e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4A748D;
	Wed,  7 May 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613618; cv=none; b=cUN7po5RBr+Q4DGCqg8tKzFDh8t97kgVeSOhfg0hgwvHJsKEfUNp2tvVPproJeGqQmMb0HUQ+tzit1S6RthRC6Q49/SEvAa8vyUAcS3y3LppoA/W/0UOnEV7U0/h5ETTLuwMt0mrnk9gfGWmLEpA2lSqUnZ35jW4HGZpRBimBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613618; c=relaxed/simple;
	bh=hTf2JFbmwImuDMJsmrnZ6KPM6n8CTgRK0R+nYi85jUs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ldvo22PpSdT/Gk4Kr5PbS9R/PbVbputZz4VCl9EhqbJkqzMon/wIxcwLB2Mcusdm6G5aYF6app6rDrAn4v083CYJrwoDt92cNZgHt0CjQpmVx3OQA7Y6mi6yfKeXDgjz7egzSwEaeeTaegpOgP2olIcMATuXNhplLWRKU3Bny/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftx4P80e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5479wbIh002585;
	Wed, 7 May 2025 10:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O5RXwrkPNB3nTDXkrCliLR
	zUkuPHUxKfsm6kiIgTxZc=; b=ftx4P80e7xciE0g+DBH6y5YVCG/nrjbgtmJJhd
	DnbRF0ba2gmg+gCeFqo0BI9VZFElGWSvnOKP9ifK5/Wi0Y4uMizUyVAaBbwOtbFG
	FBg+pzFpKJ1mRiljb12RlXeqb+K5ACVqMorudAyIJV0XLBUJHsHQbsVdYBhy3lwl
	zOkU6/yYnYBpuzj/gwSLMvcJ0OR6k5tyvvfQbSU4vVY+vJr/tFKevhs6L/nmwwx9
	/2ySKoRXQonC/dwXzvV9+/1xNKM4OnKui/eKQgxxQxYfEScfCnS3niMbqDEl10Ht
	U0jiqj3IQTKWkL1MsyqDe50hYgBKeefKNEpHuBASxd+P17gg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt1vw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:26:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547AQqDv024069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:26:52 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:26:45 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH v2 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP
 and CDSP
Date: Wed, 7 May 2025 18:26:10 +0800
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEM1G2gC/4XNSw6CMBSF4a2Qjq3pC6GM3IchhLS3cgfQ0gLRE
 PZuxQU4/M/gOztJEBESaYqdRNgwoZ9yiEtBzNBPT6BocxPBRMlKVtHe2m426cbLLsLoFwjRmy6
 tIfi4UFMLK5nTSkpLshEiOHyd/qPNPWBafHyfdxv/rj9ZCflH3jhltNfKQV1p7bi6zysanMzV+
 JG0x3F8AEHTFRbMAAAA
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
	<quic_chunkaid@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613604; l=1916;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=hTf2JFbmwImuDMJsmrnZ6KPM6n8CTgRK0R+nYi85jUs=;
 b=jXm531vnKgoiXCj3/fhpq6Ja40GQjwH9fr1MffMergNzsNszXTraiLSDIcy4jR00uvJ9yiZgS
 iZMDoGhcptQBhK7kAmFsMut7wKusfqpegfbkavqFPzz1leAru5eF9wM
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681b356d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=QfQTvixX5dd1oHoNGvgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TqZ6Y8a9RejXGxvMt2wXt6OW8AmwBMbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX79WrfpSp/X0g
 tP9Az9HepTdRrxTEboI7nFlt9V1+18Pfgh8ZfVsvD6KBhU90jrh7Om7w9aWkpzQpSxpK9lkqVzn
 zv9IMdePDml1jXWaSyNI4vszU5rNgTO5iUQAi4eMqy7m+2iTrBppzomBbaRNuSRVh0pBm1oOwfa
 i4zRcP5pWb90kA8UlM6ju3R29S3UuEwV2qYxuvXAp3W0DCdh3PyM8bOgDvoWr3mNO5MfHSJnNac
 7WiHjiePJBNyVnYOuToW6L6MqKBRebHd7i6O1WopS9FN9UxQHAaHUizc8dkSq2W0GvE/n9iF7vk
 8w+hmAzIyY2iUyEw/PFqGtnnGp56uPc1shhmi2OmegUrquLsMifnlF+TljNlj77Jg7W0i0wEbwm
 loTAB3nvooB6fTUvyboaXhVj8W/NPoDGnlk4l0+AS+8x6Ggpfbab3o55lP9F2sq9RvrgE1BC
X-Proofpoint-ORIG-GUID: TqZ6Y8a9RejXGxvMt2wXt6OW8AmwBMbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=812 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070097

Enable the remote processor PAS loader for QCS615 ADSP and CDSP
processors. This allows different platforms/architectures to control
(power on, load firmware, power off) those remote processors while
abstracting the hardware differences. Additionally, and add a PIL region
in IMEM so that post mortem debug tools can collect ramdumps.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
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

 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  59 +++++----
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  12 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 143 +++++++++++++++++++++
 4 files changed, 191 insertions(+), 24 deletions(-)
---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-add_qcs615_remoteproc_support-c82d30f9433d

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


