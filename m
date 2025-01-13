Return-Path: <linux-arm-msm+bounces-44924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8CA0C3A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A58E01888143
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965741F8932;
	Mon, 13 Jan 2025 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AjNgjcok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B281BDAAA;
	Mon, 13 Jan 2025 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803612; cv=none; b=h2wMJavb/1IY7BVAvmt4SU2Yp2kwyWBE1nhK3sjznVBk7T/Tr00P5XAqTr3Qlw39npyIJdgXhEQfkLcNaSmzcAGBCx62Z0su7JQItF73qW43fYpQR5nmCwNLvLpqUTRy7Ht9ou52IiS0BgMYHbkKqWvCL93vUSDGHd6HwtPddcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803612; c=relaxed/simple;
	bh=vUx+MNpqWyvZe/M5uK7a8NDXEEkF/Bcr/nT6ILimMV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CFq2k/7FeYpxdPLtb1akCWUQQW7/5YQ/gnRweU025AiFQn3Or1bOjBRxXT5LN3aL0pSnagih3bfeFppRi4NEeyZoREK4G8TfxEqG/Eafkau6dLsIu/XQdTWA39jKf+T3FB1+HzgEYYgs3khqUOuYWTZIF+eypC2VaXWOevtFvSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AjNgjcok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3eTE020076;
	Mon, 13 Jan 2025 21:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hqo+QmBsyrI65V7Ne9C/9/ppkpLWZh8P0kXVo/SgqbA=; b=AjNgjcokndrPzBcM
	FxlUxTkbe3iC24J9eWJOilW3tnaHmCdMT55W2PduvJE1n69a9Gj90JU1rOpkzlGA
	zwIxM1Dq6jJSS/ayLvtcAM/DBHv8GNDqraCeVyOKA7AHxRzUKLJ+gYddXo5Q+vB5
	p3It/rfyhdkQaDerr+mRkY5nV50oKvNQDkvhaw8urn742zUewhPYzJUU60IjobQP
	JvH9xbSfCGKeQCvnVz4aUXc2l4PAhirPdWhZuECm0nccl+HwlG9AYjzqaBLQPktd
	Z6HTPVzIG1XID+KVHIl7aeCqHc5iacIpjs0RyNOekeKSmhPEdWXlOqeEWzI+FMqQ
	HGrDcw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa8jhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLQkYW015053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:26:46 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:26:46 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:26:43 -0800
Subject: [PATCH 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_llcc_master-v1-4-5389b92e2d7a@quicinc.com>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
In-Reply-To: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803604; l=1173;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=vUx+MNpqWyvZe/M5uK7a8NDXEEkF/Bcr/nT6ILimMV8=;
 b=WNx7nJlJiw/SkHIYdgC+v5zzl8GF2VeMlBfq2H3+o7T6i4IHS5RLkhfcsbxuBieIlb0ZEsVev
 6mpP2H4Zls1CvxhdUMktM5JtfHuC6RGev02chgtZ/nu7NCzzfT9PJ04
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bUpGo_ANNIYQ2QP6HWtQfMZ-7Fu-s8-M
X-Proofpoint-ORIG-GUID: bUpGo_ANNIYQ2QP6HWtQfMZ-7Fu-s8-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 mlxlogscore=623 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130170

Add LLCC node for SM8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..3cd7b40bdde68ac00c3dbe7fb3f20ebb2ba27045 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2888,6 +2888,17 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		cache-controller@24800000 {
+			compatible = "qcom,sm8750-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>, <0x0 0x25800000 0x0 0x200000>,
+				<0x0 0x24C00000 0x0 0x200000>, <0x0 0x25C00000 0x0 0x200000>,
+				<0x0 0x26800000 0x0 0x200000>, <0x0 0x26C00000 0x0 0x200000>;
+			reg-names = "llcc0_base", "llcc1_base",
+				"llcc2_base", "llcc3_base",
+				"llcc_broadcast_base", "llcc_broadcast_and_base";
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8750-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0x13080>;

-- 
2.46.1


