Return-Path: <linux-arm-msm+bounces-100632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A83EBNnyWm4xwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565C3536D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 278FE300602D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89D1377EBC;
	Sun, 29 Mar 2026 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzAMmOz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SK7GC5iE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2D1FCFEF
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806785; cv=none; b=V5AYLxyrt13sxXtMwwfO28YPEtsmK4gQT1HFCTgwKA3PBAZLkkS6R/rCQFVVC2okjIMlR55xBiT1s0ksGBO2yRgPRfFuUJ/vymPwkhKbVhkrESxBpWr+WR40AIqjKtiQpZ1OEA2P0eBUeaVXSgI58kyNd2HwmOCb9eOUNrp0vp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806785; c=relaxed/simple;
	bh=j4ws4BJGa06WuxYdyoLT9bm/Hn0TNC8Ttsbn0q7sRPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d1jWXrdWrLMNtEEgsAFgGOOf+5AFzV5YcxHkCRlI8hedVij5foRQ41r9s1kcM2UVAjLzZtncySONsDxN4qiiElKJ6+kU+6AOiF2jfn8epnaa/CWB4zPfZT1sTV+3vMrhiYxGcqG2slwWxIGxdgJyE7o1E/4J/huBQqCkZPvz3Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzAMmOz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK7GC5iE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi5oP2195654
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dXp1vYKqTdf
	Vn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=; b=SzAMmOz7FNIbWd3VFp/r5n0JHaf
	Kj7y70hWExJEk5WS+wviIVC4dR8ufs4jRXEOSNbjUIngByX5iH4REpqAsZn2k2Fl
	m328f/JOAIvjdBS0qqrT7EtRhnWyAsouy2xwfL2GEnoUthKWrvekiTr9frbuhNMu
	a8+MHXqa0DzUB3QFTAPgOpDnhQNU23CMEnTFz5yWwZVjkdmj7+XsCzYI88M/wxtl
	wTj++Yb7D0wF7N0JT9JvtqBHgLdbVWwKr3uew2N4rVOsl9yhjuWq4xBm/BS2+QlN
	Yl9kelIPo122RmGalMfU46qXl4JivNd1xBy1RqWjzB27GBX3WWXjj5FthTA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c18hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:53:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7381a9a932so2410029a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806782; x=1775411582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXp1vYKqTdfVn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=;
        b=SK7GC5iE9FZ1FccAgBnwxzQBjKIMWKtVBWf8+I69C53P3UsxnDNWacQZBN6X8wt/EF
         EAxWdWGV/80nt+45HMxPKh0thEoGyKZEGlkn/i9RYCHqM15L8183BYIH1qUTCxjZhOKX
         OjpsG6FmdozsokiU2R4/C5SaBZ45jmxexsFWHTnRcH9ZhTTRMA+CX9m3vnXJVgmMVxuX
         e1mUfQkuY2QgOwAGWwOlwSAgUnag+fLJKwov4jHnqQWMr+4PzEavXs/v8ymnOy2Z+14D
         JKAYVPqd+Iauqz/QC+EqINEBTpYKPL6HhSpul2blRf/FRygfkZlKC/gJpKZu1My5EufC
         LeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806782; x=1775411582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXp1vYKqTdfVn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=;
        b=B4y1TgQvBj+k2BzYZuOZXLaYUXpCzK8AayC0uIKSPBm8nI+7Kj7tngaHIlafhtfJr/
         cu2a5mIxHlWCIFZ0nOvJZpbdxSt24d5giPJjlGfWBrdzO357GZgJW4xV+yy/DHDaDhDx
         jD6WiqHd7JqiKvH1v9eO+a8HgMwMt8h9f8e9v794F38rhwGaUBIFbC067/XiamWq7ZZy
         GN74nNFx5NJOZehmiE53sZt6QlROYXQ4f+KjIFw/NAkwR6Cn4Go7Aad1bnm0MGFmLwmi
         LOz8lbmVWEqwHraQL9w1AJhz+nooZZkC28N3Jl9xQMIMwZuYxlwaQAbSZkWNYcPvijUL
         bWiQ==
X-Gm-Message-State: AOJu0Yw2VaL26B9Hol6cI4c75tMbgkpfYbXqXuD9fj2WpkfKptU//x1u
	voIuM5RGD0rfAWDSYcnVGygFq3Q5Z2dEpYgI3USJgjwgjqSwAHorVvsQ2xrlwYL0JaLlHnAe6nm
	japCRo9+7pRX2KM5QR2ha8sMEGzsYKODUHNQWXGBLDjdyPxYSpRwWzDA+YymvQKeG5xSk
X-Gm-Gg: ATEYQzxm9+dT8gjqZS5RjEvr5quK/o3FCIsvXLfflRzDFXXFDN4iOPt5ZMkr0gQR0Qq
	p0GV5OlJX7B1aeyOWWuU4g5LUiyEfuRsq63cbx9TeUetZTwf6ko42ChHk6+IWt1tjH8kfRdV97p
	6evd4E40iVv5WFG5Ak7ZAv6dmKmmpM2g/olfWIP3iRwprAQFyyksgAtCF3bs4pViOxzmhwrzodl
	7FIwypVK+5hEWgHeVMkx1QkvZ5eGyHuhjrMYQpSnqRpX/fOsq/NX1OYApBR3onUwBz9CPga2mev
	oKj32rAHnKl4uSVdq2T89ur0A33LWqDxfmmHrogE+LtG1/JX/2BrOLV3TB5Ud+mN60YPxSzZ+xz
	p7o5hj/uI/VRym1zKNdHpCQyyThWtWhMbt+s6gn7psUFxX4EK/oaxJXWXbng=
X-Received: by 2002:a05:6a20:432b:b0:398:8071:da9b with SMTP id adf61e73a8af0-39c87848fd0mr10322508637.23.1774806782455;
        Sun, 29 Mar 2026 10:53:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:8071:da9b with SMTP id adf61e73a8af0-39c87848fd0mr10322488637.23.1774806781975;
        Sun, 29 Mar 2026 10:53:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:01 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
Date: Sun, 29 Mar 2026 23:22:47 +0530
Message-Id: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX7kyv3EHvxhcF
 DSh/2JoTNvoQMBodFj93LPQtK2ZoF0ddxpPJNI7iSF0UEV7+nMBN19SE0CNgaHdU+EiesJE2gNs
 mg7t0BxJdcQ0N9ERlazmDOIacsGh5qFNe270fSImYSuY5Ph/fvdrgHcG6BsaFOxmQJ/6wbSWhDH
 HoqJ3Xtm9F2gYJZTKr/Avc+f4JiYIiJL3X6zqsR+VND3qbH2DAwzF/9cl6hdIvZE/1IPuSXbncB
 RQtlK2hVVQ1IYlYRls62oh3OwwlOWiikePImx7GwJVNSYOhP/S1bl6OHc0p2+3soDKb6MafkABg
 oeuqRo0MHb+9pFqhWfp1d1N4CBZwlv4iH9nDKTFDvNIzTjYnHfafUQnhF0DDtv1GM1Tt4U6c3ei
 1elczgVX4UNDPgv8+zUWmrAx/9nmxuz213cVRf+ND8Kslj4ToMEdmWKD339OPymGFkeLBQHqmse
 o9KYph6hFL1wHpGZZmw==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c966ff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=OvCnZ8610trHg6y7dFgA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: uVjB8_VhMQb2cTZ_HyVIer-lQulhEL31
X-Proofpoint-ORIG-GUID: uVjB8_VhMQb2cTZ_HyVIer-lQulhEL31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100632-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0565C3536D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Add the base USB devicetree definitions for Kaanapali platform. The overall
chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
(rev. v8) and M31 eUSB2 PHY.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ac6a6c789902..08d7c1a1d829 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6026,6 +6026,160 @@ pdp_tx: scp-sram-section@100 {
 				reg = <0x100 0x80>;
 			};
 		};
+
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,kaanapali-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x88e3000 0x0 0x29c>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,kaanapali-qmp-usb3-dp-phy",
+				     "qcom,sm8750-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre_noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			phys = <&usb_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			dma-coherent;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1


