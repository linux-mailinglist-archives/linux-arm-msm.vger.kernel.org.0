Return-Path: <linux-arm-msm+bounces-39086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 585359D845C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED13B166481
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 11:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49DF1991CD;
	Mon, 25 Nov 2024 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VoYQSvnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F59198A32;
	Mon, 25 Nov 2024 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533888; cv=none; b=R/VBRncVzQU4giWmyVpizQmA/SRpzB2V2/Ngua7WWGfDsmcxuFJFczELekSEbugJKLXEiL8pNwTRyb3aYxH+Z+q9k9q8bFQKqc35vdOnxd3rR0ltRMZv3HKQMuaJnJzHUeS+RePNR+5fmF6nAtLCwt3GcorSpXIIr/YeWy/YpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533888; c=relaxed/simple;
	bh=bufTrmZZEmz3z0SOZC4QdSCJjdahdcMLTexlKlGjLM4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XuQwTpCJdEGNeMjUfvwWRa3Io0MxQC82Udt8opP4L/aiWdrUbQp5ZMyCk3ftNQ1Pf2l2gOfUozqrTS/dYEe2gNTWk87rlXcPkYdQhnJ0ua95UI45z8xIpBFrIzc2ypXV5wqdXP8l5Hkldx0VHR7u1WojQr2AyUB9UkiMeXp7JL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VoYQSvnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAqEjH020661;
	Mon, 25 Nov 2024 11:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cCgvjCjtlR+ZQzoMmAJsBY
	TLeELTO+RMuHAcI8dwO/I=; b=VoYQSvnAFhoxHSeeAQTAHkc6UHfd6Ijq0t+SRG
	vrtyBV3Td+YIRzzU4iEE78/krwXAQLwesZVqvCKSZsQVAaTZekMt0sf7o9Yw6xwL
	Ah0avUO5/40fEcnb5aU+888aA2waaX8Bd2ChOk+IEvLCsFI92f67Y6qrtJxnf7EQ
	Kb6WBU+uQy3NNrzHON7Lr+m1osRoSFZmmdikotoVkGN/ErIwGEwiYs5vsMsBoinI
	xRicBENRpciXIdm3z9ByJuXWklZV376d8EpFJ0D/xcgvUSKI/6g4MZzLBnfsCcHw
	cTU8sfILHjf7tiTm6ligltwgDdtBB4h87ehpwNDPksCcJr3A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337tjcakq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 11:19:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APBJbjL008505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 11:19:37 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 03:19:33 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V2 0/2] Add QCrypto support for QCS8300
Date: Mon, 25 Nov 2024 16:49:21 +0530
Message-ID: <20241125111923.2218374-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 29Jq7ffVKqMxKcmn50LUGHkDJQRsTQdZ
X-Proofpoint-ORIG-GUID: 29Jq7ffVKqMxKcmn50LUGHkDJQRsTQdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=832 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250097

Document QCS8300 support for QCrypto driver and add QCE 
and Crypto BAM DMA nodes.

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Changes in v2:
 - Set the interconnect tag to QCOM_ICC_TAG_ALWAYS instead of passing 0(no TAG). 
 - Link to v1:  https://lore.kernel.org/all/20241113055830.2918347-1-quic_yrangana@quicinc.com/

---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom-qce: document the QCS8300 crypto engine
  arm64: dts: qcom: qcs8300: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1


