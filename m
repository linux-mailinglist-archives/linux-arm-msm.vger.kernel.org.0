Return-Path: <linux-arm-msm+bounces-112260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0QS7LqxMKGpTBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC5662EDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:26:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=krN5jlEc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZgnCVaWy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E29B3086FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 17:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D1A4B8DC1;
	Tue,  9 Jun 2026 17:04:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D72494A1A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 17:04:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024659; cv=none; b=M5gk2tJTygLdxazOc9Pl4U3Y+jC9+N+Y1BFtZPZk+Sy9/5lD9m1SZmnW4pIQu1xDUOO0DLYS4OPNpO9cY/9gHyq1mxgC1JRq2MlWu+6z/xf17iNlNkOW7G85I8tGcDScRKQij38+xNzkfsumQHy4rOR5QxBLM3NL3gXHW3RYjLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024659; c=relaxed/simple;
	bh=5WN8vDInI2jxayVDJlE0sfrxkWEiZBomtOxJjKfy15U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fm8bkuNitPSvJPjib5aF84j9N++wizaAx6UVun/rtR4F3iGnYPJK3Qq3M6EoE6NFdEUuZZxwKMMKwVXCoOlAL3hw5ee8sPFhoMZxu+8fJY/YwLuGlS1cNLUkcZRvkA4BaSPThy7dpaehtSX2WA+TfYfwkglu30JzWCJSAI5AnCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krN5jlEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgnCVaWy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GPBVQ3207946
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=; b=krN5jlEcK7pnsq3p
	Vxs6vMu+ov4d0mSmAjU4ufDCzdzXivOyXfMHZcFpmdQ9UeODkSWysRRoDRHHzpEo
	7m3UgRFGc7asxYLza7YSKhClZq3ewOTcJW7RQj/NLXmvKwpyqQq48pM31TgV1OWl
	oZNBISUWTJtxjYS0hz/ZkOLLz4FN1igAK8Ut4uy2wmr4e73YWmW9bivdhg9hvhr/
	eGL+Jw+ufgWQz75D0s8Er8QPLto4s0MkvXzNlip82fGk7sQNqEKGRweb35Xy2+zg
	oA7MLiu37kAHrUw1SNwpeLNUfRdn/ggYni6yrUbv4n19nmGZoKU/khUo+c0ZqCRh
	NNLhdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt2fdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 17:04:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f19558so3352882a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024656; x=1781629456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=;
        b=ZgnCVaWyyywS/6L6Gk1hH6ZDs4a3mi2Z94vxkHRtLrsJkjnN61GDsmOMq6R/zRFOGM
         DZmKo53J+bDRzVsGcUGiY7GKkNjScXJhi+CmtZfCkPmV2wjqRuTjs4jzb4GRP2RwT3/K
         bpxFs7r5METXmMziwFHAxjLabPNgxTV9iedII4u2KiJpJ6L0GWzebKHtQiuqsoMoe92u
         P4kT5AnYWIEDDRKI8oesuZsBbT8cSJc1g58ivDdMSsPAf8qsDZHRN7d5/kdZk6hn5GYV
         9ilKZjtuCI0oscn4qWcJQhwNrU5BVJnawJMIb1iCA5W+j/l7/HU6n6Rr+QyCmTF5wRL1
         7vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024656; x=1781629456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhnLAmgftv/wvLr3oQmapdaqFa/zahMFPYVgDBVBjDc=;
        b=jm1jWJXz9kxwzm+5ve0i1S8DSsX9TZMjLF3RS69oxWg4cPhz3kRrvh5MN2oe+DD+43
         sjjptWmzYVU6Zz9lrs109vCgEZTrxc16SHo7DEvR4i8+aP0Pwdyyt6nVt3O5UX5EDQV4
         eVto3TLHe3Qz5jxKEYKmt9m3VaIbcaoCXZsE/XR2lg6HiB7f/9u7KnTSbx2I4Ng2j/UT
         PNzVEmeChhBqymM/ap9WsGnKKcWetqD0Kchg6bWPadDVnbSOH4lxNqs+0JhGvrRSjG+/
         qPbD9MAe7oTMIBvy/FgTe+ge7STLzvVoezOJbxM26pYAXQlk6eCQ8i+yvkjIJQUEendh
         0ldQ==
X-Gm-Message-State: AOJu0Yy0xF4iutJCWlw/oEvUmmahlDtxXnYFDqbhRkSfSVZQk4+iozBr
	2Lixnm5feU5Eh9RflwVanYE2eQgsWwUpQYhx/N5ZBJ1arQWpJdIY1xx2hniSf/I+QJZDXsawQgb
	6Xp6k7HtlBtB1br17sseR34eBsx5uu26MBDRm5mZMvh8CG77WZoQ/AWsICdBPocz3LIH+
X-Gm-Gg: Acq92OFY1/ZGqqS7JAV8iqRxGbY2CCiKNE3z0uIedD5CohyFVxnXV/xDPe6E0CbLkgc
	axe7FuCQNUg9RP3dpyFBGCuttpC9EWs3TLK+zaNRCCJyhBbSAjzRGlOQZR+1uq9TWar/lov+xAZ
	VvowSvicSprzLwAcEdIH9T7vjySO/NblJRhcWNvPnAWoawJ91AiCmFBTqwVBfJs+taMa7Kcp81D
	kOkNc/L/6D+CWMwMBCXTw8l9GV1KO8lxQX+Fo/wiNMD+whLRJFWj9g0ZbhCLA/xQGXOzW3jMYUL
	USdxFt31Tp2uPQaIlsItrutr6vjjlPRGSsJMbNonoM5cgEAupBzY8rtjNKhBMCl2sCysoxVE+d7
	HMLuqKfD+CIf+sninkxsFqXfqZyy6mRb8aP05Qk3QwCfqoYvvinQ7kv/oNPSs/9EgWusMqVQXu5
	ZMeypCU1Uzv/jdNqqj+bboog+d8uDw5A8eVKi8z+5M3qtxcwjSSA0MLCK1WbfLf+W5Lxk=
X-Received: by 2002:a05:6a21:a38b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3b4ccf4a503mr26047904637.27.1781024655987;
        Tue, 09 Jun 2026 10:04:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3b4ccf4a503mr26047805637.27.1781024655245;
        Tue, 09 Jun 2026 10:04:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:34:05 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-move_perst_to_rp-v2-1-6c731523d08c@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
In-Reply-To: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: z6I3U5C0XeRAhgXv_WkPwFT3zHJH4kn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfXy4sPLXD+kLpa
 P4cbFs6FmXMlcJttoVBeTJDBctkKp13CC4E/y4yjntbj4Rl89SbDPZS6vD2A8vPxbAIm5AGtrye
 U6yrfy/0K41+UPGD80zdQvIRkbBR9F8DHE2ioXXfvX7hu3h7KNicWXeuAqsMZ4NWu7YuiKEuuON
 PamXzAHHMlV3mctLujc3BUz88BU+CEKUIDKtv3dUA+8OCJmeRB16DNKiCk1uXU0mdAwkO6vgD8h
 yO/HG43rP52R/bhqHgQDXN85oO2A8F5I75w38+hEWDigbpvP+coBM+WlDI1p+4oAfcNDOeW0dHc
 BReopXm+XnYsVGRWziT1DFl0KGwvyS3GQpbQVibw/TCohDymTXRBSebZ10/xEjWN/g7YbDIesq7
 qgK2exIenBMMeNjeIJl95WgbuTKcRNVaB5e5Az8N5N/K0TwFizhOKfmULhTT3VmytT5BG/iKhh5
 fJsaKfu1cPCnvDjieHA==
X-Proofpoint-GUID: z6I3U5C0XeRAhgXv_WkPwFT3zHJH4kn6
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a284790 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=85xu7NCFztRxkIpi9pUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112260-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DEC5662EDD

Follow the new binding style by defining PHYs and PERST# (now RESET#)
under the Root Port node. Avoid mixing styles and move these properties
to the RP node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

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
index e227730d99a6..a1bdec941d44 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -704,19 +704,18 @@ pcie1: pcie@18000000 {
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
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -808,19 +807,18 @@ pcie0: pcie@20000000 {
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
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1


