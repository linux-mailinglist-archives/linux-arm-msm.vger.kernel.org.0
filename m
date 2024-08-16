Return-Path: <linux-arm-msm+bounces-28773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758B954475
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A43F1C209FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A563143751;
	Fri, 16 Aug 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hetaaArX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971EF13AD20;
	Fri, 16 Aug 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797187; cv=none; b=PCMsGxoUQpGbfI28E6XX/c7LGGlIJ/b9yrEwdQuvbj26sdossKVE1XIDSPk9z7BuPbt0k4F7qWFjQsNn3gN7DUU7lfS3titFNwdzhmC+gF697nj65M/oNnhzkNFZH3dtQeE61qK7QQXtO6jmYi1eyofih3nzNR9O8bIXEXc+T3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797187; c=relaxed/simple;
	bh=DTT9i0kFGKQFmP27WzGtXYunyEaQKmi/i6yT9/b9pv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V/4tqCF9jKgVqAt8oZJamT8284jMh/0rrxYs0ejnPEqVjpuW9PWzxAi6ml5xXB1aQS3fzzTZ8VS5x1mRgZGrNy2EL3fjdD/yz8ZFXpf2wPMbgHWymK2BafLJnBRcp49lACMHaPc3dplWKBAa04a5PuTkzMDvFtCJD9mdRQE8Lmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hetaaArX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKbxeN017862;
	Fri, 16 Aug 2024 08:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gikwOoekNiGIPoz8IXJNCegUmcUKIIJTzSrAEoqRmJY=; b=hetaaArX8QTECN4G
	/hLgo3kwh4new0jScjORXE0HggGXwnusBj0MCDqztqynIKVexOhCCmnCdrujbh6M
	dN97IoNrrK4IDMLD2/zB6LMPrW71wig0U9PZSI8FhDW4CTiRxDEfRySsWZcvPUDY
	p1BYJpCEI/6Opa0+8Uk+efQMS4DEMlziTi+oAnoEaxV7+mvfHD3GeO7Sl+gt182N
	ruvMy5acGkz89kPUsvxJ4K3YLlBj2viA24XDDeaMR5E2CSG+uvqi0MxsX59gCHc1
	smcdQWL8i7q7ND/7h7SGw+McPCZpsEL6iQ6U0/rH0FbXbYW9arCa4dZG6JUiYs5I
	PKWzHA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411rvr98ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:33:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8X0CU019409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:33:00 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 01:32:56 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 16 Aug 2024 14:02:14 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS
 audio node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-qcm6490-lpass-reset-v1-5-a11f33cad3c5@quicinc.com>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
In-Reply-To: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TICOjIQ4hzrbmbnSZoLxoxJjxHdYJLhT
X-Proofpoint-ORIG-GUID: TICOjIQ4hzrbmbnSZoLxoxJjxHdYJLhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=916 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160061

Update the lpassaudio node to support the new compatible as the
lpassaudio needs to support the reset functionality on the
QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
provided from the LPASS firmware.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..6e22c838eaff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -820,3 +820,8 @@ lt9611_irq_pin: lt9611-irq-state {
 		bias-disable;
 	};
 };
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};

-- 
2.45.2


