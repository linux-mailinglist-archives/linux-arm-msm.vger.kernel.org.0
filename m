Return-Path: <linux-arm-msm+bounces-25288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE4927A11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 17:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F372863E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0E91B151C;
	Thu,  4 Jul 2024 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYAMPK0z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E21B140B;
	Thu,  4 Jul 2024 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107000; cv=none; b=eFsTG0smt58f+aT3Kt2xdO2g236vQbW88UAM+V+rKIfgngLhsKeUrX4ej8GLXuDHFHDWmcIAaNEDiPGTEgsobH5U0DsFxv10DdD//gKHzkJIL6/nE3kytUARNPa2ZzaiBt74GLZ38XoKb4TWOvRPcLi14k/PPWPqBJlC8TKO5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107000; c=relaxed/simple;
	bh=tP+4sJpAGQYLsPwM2Mebn9h8BtrPAUD44qsZrWQnc9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUj/DVpSr2VgqzvDmApW12lLHZLiSAI5+sihEEbcLZmDKkKN/BTYFGK6dbvbSlEPLU6pz2hd0YKyu1Kn/X5p8XV50xlYPM6t+XA7g4DCV3weFZkT2VHLeroLLRcy9pUOe22zgyyW9KZzdGrVxBy+cEqZYn/R8Q/Xcrp4PpgUKcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYAMPK0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464CFllD013436;
	Thu, 4 Jul 2024 15:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNky1h01L/oGAoP1hesPha0379YWZQi0jpby3lzjt/U=; b=VYAMPK0zWouLPvWf
	zfjStSeRhRcjT4AwMF7fnImtPq3SGSTM7bw4KvjBEHCNnr50WuY5tAtZxyaSCbwm
	CbfINe6UYaFYqVuMPGqnF66lILIJZFYk/PpnufoQGF4XgJFZoJCYyKuOE6CkYZVD
	bmGlk25pfiJvlIVoooGbcQgbzwdy2c5huEUHFLv7MaAKVV99W6SXgBfkYYy9XhuZ
	ka5r1j9Ju2lbLLTGlZkDSXnLrqF2mJC1t8PI/zOQYmbbPpsSZPUTD4CYGH5xUNsH
	s46QCQBdKTzc1ODIjSE4NXj9XdbwrXYT7dyzSO62yTBAQYc2Jixxq7ZyYrLyC5Qr
	BCz1dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndua6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 15:29:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464FTIaN007111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 15:29:18 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 08:29:12 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach
	<baruch@tkos.co.il>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        "Sivaprakash
 Murugesan" <sivaprak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Douglas Anderson
	<dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Iskren Chernev
	<me@iskren.info>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH 2/8] arm64: dts: ipq8074: Disable SS instance in Parkmode for USB
Date: Thu, 4 Jul 2024 20:58:42 +0530
Message-ID: <20240704152848.3380602-3-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
References: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: kJOraBwZ4wJZBNsKk7HKGsRrE7n7bahF
X-Proofpoint-ORIG-GUID: kJOraBwZ4wJZBNsKk7HKGsRrE7n7bahF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=462
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040110

For Gen-1 targets like IPQ8074, it is seen that stressing out the
controller in host mode results in HC died error:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

And at this instant only restarting the host mode fixes it. Disable
SuperSpeed instance in park mode for IPQ8074 to mitigate this issue.

Cc: <stable@vger.kernel.org>
Fixes: 5e09bc51d07b ("arm64: dts: ipq8074: enable USB support")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 92682d3c9478..284a4553070f 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -666,6 +666,7 @@ dwc_0: usb@8a00000 {
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&qusb_phy_0>, <&ssphy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,parkmode-disable-ss-quirk;
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
@@ -715,6 +716,7 @@ dwc_1: usb@8c00000 {
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&qusb_phy_1>, <&ssphy_1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,parkmode-disable-ss-quirk;
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
-- 
2.34.1


