Return-Path: <linux-arm-msm+bounces-25669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7C92BD12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2891F25680
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EA719DF49;
	Tue,  9 Jul 2024 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mZlr3z5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76819D8BB;
	Tue,  9 Jul 2024 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535751; cv=none; b=mDwmAMNn8phGdf6SHNduozd5RJQ3RG+13CcuNJoTTlY5y0dcZYriMGrmA3Fsrtw3cz8IwjO7kSw4LVnlek/BXozZ9lyN4QQTsk2b0kGHKXhpAxWCfGJnyE0nYEbcD1JZba8juqfUA2gs6P9RZiDBMyrNg3moKv+RPi37QdTPZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535751; c=relaxed/simple;
	bh=4+fmzR+/2ETRPs+s3fUsvIAsy410FKmf8CL51ifTPrs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HtjEAU8zJ8TMt0Wvu6GK7S10Vypjywtdyew7Ixy0uj0RD0M8PY21kcD2JuUrBG8zRlBuDHO2knWzqJJyITewFd2ddgUHiVIScKtP/1w/MFH3Au8U8p16nThVjj6+3FJMr9ILwUxA85+1gX964cry2uERrUrxEGK5Ko93wXYlCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mZlr3z5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Aqu6V029428;
	Tue, 9 Jul 2024 14:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h7yzyLhCdR3TeTqKzaFi+D
	Da20giDro5hsjyGrqhKgc=; b=mZlr3z5uyEjsjjBdkn9nh2JUqTuMVrSlZ3Edrb
	0eFcYl2W9dR2i5PWpPVfX6cGpeRu8USeMGjR5nqIMZLtCsTT8ytNDAd0B/2rt7J+
	aFshnrDmTy9FcG32YyNu6jCNuLLJfEL1pToAC8BN1tivtZk4O5U/ZZJUzB0uOOGU
	rd4tUMU/EvdJ2xijjoYOmulmcCT+XYKIzeOHaYTX/96/TKjzQGdWmRfZB+bdADTm
	d6VgKgUzLCMmbyuquFnBxHMkCUHHonzIYKD+J3U5YjOV1T0e83sAJWJR/84+27UC
	SPgQOWZUfh2/TInTdvQfy23Fu/ynJuUjdXbmPmq4i/hrt8ww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66n1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:35:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EZinF028867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:35:44 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:35:39 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] clk: qcom: rpmh: Add QCS9100 rpmh compatible
Date: Tue, 9 Jul 2024 22:35:28 +0800
Message-ID: <20240709-add_qcs9100_rpmh_clk_compatible-v2-0-b6f516c36818@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBKjWYC/zXNSw6CMBSF4a2Yji25LW9H7sOQppYL3AgFWiQaw
 t4tJA6/Mzj/xjw6Qs9ul405XMnTaAPk9cJMp22LnOpgJkEmkEPJdV2r2fhSACg3DZ0y/UuZcZj
 0Qs8eOaZ5nBUJCJElLLxMDhv6nIVHFdyRX0b3PYOrONb/dwwyLVKIpMglQMEFn99k1IK2bbS9H
 yBrotBi1b7vPyeaB9q7AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720535738; l=1678;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=4+fmzR+/2ETRPs+s3fUsvIAsy410FKmf8CL51ifTPrs=;
 b=CnKuolB0ZL242WWh596qjAMaELQmggXSLXyr8FjYlEVgEwNDGTbK7jmrV6/SI6EZKAEzhbteL
 P726spHVCLXBBeXBhm9s8FzsbS2i0GJJ09JLzSPvGf9Q0yIVao6KkA1
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4N0jpF_9louQnVpb2glEnYyVn_UPZh8c
X-Proofpoint-ORIG-GUID: 4N0jpF_9louQnVpb2glEnYyVn_UPZh8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=649
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090095

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS9100
      clk: qcom: rpmh: Add support for QCS9100 rpmh clocks

 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 drivers/clk/qcom/clk-rpmh.c                              | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_rpmh_clk_compatible-e57368401164

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


