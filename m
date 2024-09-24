Return-Path: <linux-arm-msm+bounces-32224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 896CB983C3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF231C223F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 05:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631D3770F5;
	Tue, 24 Sep 2024 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EyUn/SB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9B6F2E0;
	Tue, 24 Sep 2024 05:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727154732; cv=none; b=PmOFddNavJAwjFxWHc36f5gqEQYw8bJyqKXGKd3AsdfSvr4Ho1xJukhRBwjJvvqBh9WwKHx1PxfHydNJwbq3Q/xnH2TALzpJaf+A0Uo6Au6yGouCWoi3J3TnDlTk5IdvdJ4MFyClghHOibDmunMeW1ANf27P9cQFs6umoBKuXmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727154732; c=relaxed/simple;
	bh=PAWN0gR0YiGUm3jvGTzBHT+s6x1Cs6h+O5cSVKQ7e9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miWz19hJzEpeCRjgBC38zJC/KCx9Agg1DiSvtklNepIL962CdD8OW1GPPT1WDV6I74uKS7Z0aeqvvUIeXrT19u+ffZkTQyxZk8Kvbd93pkhpYLuTb8FIxvkE20VL3wgvWUFXg6V2X2ym4llXKaWsPYtNZuXP7WwANVoZZ0AmLPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EyUn/SB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NJsaQY011870;
	Tue, 24 Sep 2024 05:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCvSsGbKfXfaoFJuGL7me4W6j1LTBbm3T21WLN6tDLs=; b=EyUn/SB4U6aEgTJ5
	QQeDz7v9MsaYCzvqPv75D48Cr4SFDt/Au0wJI2R1gDekdn/Y0ib+xclwR8WIimwS
	UOWtCpBGzleHNGT/IPza/LIKHXRxd8/3GhgvphwL7EfCLUgNE4CPKI4iWmw4PJiO
	5eXfyYK0d75saCroKR1e24Cf5yYDX7yXzUMYzSx7mIErfN/Wy6kpXO7dq4vIl9Xu
	26DI86jSrFg4A6/8jvn56//VRp2nxjM3wLwvCbv6YzAmbz2EgAGh5wOwDVEQYrRy
	8B3Gj/GhEmD9+c3M1nDdOfF6h+VgBCUHHFhV37oF+mPgbl/bvcC+uCyt2wJ96Z48
	sgNs2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6q9gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:12:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O5C5RE009612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:12:05 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 22:12:01 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
Date: Tue, 24 Sep 2024 10:39:41 +0530
Message-ID: <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5VluUoa7tBpd_AUdoi1vJB0jHoZSDy83
X-Proofpoint-ORIG-GUID: 5VluUoa7tBpd_AUdoi1vJB0jHoZSDy83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240033

Add the CPUCP mailbox node required for communication with CPUCP.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..4b9b26a75c62 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4009,6 +4009,14 @@ gem_noc: interconnect@9100000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};

+		cpucp_mbox: mailbox@17430000 {
+			compatible = "qcom,sc7280-cpucp-mbox";
+			reg = <0 0x18590000 0 0x2000>,
+			      <0 0x17C00000 0 0x10>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
 			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
--
2.25.1


