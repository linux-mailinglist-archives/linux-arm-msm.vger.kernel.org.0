Return-Path: <linux-arm-msm+bounces-101988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PIBBpXx02lxoQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:47:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A983E3A5DFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 19:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE033017785
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 17:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E8E38D008;
	Mon,  6 Apr 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+IHUf/J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgXQ4703"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F838E13D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497590; cv=none; b=DOzkrEHluHL1Wp81dydRMZienL1XsjHS5WcDaJgPx88wum5EBOzdbnenl6NQ5vleE1NjI3uSIAtrwMyBuVyrYnlH7gnVGOPsWfCw8Jx7dVAbprAvRM+EZB7yAel2tXRUyIctVgaYTGcKMCic5350SYAvoMKmWOf1xNamT/ptJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497590; c=relaxed/simple;
	bh=N40uFzQu+lnfYmSbEBEX1nmXbj4Z6ggbp4x+ANYm2x4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J1FzcO1aBk4RvsRBOt8DGuF0KkZse6IGf/LgebOi6kTK1kucMNJ6Qizhx5uUemy6hvZo8fBtk2itRe/dM5GSN7ftdDS7yrnmujQX/OIpY07l9nuJutyQ+UUuSMdPlCHkNrm9NYXgc/2u0hY3cFB/yY9AT5+osPQ3bJySyrUkiGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+IHUf/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgXQ4703; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ElT2e1151315
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 17:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qF9rf86wZ7t
	A4ErAZSxkq1KXiBZ843YOMyH7yQa5P8w=; b=e+IHUf/JU6/PxcHI/6to5PGdd97
	zLq9Jd8VXJldSy6+c6SHr9//mKSGmKcDAaDV3tTFCCNmaU5JMlSDPdno8Z3XEc6n
	ehhcbwhZdJ2CvI+j+uY1+ZLcL1M2TM6bhr2V2GP0UV/vh+XAKx5Ib9TpeKYThpT5
	1YwzsSrolhUVk5SIeZ3hBouNGhAVjLmMkIZeBAiulHpcgdTJbEQCYM6XYJnqRfVS
	hjCysLy9Z5FcSeyqzGx4/3QkdvUo5S/AWNi53nphcsPNg/pI/IlE3lr3v5L7zPs9
	cm2afseCY7GUpXl/PD+tK2fkLZgq7RYziJSXkjbsbXvnNlsfhHBHtY5Vokw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerkvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 17:46:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c675116f1so6114137b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497587; x=1776102387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF9rf86wZ7tA4ErAZSxkq1KXiBZ843YOMyH7yQa5P8w=;
        b=AgXQ4703yCCHsGhpmeUma1d+iTZvlvg8a2Ym6GFAYwlH+LUnDejPMRQPsihO3vBU5t
         HMb9Mbf5RMqwVLomrU/Edvt8DmtnhF22z7C79VNmfze6618cVnhCahBIB1QQwqm/j0F9
         /TFuJ/jd5t9uCYftEhuMTTPF8sZTqFL4n6rXpzXn8mR/ZuXQ8IclFe4iSn5mVPH6q4F5
         E+alFnOyhTEsYaWSkqxJMJ9UixFE6kCPgwxHXAWQPLitnT4w3lPdDBfmblXUdBMU8hPV
         mn422eDvepAOTeHRinoSwaEoJege/RPox40QN6sDFYTDCjs5L70Oi8Fk6DvR3jHN/Iyq
         Fhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497587; x=1776102387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qF9rf86wZ7tA4ErAZSxkq1KXiBZ843YOMyH7yQa5P8w=;
        b=E0vZZsj9Qfiw7yqYXDQcpfaQ8BKp5D1uNfs9HSJd75qMto6ClEUK3hANKrT/axxNR3
         M26CMhuPT9iss+3tE7U3TbxFvTWsbo/Of0SOwMUH+HgxtmSRufIDglKYrcEPraGrN0za
         8RUxMNBxKoh7/8iFvkXAWjkf9/3hfqq3v4ADwTpUimFB+PyZYcrwLKKsuxxVMhEzqm1w
         sjMSFAfzOwXhavaNSztzwx062n/TyN+qwGG57ny/47jnQCZRzNgnTxnW3BhDQekZbYus
         uJ2N1FUdw7pgOegE6ZehLwteAKGaYWCXdKWC53CPrGm0BXdcqEtE48troig5Ld9rQ16M
         v79w==
X-Gm-Message-State: AOJu0Ywd6g3BhOFeG6N+IRvQu+74T74ZFgEiWzSs62r9Dwgx7CIK7pP7
	bvqsUaiIE0T84Ih1GPW0fWWntgzCETBnlQG5ZPe2ikdoaTtB1bORQoXOVXkk4eDdgcpepikTijQ
	sRaWB228t1baXJsI3niqtTsAlyPHMOZYk2EIDpZzn7flY3T5cloEao3hGw1jNHFUxyEtB
X-Gm-Gg: AeBDiet5BMwERr4/SDfMKwEG2zZPjadsY5bSvyO/T1HoBDSeT4asPm90DNeB8Nwm8wh
	4P86Gnv7SLLj3cRF0GCnf8SeXtZzlnfk1qX659Z94Nd7ctS2E+6zDUa8W8Yv7rmv6X1yuSbJ/XP
	ZkcWQW6rHtN6eAPl54fsyNHPw7cgTVHM9D/0FCSW5Fd6Lu4mfDIdLn+pnBpsgFSNRkUbPW0Xw9W
	htoS5dmFz3dfxMEoENxwGUMv63UQXJuu+wHu1Gd+Q3YMbGV+V1Qxwash/CcEKgyaV78/RqPOH38
	HdIkuIhd1lp6ty/0XflL6EC9ZtN9qr2emL+k1UnByBIuIIKf+lxv6GWMBsnqjkIkz6UY4j/ac3j
	LwK/Gf5i4cBI+mA4YrWkrhB+l2/ca2sADj2SRvKt1/ePVy0mULTkpU9Xqzu4=
X-Received: by 2002:a05:6a00:4649:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82d0da8cd3fmr13517322b3a.19.1775497586669;
        Mon, 06 Apr 2026 10:46:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4649:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82d0da8cd3fmr13517294b3a.19.1775497586180;
        Mon, 06 Apr 2026 10:46:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:25 -0700 (PDT)
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
Subject: [PATCH v3 1/3] arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
Date: Mon,  6 Apr 2026 23:16:11 +0530
Message-Id: <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3j8dp87J6ZC0DjLBj7WUbGvIskFzzBvj
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d3f173 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OvCnZ8610trHg6y7dFgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfXwKfAOI1b1Ii8
 7NqbYoKZcTDg69F7Up3Cb0Zmeq+HuNB3V0h8PEo2SkFKmES871+zpQZq1s8nKcIsasJUje9P81f
 Fxnyh2AMJvo/byqE1Oy3CEdkWAv4fuoBXiOIIDf0ugi606Daw3zRNYYgjc8EqeEloB8L2cGbXxy
 AVdxgZy3EEOtg3kaT8+NG4vZB8DXutCjYGQrdinOyjT2I3YsSAxDelOBHzB2g7LH/7K4aTwGNqM
 LehQlpPbTHDXIq0Z3JK/qW0TsD93A1FQ0K1wZFapGQZJh3FkVyDqqKlBpoSitIEnifF3ppR0M+8
 LABhxncZa87aRxDEDWkjd4chx5gBFfo587KOf8JFhxaZI4tabvsoCLWE+0YJiZEWJ8/J3Pq36O5
 91BBOPRSO49feHZU36ifEVpqQ65pEcVl0n0RDIGRb0wkjtk938IoFh6NwElNcQd8E8exP9+lamg
 eiXlwP4hd2/xR7ENiiA==
X-Proofpoint-GUID: 3j8dp87J6ZC0DjLBj7WUbGvIskFzzBvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A983E3A5DFE
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
index 7cc326aa1a1a..bab654bbd6d0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3138,6 +3138,77 @@ opp-202000000 {
 			};
 		};
 
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
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -3422,6 +3493,89 @@ dispcc: clock-controller@9ba2000 {
 			#reset-cells = <1>;
 		};
 
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
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,
-- 
2.34.1


