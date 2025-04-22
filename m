Return-Path: <linux-arm-msm+bounces-54904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D1A95D6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 07:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DEE3B8D62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 05:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D2A1A83FF;
	Tue, 22 Apr 2025 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BoRHcvnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF1A59;
	Tue, 22 Apr 2025 05:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745300555; cv=none; b=dkm0bY/zPwyYuZrTBXjsK42+rEQrjEiP3ht12KYuKi9B69OzOeu0/teXcx4yDxQGN33RutDq2NSIKNdQYZIW3os7SD8kKHrsnicCZorksRmy2SwtBLcM83rMbDyIj97hxjj4EJXRkq1pCUTA1T52UlTiCeoVselLeh9pR63Z+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745300555; c=relaxed/simple;
	bh=I/eaYPiPD4/vR9fji1kZ2T1ODATHcon+1LC3SCxLVrQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=AvaeRfmvMagJr51/JeL/lERZUiReDESA21cB3sgNR1iWAFckmTLLVmssuER1w1g9/smU+wC8QeeUjP/SFIQIa9g2pHKz2nA0L/8887PpNksOlHQwQIxUuUcXd17pe3aB0NsVBzL0elmEA6LgBVEL500n0pguMI9t/s9gnagmtNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BoRHcvnu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4OcVY019396;
	Tue, 22 Apr 2025 05:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VwTKnYwHVBUp8m+jvjJ/hJ
	jElEfSxcZXInmyV6mUX70=; b=BoRHcvnuukEFH7cf+xjm81Hys1g4yCg+W96CYC
	Mr5+WkPlCY5jFBILLQcv04lfWkQaFWBXq48vIOmZcgWeYrG6wGDGTV70Ba6dYfUk
	mucUPMi7E1BAysQMFMPJIugQBR3tipUubRxY/O7xiuBvMmXXOzwtRmuVN1az7G6q
	A3g5Z0cAwOAlvJdxyrYtOp2d1kfH/M+lx7BcHKvusC/k8WjvwcpfNYJqEGAcwkXv
	KaUs5B+OqbqHci87j5JpUF34T0hGuHeZ6KhTIaK16jSkPcngGdbr9Bu1wUpJtY1I
	mV+U4MTjzmGt0zrTu9ugSRoa4JgjpwUrTNzFA3RxvS1Mu7pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bp693-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:42:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53M5gTOc000862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:42:29 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Apr 2025 22:42:24 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH 0/3] clk: qcom: Add camera clock controller support for
 sc8180x
Date: Tue, 22 Apr 2025 11:12:09 +0530
Message-ID: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEsB2gC/x2MQQqDMBAAvyJ77kKyKsZ+pfQQ1rXdgzFkaxHEv
 xs8DsPMASZFxeDZHFDkr6ZrquAfDfA3po+gTpWBHPWuI0Lj4IPbkePCjLblvJYfjjFUP0wU2xF
 qm4vMut/f1/s8L/CkxutnAAAA
X-Change-ID: 20250422-sc8180x-camcc-support-9a82507d2a39
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=68072c46 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=OrtqDbjkpIUBgnuzYQYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tHm99u_fWYB3Ex6tn6AFyGgPrjNvKe3D
X-Proofpoint-GUID: tHm99u_fWYB3Ex6tn6AFyGgPrjNvKe3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=801 malwarescore=0 clxscore=1011
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220041

This series adds support for camera clock controller base driver,
bindings and DT support on sc8180x platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Satya Priya Kakitapalli (3):
      dt-bindings: clock: Add Qualcomm SC8180X Camera clock controller
      clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver
      arm64: dts: qcom: Add camera clock controller for sc8180x

 .../bindings/clock/qcom,sc8180x-camcc.yaml         |   65 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   13 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sc8180x.c                   | 2896 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 ++
 6 files changed, 3166 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250422-sc8180x-camcc-support-9a82507d2a39

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


