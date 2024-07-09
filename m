Return-Path: <linux-arm-msm+bounces-25691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647892BDE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A36E1F22AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB74419D89F;
	Tue,  9 Jul 2024 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="plEQDRkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F99719CCF4;
	Tue,  9 Jul 2024 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537835; cv=none; b=TYRN5Q33oO0tD91A4ZntwdSUVfKk5wEliHefillzTO/IJMMCAv/jX1kzokT1EMTpa+XYHij/BKbgo5Ndt81uIVoTyyf5G+ai0dCIF3yJjMTJ5oEeAf15PRxrdZKtWDgGYBvqYRJuGHVfYqb5h/cjLTvl4AGe6Vh5xQkZoErY/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537835; c=relaxed/simple;
	bh=jPoby4tQZRTRnFFPr+AIu8liwInQbLnkwnhtUcXusHc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TxYnREulurGD3VH/zNrzrp1SLDGQOEjtj6c3BYCfNfBlvezBi6givfsF41aAai6uuzNo/RsY9IQFUwYrve3cV45XR3Tzzr0IjC5O4LncncMF+K36iNMT75NhmVvUFG7Ks/2KxnJ1bQ9+ARhjIZSXBz4qW2sradTmGDRij0m0+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=plEQDRkF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Bjxh4002542;
	Tue, 9 Jul 2024 15:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FJN3LwWZZ82hDK3ZyFDOpo
	/xuCKNvU84ZoA6sHSYyH8=; b=plEQDRkFYAbMmxlSb52eruvLbSlylgMJzQ/9b3
	bvMvYq/SYv0Lwh/ZZkcjuphvX7cfgbzDPq4BskqKEEBLQ6vn2GwfmVUC21TfyOBw
	wZusZVetuXSSpELxUd5c6o6sSt5CxwyJ5xQcG7RBcI09gkzG8pWuReDwh7FjheC3
	i8F8/P6nrxRQpReFyivhKvEwqrJViv7W7k/kGaQvNnMr+6BjyCjFNVMjSnWJ/3D0
	AD7xxxd2QVGywcXOog7r2PC+worDjwmD7m83aAY/nf26nyfMPUvLuMS2OW0rGnar
	qJhKGdQGzkgrFc+UD5gCXG88joMDU6sojaFv053VkDY7MYGg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8xq28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:10:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FASeE006180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:10:28 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:10:16 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] clk: qcom: Add QCS9100 GPUCC compatible
Date: Tue, 9 Jul 2024 23:10:06 +0800
Message-ID: <20240709-add_qcs9100_gpucc_compatible-v2-0-c206bccc495b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9SjWYC/zXNSwqDMBSF4a1Ixo3cXLU+Rt1HkRBj1Att1ESlR
 dx7o9Dhdwb/2Zk3joxnVbQzZzbyNNoAvEVMD8r2hlMbzBAwhRxKrtpWztqXAkD206q11ON7Ugs
 1L8MLcW9EWqaAKmEhMTnT0efKP+vggfwyuu/1tolz/YcTwKzIIEaRI0DBBZ9X0nIxtu+UfZwgq
 +PwxerjOH4+vPpXuAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537816; l=1670;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=jPoby4tQZRTRnFFPr+AIu8liwInQbLnkwnhtUcXusHc=;
 b=yiiJiDlc4BPzHht0F2NXZeuLXPkf6cCI1VIPQJ7oWG9Xsw0eD7XZtZyKBN5ymAkAy2VXrc+S1
 qV6p6fHdcrzDO7O7eJPqkdinWHMktlsJaXBiuQRnp0qLaV47ccZqrkv
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _ex9pD1hJYTKteda-DxREasOwpGGT7k2
X-Proofpoint-GUID: _ex9pD1hJYTKteda-DxREasOwpGGT7k2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=673 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090099

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
      dt-bindings: clock: qcom: describe the GPUCC clock for QCS9100
      clk: qcom: add the GPUCC driver support for QCS9100

 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 1 +
 drivers/clk/qcom/gpucc-sa8775p.c                        | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_gpucc_compatible-816b149402a3

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


