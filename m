Return-Path: <linux-arm-msm+bounces-76996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D2BD2AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A33D3BE2F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AEA306D47;
	Mon, 13 Oct 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM4yPuQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774C305962
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352857; cv=none; b=U2VJwd84xhYlSdwtVSy9oAc3VecSGCDTNVg8fNJAXZhZQ/0qedjQYkZ2jpegUMr5U1K5U5LeZtpsmnXEXdvluCUotlZ3EudHxb9zDnkiANgxQPQj9rlFxk7pAuUrns3eSwa4sRar8cIdwGYz+DbZ98QzMd4tw3Fx8QLv2UHE0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352857; c=relaxed/simple;
	bh=MfR1jV6eq/YYIA14Wj7rCxiMT+Ho24Flcb/t1rnKumY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gi/hE0SJ5OjKYossFn7LLV9nN7XLHBpdp8+jkmoeFB/ytxJjncPIFXY6PKrrwzWE1yjbyYLiTu639goa7BH5ia6DYc0v06PBNQAuD8uoMBEX3eM0tJ1Ju6NeTp7Dvnpr4PC5plYORS57cWpFpfOYICoMv/Zau6qWxdnmEi5G534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM4yPuQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAQGh7024651
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wL25zqHZA5p49x6EbdmQyT/vsQhuS7USBHx55ojonKY=; b=OM4yPuQYv8hwIDnW
	VVgOynC0iRTNZPb3a2tCZzVhBjXyAiaXqH/N2dvg6etPCNFn12929CqS5czFQx8k
	fVck7TrR8u6uzGrG0iwVsis13ELgQUjwknlV9v5ltKZEdkgpzydIdmosL0sBnnr8
	ZCd4EELarpuNL9cUgvdLb299sQm9odz0Jy2kNC6GD1uu8NhQze/TG0px9qirX6gx
	jwEi+rzNveJpcEXzDyEV7nhcC2ESMei9ZAF0zmRxdZEjxIQ74aOItMLxrudrqAnB
	nWPD6kLcdGJAwe8tZTQCPMaRO6EOiJ2d4Wv1nY95KZwHExwv19rvp1EnSyF3EVFh
	TqVVZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa84aj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:54:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33826e101ecso12474104a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760352853; x=1760957653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wL25zqHZA5p49x6EbdmQyT/vsQhuS7USBHx55ojonKY=;
        b=q2v73tL/GygxUrzaqKenHc7pMJBlMVnDPB3eRr6K2LPaA2ffpeFFyEFXeDTSq4LLP/
         a0WH6F4KJkl30juoEvtfGprlYKjTNL19jFy/2QoTiDt95AMnIPUL3exrPbmWNIVF4GY/
         DtdOenyyz+zDXrKrDmAYDqvtbx+jkq0gdoydBa0g9HZrSmsTR34lzzFqVqpmr5rR/fN0
         4jNd3t+d+kOKjHpe5ElTKDPli9IxvdjUxqgYXOkKEDzuXpPxsGz8TJLAf5hTcrRcvvf1
         FWbXfgDH7fKT4uRRGSiqLcRdDsvoQAibsuOp+dhvBiSRCTSRuTWPUFFOlreXLEMQWtAh
         YV+A==
X-Forwarded-Encrypted: i=1; AJvYcCWhis4yJNhmkQALU7S6lr/FgBEgUcV8vUdECv+CIVliISM/WH2VmXWkstutvl8ehtfk1Xrc+tWWZUa7iRRW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx89W9KFWLo+j/diYpBh6dqivXhytCivyA2/SIGv+ve4OZUmZR
	lezJm9OlynvrGr+XlXs6C/GARbbqMGRBFZMez4dnc/opdFojKMJMopqeMZGYnSaL2Y/th3xxf5+
	EVGamCOJ6Q75o0+H1gvYBSWMHbeLpL5viZzMs7S7q233HQUxF8Ij4QPGzrNZnRoTcdt1K
X-Gm-Gg: ASbGncsyMEJISgcHuLM34qtpJUANcbSUI8rEKz/g6yDc0/y2zXy6vV/5nIja7tGA7vG
	uTXCqZmKg8m1SCMfKuVqZ/lDvKLfaRtZwx5FwMkBtsOg9ghHX3VJTyyyhm0A+vJBMT0b162trdp
	mTAOEDiCj58dRQIWg+kspzKBnnUg9TIZMb+OFpy9BSMAtvB9iNtaNOjzNWCZBPNYBKdJJ+zCJok
	9bv5l0w4ghhYGz3XP8bvSOu17AfLpZUEX0P/b4DuheFGggJCiucNvQ2y40sPTI5dKJVUPsPtcAX
	KyX77JZI11rl61e5S+KMhDPowPG7RqpQYOVFkaH39wGaRw9kkFzfgZuxkVQVMhRYp0b7V+jNLnY
	=
X-Received: by 2002:a17:90b:1b01:b0:32e:7277:9a81 with SMTP id 98e67ed59e1d1-33b51660588mr28605085a91.4.1760352852652;
        Mon, 13 Oct 2025 03:54:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/yZlRBooTIIXFKaInY/sJrf8yLLhlb+Jc44JB2qOxtQbkQ67CwNW9zuCTTxca9MrAB//Rbg==
X-Received: by 2002:a17:90b:1b01:b0:32e:7277:9a81 with SMTP id 98e67ed59e1d1-33b51660588mr28605045a91.4.1760352852137;
        Mon, 13 Oct 2025 03:54:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626403desm11662295a91.7.2025.10.13.03.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:54:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:23:31 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: x1e80100: Add opp-level to
 indicate PCIe data rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-opp_pcie-v5-4-eb64db2b4bd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760352825; l=5084;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MfR1jV6eq/YYIA14Wj7rCxiMT+Ho24Flcb/t1rnKumY=;
 b=ppwjdO64XNEwf/jv5oUWPu9UGGyQbnkz72uUMal/pVv0HOjBB10u3PzB8mephbeZCQTvLz9ZX
 sPKjbX90MzQCJXHcIm1UurwUjoCSl01D4bRcEPMrrS33/ERfy1tfIeO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: XFLxp3obs4iuBawlEkm3lo9tQigYbLFE
X-Proofpoint-ORIG-GUID: XFLxp3obs4iuBawlEkm3lo9tQigYbLFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXyJ5VUWQRY8b8
 akwDvbizxKwlNzDgVqi9Kf8bAqny6M3EV9Xs/15ek8DSg2RWFQH6dNfzrrI2FO9tQb7bz+U6vVh
 mF9sa81nvnjPuqXSKUgJpiRojnCnAwqA8FGfcvwTw8Vo9y04qfyXbf77CyDb89S5xVCFQ+zbmsU
 jwXv+20WGAm8g5C3j4oUNbbYRFYETMyFWPjeu1vMwNz/7o/5BuUSZ0I0ujncvJ7komz7NtoOO7h
 1lpbU9Se+5s8+AyWa77qDnpp8kPN638a72LaZznAMxj3PbV89FWwWaypiyi+iFdK4g/GfuT5kBE
 5AduwmPrCCLMFQEXhlJX75q1BgJfEbjNLCicv2hkgvKH7B2V+iUK5AQowNPOF4cGdNYCzw4mfGw
 ItI3vrtGiLB+dsGhVRiwajpG8/qxxw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecda56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

The existing OPP table for PCIe is shared across different link
configurations such as data rates 8GT/s x2 and 16GT/s x1. These
configurations often operate at the same frequency, allowing them
to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
different RPMh votes which cannot be represented accurately when
sharing a single OPP.

To address this, introduce an `opp-level` to indicate the PCIe data
rate and uniquely differentiate OPP entries even when the frequenc
is the same.

Although this platform does not currently suffer from this issue, the
change is introduced to support unification across platforms.

Append the opp level to name of the opp node to indicate both frequency
and level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 98 +++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935decbc61a8e4200de83e739f7da814..6e931fbd409269be2fd1cc848bcaf0b4037bc793 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3240,74 +3240,132 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			pcie3_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				/* GEN 1 x1 */
-				opp-2500000 {
+				/* 2.5GT/s x1 */
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
 
-				/* GEN 1 x4 and GEN 2 x2 */
-				opp-10000000 {
+				/* 2.5 GT/s x4 */
+				opp-10000000-1 {
 					opp-hz = /bits/ 64 <10000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <1000000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 1 x8 and GEN 2 x4 */
-				opp-20000000 {
+				/* 2.5 GT/s x8 */
+				opp-20000000-1 {
 					opp-hz = /bits/ 64 <20000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <2000000 1>;
+					opp-level = <1>;
 				};
 
-				/* GEN 2 x8 */
-				opp-40000000 {
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
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x4 */
+				opp-20000000-2 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x8 */
+				opp-40000000-2 {
 					opp-hz = /bits/ 64 <40000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 					opp-peak-kBps = <4000000 1>;
+					opp-level = <2>;
 				};
 
-				/* GEN 3 x1 */
-				opp-8000000 {
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
 					opp-hz = /bits/ 64 <8000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x4 */
+				opp-32000000-3 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x8 */
+				opp-64000000-3 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <3>;
 				};
 
-				/* GEN 3 x2 and GEN 4 x1 */
-				opp-16000000 {
+				/* 16 GT/s x1 */
+				opp-16000000-4 {
 					opp-hz = /bits/ 64 <16000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
 				};
 
-				/* GEN 3 x4 and GEN 4 x2 */
-				opp-32000000 {
+				/* 16 GT/s x2 */
+				opp-32000000-4 {
 					opp-hz = /bits/ 64 <32000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
 				};
 
-				/* GEN 3 x8 and GEN 4 x4 */
-				opp-64000000 {
+				/* 16 GT/s x4 */
+				opp-64000000-4 {
 					opp-hz = /bits/ 64 <64000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 					opp-peak-kBps = <7876000 1>;
+					opp-level = <4>;
 				};
 
-				/* GEN 4 x8 */
-				opp-128000000 {
+				/* 16 GT/s x8 */
+				opp-128000000-4 {
 					opp-hz = /bits/ 64 <128000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 					opp-peak-kBps = <15753000 1>;
+					opp-level = <4>;
 				};
 			};
 

-- 
2.34.1


