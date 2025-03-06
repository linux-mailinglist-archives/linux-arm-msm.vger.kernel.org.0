Return-Path: <linux-arm-msm+bounces-50486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34834A549B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B68B23B30F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8A20E039;
	Thu,  6 Mar 2025 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N2NuCReI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECEE20E00F;
	Thu,  6 Mar 2025 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260865; cv=none; b=XC9Zs+x6d0a6Zt07El6OozQmBNA0/bbaLGcniD1gdClIg00kOnJCpbWIeAmOBmpvP7+6mhPOyoRy839qOkzjQFxxgSa6dyvf2O+kdyU+7fefdeNyQQctOpNgP9Eu1IxzOpCG6cOWZFARnYWj+vphSGevks07OO7ExnRrrwWhtDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260865; c=relaxed/simple;
	bh=Lky9d1bNNLtV636/7wgrQCa2QIqT0SQoPsptlWsQcLk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBKm3L1uDXp3drZl1jg69aX0oxaJUlOHglJU7wHyIL1zLRJIDIL1SCMc0jRQm/zI6UNDUSHRzEDfywvJdhnEkNwvHkXDbud5hePa6SiOajb8JHT2BYwa2Iofs2KHaeVWWOuLCaOeQ+O7wtipyikI51O08HGV7ucczXopTL5OZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N2NuCReI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52695J7A005689;
	Thu, 6 Mar 2025 11:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4dL0JbMYFHkTT29P3aJcP38f+7KWRA5keQhDVMGJs8=; b=N2NuCReIhqYhbhRK
	NDkgJFYhBB4RZ/tx+2lpCSrWuvz7ZfogXibMxVC+gKVlbCGi3DcROyA1drIF6+rM
	2HA0AcF8s87MeIXBftRkH2LnSkmp+U2vcgpcCqh/fu1ySrUe+jOJ9vVsFzOxAGlg
	N8ehVmko6+VyvXjUBcOSJwmj8rUQDw1dGcWgX4qhGzRfpzyLF8tzKOESRwAFLOpZ
	VHiaZVyStGqrUzrOLqXE/E/0IG9zBc53RMqgJEmPpDk8YivUFLHuZ8nQjYvtN5aL
	S4/V8vTBg1KwwBF7qBqHrJ2oQJMnQbvDBRKV/MtN//xZd8ahZOltIskn+8xZI669
	6xs+vg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6trucb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:34:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BYJ3e030777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:34:19 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:34:16 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
Date: Thu, 6 Mar 2025 17:03:56 +0530
Message-ID: <20250306113357.126602-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306113357.126602-1-quic_mdalam@quicinc.com>
References: <20250306113357.126602-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c9883c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ApJ5WhRBqtmdY_byfOgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Qnci0vTXrTchOOFHleuAvcFWcLm7ftRn
X-Proofpoint-ORIG-GUID: Qnci0vTXrTchOOFHleuAvcFWcLm7ftRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=747 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060087

Enable SPI NAND support for ipq9574 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Added Reviewed-by tag

* Added new line before "status = okay" in qpic_nand node

Change in [v1]

* Moved out ipq9574-rdp-common.dtsi changes into this patch from
  previous patch

 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index ae12f069f26f..140e989712b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -139,6 +139,50 @@ gpio_leds_default: gpio-leds-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
 };
 
 &usb_0_dwc3 {
-- 
2.34.1


