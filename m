Return-Path: <linux-arm-msm+bounces-50485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D70A549AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F70A17655C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB35B20DD4B;
	Thu,  6 Mar 2025 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i7B8sL0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4720AF92;
	Thu,  6 Mar 2025 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260862; cv=none; b=Ed+v/p2gUN1wZLNih/6sodYrBhWawiJLiQV7bJMxq3+p1+F+k7cmII+xQaAhujgF/yMyQljttqSzlDqFT642CtAqJ0iam83zfW0wNLJRs4l/v181Jiphvdl8JJNYQTS+XAXXjaHDvrYoXkxCiKEvWld1ikAwO93QSIsASLgOY/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260862; c=relaxed/simple;
	bh=PYR6sp3kOj2Bh8tJWNp018uSRahZg3Ewf7h3Dh87RCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0SSzQJ8wvhWL3DEPCZtoCJZJeEqockF8pZcf5ZCyYIe6BUH1R35dcRy+ZzY8bYgInnUKPFJayWmQBuRzb0KgI9PsDy/+apzxyNYmX1WWFHuk3DtXneVvwadaiUtFk8jPoKtzvIWoURxXG/79ykM4dIWILSwnUg97HT/TaYPRgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i7B8sL0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52645OQV031550;
	Thu, 6 Mar 2025 11:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B99Gbgrdzl9X5YLl99B4ev3rfsNq789MHJcrp5x3nrU=; b=i7B8sL0LgMDIhQQ5
	q6fAQQoGXggwq24Gszydgjfbm0e5DdlGwJPkDS9eDjwukbf4+AgPGIz0b2jnRWFU
	kqE1okq9v8wLI4RxDq0xTZUbJ3OPKWxWiFJE/LC08eyjiFuSMo98PLiK27VcJEpO
	PMcp6N+FyHEgV638YihWLeJCHLgN/4hxXyh2t3FSG4IIMB6fhGeqqLOhBrow4mxr
	ojLsft2EyKBP+z4BjP37Fhx1MK4/NVsyGbxi0NcCYejdme66L9TkishjHmL7IM+8
	WMArOE27sRloiM2Pg8pZC+srZ4Gg+N70u1GFCbnWTLKvHkBjqB0eA+l3MUxjwCGl
	x2jcsg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4574ce975f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:34:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BYGIc027419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:34:16 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:34:14 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: ipq9574: Add SPI nand support
Date: Thu, 6 Mar 2025 17:03:55 +0530
Message-ID: <20250306113357.126602-2-quic_mdalam@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HGz9qObn-S3ytrm6a0UXuEoA_wdYG67w
X-Proofpoint-GUID: HGz9qObn-S3ytrm6a0UXuEoA_wdYG67w
X-Authority-Analysis: v=2.4 cv=bNLsIO+Z c=1 sm=1 tr=0 ts=67c98839 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Io5rIENU_qKRNLBcn50A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=671
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060087

Add SPI NAND support for ipq9574 SoC.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v2]

* Added "qcom,bam-v1.7.4" compatible in qpic_bam node

* sorted qpic_bamd and qpic_nand entry in dt

Change in [v1] 

* Moved changes in ipq9574-rdp-common.dtsi to separate patch

* Prefixed zero for reg address in qpic_bam and qpic_nand

* For full change history, please refer to https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-8-quic_mdalam@quicinc.com/
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index cac58352182e..819d6cdf4197 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -673,6 +673,33 @@ blsp1_spi4: spi@78b9000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x07984000 0x1c000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq9574-snand";
+			reg = <0x079b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core", "aon", "iom";
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+		};
+
 		usb_0_qusbphy: phy@7b000 {
 			compatible = "qcom,ipq9574-qusb2-phy";
 			reg = <0x0007b000 0x180>;
-- 
2.34.1


