Return-Path: <linux-arm-msm+bounces-38905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6E9D6839
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 09:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30F0281DBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 08:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C06187870;
	Sat, 23 Nov 2024 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dmhx6+hT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3015C14B;
	Sat, 23 Nov 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732351966; cv=none; b=a5SIhLy8eLFWSuvP4J03j8bkZyEQnHrNs6So5+JaZR5rkeN/6SMlp8ZLrUkZ1f/1o88c5r/x0zR5KwFgyAW2wOFvanQ7rVt7rFizOzJp+U7DSFNuGo9BSf0QCAfx+p79pgjh6lK77ano1d4U2mgQ0JSPwtjwVD5VZismr2FgnD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732351966; c=relaxed/simple;
	bh=LE+h6b48E2q6AMxV0fPHVvkzjlG9C3EDyOqsIex0apY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GAyPjPI/4JdXy8b9Ic0rVOa6rhECEGIH38E38G7qrqW/I6Z0/FMgP+tN7l3488W/cEg7IXw4x2WXBy/KHXsxUZlH6mQrIJsVGAK36DTVu5pYXO3dJF18l9+fR0BmquJ0ybthyD9QFP/7mtrKKyzmHk9oSodPSBhH5MMAjejYIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dmhx6+hT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AN4GUPn028585;
	Sat, 23 Nov 2024 08:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ejlJOaXDtNnvAZ7jfGdDgiFzpqLm212A1Pi3F1bWgA=; b=dmhx6+hTRiDyXA85
	nHoA+5fY1SeajGyhQtkWlxxrsmVo4LFsbDLBRrDkz87FXxCLfj5he3VxC22jeZ5P
	avRAYDzvO9zFy045NAQ5w3XrVWPxBXf3YC3jqy2Nf9mlwlfHfNxSyShGaxcNGyyk
	8Wno5KT9LFfF8OWQfYypUCrCu/faEksQEHlYahBueHv3CEUQOjJVDD9urtVXNpyV
	Bp/Soz+ak/Nof98Y4l6/MD2+RRT1RVeM04Z3fNM3/H14VoOkS4FOxjG9NjzwJ6zs
	TBIjzsmo5IzC+AGUSRX4TnT/WV6DB8kB4gTDGGGynaVGBQurCshRGhOlwFz1wpTz
	Nu2wgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337tj8edf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 08:52:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AN8qZ99002209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 08:52:35 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 23 Nov 2024 00:52:31 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Sat, 23 Nov 2024 16:51:53 +0800
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add the first 2.5G
 ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241123-dts_qcs8300-v4-1-b10b8ac634a9@quicinc.com>
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
In-Reply-To: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732351947; l=2205;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=LE+h6b48E2q6AMxV0fPHVvkzjlG9C3EDyOqsIex0apY=;
 b=kdWtHBUa/UwBRXkBoifAqz+QLEAYwLJ1/BQ6dszHcf4rR/0CttdyeW69ltZbOePO0gQDv3pl0
 O1sifRe9HyuA7i8PVPQu7Eoj+uk8uPypy8TX9l++AWvquLPz2iOwlhc
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -UK9awv9JxTiUYt-1jVhkuNUl5PW5LrQ
X-Proofpoint-ORIG-GUID: -UK9awv9JxTiUYt-1jVhkuNUl5PW5LrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=745 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411230073

Add the node for the first ethernet interface on qcs8300 platform.
Add the internal SGMII/SerDes PHY node as well.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f289d5e2e57e0e30ef5e17cd1286188..718c2756400be884bd28a63c1eac5e8efe1c932d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -772,6 +772,15 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		serdes0: phy@8909000 {
+			compatible = "qcom,qcs8300-dwmac-sgmii-phy", "qcom,sa8775p-dwmac-sgmii-phy";
+			reg = <0x0 0x8909000 0x0 0xe10>;
+			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+			clock-names = "sgmi_ref";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pmu@9091000 {
 			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0x0 0x9091000 0x0 0x1000>;
@@ -1308,6 +1317,40 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		ethernet0: ethernet@23040000 {
+			compatible = "qcom,qcs8300-ethqos", "qcom,sa8775p-ethqos";
+			reg = <0x0 0x23040000 0x0 0x10000>,
+			      <0x0 0x23056000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "sfty";
+
+			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
+				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+				 <&gcc GCC_EMAC0_PTP_CLK>,
+				 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
+			clock-names = "stmmaceth",
+				      "pclk",
+				      "ptp_ref",
+				      "phyaux";
+			power-domains = <&gcc GCC_EMAC0_GDSC>;
+
+			phys = <&serdes0>;
+			phy-names = "serdes";
+
+			iommus = <&apps_smmu 0x120 0xf>;
+			dma-coherent;
+
+			snps,tso;
+			snps,pbl = <32>;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+		};
+
 		nspa_noc: interconnect@260c0000 {
 			compatible = "qcom,qcs8300-nspa-noc";
 			reg = <0x0 0x260c0000 0x0 0x16080>;

-- 
2.34.1


