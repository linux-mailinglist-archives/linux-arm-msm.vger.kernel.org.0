Return-Path: <linux-arm-msm+bounces-84963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A3CB47D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C9E53038695
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902E9274FDF;
	Thu, 11 Dec 2025 01:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTXbwm0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezFRaUvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80109275105
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417983; cv=none; b=evl5ChenyK1tWbcR/HS2d0NduKmDzsYyKkSsn9D/+/RI+X0eGfs02HjBDTaJyh9UcyFjwHlxsEiMJjm/TBn8e7ZSs4KVPUPajqUlsAcgQo8JcG2xC/GqCSTki2MNe/CZSh9c++r7RtgEqisXPRQtYa88DedARttwPG+1WCWMRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417983; c=relaxed/simple;
	bh=CyMRbFKDNEQHJt048FZ7MVOADmwZrYIso2pVu1vVPZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRf2sc9Yv3wN32Ck6227+Fdh8EBanoQBsMC9ne1eWQk3YVSmGl2xotlyhM5808MDi2wZlaJ1cJO9vEVD3WDy6K4YHnmt7PR9KdkAW5Y9afcieHgqDIAMX/CUY5JgHbaMzi6bdaCrR/8LekfCmXZNZvEP5566ryVnrILKiZp8I5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTXbwm0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezFRaUvU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP3Rv097690
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtppExz9uAAEh5CtagUbir/ngcv9SKj5JsNwjfG37aE=; b=eTXbwm0KS6XE7Q+e
	dyhqpe/1niyGrkvDU44UhPC+AICgH9ubN5ySJABLEyXCwyBIsRYSWmFr/ryE0rQs
	8EhRo9A/eTsgP01iNfyko4ksMSNojj4Sztl/EPVWULp0wja7b4Tte7Lwp1NovPfp
	q1jOPOPdhsQy5KvC6BXKMZzeEnm1mZaHK1uOCBHoUFVdyIB/znknIY758Z2bEaYx
	uXdA3HwI0lJytIkk05eo74HmVqkfGjG0Nz0t3joxdvBOAGYbaxuaET/0YqW+Yr1i
	xhi3o2bMo2YwOZjAQZ/oqnAJM429BKDBcCjXOdbMPhTgXXeKZxRX68r7T0ylnt0o
	PYYfOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayes1gwue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:53:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b55a033a2aso128957885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765417979; x=1766022779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtppExz9uAAEh5CtagUbir/ngcv9SKj5JsNwjfG37aE=;
        b=ezFRaUvUS5KhzznOPFUzQ4U3gvXHIZNr8Jtklm4IocxdvhcT5aH5cao9g+6aqyeYWk
         tyC59GYO7+9UjnaUNjN3rzzEgspFnHlR+zdAtMXPojfqNZBXeRx7Wkf7MIHL8wmHnnUT
         JQ5I6U1w1o4LBXjoKgjIfGyS7h1GHJBhBqIg/s47iJLfvjz6RdgsMgQ/4BkuvsXUuBPy
         OsWT+6e2qO4X/FsL1AA6g0HG5v5DHT5s4qTrVRteDfrkjdX6I45qIQSLnSbDmzCSK7y9
         98ssttqn40fnddjeWIC+dNrCh0XgNt3FBf3ovgRjjwBhj3kLRtu2PiDmYtc3djNVU5zS
         4m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417979; x=1766022779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtppExz9uAAEh5CtagUbir/ngcv9SKj5JsNwjfG37aE=;
        b=ADpfWSEMROTpc9IMUmjuL/MiF/SUo0LYP05x+25siVu1Wy+mJCj79Up2pMUaHYpEe5
         KmndrtJHMZXAGtadSOsHK3gCszssirMb7J5AHgk5jfWtkrUWAbIRqf5LUe2Ea7jehO4W
         EjyEXt4khMib/7nfRCH7oHr4nalYsBBqbxThOTcoFFe3rsb2G8THcYpfqbogquVaH2w7
         3+sv3QodfK6LE0vNp6kihD+3xu9v0A/4zZy3b8pG398e/NUGNsjvnEZ+qmI/zGPFrN6e
         ksJYkmLfWD/51Mu/mxzf83fLIosESd8xGS9Uy96BlJiR9lqulAxwn2Mg3suNKg83BiUk
         WaHg==
X-Gm-Message-State: AOJu0YwWLHVeWl1x9PeWSHwWNm9XZ0Z33ZyzDTcaxcAk1LBiBz2bXWjO
	wmISv4GYGqwuGA9c4IGzD+6kf7pewWwnh95WxBnrJ2TUfC63M2Sg+CkxMX/GvZPYkkOVA/x/C5y
	fxclkQH/wb2qX3+uvaRtXYwPBWY9HkiaFdhYqzH2qdsuUhqLtZa4KbOPGW1qjsFpe052DtXxnxG
	Kr
X-Gm-Gg: ASbGncuB4cd1NpDzx9b8UYPZ780pC3tZRvTw7OeoQmlmgRpadpOBxJIAsgn5Vd3fRc9
	jC1dY3KxGCnGFgkOYbm/heeleQPD8r1FTRLrd3Ath5XpNzXwSiLXb6DyFWJmXX1kFY/tt1Mcplg
	0KkI1hUoyR6i6KMO5lgAh82h5CRKuILVBqkj0ZPrp2NFTcby96IHP9olFzeFiuBRoIGnyqvvUjA
	7atBiHLPwQzQFPBJ+kqNYcb7ZXxeQZwR5fYn58pmH6TGqLrRtbxAwWMz5B4rFQUMfE90SnjSUl0
	USt1RG3Fux/eiEiVwlv/Q1iuSZULABOG8dsEbUiNgNHW8ApmMkU2yu+2suICkSoQBVpXRaV60Ay
	/9KRZ89SeEuPLHqwsIRfAeFryp4ctFNGpb+lGNBULlpppNkaHAIQxSR8InOimxD8VRfbZ08gfpi
	itkCn6Ff8lRqJURuvyrvkE46U=
X-Received: by 2002:a05:620a:4890:b0:891:8c16:283b with SMTP id af79cd13be357-8bad3f90e09mr81650185a.9.1765417979241;
        Wed, 10 Dec 2025 17:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHogU1Fhzx4WlzBNBS/DOhGSlGDxXkfCgnBBMTBcOjV2xTIxsEV/VmonT2MhUt2uz6TbyfrvA==
X-Received: by 2002:a05:620a:4890:b0:891:8c16:283b with SMTP id af79cd13be357-8bad3f90e09mr81646985a.9.1765417978754;
        Wed, 10 Dec 2025 17:52:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f95416sm393252e87.57.2025.12.10.17.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:52:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:52:52 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: dts: switch to RPMPD_* indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-rework-rpmhpd-rpmpd-v2-1-a5ec4028129f@oss.qualcomm.com>
References: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
In-Reply-To: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CyMRbFKDNEQHJt048FZ7MVOADmwZrYIso2pVu1vVPZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOiP0tcigqPYGR1Ojyu+Gyy8BYQwLhbGR7l6Il
 BpmRx8Rv1GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaToj9AAKCRCLPIo+Aiko
 1f+eB/0TzH2sz6UtB6G60YXA9DFq2Drv2cPtRKcXQlpe9FCneQjxbpgg4kf7HzM8CHaF8x+w149
 TZGmaZe4Q3Pr0qetjjNi+uKne5LLbJYToUY3xbfJXKF3ElpP2y2tyrgW1USTx0okH9CqKLMfhRW
 DyMME0nHkBqZNSWQ8wN/UBcFVsCVXtkxphmV7duWC5+CtXc9XUa1E1e+PUvxWhvmIG66yUtdyEj
 fDKg9PIT2nD7kpDrT2fA2C2K5NHEw/FwOkGN1QB1d19KRUwSp9TIqSCk8e7Gc6n0g3HigeG1O1i
 BuPDCdyEXtBnpY+vJ7qKjJC7Ybd0EpWM26bMtkq8hp8MLmLS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ge22UqLO2j-ALEskTv04iZTcq2vY8Zq7
X-Authority-Analysis: v=2.4 cv=KqBAGGWN c=1 sm=1 tr=0 ts=693a23fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RRyckE19mkiINdCq0tsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Ge22UqLO2j-ALEskTv04iZTcq2vY8Zq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxMSBTYWx0ZWRfXwFk5qhczZcTI
 wySIwsoe5NAhR9NHMf/DY3cUdLeYMMh7fTpXb+6tURahwvMp5eldL/eUxC5vAnCArWiAk9RJeR5
 E/hSHkBIM8sRunJjSHg/1lX6bCHvct2Zbjp4o9oLrTW8m1/kqnqq4DG+gbp/1FOrbGnUzJgGWW7
 5dYj6Nc4qQ4dr92a1UQFGe3z/xyJEc4v5mCTuZJSpDJUM1u9Vq+Kc6fcnZ0Q3yyyoxtLbSF5BzT
 eI3gBkGTmcO6wcbHuq+4iUwQNhl/pS8CCFUsqpVQoF+LaZM4VA2pVq288RIDH+uTFF2F5KPjq0y
 A3gCsRyyr1NyK7ctbuMThWJxdn2HZjmHQmAvZPLllzoIVICVsJVZCqGEpan4/pW9PBJhME1wCcJ
 xVsJj8HJqwsOW5x9woHinHt74swDkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110011

Use generic RPMPD_* defines for power domain instead of using
platform-specific defines.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 10 +++++-----
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8976.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sdm660.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi  | 12 ++++++------
 8 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index d3a25a837488..e39743e22043 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1945,8 +1945,8 @@ mpss: remoteproc@4080000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			power-domains = <&rpmpd MSM8916_VDDCX>,
-					<&rpmpd MSM8916_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
@@ -2449,8 +2449,8 @@ wcnss: remoteproc@a204000 {
 					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			power-domains = <&rpmpd MSM8916_VDDCX>,
-					<&rpmpd MSM8916_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			qcom,smem-states = <&wcnss_smp2p_out 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 8a642fce2e40..87dfc1e7e131 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -1070,7 +1070,7 @@ mdss_dsi0: dsi@1a94000 {
 				phys = <&mdss_dsi0_phy>;
 
 				operating-points-v2 = <&mdss_dsi0_opp_table>;
-				power-domains = <&rpmpd MSM8917_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1288,7 +1288,7 @@ sdhc_1: mmc@7824900 {
 			pinctrl-0 = <&sdc1_default>;
 			pinctrl-1 = <&sdc1_sleep>;
 			pinctrl-names = "default", "sleep";
-			power-domains = <&rpmpd MSM8917_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
 			mmc-ddr-1_8v;
@@ -1313,7 +1313,7 @@ sdhc_2: mmc@7864900 {
 			pinctrl-0 = <&sdc2_default>;
 			pinctrl-1 = <&sdc2_sleep>;
 			pinctrl-names = "default", "sleep";
-			power-domains = <&rpmpd MSM8917_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			bus-width = <4>;
 			status = "disabled";
 		};
@@ -1517,8 +1517,8 @@ wcnss: remoteproc@a204000 {
 					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
-			power-domains = <&rpmpd MSM8917_VDDCX>,
-					<&rpmpd MSM8917_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			qcom,smem-states = <&wcnss_smp2p_out 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index b93621080989..adec9d7956b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1121,7 +1121,7 @@ mdss_dsi0: dsi@1a94000 {
 				phys = <&mdss_dsi0_phy>;
 
 				operating-points-v2 = <&mdss_dsi0_opp_table>;
-				power-domains = <&rpmpd MSM8937_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1209,7 +1209,7 @@ mdss_dsi1: dsi@1a96000 {
 				phys = <&mdss_dsi1_phy>;
 
 				operating-points-v2 = <&mdss_dsi1_opp_table>;
-				power-domains = <&rpmpd MSM8937_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -1456,7 +1456,7 @@ sdhc_1: mmc@7824900 {
 			pinctrl-1 = <&sdc1_sleep>;
 			pinctrl-names = "default",
 					"sleep";
-			power-domains = <&rpmpd MSM8937_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
 			mmc-ddr-1_8v;
@@ -1486,7 +1486,7 @@ sdhc_2: mmc@7864900 {
 			pinctrl-1 = <&sdc2_sleep>;
 			pinctrl-names = "default",
 					"sleep";
-			power-domains = <&rpmpd MSM8937_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			bus-width = <4>;
 			status = "disabled";
 		};
@@ -1709,8 +1709,8 @@ wcnss: remoteproc@a204000 {
 					  "handover",
 					  "stop-ack";
 
-			power-domains = <&rpmpd MSM8937_VDDCX>,
-					<&rpmpd MSM8937_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx",
 					     "mx";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index f9962512f243..80a0a09e055d 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1558,8 +1558,8 @@ wcnss: remoteproc@a204000 {
 					  "handover",
 					  "stop-ack";
 
-			power-domains = <&rpmpd MSM8976_VDDCX>,
-					<&rpmpd MSM8976_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			qcom,smem-states = <&wcnss_smp2p_out 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5c75fba16ce2..d41b5c470c48 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1497,8 +1497,8 @@ remoteproc_mss: remoteproc@4080000 {
 
 			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
 
-			power-domains = <&rpmpd MSM8998_VDDCX>,
-					<&rpmpd MSM8998_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			status = "disabled";
@@ -1544,7 +1544,7 @@ adreno_gpu: gpu@5000000 {
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
-			power-domains = <&rpmpd MSM8998_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDMX>;
 			status = "disabled";
 
 			gpu_opp_table: opp-table {
@@ -1680,7 +1680,7 @@ remoteproc_slpi: remoteproc@5800000 {
 			qcom,smem-states = <&slpi_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			power-domains = <&rpmpd MSM8998_SSCCX>;
+			power-domains = <&rpmpd RPMPD_SSCCX>;
 			power-domain-names = "ssc_cx";
 
 			status = "disabled";
@@ -2871,7 +2871,7 @@ mdss_mdp: display-controller@c901000 {
 				assigned-clock-rates = <19200000>;
 
 				operating-points-v2 = <&mdp_opp_table>;
-				power-domains = <&rpmpd MSM8998_VDDMX>;
+				power-domains = <&rpmpd RPMPD_VDDMX>;
 
 				mdp_opp_table: opp-table {
 					compatible = "operating-points-v2";
@@ -2953,7 +2953,7 @@ mdss_dsi0: dsi@c994000 {
 							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
-				power-domains = <&rpmpd MSM8998_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				phys = <&mdss_dsi0_phy>;
 				phy-names = "dsi";
@@ -3029,7 +3029,7 @@ mdss_dsi1: dsi@c996000 {
 							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
-				power-domains = <&rpmpd MSM8998_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				phys = <&mdss_dsi1_phy>;
 				phy-names = "dsi";
@@ -3277,7 +3277,7 @@ remoteproc_adsp: remoteproc@17300000 {
 			qcom,smem-states = <&adsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			power-domains = <&rpmpd MSM8998_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56e..412d7f7d6de6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1058,8 +1058,8 @@ remoteproc_mss: remoteproc@4080000 {
 
 			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
 
-			power-domains = <&rpmpd SDM660_VDDCX>,
-					<&rpmpd SDM660_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>,
+					<&rpmpd RPMPD_VDDMX>;
 			power-domain-names = "cx", "mx";
 
 			memory-region = <&mba_region>, <&mpss_region>, <&mdata_mem>;
@@ -1096,7 +1096,7 @@ adreno_gpu: gpu@5000000 {
 				"rbcpr",
 				"core";
 
-			power-domains = <&rpmpd SDM660_VDDMX>;
+			power-domains = <&rpmpd RPMPD_VDDMX>;
 			iommus = <&kgsl_smmu 0>;
 
 			nvmem-cells = <&gpu_speed_bin>;
@@ -1396,7 +1396,7 @@ sdhc_2: mmc@c084000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc2_state_on>;
 			pinctrl-1 = <&sdc2_state_off>;
-			power-domains = <&rpmpd SDM660_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			status = "disabled";
 
@@ -1450,7 +1450,7 @@ sdhc_1: mmc@c0c4000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc1_state_on>;
 			pinctrl-1 = <&sdc1_state_off>;
-			power-domains = <&rpmpd SDM660_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			bus-width = <8>;
 			non-removable;
@@ -1612,7 +1612,7 @@ mdp: display-controller@c901000 {
 						     "rotator-mem";
 				iommus = <&mmss_smmu 0>;
 				operating-points-v2 = <&mdp_opp_table>;
-				power-domains = <&rpmpd SDM660_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				ports {
 					#address-cells = <1>;
@@ -1664,7 +1664,7 @@ mdss_dsi0: dsi@c994000 {
 				reg-names = "dsi_ctrl";
 
 				operating-points-v2 = <&dsi_opp_table>;
-				power-domains = <&rpmpd SDM660_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <4>;
@@ -2280,7 +2280,7 @@ adsp_pil: remoteproc@15700000 {
 			clock-names = "xo";
 
 			memory-region = <&adsp_region>;
-			power-domains = <&rpmpd SDM660_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 			power-domain-names = "cx";
 
 			qcom,smem-states = <&adsp_smp2p_out 0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index ef4a563c0feb..4b27095b4bc8 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -163,7 +163,7 @@ mdss_dsi1: dsi@c996000 {
 
 		/* DSI1 shares the OPP table with DSI0 */
 		operating-points-v2 = <&dsi_opp_table>;
-		power-domains = <&rpmpd SDM660_VDDCX>;
+		power-domains = <&rpmpd RPMPD_VDDCX>;
 
 		interrupt-parent = <&mdss>;
 		interrupts = <5>;
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 8f2d65543373..80c42dff5399 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -724,7 +724,7 @@ sdhc_1: mmc@4744000 {
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x160 0x0>;
 
-			power-domains = <&rpmpd SM6125_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			qcom,dll-config = <0x000f642c>;
 			qcom,ddr-config = <0x80040873>;
@@ -755,7 +755,7 @@ sdhc_2: mmc@4784000 {
 			pinctrl-1 = <&sdc2_off_state>;
 			pinctrl-names = "default", "sleep";
 
-			power-domains = <&rpmpd SM6125_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040873>;
@@ -1275,7 +1275,7 @@ mdss_mdp: display-controller@5e01000 {
 				assigned-clock-rates = <19200000>;
 
 				operating-points-v2 = <&mdp_opp_table>;
-				power-domains = <&rpmpd SM6125_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				ports {
 					#address-cells = <1>;
@@ -1345,7 +1345,7 @@ mdss_dsi0: dsi@5e94000 {
 							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
-				power-domains = <&rpmpd SM6125_VDDCX>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
 
 				phys = <&mdss_dsi0_phy>;
 				phy-names = "dsi";
@@ -1406,7 +1406,7 @@ mdss_dsi0_phy: phy@5e94400 {
 					      "ref";
 
 				required-opps = <&rpmpd_opp_nom>;
-				power-domains = <&rpmpd SM6125_VDDMX>;
+				power-domains = <&rpmpd RPMPD_VDDMX>;
 
 				status = "disabled";
 			};
@@ -1434,7 +1434,7 @@ dispcc: clock-controller@5f00000 {
 				      "gcc_disp_gpll0_div_clk_src";
 
 			required-opps = <&rpmpd_opp_ret>;
-			power-domains = <&rpmpd SM6125_VDDCX>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.47.3


