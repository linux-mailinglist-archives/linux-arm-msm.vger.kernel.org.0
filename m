Return-Path: <linux-arm-msm+bounces-108033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNtvAkO/CWrDnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FF561262
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 558843002F64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA33932E3;
	Sun, 17 May 2026 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkPM4C8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA738F92A;
	Sun, 17 May 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023665; cv=none; b=ZVsa+aKu9w6DEGbMwRMpm2RiT3HTOsG68IpVg+LuAn/qtCq+LS9CCjp5nEO6w6+P0q6cKlNr9kMTsLnMptD/PG97vlOONm8raXjtg/e0F+rp2SluBmzVkqXvwkvP7H/RigUg8Ec2QXAmYVTdKNMxiW3kI0pP0+de88rfDUYTkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023665; c=relaxed/simple;
	bh=C0NfV0bt26acgBuyjoOhfdtQ6SXvD4+U/Pge//YsjaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MD+YlWUh0AIk7fly7qc47UbOqP8CyMnTbOcIMU5SgilV+gB6k3TokUKeiR9ZQfcFNsWSsP09rZPdJg3Yd1Qcvc3ZJGFcDac7Nqzk3fgJnX/XqfAZePFy6ZnxdmB+h3Yvq/VxN15vZPFR1DXBdwJ7P/kfoIvf8CGg9xoeLeWFmkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkPM4C8O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3670DC2BCF7;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779023663;
	bh=C0NfV0bt26acgBuyjoOhfdtQ6SXvD4+U/Pge//YsjaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rkPM4C8Oa8t0FgpM5bZa7aN+Lg8YXE21Qr2M3uKh0NWUPeSgWiQrNjdVQkrAlPqPT
	 BTTco1CII2YJDEvW9AW17Sqsgv8ldO6TfBYGccpcpG9A7rjiNArUsx+rzbkfkuvtCX
	 C8T20nnJenDuzwOi9Sv2YFpIbHVUQd9SB81XNC7ui/FKWpn+bnw2nZAZvqOJbR0bVj
	 +sjnb4f70x3l1OQt74TVOxn0PGtXgARfAGQJkyIvAKh2W+ld0F3iru4Tk8gtogBqyk
	 Xp85QJNMIoGqyhFC6dYd/Qr9Dga0zFUbfRJqM8A8eYH1JIpTMHKpdLNt9ZcNoU/RCS
	 o7HJnqwNS4LeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3015BCD4F48;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 17 May 2026 20:14:23 +0700
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
In-Reply-To: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779023659; l=1968;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=g2a8yIPr/NXyccP9E9kuGm/v0j5P1EWZoxrYzuxfC0w=;
 b=FLSZ6DNRRt17NzQZy35jonoFjMneO5VLh/PdOc3lMBEyZu2ZHKF8MMhjBJyS59F/s2F0j4Iwv
 0CGASmlMSMfDCQAxkxG5EPnbu+dRZts1ogvZlSRpTgB9nH5AoWb+uA+
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 4D2FF561262
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108033-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.13.148.144:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[88c000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add the QUPv3_2 SE3 High Speed UART (UART11) controller node and its
default pinctrl state to sm8550.dtsi, so boards can enable it through
&uart11 instead of open-coding the controller in their own dts.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index a9c678fc9cb2..3e71701b18ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1084,6 +1084,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				status = "disabled";
 			};
 
+			uart11: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart11_default>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core", "qup-config";
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				status = "disabled";
+			};
+
 			i2c12: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00890000 0 0x4000>;
@@ -5102,6 +5120,14 @@ qup_uart7_default: qup-uart7-default-state {
 				bias-disable;
 			};
 
+			qup_uart11_default: qup-uart11-default-state {
+				/* TX, RX */
+				pins = "gpio70", "gpio71";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart14_default: qup-uart14-default-state {
 				/* TX, RX */
 				pins = "gpio78", "gpio79";

-- 
2.54.0



