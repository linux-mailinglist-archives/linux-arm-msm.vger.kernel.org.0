Return-Path: <linux-arm-msm+bounces-110832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9N8oHsEHH2r7dgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:41:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F26304BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 18:41:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c5y4FSok;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Uy/fut3u";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110832-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110832-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D66A30AD624
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 16:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB72373BF8;
	Tue,  2 Jun 2026 16:34:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1CF36DA15
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 16:34:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418060; cv=none; b=h+KSYnnX7XTCsGc88vC8mBHTJjRQ17NGI7nwGbVKUCGFPY+XFZ3LehvLTtw8dc8QjHk2N748K16shhz4z3AzRhnfDb762S1FA4rmJGadXan1sIHBiu5e2m+dyfoLk+2LbeHU2V8co7qkuBIjj71926q8vwFBuoNBDyPXFNwKz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418060; c=relaxed/simple;
	bh=EjEZ2emUERpT6JtYoYhY8DbdoiOV6CqX+E2v3CbbYb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUsxUGwCkJD/QSgswocAfpGzlx712dCzYY1lKWh6bkbVkFyUqlV9FB5vnA2Lv2df5LwCj3s0R7Yoa5IdDShiZSWjIGXFoEoph2kVq+D7use00uCnR7slEO/Escpuo9HvnFkw16y55wRkAHmqzW7Il0HC0FznnpYSNM282IOZbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5y4FSok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy/fut3u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652AdJYQ2692219
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 16:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=; b=c5y4FSokzUQMXTyQ
	3yvGNdHxcbSk3crxWcD6BmflkpmwFNyayOrUB7A3+NuXS5m7wGvh74Xim4qhjRMh
	Ur3oqFYxSAXo0zxYE97xRkkuZC2eElbVf9u34ZRuEUh6ia5XCJ5zehvokLmWheld
	Eu5eaZQ6gI6MuXEpnWKip/mi2gt0HOkGSvzRXG+FP7JGcZc/c9hatg3CkiWLwbmq
	FzB02wnc9xS5eKHzckwglSxRVWgb2phk5hXHGT8BsHcXYuxAVdfmlFmO95rCvJcr
	f3waJBBsEchj7ovNwjVz+/8n6D8XGK+wlYKfuPQmJ/8wH35WuPfoagugKRdjHQdR
	tfCgVw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumk1ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 16:34:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso34143b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780418054; x=1781022854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=;
        b=Uy/fut3ufTLXOsxuZTqVnoNR9Uy4G/ByFb0CU9cloHxaoXvtsRANynzbAbTFX3sw+u
         12ASy9wbi/m762zk4g5/6WhRotVdVu5u2ADv1HWde/a0SnFSM4wU5l676npRRURo2x/7
         L5RIGAGfVL546UaPSZMcZmntOLtUNG96jNMEnhcqYf2zg3CzArXZhbMmrcFBuwPZ9v+H
         IUoK2n4tavo1QkZ0m8wpGfynElJtxs/DqQ3sMkhJqyBzld13Q8dqgdv0eSf9mRJEl4LK
         BSXsTYlD/SigaJdjjADfnuexFeacjqdjYazOUFA0MtoOcv8Tx7lWWoRNz97v5osEAJYT
         LDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418054; x=1781022854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bV9J6TOeT/8TDZcCLgi022jmuNhYF/YfNwqzMptkjVE=;
        b=XSWrS6XXeveXtpj9a+gowY+qPmvixm2b4mBfjPx1JiF8JCAPs5DAzGgBOtGqqGYKq+
         APrf4GHsnZpturrmK4BDu+nwhF3tOnQOvLZkcM9cr1aVF9+PxH0DYDZvQpN4EJCLWIbc
         HqaDejKF1v2ZBAbrByzuJFFQl3T/8u5CTU8uyGMK4uqSZkxlj4PMuRj2/z/95C0g2yN3
         0NF9XAEQYYa60a9cKBxUNueIzAfPy6kwoBooisNnyJexJK/zmfekkzxkIhP0R2rKgO+M
         4/QtLPzMLJcYy5AfqmbA5PbqEvZeBfpSu5JgPo+jLYGK5TsbJxIQdwvufCRqxJwbaiTS
         hKOA==
X-Gm-Message-State: AOJu0Yz1LDA7eDF2onc8sI1ntBmnJGNfGkFtqcTZ/3DhgbV5LFHlePuZ
	nPAKF2Re9ae4FK6epiVArVPAjX2vbUeXIQ6cdI15jbSafIW99TvOmpE+FnJoz2WpKKQF7G1CzVs
	fd0nDbnCIVWG0b2TFBtMeFlwfMn2RnWalA1nJPqrMqnSCZNh5pLB3GcDKErCyFpUorwtn
X-Gm-Gg: Acq92OG6pqeF7Cs5M5Vn1adHc2TuUXSEcjcwVphO40rlGsW8ZxJV8eeysCHXGmJ7MtR
	ygTtmpomJcnJT20uBkJ9M7e+yaP4a5il7ZztJB3vAYOdQ3RsdBORm2f/CZcH/Lqu/9O7tK6+2li
	nm7yklhfqsaLVHW8WnmICcJvA0YiLl8i8ImB8lwWQ0uh5dJbAVXbhxzmYwfxvrzN48d6NeeS+O2
	m8n9YwMe1yCEfnGARJPkkgNUtkZDtGm0lLUr2/E2fYOR4OtWkai0ixfrcXLQOKTbB+8s2oNmb9Q
	k7I9VcxjAJDTqYQYHv1j2hTAeoemzVVShuOOG0Z0WxFTswDDPoNwMqWogvlZLMWK2KHf1bmEpy2
	6P2ce0OOk/xp1uNFgEdQUwP3+wgnCMGrAJuflfzSWAdGNKcsGXwDuiAIzFB8+ZJCZKM8jgAMUQP
	prxRHUnj5rpOLlztInMItbIlCGIpCg+k063LnAScqbPRaBbTpA6kB2CqSVujlSzsSiqFY=
X-Received: by 2002:a05:6a00:1406:b0:842:5719:455b with SMTP id d2e1a72fcca58-8428302cfdemr288560b3a.42.1780418054351;
        Tue, 02 Jun 2026 09:34:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1406:b0:842:5719:455b with SMTP id d2e1a72fcca58-8428302cfdemr288533b3a.42.1780418053894;
        Tue, 02 Jun 2026 09:34:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm292181b3a.7.2026.06.02.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:34:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 22:04:04 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
In-Reply-To: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX6V76UDJHo75j
 /br0CTCndvOAMPjc+fP0tbbRAhG63Jt7hTHNxBVhAnytkcW5M8aSkoZ84nN2dWxj2MxILrs9kBH
 OV5KFugFuHDhs/exdROsiGXHc9Q//em9nNTWANPQgf3PIWg8HesS3rt8o8OXBiozvLMwD508cjS
 Wmo/im7LOntyjS7Xny6+f7wdpDhZU/YBBnCH9M24cSpQiCIGz6MBapRRFrXgFe6+Kza3vrITwhb
 7GMdEWQ+TwpOdNK5Z+X9Eld3LZHiqg8gvuPSi7XgjH8ks8IJvX11sIQWFabz0Qptc4CqfoIzJ32
 0cWeHm81qCGlGOEHESTbJI0g8vvfNpkzrjHVPIw33C5oft0FbbdrZRBRjb6oH0SoT8JzTtAcNrj
 NoBs0N6aVcEgcnQJi0ttLW6wAIrZKJN9FNIpxE/HwjCPK3xAOUWrifSZGG4bnQh0kQGNmfu1Y2K
 wJXQsN8H3OvkKVCzNbQ==
X-Proofpoint-ORIG-GUID: JGDlAdvZf60ksG_SOhyXL5AcpHwOIu2G
X-Proofpoint-GUID: JGDlAdvZf60ksG_SOhyXL5AcpHwOIu2G
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1f0607 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=85xu7NCFztRxkIpi9pUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D88F26304BF

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 12 ++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
index 79ec77cfe552..7fcf632e289f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
@@ -36,9 +36,6 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -46,13 +43,15 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	pinctrl-0 = <&pcie1_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -60,6 +59,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio29", "gpio30";
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..bff5e3ea7831 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -704,22 +704,20 @@ pcie1: pcie@18000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_2_M &gcc SLAVE_SNOC_PCIE3_2_M>,
 					<&gcc MASTER_ANOC_PCIE3_2_S &gcc SLAVE_ANOC_PCIE3_2_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 
@@ -808,22 +806,20 @@ pcie0: pcie@20000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			interconnects = <&gcc MASTER_SNOC_PCIE3_1_M &gcc SLAVE_SNOC_PCIE3_1_M>,
 					<&gcc MASTER_ANOC_PCIE3_1_S &gcc SLAVE_ANOC_PCIE3_1_S>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 	};

-- 
2.34.1


