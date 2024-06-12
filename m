Return-Path: <linux-arm-msm+bounces-22373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4308904B94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486F01F237BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335EB169383;
	Wed, 12 Jun 2024 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D0VAZfsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6786169360;
	Wed, 12 Jun 2024 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173674; cv=none; b=MXlxu+6GDFPq2e+Y454qp/AfqfM76sLC5lqya7tIbRYn3udymoJU2JyJgCbDhorD+hgV8J6tSJY6HYD67U/tLZmbhEuiZIsrlQqCfs8AQkFNoNxLHwqd85Y1d/aNuPFnNQs8cJl1+IcESNJEbl8j+UC3ckXUk7r6OE1VzJORrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173674; c=relaxed/simple;
	bh=JUaofg3V6Df4yw/ZejWWiHCo0Ggb6rfbfG5nZJM4ozo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kb3/wZ9A0H7VkBsj+8q7x3GWFQhLOstjIZN894e6fZWb7ET3Uq2+5xMyWplBQxv5wwCg5qpjBYdNYJSkSHbcMaeENclHp8h94C2hFWjNBdM8y4b2KX29ITgagGyJar7YlvkLxzGTroJ0vApwFC7tWrJjbr8LaK60If4t2RIOvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D0VAZfsX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5Onxt001827;
	Wed, 12 Jun 2024 06:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgDzulhXMikSpi3mOckhwtngyDk5ljjzyvwnLmXznSg=; b=D0VAZfsX5hP74N+s
	/fuRLLfCWQpbxIJTKoMlTJGiQYb/X6y/gka/WpFj9DBgtxCyaljAtuI0uwzF3qN9
	YJrNZFGTLzkwCJM/+eU36Hp2J2Gd2hm1JGJW13nnkPLzOhPX0dXoOACHujtkQoUN
	e4SmoPQGPMTnfAGkVqCjdILMMah2bmB4EFfQs8J0Vf3NSAdUyKcn7abQ8UR+pWxY
	E8YqxCYNg3WEU/1GrkqVqd4L3w6RTS/Tgy/pV9m3CZJZLx45h8tsb4MtiQ57yIv3
	5EiyqwigBCaWz4/Z7JN7d69fDkltIp6ijW8Ajg8RO88E4e+4rHp4hV0q7A7E70xb
	LM4qdA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yphsau0wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:27:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C6Rnk4011264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:27:49 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 23:27:45 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: qdu1000: Fix LLCC reg property
Date: Wed, 12 Jun 2024 11:57:18 +0530
Message-ID: <20240612062719.31724-2-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240612062719.31724-1-quic_kbajaj@quicinc.com>
References: <20240612062719.31724-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MdVrCwrfPu7UC0tv3ej-ST7Jwx9sUTPE
X-Proofpoint-GUID: MdVrCwrfPu7UC0tv3ej-ST7Jwx9sUTPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=707 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120044

The LLCC binding and driver was corrected to handle the stride
varying between platforms. Switch to the new format to ensure
accesses are done in the right place.

Fixes: b0e0290bc47d ("arm64: dts: qcom: qdu1000: correct LLCC reg entries")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..3795ebb2d3d6 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1579,9 +1579,23 @@ gem_noc: interconnect@19100000 {

 		system-cache-controller@19200000 {
 			compatible = "qcom,qdu1000-llcc";
-			reg = <0 0x19200000 0 0xd80000>,
+			reg = <0 0x19200000 0 0x80000>,
+			      <0 0x19300000 0 0x80000>,
+			      <0 0x19600000 0 0x80000>,
+			      <0 0x19700000 0 0x80000>,
+			      <0 0x19a00000 0 0x80000>,
+			      <0 0x19b00000 0 0x80000>,
+			      <0 0x19e00000 0 0x80000>,
+			      <0 0x19f00000 0 0x80000>,
 			      <0 0x1a200000 0 0x80000>;
 			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc4_base",
+				    "llcc5_base",
+				    "llcc6_base",
+				    "llcc7_base",
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
--
2.42.0


