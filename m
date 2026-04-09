Return-Path: <linux-arm-msm+bounces-102471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ9bLEZx12mDOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 554253C8792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9448930065E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B483AB286;
	Thu,  9 Apr 2026 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nv5A8ic6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BV5YCJ1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B5F3A7F69
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726916; cv=none; b=aJnkBZvoU5suEsP+iSkF4E4+PXaJWi/N5nNSwJbSH6ss4GvsMa83n6JkddTvKBcyqcmip7FdyW8E6A5wDe+UcXfA4efXc2f2Ba+mg3JC8vpDAVS0ZUGtqOMns23H1ti6fYOgJWR6Ujci8KCjrLTCm+2QlzCBYCZczT4ZG7FfEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726916; c=relaxed/simple;
	bh=CiV8Eb+aAuSaC0yvKkCcxTaJS4DNy3oRfwjQKCP0H7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ayJ8nAnl9x3b1ATaLovkAz9REwEJFjGlmYGFE12XnAu3HlIPl9yz2kGquXj+9Vq4z2/abUB2wHSXggi+uvGUMhK8q9Re28jSHhceHii+TxL07XkH4zAA3p3EYXv7/dp2J/WFRPFhQZ49YIj61cvrHPWOckvwQ1iiC9QEBlfSLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nv5A8ic6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BV5YCJ1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392uqh32247132
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lg4kF7DL+oB6tH36fAvaKX
	c/fnplKDnQGRscIl2tUpQ=; b=Nv5A8ic6AAq5FY0fikoVQK4LE01lplpMKBw2h2
	+852dBSD3AZur6FuuZ3piapy5e42Zkn5kq0H+T3O+VSN2tv4OnW5d4qj6H+uZs2C
	Zaq/grmLQvX8vTWnbCavFhODp1owuc9Fbiej7Fd92sLkG5QBPsiPd/zRlusWTVX4
	JSileFrlzzupDuig1ZquebDGLYyadNqWZNm+qdoVYHLXPW4RAQUbC/w28h3rjI9Z
	TpiRlPf/42gzyEHDU+psSZDiqgjKO2gr+gYx4w3SsTCRAuTu9e8F9LbE0xrf/Bk4
	2jFW9Vl50+7RQmErr87DEWpYMmhfanMB31UywRvP/ac8aKgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s9u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:28:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso1841700a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726914; x=1776331714; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lg4kF7DL+oB6tH36fAvaKXc/fnplKDnQGRscIl2tUpQ=;
        b=BV5YCJ1KqShHv8BksvstdsxfagdeO/SOhuNKwvhw8C8td0CDwPPVH5iwYbK3cyrsae
         SrypUsxfMRb5O5ZBhBYwKHHY+aRp2odnv9zRC9VX0ZhHO9vDtyCOrcJYlBKvAVP5M6ga
         QmP7QkzupKc2mTwJSNO50kjCZXQxreXOyHAX7qmZnhEuZ1+9ZtIwWKD3p1MGRqw1etMG
         dVkWrGArWD3ngOpTd0hboXY4tvZYsZsXKOTVcNW23n3cmz/z9UDFcn6acnS/IZuFrZcS
         AxlXwp0VYDZuYkqw1AQ5lSR335SMSaoxB31V/bkdv4ikRx3pnDuoZPEdekkIiZOdMuoI
         Ab6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726914; x=1776331714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg4kF7DL+oB6tH36fAvaKXc/fnplKDnQGRscIl2tUpQ=;
        b=GDUITgI8W5MAYyqjxRhjRX3wZQURu7IjKjmk3Ns9iCGpOqABJYxSv+CmeGcZl12ug5
         t7Do9hs7bJ30wwP1k9Up+ZUH/JPiOJtbAU4bfSTwDS0IzIV/VLsZ4q4nf8sBUflfHdfZ
         5vKXtty/HZzIpVB2ArIQTO6ThUI3J3nOTYGComwRUQdlxtcmvxiqmGmUlcut6ztFpGA6
         AJB07X930AOvJyKQPWZIKLU06brLviAY0eXFWxsvzSG5sRv0/QJwuKNhyGXcUJLwvfqR
         Lw1u1VNgDqa+Aman4wobv681f5Bu7Bmty5Whh4tnA1ifa3wN8BL3gcxTujSWOY/llQzX
         rHnA==
X-Gm-Message-State: AOJu0YyCjABuoGvQpAVwiczBy8Ev3v1liYrDPCYHgpAaOdJ7x8YJDaq/
	cWsdg4e8hTECH4J3j9ghtYLbTievS5cYdQj3iSMV94jnYm1yzVa1HzUecXkKJ0pEl71KW4egmNf
	9Nsd4UTxsAAEasVPahrO7yHgJNYJqET7SgyyuqRNb2DkektDph9DWe3UCE0/JURvzrUis9es5wp
	sW
X-Gm-Gg: AeBDiev8qgxEaWYa2g0U1s6wtfGNa3rlSE3M2siAHSIKx4UfWBut0NBRL3VQjY9OJfP
	QLYfMa6HrY3F3ZesIXXHgYPul/PvNjILMxai+8fsPdf5N+gVf52N4N9nnwEsFNJzJCLPOVStiC5
	O1T3ehiFrk7ARK9bcUHQnfVas/zMMKDwXdExH2TtbvvwF+bzF3jNWW3Orpo6yxqesSpTQrHTgcO
	39jYfwR/UmqVrMzaLR4X/B2aSsIrcZmz21O1Gjrq0mMgUeE8MDpZtTJ1ulUi7Hy6Owd851V1dNd
	OumvyyeS10qHOpTMyBH9lZxmZboWbF1rQEbijTap/ln3lkfFPKSH1gpIKXzlrMuP6Xe0bFwlUyU
	VG+Chw3aQJfIEq+HxBxNG+JT3aYbAxuXnB5p8n/aNjMCsd3i5pdWgyY03BTSvoqNKeVG89HgsPI
	yVl3lYcueZiDYtiVkQ+WybXumlfyqKVrAyVBKKFRBSEEjFphCbZCkLMcyC
X-Received: by 2002:a17:902:e948:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2816f8000mr292137845ad.21.1775726914022;
        Thu, 09 Apr 2026 02:28:34 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2816f8000mr292137445ad.21.1775726913518;
        Thu, 09 Apr 2026 02:28:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2cfa82655sm9299825ad.51.2026.04.09.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:28:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:58:29 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add the bootph-all property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-add_bootph-v1-1-cb2b5093f7d7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADxx12kC/yXMSwqAIBRA0a3EGyfY/7OViDB91WuQoRZBuPesh
 mdw7w0WDaGFNrrB4EmW9BaQxBHIRWwzMlLBkPK05DlvmFBqGLV2+8K4LOssKao6lwWEYDc40fX
 Nuv63PcYVpXsP4P0DeQqpyW4AAAA=
X-Change-ID: 20260409-add_bootph-0c68315784c5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775726910; l=3531;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CiV8Eb+aAuSaC0yvKkCcxTaJS4DNy3oRfwjQKCP0H7Y=;
 b=iH7VNd6BOEXIFmu22BGq3V8MF47/ALDCUaRXxyYpUHjWI4Zo5nT4zKEx78HEPMyi1NUROIve1
 Hl+NbaKUXPuBew20/3DpeezCl+3NnHQ2+nQNSy3dss6439FDwO0Y6tO
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: F0svv-LLP9i8rUJqa7rMn1mMAJLHqj5G
X-Proofpoint-GUID: F0svv-LLP9i8rUJqa7rMn1mMAJLHqj5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4NCBTYWx0ZWRfXx23VmdhdQ6zR
 GcK+0wPKrtdusE/xE/+7V/ZQIG3e/i8xrsIPoPDch1XDg5vmRA1Pum96LE5D8PCk5UFIz4I2T5N
 hWcdBiP/taFmxrNKttqslpp3dx8Gwn6nHB+cvx1BDshhRtew3TOqhnPZRkc2D1OG6pHO6wcKRDy
 JA8ZHVFADnxx0cdiDpwiIctkXRjRL6Rmzu9yA20OFB9C52CnD1CtZOJLB7ir29VEBUrIXZ2QiOp
 o0lyDzJjX5h4hQJwv7gNW9FzQkF/mbyL1LK9sWTETU1pSaJqbtlmzqo1BQCEytE/HBh/bbrKw3K
 ymtVp7Lsb2HyCC2vinMV4PUII0tLZA3gNoZxYpFv//56qnBtBsW/di6uUy/tONetNmJ+5zkjen9
 WJSy6arkX/1tVuYMe0ChQfI+Unr0X2U0xhLdskgArhv9lqTINILqvGTQSzqYnKRTqgK758Erd4D
 wyKxYMdNUUrbeBgJUZQ==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d77142 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6_qVrJlOYV7GrQKWXk4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090084
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-102471-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.830];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 554253C8792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the bootph-all property to the nodes which are utilized by the
bootloaders.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  5 +++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..56dbc506da78 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -17,6 +17,7 @@ aliases {
 
 	chosen {
 		stdout-path = "serial0";
+		bootph-all;
 	};
 };
 
@@ -41,6 +42,7 @@ qup_uart1_default_state: qup-uart1-default-state {
 		function = "qup_se1";
 		drive-strength = <6>;
 		bias-pull-down;
+		bootph-all;
 	};
 
 	sdhc_default_state: sdhc-default-state {
@@ -49,6 +51,7 @@ clk-pins {
 			function = "sdc_clk";
 			drive-strength = <8>;
 			bias-disable;
+			bootph-all;
 		};
 
 		cmd-pins {
@@ -56,6 +59,7 @@ cmd-pins {
 			function = "sdc_cmd";
 			drive-strength = <8>;
 			bias-pull-up;
+			bootph-all;
 		};
 
 		data-pins {
@@ -63,6 +67,7 @@ data-pins {
 			function = "sdc_data";
 			drive-strength = <8>;
 			bias-pull-up;
+			bootph-all;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..e0a90b16b097 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -14,11 +14,13 @@ / {
 
 	clocks {
 		sleep_clk: sleep-clk {
+			bootph-all;
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
 
 		xo_board: xo-board-clk {
+			bootph-all;
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
@@ -98,6 +100,7 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		bootph-all;
 
 		bootloader@87800000 {
 			reg = <0x0 0x87800000 0x0 0x400000>;
@@ -108,6 +111,7 @@ smem@87c00000 {
 			compatible = "qcom,smem";
 			reg = <0x0 0x87c00000 0x0 0x40000>;
 			no-map;
+			bootph-all;
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
@@ -129,6 +133,7 @@ soc@0 {
 		#size-cells = <2>;
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
+		bootph-all;
 
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
@@ -139,6 +144,7 @@ tlmm: pinctrl@1000000 {
 			gpio-ranges = <&tlmm 0 0 54>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			bootph-all;
 		};
 
 		gcc: clock-controller@1800000 {
@@ -152,6 +158,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		tcsr_mutex: hwlock@1905000 {
@@ -169,6 +176,7 @@ qupv3: geniqup@1ac0000 {
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			bootph-all;
 
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
@@ -176,6 +184,7 @@ uart1: serial@1a84000 {
 				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				bootph-all;
 
 				status = "disabled";
 			};
@@ -200,6 +209,7 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			bootph-all;
 
 			status = "disabled";
 		};

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-add_bootph-0c68315784c5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


