Return-Path: <linux-arm-msm+bounces-51569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9494A63FF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058DD7A4F0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 05:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B0A219312;
	Mon, 17 Mar 2025 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VvsG5jpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CED7E0E4;
	Mon, 17 Mar 2025 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742190136; cv=none; b=hda/sndWGjm+02cD4Y5d12O+e1o6yq0IkVp/0C2EPHj3LYf1MdBMgBAp9hPB3h8RY2z8Lufy0sj//mu/uoEfIscLLCulo7gYSBA3Pndm3W06R57wZXk3eLcuFhmtMjgfFzKQ4eM+O+Rnv/AMPSs7YiUam5FURCoYQR6WmjLSCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742190136; c=relaxed/simple;
	bh=ad036HPVFPRhQY1wsOI3vm6xzQiUr/gmC8Xgg7LvjQk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lNxRT4tdWnAUB4I2yf1s/S4Q70JKO7ts0hAeCGZde6uXcc2GIhrZST/c3uE/JqMIFsdgt7+m7MP9SEpLk9lWZkY1B5NdWFqhUonh5pXPRTVYo1RRHeSRhdHhTfaX+ASLCD6XiPTPFkerx700TdKOoxbQeNA93zLEJpQ7MQOa/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VvsG5jpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GKh3Qd001103;
	Mon, 17 Mar 2025 05:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=ukzs2O2IYaD5
	rqT/7IAmrsuhMbWOJq1VZzl2EIKghb8=; b=VvsG5jpek88QzqkJGYJP0qMYX0Ip
	sxzloOY6oWx32sgNOQ2CHiHRskBPqu/jeK0EM+lvJO/X4jc79eiZJ3xlDtji7h7L
	u2MJIxPIelV/q1Sq3/tAbslkcoI5qqHhBLTgE1GA2AsuUbhjoPF0lSZYow7teFzq
	aXI4BQFBPR7zlIXlAk2sKnhXvxJ2Ymbj2JkvO36gawY6HsKnfZ12W3Gj/TpbYtqX
	JTpAWPX3TH0fuzPAWO/I45egBPbt/VGyGyaLmg5yaEqfK0O0T+fL8581px2KB0YO
	gQESerw1qfbC1ON8goJBuPAUszp03i3Rxk40TSb9EYyXFa0MFn/6yb3wzA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4kge2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 05:42:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H5g7I6015699;
	Mon, 17 Mar 2025 05:42:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgm3pnc-1;
	Mon, 17 Mar 2025 05:42:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52H5g7B7015691;
	Mon, 17 Mar 2025 05:42:07 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52H5g6Bt015687;
	Mon, 17 Mar 2025 05:42:07 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 20D765001DE; Mon, 17 Mar 2025 11:12:06 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Mon, 17 Mar 2025 11:11:43 +0530
Message-Id: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d7b632 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=0r8ssxmbRpIe_Kuj0bQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uhUR1NW6zOJjsJCa4twAJMeziFBiH1-Z
X-Proofpoint-GUID: uhUR1NW6zOJjsJCa4twAJMeziFBiH1-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=757 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170039
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

Mohammad Rafi Shaik (8):
  arm64: dts: qcom: sc7280: Add gpr node
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA and VA macro clock nodes
    for audioreach solution
  arm64: dts: qcom: qcs6490-rb3gen2: add WSA8830 speakers
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Modify WSA/VA/RX/TX macro clock nodes
    for audioreach solution
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 282 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 138 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi         | 105 +++++++
 3 files changed, 525 insertions(+)

-- 
2.34.1


