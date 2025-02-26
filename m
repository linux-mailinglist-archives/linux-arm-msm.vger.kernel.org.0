Return-Path: <linux-arm-msm+bounces-49437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D66A4578C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712B1176485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C895E27FE87;
	Wed, 26 Feb 2025 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Odb12Zr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6B2459F0;
	Wed, 26 Feb 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740556579; cv=none; b=eOargjEzXScNQDpzpVGvpewlCrk2yJNUKkE9EpI5K06qpMFSdYDLcVEzqJrqOOoFPJMA3GuzP3kFAhx6B96EPYgdv3Z/yjdY/YKSceS268U+U1CqmRTXp9ZBXGIospDH2O2faVO9M67Tab4tJ11jalT69mKpvWKuuijJObM1Mkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740556579; c=relaxed/simple;
	bh=HnAJrxssf8dT+jZhJ50NWo8ihFoVO5aaD/onb2qA70A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqCLCljrEFN52Lgs/zcSmvG45cKi63wxfcUOmHh+7LOMflnaD2OzOSHNgYIHT/iFGKEfoeoFxrjLiAEAvWZ2l/iW1yzfcrqHxtMHWI1CK4FYS/GD7RkUNEb/dpYY/LhF7k32EbfKD+nsGXX9s9FNDOxHFqGsDF1dWXUAagBs4DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Odb12Zr0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWs7A021581;
	Wed, 26 Feb 2025 07:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsUQQYSr3nk7df6O/gbSVlg6Xh1S+smJFyFP3AEQVW4=; b=Odb12Zr0iPJb8N76
	EfagxIgAXRTLgXyaxbDgJDj0z0WkjrTUPlBoLgW0uZZ3nuIMnvdhLS1cMHAVzhGV
	qTBmTrWYACQFmih4/LpoUqmeSt2ccILx3uhaZVE8NRVZBIypryyhZdjg4EN+ucpq
	ybLWVerFP3f5KfNY0kP/k/jfBiWXt+7BZywh2VkKN+sbzfArY0IPaq+4I9w/p13r
	ouSb42u4eXBQT163qwLx6inprHvSA43ObXbb2gjWTuVu9WHLatY1ii2w06oo58Qu
	EvmeNYkDsGi3QpBblnPbyFVQ2eH0c2vWgNgfAGtuhQHfisjn9nOgqcsyGSVYsC7E
	LQ1BeQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkh5j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q7tmEJ021124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:55:48 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 23:55:40 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <elinor.montmasson@savoirfairelinux.com>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v11 5/6] arm64: dts: qcom: ipq9574: Add nsscc node
Date: Wed, 26 Feb 2025 13:24:48 +0530
Message-ID: <20250226075449.136544-6-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
References: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 74hkVxuqdu6TJS9lwAYBhXTW6DYiPsAQ
X-Proofpoint-ORIG-GUID: 74hkVxuqdu6TJS9lwAYBhXTW6DYiPsAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=996 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260062

From: Devi Priya <quic_devipriy@quicinc.com>

Add a node for the nss clock controller found on ipq9574 based devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V11:
	- Renamed 'nsscc' clock to 'bus'.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 942290028972..c43cb177ced4 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1193,6 +1193,35 @@ pcie0: pci@28000000 {
 			status = "disabled";
 		};
 
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq9574-nsscc";
+			reg = <0x39b00000 0x80000>;
+			clocks = <&xo_board_clk>,
+				 <&cmn_pll NSS_1200MHZ_CLK>,
+				 <&cmn_pll PPE_353MHZ_CLK>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>;
+			clock-names = "xo",
+				      "nss_1200",
+				      "ppe_353",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


