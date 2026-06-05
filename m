Return-Path: <linux-arm-msm+bounces-111297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MBSyEXwmImqwTAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:29:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C06446AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=FbyFCMbr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335ED31421BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 01:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA03BC696;
	Fri,  5 Jun 2026 01:01:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611737FF4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 01:01:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621300; cv=none; b=WHEyvqyhOQDLG73CoRb9GfXx6UcZPGYd0DCrn6nDaLc+ZJvbnOu/CPM9lJ9lpPOSygaYY9R0SEFJes4PLVrm402yPFbxN1VY5LVpR3xNCPQyXJemnA1fiN0rcfyIJ3fC7AQNagarjES446ElkvrCuxgLhb3Oiyp+uPvUkPwUV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621300; c=relaxed/simple;
	bh=bNdzZCp4H4EqUayBYK6F7gzfqkb9PzdmXuPOgMv/cjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRFYmYlmK5DTvH770UJMTmv+b78Y/jy9+cYAtJF9LGY9tHw3kdH0WqfeBEcrIqrnwFNdHWI10pYWj45CTFTtDxrAcN3YRyiAcG8bRDqmXEgGjX30RZLMdF3Bg7QCs33Zosd0L40YGre22LCcFvXvmViuhLPf1pbCxvJvDX8lJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FbyFCMbr; arc=none smtp.client-ip=209.85.167.171
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4854166e1efso1259997b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621272; x=1781226072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=FbyFCMbrcdE33xYJfmSU0PdE/SwPh+C7CaeDFSXmLHoGc25fvOSL4JI0qHenNYnf+k
         RRnnw+KIZtMIaM3kKgm/ILskMrxxGQGJX0frZo3QxRIsAJndGKv0Ocuurx04t7Ses7ar
         5Qud2JgujPHybNuEWD2VL3yqCFzH/1sn4UGEL+6qygiLMpoRT+AqCpNPFyhtB3Dwqfa1
         eM/NFqVhK59r1l8pFBlscaGBm0IX2TUoPxKbI+tjjmqlfwG1pPGJVeTqya0KOBhffoWn
         wUGvKOfLVEu3FkkQ4pyt8mazPQfXc0FYEDw6PHsOR6l08EF9VFwFznFjsvNyivu4qgVG
         UoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621272; x=1781226072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=N006HidREV2JPc3zZ04qreXYL9jihVPvWsWKv1AKgZjYRdxOjmv7JLSCFJvMrcPo0J
         LF/Le4Cf0MBbt8nhr3KNI1tV3tRLPpdt49bNdJON14FnHxnKQvld3zEbLZ9LQnTlC10t
         QwPm0K/7o0isgI07g1c0nXhKqZa/N5sKIQbfYLkeTyLepVOWgUbZXbVl/+EBgB7o/uzc
         wRhMyYz8prPBpkvRGgR4PCTeJso2O6wVa8SaJJegvdTn16zi9PlGyi6mG1kWqlVkwWrn
         0O5QcY1nwEE5ddtuiRTUMnwyINOT62ybP01NX8G6tJuB6ZFuv0WqGZSo54NhA2UQe/eh
         484Q==
X-Forwarded-Encrypted: i=1; AFNElJ/HHI7cMv1XhIkv9P/j4DFqFUg0g93XUvdQXiv7fpED/mZIvTRdPR0nFrRzL+llPH1uYvnwKhAvChaVbxjA@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFi37H4WdXWEET3Z0QKIgWnrL575hUe4gNwC8/Pmb/gR32OP1
	XWdiGclqkex8b4otige/GEBS72Koa4IREbNvnbOY5e41A5GZVXhqltAfmNrY4g2Paxo=
X-Gm-Gg: Acq92OGwFpd2WDpoaRdbTEcgWSrWAGMkh4gmQUo6Mq3lehdkvo3GTcKhV+CS+pWH+e2
	gF7kb1qC0AZoWsiaNHLU1WsG8S7fnyTjV7c2wjKLQ0L0EQyEy2T+r9egMBG6UI0HyZn3L5OAFQ5
	X4ArRi9Ik7B6qO78Kp5e9aQ0+lEbmkUQRWNZMe1ZrqMyhTiLdlhJbATcuQXMb1gxGm4AYNTNeXB
	bDA3xVcUg1JIi+C9am6nt2x7E9pX5iQs+TI6Jfadqh3VSTQMpag5qGvftdmfjL/HVevyavzZA1v
	pd5mc4E+LDtskuYLh+IGrs1JtBapBSmZFnIpCTTKmDX6Lsv02rEWyAlKJYEna5yTgpxFakLzUd4
	cEuBehmtyKyNre5lHhMsCxp03PBJ1EUvgGkTFsJ6HdWjoJ3MLW9la9aM2pLrHZRFuJvurjLwXO5
	k7N5cKFb+yu9xZpu249i7LzFPSILM78GD5CQLVug==
X-Received: by 2002:a05:6808:1804:b0:467:27d2:96a7 with SMTP id 5614622812f47-4868dd0463amr865195b6e.15.1780621271933;
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 14/14] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081 phy
Date: Thu,  4 Jun 2026 20:00:21 -0500
Message-ID: <20260605010022.968612-15-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111297-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:elder@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@k
 ernel.org,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 970C06446AE

From: Daniel Thompson <daniel@riscstar.com>

The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.

Downstream PCIe switch port 3 has an embedded PCIe endpoint, which
includes two functions.  The GPIO controller embedded within the
TC9564 is accessed via memory-mapped I/O through the first PCIe
function's BAR4.

Both embedded PCIe functions have an attached Synopsys XGMAC, but
not all RB3gen2 builds include PHYs on both ports.  All versions
include a TC9564 combined with a single QCA8081 attached to eMAC1.

Add properties to the existing PCI nodes to describe how the TC9564 and
QCA8081 are connected to each other (and to the host SoC).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
Checkpatch notes:
  - pci1179 is not a recognized vendor ID
  - Some lines are longer than recommented

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884af..1d83b07360a33 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -308,6 +308,15 @@ vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
 		regulator-enable-ramp-delay = <10000>;
 	};
 
+	qep_1p8: regulator-qep-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "qep_1p8";
+		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -938,19 +947,51 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			pci@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				tc9564_gpio0: gpio {
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
 			};
 
 			pci@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				ethernet {
+					phy-mode = "sgmii";
+					phy-handle = <&tc9564_emac1_phy>;
+
+					mdio {
+						compatible = "snps,dwmac-mdio";
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						tc9564_emac1_phy: ethernet-phy@1c {
+							compatible = "ethernet-phy-id004d.d101";
+							reg = <0x1c>;
+							snps,reset = <&tc9564_gpio0 1 GPIO_ACTIVE_LOW>;
+							reset-assert-us = <11000>;
+							reset-deassert-us = <70000>;
+
+							vdd18-supply = <&qep_1p8>;
+
+							pinctrl-names = "default";
+							pinctrl-0 = <&qep_irq_pin>;
+							interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
+						};
+					};
+				};
 			};
 		};
 	};
@@ -1524,6 +1565,13 @@ usb_hub_reset_state: usb-hub-reset-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	qep_irq_pin: qep-irq-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {
-- 
2.51.0


