Return-Path: <linux-arm-msm+bounces-44911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BFA0C363
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D271A3A5B04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8EA1C54BB;
	Mon, 13 Jan 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mLUfPbP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51589240233;
	Mon, 13 Jan 2025 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736802999; cv=none; b=h5m2p/CkjrJo1TOH3sEejNzEqRPvCPKds4hBDlidAIal//jXlI6zbikQs43Te5WWq4RIKrMrgsyVuYDEoo0cBZNMRhtYwowHJEci7HnfRGRHBsbQeNvS1ILMnM45L20OIlY8mY8biKG/2AxH6R17+VTHx62fU4/MyCHxghuHXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736802999; c=relaxed/simple;
	bh=fBisETkOMaQ7xVxoDN3BHMpOq6UWOWxMaBaGJLYWdDY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=TP2Zexc8yknYUMwlk3MooNcdXmBCfAdNPGd5KpBWo/Gb8XXs5b3EcrRAGeAsz/JyQGQxaNk8jW0cgJalThhiwxvrgx0biFEXnk3cGiLmNdburC2+sqV2OyCKjkcgN4ymQZFVxPHAbaieFTA5SDE2rtb0iQdtqfo7kgy6kShzF74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mLUfPbP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDWkcs007536;
	Mon, 13 Jan 2025 21:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G6AQtZTUxZkSOxCqKsXJpF
	gUQQtEFvIH0nYe9xq5rzI=; b=mLUfPbP24ENNJce26DlNdarkLvkXpKU4zjdDgB
	bRXlV2Cze0GMtfVSn1A8l10bhlJCQpZUd4xTW6jPV1fCHbG5ZRO0Z3Q1zdRy+v2z
	PhvLoqT23RUF3xhvmNhTUIF1LufmIE3aJcri/ZMiuTlngOKNPMwJDz7x7HNnAzvB
	bXQv5DE9iF6j4XmpL7njWT3CPB3WxzfJ8tad5x+bF3cbXe7fGZTThdITW1sFSk90
	KO1kWtwELlRH6G/rHGD/AxE4cmNYy1U/tLoRMFX6RsbcqMuFKpHAYeXSkt6q5qEW
	b+WOTPMnMUv//v2GGyWJXlnsYhN+m4Vxav7i+4rjiCoJQqZQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4453tas2qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLGUpo000922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:30 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:16:30 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/6] arm64: dts: qcom: sm8750: Introduce crypto support for
 SM8750
Date: Mon, 13 Jan 2025 13:16:20 -0800
Message-ID: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSChWcC/x2MQQqAMAzAviI9O9gqovgVEZHZaQ9TaUWU4d8dQ
 i45JAmUhEmhKxIIXay8b1lcWYBfp20hw3N2QIu1dbYxGtumtqOX5zj3MU56khiHhMFnQoWQ00M
 o8P1v++F9PxI1a/lmAAAA
X-Change-ID: 20250107-sm8750_crypto_master-12e2fc2fcf32
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
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736802990; l=1010;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=fBisETkOMaQ7xVxoDN3BHMpOq6UWOWxMaBaGJLYWdDY=;
 b=jeCDhJ/h3Zyc1mbKwOFs8A0U/KC8TjKd/UUO3Fm+pVJDeXP2EjkrOXN6gYZbZ0kcb+EM/XP0M
 07rONjcdKOABsmEkj5oXQK01k8z/xDsnctWCwD/ZPebIgspDYn9ITsL
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nnKLaCJ2xipeJMUTNQeiAn6wUWy5WNtJ
X-Proofpoint-GUID: nnKLaCJ2xipeJMUTNQeiAn6wUWy5WNtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxlogscore=591 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130168

Document and describe the crypto engines and random number generators
on the SM8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Gaurav Kashyap (6):
      dt-bindings: crypto: qcom-qce: Document the SM8750 crypto engine
      arm64: dts: qcom: sm8750: Add QCrypto nodes
      dt-bindings: crypto: qcom,prng: Document SM8750 RNG
      arm64: dts: qcom: sm8750: Add TRNG nodes
      dt-bindings: crypto: qcom,inline-crypto-engine: Document the SM8750 ICE
      arm64: dts: qcom: sm8750: Add ICE nodes

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  1 +
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 43 ++++++++++++++++++++++
 4 files changed, 46 insertions(+)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250107-sm8750_crypto_master-12e2fc2fcf32

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


