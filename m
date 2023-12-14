Return-Path: <linux-arm-msm+bounces-4727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC84812D24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F0921C21510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7953C067;
	Thu, 14 Dec 2023 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LNOkMoFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDED10E;
	Thu, 14 Dec 2023 02:36:41 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE9K6JT028706;
	Thu, 14 Dec 2023 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Hy0ZCuxeshJ9OJqrWSouk5mKlu/Kf0gzIP9t1ih7CTA=; b=LN
	OkMoFKYjFQD+lYDukDIkcmZ09DimEPdpEaJazOMOf1SrEJRjAGtJrMmrPeXSekeM
	1HIGT3IC8VRKmFv1rxy8oOXvX/VQ7+hnG50D8CF08Hyk6QdhNHj8ZS3WnXYuGZeL
	yoNsOSY6zSIH4TDO9QQUrL8hbID9OJq3loyPrgIZdCmYx952TBh5EGnugQD1Lwrd
	4D+KIIy4Os56qkxlKF0laYQG2O2hKGkMk5z/bQnu4r89SmwgvOXv4QdMXwO2jsDp
	ZFES3Zq5+MrrjMDAjIELnCDTeoAioAOBlVEay1bkLjRb7zR+bLOLxILZKzi0zNyU
	6jBhagoCEsRC5yOoBONQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyqgt115s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:36:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEAaW2O002868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 10:36:32 GMT
Received: from hu-omprsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 02:36:27 -0800
From: Om Prakash Singh <quic_omprsing@quicinc.com>
To: <quic_omprsing@quicinc.com>
CC: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <conor+dt@kernel.org>,
        <davem@davemloft.net>, <devicetree@vger.kernel.org>,
        <herbert@gondor.apana.org.au>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
Subject: [PATCH V3 2/2] arm64: dts: qcom: sc7280: add QCrypto nodes
Date: Thu, 14 Dec 2023 16:06:00 +0530
Message-ID: <20231214103600.2613988-3-quic_omprsing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214103600.2613988-1-quic_omprsing@quicinc.com>
References: <20231214103600.2613988-1-quic_omprsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eI1ZMDqxm7hjzoiataeKDsSfKo5OS_qG
X-Proofpoint-ORIG-GUID: eI1ZMDqxm7hjzoiataeKDsSfKo5OS_qG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=810 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140070

Add the QCE and Crypto BAM DMA nodes.

Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
---

Changes in V3:
  - V2 patch was sent without actual modification. Resending the patch with modified file.

Changes in V2:
  - Update DT node sequence as per register ascending order.
  - Fix DT node properties as per convention.

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..b819724c1255 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2233,6 +2233,28 @@ pcie1_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x4e4 0x0011>,
+				 <&apps_smmu 0x4e6 0x0011>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sc7280-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x4e4 0x0011>,
+				 <&apps_smmu 0x4e4 0x0011>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		ipa: ipa@1e40000 {
 			compatible = "qcom,sc7280-ipa";
 
-- 
2.25.1


