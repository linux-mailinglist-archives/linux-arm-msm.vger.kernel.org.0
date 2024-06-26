Return-Path: <linux-arm-msm+bounces-24300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4F918456
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 076D92839DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A307188CA0;
	Wed, 26 Jun 2024 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jL8X7uqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B4B15D5AB;
	Wed, 26 Jun 2024 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412414; cv=none; b=g8jLOew9IYbLJVfw9wlRZb+NxAT3U7wcchY2DxI9EcJwL+k8anphuMkicR0LSogBVE6/ZpmUu7ZQmwMWbK4eXokMBQkDAuobi9tqb2ZwswJkZs1Hv4PA9eR9j4HMt67Ud6KyWO+1wUHSuBHMAhzpNrUf/uujXktbvNXdF+Ksh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412414; c=relaxed/simple;
	bh=JzOFGZZyxgmZ0//vP+Yxp4r2i8+MvPs7bK5LXU+DnA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CpIAtV+3FRg//AnmSIY+OoV/n5MxJHycGu9e7FQWZ6AdnHRc27plYPqMaiADX+DmMofn2JXUkid1KfRpb9caNaBhm1cnhHIA1YPrIrML/4GeWseOUS7FbyEvnhSudQderbHeJSiCcjHFSlhmx+YqNJK9k9rS7o4anK885eNuzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jL8X7uqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfTlc015144;
	Wed, 26 Jun 2024 14:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LAmkE+XqFLm
	g6dKQAmM5PtzWzUtvjN+ei5xwNKExOjs=; b=jL8X7uqPnlUdr0SNBjrQXtR4EEk
	jzgfvFbfCNP2gTwfNlz5xrMjf0Rp7mT4EWOF5su6uC5D6+uL71DSvq3t8aq0VLzB
	jud9k0a7zAM5VHGX4DZ/A+DeuITeE2FYHclXZTCdakt2cc6sBfEgZMtpKAHYIAhx
	mH528Ypc8FMO146IeHvR17rKCJ718NuCYG1/YhyzGk4zHWo2jnHe8EifJXjZJS7F
	feD8hkGBxfwPBHHIrHXsaaCEG8A7anXDCeCFdznoCgMKZcG2BYsehwgk6Sfun/uq
	pTw56paWPoxi3hLUwVzG7M9jJv1KNP4tiUdBuOaWx2mKpy2tpnOs7exY3Tg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshswkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QEX13Q025767;
	Wed, 26 Jun 2024 14:33:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ywqpkv29t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QEX49r025835;
	Wed, 26 Jun 2024 14:33:04 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45QEX4vJ025825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:04 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 97D7A4105A; Wed, 26 Jun 2024 20:03:02 +0530 (+0530)
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
Subject: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc node
Date: Wed, 26 Jun 2024 20:03:01 +0530
Message-Id: <20240626143302.810632-7-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626143302.810632-1-quic_devipriy@quicinc.com>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Qh8GN0T0A31ZN7jpPEZ2196MSYLaWJHd
X-Proofpoint-GUID: Qh8GN0T0A31ZN7jpPEZ2196MSYLaWJHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260107

Add a node for the nss clock controller found on ipq9574 based devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
---
 Changes in V5:
	- Dropped interconnects from nsscc node and added 
	  interconnect-cells to NSS clock provider so that it can be used
	  as icc provider.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 48dfafea46a7..b6f8800bf63c 100644
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
@@ -756,6 +776,27 @@ frame@b128000 {
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
+			#interconnect-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


