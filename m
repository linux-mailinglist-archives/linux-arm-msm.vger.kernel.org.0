Return-Path: <linux-arm-msm+bounces-71763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F209EB418D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2DF5E34BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96172ECD11;
	Wed,  3 Sep 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="axExM31N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608D2EC566;
	Wed,  3 Sep 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888856; cv=none; b=S5KFBfLJ5BXAiYBzmrl4S39afaT8lgblKLwZYdp/y2T7fXDkFd1oqKldAPAhs6zhYSRAhQxvp14lQMrJjstVqgChln1uUVOMtdLgbWX2i6LuwTqKDk1fpelPHqgvD9HGeSsLEWgTleuiXGPuFhtt8+FhbPj4ZQQ/Nrwsq2WZxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888856; c=relaxed/simple;
	bh=MvwikoZqYa6j3JaVovPyWtHEGzkqCnQXWa29S7v5L1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QzeJsOxW149Mk4f1kWnpocOk/LPK0Ji+vWsM3DTpQs0+UDmE7VtMoqwCU07LdVnggkunhyVEIsk70fkNK0+0WK9aWslApeEFYJLB8XUEk9epyiGPgbVSmQunj8+4JjAudfuMJ0HLZ3AWgwvz0JbxzlpkZTpWVZBUqFw0iUu8klo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=axExM31N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832LEZm004340;
	Wed, 3 Sep 2025 08:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uy8G82mk/dn1+g5l+E2jx02Ui8dwkece0d9JviDEhPU=; b=axExM31NOyWSNNzc
	hSxzGtnV9zK2txqEEPRlK4atZr1hmgc181z0x52cx9C7z22A8nyqHrqHxtcEs5sv
	XABJBcnmNIdCtIy7l/6OvtTyWGqKPKgH5DnEyHYDKBLkdJ6qHWgWfjwNUiqlTMt4
	v4hnWb0qkaRSNRek3vQglLx/8LO/GVElgfBXa+MIRR5rT0O+gh0V2cxDbA2yXjdM
	kymrA/pfh+wnslGizW6faxc02WTvQBcOy98Cgj/+s3kF4U14WYKFabeLPA5Hx9WB
	mm5IHi3K+LnIfHqTW3dOfhiLNJupGiKajCv5LgXe1qSW7CtODEzXTescDIP8d6OQ
	/zXsVw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjtmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:40:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838epBS023907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:40:51 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:40:47 -0700
From: Wangao Wang <quic_wangaow@quicinc.com>
Date: Wed, 3 Sep 2025 16:27:35 +0800
Subject: [PATCH 2/3] arm64: dts: qcom: x1-crd: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250903-add_iris_for_x1e80100-v1-2-410e9e6c79f0@quicinc.com>
References: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
In-Reply-To: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Qiwei Liu <quic_qiweil@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wangao Wang <quic_wangaow@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756888839; l=664;
 i=quic_wangaow@quicinc.com; s=20250814; h=from:subject:message-id;
 bh=MvwikoZqYa6j3JaVovPyWtHEGzkqCnQXWa29S7v5L1M=;
 b=l/wjWUgeG2A+OiydiwVRFTPuEeR11mZhp6ULl7icz/HALvGzrgzdLZoMfztGmIFzfxu2G5TYP
 vW7VzgOUpG2CH8QhE2ZRPPvA5iZ6NlaWkOpSh2cXm8liFF+W+gKBDoX
X-Developer-Key: i=quic_wangaow@quicinc.com; a=ed25519;
 pk=w32d+heQorY/WMv2MAjQHXfwz5WLNqBlarTPtMmAk3k=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7ff14 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=6BfzqfAx9OE1sp2DhHwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6QH6aaNMiuJhPAgXOISZRuXbDDhJWOhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+KT7mGmr3xvO
 euNoWHW6fdSIhNLRiq6N6WNrnxrNzIGKgx+PvAo35y/dSOngntM7fDPr7NECYWjAglIpQ60nUoe
 wEk/d8f71P5zX7lP8NuqMAqO5r/KV93bpeGbDaR8yuJTvmavV3G+FByNfhHAN2guYV5KYQ3qTnp
 D0v+2c2+lX+Rwf7KZ/ssowyBAMrIoYIIZn8+Q6NbUuncgiKVvgs81SPoN7s5Njjaqk+J+u+609F
 JmsE7SY/yLGSxCaTIqEGsT5grlR66CGpPumdHhA6eUUdTfkXO4YyzH6QUEf4sN22L3fTPR56cJJ
 iMkiCA2YRKiEJW29yG50GDJjFcP2XXbL+yhaSK+RYrScff0I8quBeWais/fUtfDUL0OS2mZobnM
 kMCdR0+K
X-Proofpoint-ORIG-GUID: 6QH6aaNMiuJhPAgXOISZRuXbDDhJWOhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Enable Iris video codec on the x1-crd board.

Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 3c9455fede5c09d90e00c98db35d49e8738e6acc..6113272c8e80d97d5f2f51ecc003c4876a188652 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1114,6 +1114,10 @@ touchscreen@10 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.34.1


