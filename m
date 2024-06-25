Return-Path: <linux-arm-msm+bounces-24074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48432915F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 09:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2AEAB22DFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317F41465BE;
	Tue, 25 Jun 2024 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l99iDUX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3714659D;
	Tue, 25 Jun 2024 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299174; cv=none; b=SmL8THtqV47jyLsZ9YYrpCG69KL5mBKq3y0Rpqzv1Ja+MMY4CDfvrx7rDIoMSDsvrEQJaRcM2Crz54Ldk9urGVYmkLR4KIRmea5SqCi8gSfE5WlUNfvkbFWBd+Sfe4YSQDvTz41U8yR7Imz23onXVOv3q0ozAFfUX6QNCneXMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299174; c=relaxed/simple;
	bh=xCVG3UITRCCGPqkvs8tBM2OS5OmHfJop17puwbn/STI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q04uoc1jB8LRgrok3QzoGVP0CAieyGp1nb7Qz0XV3q3fLiJNYdH1sxXDxTqMCRuG5gYgegAj/PrdIEHMx3SZQR+6i3Rl8mpi1ClGGh+MbnJvesy2YSpnV5ghfddcoM5mlOarBu4oM06CmuSkcgvA8piWwnJ18TUef0GohZ5tey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l99iDUX9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OK7CIA032231;
	Tue, 25 Jun 2024 07:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t+ydoreklrW
	AfO82zvXqBj8nmDy6bzZFLrC8xp1eeDg=; b=l99iDUX9efM6HQXxFLX5MH3oCmR
	BjSJS6AsTaMJ6wwZ22/H3mStv6xTPIHfUzAcYoKXP5gbdd9fX85UHgkhczbqg1XB
	gwr44S217OLDEGbaodV0QtcYP+9KRIH7GkgxzmQuHimEkfDmDY/TOkKVJQVf2GSw
	q7NS7sKEYzOAjFND4Lu2etJ0eM9lKVAwX90XFWb00cmMfpwi5+ulUdEbzuiUMkxc
	Sxy2F9ZlpAZro2Un4vka7yLIUiRSvV77alBjzcNQ5FOglLviP//EAHH85q8BE/1U
	TlwJPOi6sff8Mvb28O9p+Mj/i1dE2uYnyP7B96Q18k5nrH834bh/5BdEysA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv5k0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45P75c3n013335;
	Tue, 25 Jun 2024 07:05:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpky2v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45P75d8X013357;
	Tue, 25 Jun 2024 07:05:39 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45P75drx013350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:39 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id E9C42419C7; Tue, 25 Jun 2024 12:35:36 +0530 (+0530)
From: Devi Priya <quic_devipriy@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
        nfraprado@collabora.com, u-kumar1@ti.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc node
Date: Tue, 25 Jun 2024 12:35:35 +0530
Message-Id: <20240625070536.3043630-7-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l0hIZRykzXgFyCGeAxegf_ooCWA9rjfM
X-Proofpoint-ORIG-GUID: l0hIZRykzXgFyCGeAxegf_ooCWA9rjfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_03,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250052

Add a node for the nss clock controller found on ipq9574 based devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
---
 Changes in V4:
	- Added GCC_NSSCC_CLK to the nsscc node
	- Added interconnects and interconnect-names for enabling the NoC clocks.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 48dfafea46a7..c4855b959159 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -11,6 +11,8 @@
 #include <dt-bindings/interconnect/qcom,ipq9574.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
+#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
+#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -19,6 +21,24 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		bias_pll_cc_clk: bias-pll-cc-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <1200000000>;
+			#clock-cells = <0>;
+		};
+
+		bias_pll_nss_noc_clk: bias-pll-nss-noc-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <461500000>;
+			#clock-cells = <0>;
+		};
+
+		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <353000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -756,6 +776,30 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq9574-nsscc";
+			reg = <0x39b00000 0x80000>;
+			clocks = <&xo_board_clk>,
+				 <&bias_pll_cc_clk>,
+				 <&bias_pll_nss_noc_clk>,
+				 <&bias_pll_ubi_nc_clk>,
+				 <&gcc GPLL0_OUT_AUX>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			interconnects = <&gcc MASTER_NSSNOC_NSSCC &gcc MASTER_NSSNOC_NSSCC>,
+					<&gcc MASTER_NSSNOC_SNOC_0 &gcc MASTER_NSSNOC_SNOC_0>,
+					<&gcc MASTER_NSSNOC_SNOC_1 &gcc MASTER_NSSNOC_SNOC_1>;
+			interconnect-names = "nssnoc_nsscc", "nssnoc_snoc", "nssnoc_snoc_1";
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


