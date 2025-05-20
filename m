Return-Path: <linux-arm-msm+bounces-58599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15500ABCF33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2142167510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DDE25C717;
	Tue, 20 May 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hcB2G/+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B51191F66;
	Tue, 20 May 2025 06:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722423; cv=none; b=IByYCI3ptV9DsGj/kXwUEMEzgB/ZBvw7Zxl16hiLVcRGDQY0rXraVxhEe7kmdKVzR5Q972ltVtRVCMslJHQY7DJWemi5TGbftyBfBVy3f0jEPyeaQM35cM+zJJrYUN1Gw16/kPvPPO3B5zH8fxhnYQqXu4pIhnG7jri0e3wg2U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722423; c=relaxed/simple;
	bh=GpyUqaANFcHyx5byEjQTPgbH3UHFzrQybJoCiT+Ew9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yk2ULZAstObIGQmTlus3I2zVFTUGJYR5yYrBIJJqxC+KdG0d5DoRcl5jsPar2++0t6cKUg90shn0kYwU76++ZD2CEOsiExWuNZ2tbzFWAhdABrOB/INs/i7iFkRAVFVel9S+RcUdJQbpCw7YjkIGobAX9v0FST1C7DwsNWMfXtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hcB2G/+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JIOpx5002214;
	Tue, 20 May 2025 06:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ul2TrUg+BuBTm/zCz45PmuUEa5MJIZC2jSk
	wp8ofa6I=; b=hcB2G/+1ykS9ckE6S7RXUr4UKKLMa0ZuYTJiiS/5d9PRJKkxbKN
	dmFk57WfQ6vgpnWCPvSR7uJfdy+nxOwSuG24elVCFb73hlRthpLc7w8kK6pS5s7h
	X3XuSKLqUKtESzvuJ+R4g5cC9VD+RSlb5hnSyk/B0n+0xHImfuG7YMnr9FawvRIM
	wo5Mm9hy7YEt9MwJZHP1VzhzS6h358Z+SaWOj/7v0OKcSj+uEIDYmO6wI1Fv2FGN
	tozBMPGAv7xZEedVH1dg5Dd1prcEu7Sle1SkDB+x5r91BUNknXmIZl+AOfS9/wfN
	cOa9n8CQjUbj40NY8Z2F9iIQCw2qUKZRIPA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atk20d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:26:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6QqJ2010623;
	Tue, 20 May 2025 06:26:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhm5t3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:26:52 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54K6QqJ3010616;
	Tue, 20 May 2025 06:26:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54K6QqBU010615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:26:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 391685C2; Tue, 20 May 2025 11:56:51 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 0/7]  Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Tue, 20 May 2025 11:56:11 +0530
Message-Id: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c20b1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qXBIds3u5FJ4LVJbLgwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GSif-6SNixviYH-4FPc1dv4rvqTpulH7
X-Proofpoint-GUID: GSif-6SNixviYH-4FPc1dv4rvqTpulH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MSBTYWx0ZWRfX33EmXMqeiQde
 SVHAOIuiZ2FDkqnvOV9qUZAP2j1Zvseb5Ah031fLm8nDdN1avesCXhbWtIBNoy1egnTEUqIXCLV
 aRc992PHLDS/CpZox9sEMf/t2vM1Fuj6pSaejbYkpXmFy7H5k4sMjt4DCHCYFqnyGpCKbzDvggW
 iPqno4gJv3RGeLFq5GJtnlxIAJONCgZ36XdtTnChibG9uycMsFSJGvyrRp37SqVHFz9QcZqM3+X
 NMfD6JmQnd708oXrLg/qRKWHoCkMfo0Di+kBPC1MIdbFJvLiK/UNzqEFw/GvSP+O3QmkPVotzR9
 lIaLgoGQNEK/1gPuJvmcc2w3sl1yFPm7o5CIfKAX8jcK79zSTXdUdDZlcjCEw0DlllFLebjJWWC
 0R3rpeX/RM0igqfsC+QHThjLWf/2Dt7bEDDQv/7jfOKcgqD6fZNt4HD91DU78nKCgSghBYGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=774
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200051

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

Changes in [v3]:
	- Added protection-domain in gpr services.
	- Addressed the review commnets from Konrad Dybcio.
	- Fix DT binding errors reported by Rob Herring.
	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/

Changes in [v2]:
	- Created dtsi file to handle common audio nodes to support Audioreach.
	- Addressed the review comments.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/

Mohammad Rafi Shaik (7):
  arm64: dts: qcom: qcs6490-audioreach: Add gpr node
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 179 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 158 ++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  78 +++++++-
 4 files changed, 494 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 484803582c77061b470ac64a634f25f89715be3f
-- 
2.34.1


