Return-Path: <linux-arm-msm+bounces-76994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D8BD2A87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D231034A8C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D36430648A;
	Mon, 13 Oct 2025 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6BeEayn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F921305E14
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352847; cv=none; b=f4luP3RA6a6ddTFVTrjO3ecvOtCgmB8WSJUwbceJj2FrTcgKLcBkGPIWopJaCeg0Icm1NTwzRuo979AztmdbLMbwBOCXLjEvOpKDYMzcup2wdg3DfIfoJLucBvr0PGXzvWubFVdlBitgFnP3M0lD5BHyTHSxxVzA3g2bOOZ7KgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352847; c=relaxed/simple;
	bh=y2oEgd+ZoMp2aZIZllFCtM7ZHgenc6dnMUZhPAHCRYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUpC0fGRiYQszR//HrTOsALtJh/r/Ulml/jGuIxSf2QNT78JTfmuSqVTICxyRe+qy+IQQ5ShwAtjvjat5Uro6eaN4Lzu220S7GmuOXAbO3M3DD9eBQXsYhmZdWc8LnzV2OqKyisr0a8D+9y/BtV4GyBXjchmJ4suCkjlXPgoH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6BeEayn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DANrpp000404
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hu12c6U1rd8Z27Ib4V1hOhlGmxZlRxn08YoMKrqBQYI=; b=E6BeEaynWXTi76uP
	C3ZLenxlwqiO95JQAXfcWyKzlScZPq+awm5ki0xpNJkWQ/H9sJHUPtlj0+AUY+Wa
	tQ8H0mBw9DbPaZfs7ItE2URoZK0Z+8ydKyq8pk91I1FX6oUgFJMJoKaCWyqBcysU
	O0zD7bJvGRPlbh1E/u5B76foCpuB2KGboJWF/gV7jw222sGE9q4p7Cqp/n9xmMcX
	ziacHrIkZyOoskr1BzdLYGVXIqvX7ywZyzwmdlj/0VT+B96zYwK6NOwIy+ygEoty
	6LB2Sw0bfnFYo/tlY7ykZ/5464SC6v2UkdzMnjclXnUfbhjAeJWJPUB00kUHbtBO
	Lg8l6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferva6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so12891368a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352842; x=1760957642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu12c6U1rd8Z27Ib4V1hOhlGmxZlRxn08YoMKrqBQYI=;
        b=jqGO/rZCzRy/B2J8U1xjgnywDwqr8Z5Bp/sY1q9XGLXgpfwLvpSK5fzO62tsM1iDGS
         r9g3vY6WLs1ufJ8OimIX0Mt6q2rVCZqC4129R+yX9dX6/HliJpnW4l5c+ST1hLjbueDf
         xwsEyib8CPeFGR5/AzvprGhfD8813mW66GzdxmTEDxLLP7uH+zqzFbCfKr/S/qtl3Ic7
         YuTRJNYD/pHWIMAyD+rY9iTvRU6T15kdoyGX5zJYq/bodoHyATSvCluMUNz3IIU798Lu
         g0m8matZRPsBuclQKcROwZ+81jahYbxyMlHfn11pTWMJV40PSIwb29vPwmW9734564sq
         r9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsirhhkEI6h62/IoB5f5LQXkK5V/tyFdwM9LhoHP3FMTAtPCQYiB2q5TQOEHXzztofVM4qGm84aPZke7TR@vger.kernel.org
X-Gm-Message-State: AOJu0Yybop7DY+/e0aJljG3qwNP9Y+6A0xMDz0gHft6cuFjwALjlmex3
	S+Jvnc3/vdYhyA5ddGMbv7q6wDxwW/+YvCPHN9rqyT9lh1TzzogWh62D9w9n43X1cU/ccK7QLEU
	veC1o1O9OocFd+5iDXnGXYdqSv8yCrykBniyhnENK6Qyi7x8zyf1K4yZIMrmo41nLgPrs
X-Gm-Gg: ASbGncvZoGfeenCyATuK01nK/cW2eHC282e3KOWQohYVb/1NAJyDmpyG/WSirTKt1Wv
	8snWxDvI1OVL93hTXPxFYYVz/WVktiCxyfgWMU0aMwR5MGZBdsC5w5QK66s0qOQCzv7+dP6f4z9
	5bOudT3CwtdHYurZtAvzHM9xzCwaVJrCUHZtWTBJBsjQm5Ecsf5DHYPVltUiVhGSY1jazQRD6PZ
	pyctAXRSdX9UANldhfYeBYw/1F3OFocncjJby38jGYKpv7EERKrFV7YaRJ5YwASv+XBvE2AUt9c
	Mph6P9AYzpVhTTUKW3FtTZwpaeCyaG51g6gdIX2XktxVbaEj3ClzNyRARY72+CJ9a1S9y24p+ac
	=
X-Received: by 2002:a17:90b:4b45:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-33b51106a08mr28884075a91.8.1760352841726;
        Mon, 13 Oct 2025 03:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL67rs42FcPE7mXkIbR0fTv7qyOq2w1A0meKupktMXF+eQ28rjAxJADbVfTx018wSYf5I+FQ==
X-Received: by 2002:a17:90b:4b45:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-33b51106a08mr28884036a91.8.1760352841264;
        Mon, 13 Oct 2025 03:54:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626403desm11662295a91.7.2025.10.13.03.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:54:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:23:29 +0530
Subject: [PATCH v5 2/5] arm64: dts: qcom: sm8550: Add opp-level to indicate
 PCIe data rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-opp_pcie-v5-2-eb64db2b4bd3@oss.qualcomm.com>
References: <20251013-opp_pcie-v5-0-eb64db2b4bd3@oss.qualcomm.com>
In-Reply-To: <20251013-opp_pcie-v5-0-eb64db2b4bd3@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760352825; l=4819;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=y2oEgd+ZoMp2aZIZllFCtM7ZHgenc6dnMUZhPAHCRYc=;
 b=WXfYwVyiJVYYbOAPvvH+jgZiwIINmOHJrFhYWq18X8sh9yyNtTJf6l5wocZ+Mj9sbcb3xvIPv
 vzTV8kmZCATBS4eVgcdllk2rr50C8OsXR/k9jFBRhfid0PWBw1QhC/K
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68ecda4b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: I1wrnmw2F46zUfVDcL4cc54lWp62_ikI
X-Proofpoint-ORIG-GUID: I1wrnmw2F46zUfVDcL4cc54lWp62_ikI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9i7y1VQW5a5Y
 lOd1EgmT5ad4ZzKFVdZi6R9agIddLqc+2GXEaRn174BiUnIqtlW26sqjHj4YhxpXXjjU//g64Zm
 di2fHN1pxr3cTK4ICi+fenCUHOdnV/yFyeBpNQ8z0y+iC0FwipqQnTF4nSDz67yInZBsEnPrwup
 kXxfqnsh7y1V+55MtJC0h/CMMLJL0rmcLTIwkvlX/f/5jzN0QfzhmymPNfg4iNKzOiH4FpGXzDl
 LneNC3MpMpUFJb+pngzx1UgpfHgaqsBum7uoJ59oBEqxITtKOHojmSjWjPX4K7ynQeK75DuNc/T
 aZJJ4B0C/dxut2rayllixjNIa85clyiLPUoTx5MpmxDQVMmFRQ/uItMcuUdmRSmjWXyiujS2P/J
 mGFLc19OXBGpIM1uNr/AcQOS4J7b5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

The existing OPP table for PCIe is shared across different link
configurations such as data rates 8GT/s x2 and 16GT/s x1. These
configurations often operate at the same frequency, allowing them
to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
different RPMh votes which cannot be represented accurately when
sharing a single OPP.

To address this, introduce an `opp-level` to indicate the PCIe data
rate and uniquely differentiate OPP entries even when the frequency
is the same.

Although this platform does not currently suffer from this issue, the
change is introduced to support unification across platforms.

Append the opp level to name of the opp node to indicate both frequency
and level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 79 ++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7724dba75db79a9e66a2c61e1ea3607bacfdf5bb..9e726f848d3ac1aa6769c5c5e336f53ce7df9046 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2027,39 +2027,52 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			pcie0_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				/* GEN 1 x1 */
-				opp-2500000 {
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 2 x2 */
-				opp-10000000 {
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
-				/* GEN 3 x1 */
-				opp-8000000 {
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 */
-				opp-16000000 {
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 			};
 
@@ -2194,46 +2207,68 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			pcie1_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				/* GEN 1 x1 */
-				opp-2500000 {
+				/* 2.5 GT/s x1 */
+				opp-2500000-1 {
 					opp-hz = /bits/ 64 <2500000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x2 and GEN 2 x1 */
-				opp-5000000 {
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
 					opp-hz = /bits/ 64 <5000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 2 x2 */
-				opp-10000000 {
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
 				};
 
-				/* GEN 3 x1 */
-				opp-8000000 {
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 and GEN 4 x1 */
-				opp-16000000 {
+				/* 16 GT/s x1 */
+				opp-16000000-4 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
 				};
 
-				/* GEN 4 x2 */
-				opp-32000000 {
+				/* 16 GT/s x2 */
+				opp-32000000-4 {
 					opp-hz = /bits/ 64 <32000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
 				};
 			};
 

-- 
2.34.1


