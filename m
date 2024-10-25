Return-Path: <linux-arm-msm+bounces-35777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B39AF8A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190871C20810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195B318C02E;
	Fri, 25 Oct 2024 03:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OehNgjUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D118DF85;
	Fri, 25 Oct 2024 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729828608; cv=none; b=etUI9/pNUiWrpu7AaKxza1LxdB0ahc3AyDTYYKgW/qGTGtOuSm3xo9RE5iFVX/Jl99aJDMco5XQfsEZu8naKP2ttWXWXKYTDUkI3bfD/3BFlaZOjFk6Lc/2V13IiREXZKLprx6/LxxdfizGnWEPaQn2PEv9trvg9vuNUDDlDbKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729828608; c=relaxed/simple;
	bh=AH+HHGIO/o/sWWxoRxnAqmcRxBlMELbR8LBmt0WOCRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzrUDi80M0unkx2vZQD2xquP5neJXL/wY0XspqbGv8iAghtY3fJJnWyez/usjYdy7NtzvM6q5zSHn97WmKTalWyCbb/HvBHrnmQCtDD6ca7ggO1vBtGxvLHEa9oJS2FeSaKTaGkrKBORZ2AnkJ0GBPElP1pebukYaV3bnXRhu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OehNgjUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ON81YA025869;
	Fri, 25 Oct 2024 03:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzSiYHDIHbp9WCtwmEtL8yd4p2kGpD5VUSm+JHqQ1R4=; b=OehNgjUZIhwwJuzH
	6SVTf83Ql7pnN9tbKKFhFdu9fa4p2QnB6c1BzpWxsaPl5/O0bpd5RytHyubnOmVe
	6Bb46/D5JqyavEtyzZEG6kh6OfBw+N050XwPwWISci9GpI3XKKq8ytXb/JobbVoU
	YEHhSbl1fVBxGoZ7W/lXyNI/pLQd7XY4kojtI6EJCHFGajhnlT9h2QIKpznF71AD
	SV6I17AoJwR2ZMaUqj+6zNL4bbz/bcoYVF/NjcsAVn6v2lgWjCKXT5hnsPdYKJPT
	/glBhKKr8tLNJw+hwirsrIiBgCDLhI2F6R/aKDgwRYLUt6deomWcH8nWLiwjxbSt
	++pDhg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wqmen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:56:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P3uStK001731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:56:28 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 20:56:20 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v8 6/7] arm64: dts: qcom: ipq9574: Add nsscc node
Date: Fri, 25 Oct 2024 09:25:19 +0530
Message-ID: <20241025035520.1841792-7-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ajpfDWd9V4Y-PW1vOajmYi5qGx6dkNUy
X-Proofpoint-ORIG-GUID: ajpfDWd9V4Y-PW1vOajmYi5qGx6dkNUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=960 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250026

From: Devi Priya <quic_devipriy@quicinc.com>

Add a node for the nss clock controller found on ipq9574 based devices.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V8:
	- Add cmn_pll NSS_1200MHZ_CLK and PPE_353MHZ_CLK

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 93f66bb83c5a..34f3510ea7ec 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/interconnect/qcom,ipq9574.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
+#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
+#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -774,6 +776,26 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
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
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


