Return-Path: <linux-arm-msm+bounces-55092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32954A98529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5543AB107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20F720CCDF;
	Wed, 23 Apr 2025 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ITs0Ng4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242951F5430;
	Wed, 23 Apr 2025 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399889; cv=none; b=OJiN11iCotVvOtaj6NvKAL83eeVveZQeN3Ff3gCfNJvtDxzmT0PpvJm3deED3awhw54BipiZ86P3epBsw21meHmM9LeFd0I/29+4oKkofrSBkiIlnYlOf/zqId767nzTkmkWB/m6wV2PZLI+8e0I78HmhKlN6IZB3kSxILO9oQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399889; c=relaxed/simple;
	bh=wWZ5ZbR4uwnLS9gUFgcryCnrzhxHYMElNM6ladJYaYc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tFMNWfS4g4YKZppFTUm8PXbpZesfjJGl8oIeV6OjzEYtQu0tMcEqn0g87/ziPeDHoNtPjiLbeXzj8R/bLEBRxZsYCjRfbCcMfH73L0dj+CR+WUvgZunFItZ3XUast/Cgvwj1jvcbw++M6nD1+z98hzkLR0hrwZX38OApPHmPA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ITs0Ng4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9Om011498;
	Wed, 23 Apr 2025 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oRzweVFkm+leCMYoV4OmhB
	fVMrZcPuUShl2UXT7vyr4=; b=ITs0Ng4XN18QkXkzyWAqpUIlOmhvCejqXE/r1R
	wFd99VL7p0sWowxta3OFkE2SeVOZoc6vmfztFsvI6nff2W2ICT1R2OsBN7LpAjdc
	PMTtkO8rHjk2uin9gUsaacd9qH67Be5X7EeBlVIEzBfpIvo1UPLHfnttrztVXmd/
	6Sd0t9Xzaewd05N/Vw3XrmtX8iWr4QPkdCIz0mYSrJG3HkkF44SQ8zOWRA5A/VII
	jwR/CXbEHDmcz1fCIKDfZWSsdc81gEJIsbSvI4IW2X55EsF3qWebpBxvtzR/RB/d
	RyD2X+fM8XrvzRDLQlNotpEggR1weeWHHNNKB2kQRM4U0wtg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1hkh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9I3Mg005500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:03 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:17:56 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [PATCH 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP
 and CDSP
Date: Wed, 23 Apr 2025 17:17:36 +0800
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCwCGgC/x3MwQqDMAwA0F+RnC1YsT3sV8YoXRM1h9ma6BDEf
 7d4fJd3gpIwKbyaE4T+rJyXCts2kOa4TGQYq6HvetcN1puIGNak3rog9MsbFckp6F5Kls14ixi
 /zvk0ENSjCI18PP/7c1039dukOG8AAAA=
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
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=1323;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=wWZ5ZbR4uwnLS9gUFgcryCnrzhxHYMElNM6ladJYaYc=;
 b=x4joLMsCzt125d0jnxfxtWXtqEGV9iDClZbo0q6KY4tyK8v1zUbzgyOvG66w5pCw9ptLAss3F
 M1M09Dwj/EJBTN7i5BnrJQcKpShOII2zgpggJqFneITthKx1vyOKqcg
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z-roSG1h-dtZB7O2JeYPs15J1mcH3reD
X-Proofpoint-ORIG-GUID: Z-roSG1h-dtZB7O2JeYPs15J1mcH3reD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfX5/MNN/U/7SAF Hfg1z0lttzGR2gCo/ZxYYH9EDRj6am3LK4rlQn/rln+w6/k1qPhMDIlGV1AzfYUazOXTWl/eqfO HMzwU0AnnA1dcBjhNxCGovSrFveWLza2jLXJpZBmudT/FOUu+W595TTsbcfUKLHlpqTHsgBkmmu
 mxeq3uny1C5o+XZQDWRSWD2AvNyLfXC1JU1GsvhLi6Jy1rpQld8o9O8940dpr9FIL1a7RUa4hA8 grvTasM/PcjdSXDS4nC5clg5fWjwqIdzMp/MFuzQKPMBpcUTgPkehho2x8arYzVK/nafV/trcsc Ja86fs8XeCzLB6ftOheX6JHdCq7pwJX2X/segi44mDh1RJhlGgeAYuXNHiUQRaxkfgIOWkH4g45
 YBqGzXj5c8CD6+E8ftsPozSre6m4Ti+ol5nfmoIEWXFfYKnkAVkO6/fwU1poDWDNqvEtlWmv
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=6808b04c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7SMQBPlZ983H3FKNTaoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 mlxlogscore=629 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

Enable the remote processor PAS loader for QCS615 ADSP and CDSP
processors. This allows different platforms/architectures to control
(power on, load firmware, power off) those remote processors while
abstracting the hardware differences. Additionally, and add a PIL region
in IMEM so that post mortem debug tools can collect ramdumps. 

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Kyle Deng (1):
      arm64: dts: qcom: qcs615: Add mproc node for SEMP2P

Lijuan Gao (5):
      dt-bindings: remoteproc: qcom,sm8150-pas: Document QCS615 remoteproc
      dt-bindings: soc: qcom: add qcom,qcs615-imem compatible
      arm64: dts: qcom: qcs615: Add IMEM and PIL info region
      arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
      arm64: dts: qcom: qcs615-ride: enable remoteprocs

 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  59 ++++---
 .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  10 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 179 +++++++++++++++++++++
 4 files changed, 225 insertions(+), 24 deletions(-)
---
base-commit: f660850bc246fef15ba78c81f686860324396628
change-id: 20250416-add_qcs615_remoteproc_support-61ddab556c4e

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


