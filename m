Return-Path: <linux-arm-msm+bounces-57577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306DAB2EAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33CE3AB65A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897FF2550C6;
	Mon, 12 May 2025 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hhw0um6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A42550B0;
	Mon, 12 May 2025 05:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747026323; cv=none; b=d0vw2gsRprqPjFO50iqEG+BXc3TnrxqYYOrLkcwFsQN+dyI4EQGnhkGUw3zJ6lrA3kP5PfecXUyl9vpCTzn5V1BoHgpUhf9CFNnIa+tE7X7+D5bBI+qxhaWK63TjOlfdReq8dLv1Oh0ldBKWlx1x+7fKq67eOdB80+hPgm8u+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747026323; c=relaxed/simple;
	bh=xZRqyuHq7UQx3b/0TY7SC9mlXfiSNUFfJHSbW/ggC14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aWrO5xrv8DLRC3+rzWfGeljbJkXvTXZMmMN2jpdT4NIxA15CZcse0ZIn5w87Iv+f/RnFZ82P9BX3PFs78ut+975nt0VL9HWpEV7QgvFYGZVZOWAuQ/x90sdKjHvYLxgCMyTuXd9WERgt0WJyoMBcR0w8wBak7EarcHD5jL+j4lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hhw0um6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BLDPBQ031930;
	Mon, 12 May 2025 05:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tJd2LeehFEMP/o67re/8aOnwmUwvZ2j1N/32uvJhFg=; b=Hhw0um6Ni/jBPk7I
	6wM82vLaWVyN3dm462BLFtXc8BiSrPuhXg7Y3Slx6n22bXWXmrJjIrgFMdm+xXCx
	nK4c7Rg5t103DrsRxI//6qI0LChwlDlINaFFp5E9C+Hh1hlDGAXT0OU13ZSH/a2S
	p7vrh72LDVm6NWrQ67mRE7AWo9ekPd6nt7nc2Ts6cBmEtDzn+it9dL1M83OeNywN
	FD9Rq/bIVhhelOkqFppUzdXAx5K2xwpP9ItKjtX5HjlBGdnF01tiOznnNybVmO3H
	WqmaDVpaNm8TEa2zCfj+W1iQjZNKyeC5JHrWGrD0yE5WYCQ852nXUGApEK2gpLL+
	DJw6vw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15u3kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C55FmP004880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:05:15 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 May 2025 22:05:10 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Mon, 12 May 2025 10:34:36 +0530
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250512-sc8180x-camcc-support-v4-1-8fb1d3265f52@quicinc.com>
References: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
In-Reply-To: <20250512-sc8180x-camcc-support-v4-0-8fb1d3265f52@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yy2xF1Tl6IyijVrGwf8WhYpzH0R4Y8Uq
X-Proofpoint-ORIG-GUID: yy2xF1Tl6IyijVrGwf8WhYpzH0R4Y8Uq
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=6821818b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=RnwmOxhnHiGVc7f_JFQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MSBTYWx0ZWRfXzdSMTVGH05y8
 jFzu8fRoCiGIha5XnJUG5N+0aULc6MpXWys1i73jN0ZQ2xMZ/lyjnEX2BrkwkM+ed17WhHcpt81
 dlzCPhNkyyvjH4jxEn/sgfF9aKpkjU7h/IvtnLV3wRdv0Ca99qEHahc2B/mWih9kYcLbwHL0rAc
 LrwMPOhKOnVtcHE4nJUBeO8uZM8DXfDOfr2LDrkd4jOKQGukfuZfJbSo4/jyh432qfoUZszUXHN
 SnBDN61T/4K/WPO7So9i71ruXrvNXwX9kvnSgIuo9EO+ywjhB4s4oYgyvuHLf+YY3xN5eqS2Plj
 C6sy7OmRU4eZ7zaTUxNXa+jFb0jZ0P1yU8zkHScU+724xCIVNWF71esUwjfOnGMz3L0+dblbHLA
 bxHUuRc91vDz/5KbBev4Ve3c/ViphGYWODDSHDFUb3sV4lsA48O5g6N4/N2p5M6jT4tqQRZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=1 mlxlogscore=783 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120051

The multi-media AHB clocks are needed to create HW dependency in
the multimedia CC dt blocks and avoid any issues. They were not
defined in the initial bindings. Add all the missing clock bindings
for gcc-sc8180x.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index e364006aa6eab8c1c9f8029a67087d09a73cee51..b9d8438a15ffbb73efe1a6e730ac7a532d2437ee 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -249,6 +249,16 @@
 #define GCC_UFS_MEM_CLKREF_EN					239
 #define GCC_UFS_CARD_CLKREF_EN					240
 #define GPLL9							241
+#define GCC_CAMERA_AHB_CLK					242
+#define GCC_CAMERA_XO_CLK					243
+#define GCC_CPUSS_DVM_BUS_CLK					244
+#define GCC_CPUSS_GNOC_CLK					245
+#define GCC_DISP_AHB_CLK					246
+#define GCC_DISP_XO_CLK						247
+#define GCC_GPU_CFG_AHB_CLK					248
+#define GCC_NPU_CFG_AHB_CLK					249
+#define GCC_VIDEO_AHB_CLK					250
+#define GCC_VIDEO_XO_CLK					251
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1

-- 
2.25.1


