Return-Path: <linux-arm-msm+bounces-60755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E253DAD33C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7961897BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF27628DB7E;
	Tue, 10 Jun 2025 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GHph1wPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA328DB73;
	Tue, 10 Jun 2025 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551751; cv=none; b=tdpzJ4JERcY/sprbPCLF57+MRTFKTmo6UabFkXVTNvSzrFF0Vkqhidn0buI+FfiP5kwW0Wjgx1YM8LNsiAjn4nIwuR6H7BNAtWRJFx8DMQjPzebsfhfkcUjHqqVccwGin46CZPJRjn22/lBVmDDijMY4itb2uswK02Xzh8p3c8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551751; c=relaxed/simple;
	bh=bdwM3PnFFNbhMS1+T7bPieV3m21qfbltFhx4Hspvj0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=puHsvwLAhCc5yhJT61hueLA0j5msUDKXownp/eVzbCW7cJZFymUM5QXvbz6/aI7htdDGrIceMNn5ga51JW90YyK7GqGum4qWtSuVW6gC9bHrbfDZvC0+tcnP7sM5lgPF4pCPVJzP/5Ala5je8lwkTZugrV7xor878gMsz2MM4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GHph1wPh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AACvgN010142;
	Tue, 10 Jun 2025 10:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgT5xYT/yp6rn/MPyySq9GUj0lfcRcJLeFGrqcq6L7s=; b=GHph1wPh1/Momn27
	zQsMjbxQ7T3IpN0+eCcTG9xTXPv5/64lABMrP1XZMFcTV5mqZSjqduKTGlFIhVVq
	XAthVYvuioQakTStqLVHBJUEuOPc2jybY/Nbd2MqOpDjkiX/QThulYVjkwj6JIBF
	SwqUVBfySE1dRV5MMBws/2oLWLZwSKIxepVSqH1nmqoTBFyqxubk6U4kyTwNaRJ3
	snVjX/pXmxpyxOAJ9ZT2ek2ItYMQ4fuqQuY1ZV2BAnu9SD6z84RO5h4TQ4yzAKno
	WOf9lQBAiZERxZbPdqQkkt0WWYFe2wrY74diOFzX0xtGPrl1JLJNW21ZtuxNbzFh
	xzZTsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh81xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AAZjxl025528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:45 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 03:35:41 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 10 Jun 2025 18:35:21 +0800
Subject: [PATCH v3 4/4] arm64: dts: qcom: Update IPQ5424 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-qcom_ipq5424_cmnpll-v3-4-ceada8165645@quicinc.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749551725; l=1455;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=bdwM3PnFFNbhMS1+T7bPieV3m21qfbltFhx4Hspvj0k=;
 b=HYCoJiSrkQDjfIG+AWed+ee1wqpNLvYpJurt47yR0CovghA/0yBDo2nb44I4I79uLnp6KVO77
 j9IhD5GoNKjByTXh9Jk2+bGXDsacz7+9zpVF+L8fyCm1AreYc4DrR1C
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=68480a82 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yITdEbznlgY-7T192IXOfQxMr_I5uMxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MiBTYWx0ZWRfX6fO5IrP5mFwb
 dNYCyoxA/SQ+gXW1J8UVBpUrbmMpQWH8by9Zk6w5R8ryp/QhO33IU4bwY8f0joI/FFsF6NTa4cJ
 wwdjbwD4nbOSiGduOnfYz+Qw2TQ7DIzn/DO0R2Tmd8Xr4JHDFeu4nG/wzIZMAuKwD3q2IMilGnP
 YoCVnMGWfkliXXEruyRas25bqb6v2Pun+xPCuPpLjdrbW5LQ4X2FVgD87a/FSxzLFRTTIl/Djbo
 nYyn1/0m54Mursbf47kF9sYXTQyXvwEbRMUuSMEef7y5CBCbpeTUzgX1+RqvFjy8mvQKd0fPgh9
 NTJbkEv4ppEmuk+DFIMCXPasECX+kblGgQFPG2O+VWWBnSjMGzfiTbHMQc8lZaJIKTobKl2WKhD
 wQxoYWWmXo6IF6B161ONgVRXg5WrwABnRK6bP/RzODQqeLLPdhSc6hoJ5pG7ZXbaKcop4S5m
X-Proofpoint-GUID: yITdEbznlgY-7T192IXOfQxMr_I5uMxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=898
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100082

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 5ca578904f85..117f1785e8b8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -264,8 +264,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 13c641fced8f..2eea8a078595 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.34.1


