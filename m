Return-Path: <linux-arm-msm+bounces-112924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l0/qAdPlK2pIHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EA678D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=39IKuei0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EAA33009164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8EA374192;
	Fri, 12 Jun 2026 10:56:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDF388E4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:56:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261767; cv=none; b=CYCS4gOgNnZeJK7mQxywsMxg/Hxrfh3Mab1YzbA7olJbLHBk5nLGy+h6ZpvW5Z/nllOW01boln3wV0CarqA6iteKbULpl0hdR0GPBIOJK5MjDfKXwwTZvxrPJ9F8T4HqElX/XZyxfL1AXxtm8QbXPV2jHiGU0GKqC2rI0uENEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261767; c=relaxed/simple;
	bh=2PU3g/Y9/kCXesH4ZmBzOD1Zua1tmsKn2+ZGguDqp4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohE7eGD4hVPosXOzYIz0uv9VsteF8DbmVPp/6p0hKHQdBcBt3Ha7IEI3u8Ksb3dA1p9xDfmlKszd5E9ZevCvPKRxgjMQzpIeSxVyrzOrKMcQgA9oL+sSIowtYS+Gt1CspP0JvmjDz3DVGRdgj/4ST/z6myVfpsav+1rJOruIwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=39IKuei0; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso140123766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261763; x=1781866563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaysdM06Aa3OTW9i0bvVQPfdB25HZ+rLA+/+NYZ57Yk=;
        b=39IKuei0vcUasIFB4skvcWCh25kqyR2tvgjRqdKV7I21n/FUOcgP8+IdkRzbVFVZHr
         xKEiRUQEm5WdehXo+LoCFPNcfPuL5Bm0nEOpmfplJ7GGa79436QFBEPJlgePGE6JbpcJ
         JF3LgD4p4e1972lbSnNP+sMva09VBl3Nq12FWE1lncYMYsIohjjVFq+4StIYN1KofCmW
         1UiQqz9iKXqAPH8mMFwgv0HB4HdVf+mIm2HqvgbakVFDiW8vnR12RgtQcawO8C+ErFZQ
         CeE73MAqosaRzXGsgWvP8neG1rXJb4U8Orvo+1dczCUaQTOv4u3k7kJGZ0v5K3Z/wnvV
         bELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261763; x=1781866563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NaysdM06Aa3OTW9i0bvVQPfdB25HZ+rLA+/+NYZ57Yk=;
        b=Ynl99i0ry99smzhd2gs+xlswJiTSdzBcloRZz228mliHOc1Tp+1B+SE+vPLSEZe5aq
         F+2crLPHMbA5oR6+RlwK7nODrYMLn3sTZFSfHrNABy1XJg84V2H6+GepQoq4xw7zFZpp
         +LiZDcNH4qrD/9j+36uh1G0VZkNQy+KabENnATRX3RVXvMMDyu7Re1qwO62UXSLk+lA4
         JIntzLVFKcAAlzxpeo0HVKzzjVXNyeXWaqRaxOnDqNva27Yn3JXX9xHgKwHIcGJtU/hG
         TVjw7xx9+ZX/k2xWKt4+GWN8PUp5w4U6mSigreZ8/v41S8RMKWGnYPdrqUICq8Pdn0NV
         q2Vg==
X-Forwarded-Encrypted: i=1; AFNElJ9e7b/HB/IHZXO6w8F9j6gxNNEjolS8n+oBvCiom/QKgzYWX2M9zc4swbgdptLjFO/cvzy8tX51vKvFqCAm@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwbebqcUTRh+b6hLR+AmsJrp/Q+G79yWUgMmBBbd8jMeOLD8m
	e0d3wCKQOmloKMhOthq5i+/NJEmB886wbElQVa/I35Qp4H7d5tz2+72Dak0h09GrZtU=
X-Gm-Gg: Acq92OEovxsN1kU3wzSq7SVewUv+ImAd+2t1rJ2Iv6ilsk7lIX5pnguo8uO/Q3OqeiB
	BC1aloMaQdJCp16cpyNZfVAk265xsNl/OMKQ6zgHSIBAQi3EuE/R223BppinU28c3S0JixvzyJk
	ZFOCpNvk6BqCDcBkJMJMNlC4uRiPfWOlgbqAwJXAYGc3+r7oWL8MnfjUC2Y57Ogk0qECIoq4sKK
	SvvP/Nm53q0R/Ihslccvg7RGvFy5fSG47lU5jca3M4wuMh0X3S3pXvbu/ODS2yfF/NCsvdf5iaK
	s/SKAwvU8lCriXciykDpjIQYKdvcmKngfOr7U0vHDgdcvOcs+KL20X7qX8m/IivtaBPR/KKZkuR
	GY5kmtA+944KDp/wy+6K/WxLDLuvAOkr4+/maisEUBeAph6RUOPakP6Ffkm3AzBbScnzM/T1+wG
	L7CdXrJtTSIpGq4tFHSLWQCTzLxbn1IGXjP/AFPSYSQD7G0DlWbo1nnlVWu1fIxXHkpZauR9u2X
	iLHnUxveif8hTlzGmOZS2LHTEPLjZuFGVNk8aJpdEF00qzPfi50DH9O4vA=
X-Received: by 2002:a17:907:b5a5:b0:bfb:c8ec:7f9e with SMTP id a640c23a62f3a-bfe2a8101b6mr56650166b.35.1781261762679;
        Fri, 12 Jun 2026 03:56:02 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 12:55:51 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=31400;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2PU3g/Y9/kCXesH4ZmBzOD1Zua1tmsKn2+ZGguDqp4k=;
 b=h4XRHLahUW4Gfvr0o2+RHPQCbdtAknUylUSKDeEcBDrHqDw5Wm+mxY3CDksrYR96enlO5azYD
 eVHIgN383VQD7IT9lnR8ImUTiuOiMMUIfa+1c2e7DJWufwk3AltZpxN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112924-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D98EA678D08

As documented in the "Devicetree Sources (DTS) Coding Style" document,
pinctrl subnodes should be sorted by the pins property. Do this once for
kodiak.dtsi so that future additions can be added at the right places.

No functional change intended, verified with dtx_diff.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
 1 file changed, 691 insertions(+), 691 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..62daef726d32 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5835,6 +5835,676 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup00";
+			};
+
+			qup_uart0_cts: qup-uart0-cts-state {
+				pins = "gpio0";
+				function = "qup00";
+			};
+
+			qup_uart0_rts: qup-uart0-rts-state {
+				pins = "gpio1";
+				function = "qup00";
+			};
+
+			qup_uart0_tx: qup-uart0-tx-state {
+				pins = "gpio2";
+				function = "qup00";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_uart0_rx: qup-uart0-rx-state {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio4", "gpio5";
+				function = "qup01";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup01";
+			};
+
+			qup_uart1_cts: qup-uart1-cts-state {
+				pins = "gpio4";
+				function = "qup01";
+			};
+
+			qup_uart1_rts: qup-uart1-rts-state {
+				pins = "gpio5";
+				function = "qup01";
+			};
+
+			qup_uart1_tx: qup-uart1-tx-state {
+				pins = "gpio6";
+				function = "qup01";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_uart1_rx: qup-uart1-rx-state {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio8", "gpio9";
+				function = "qup02";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup02";
+			};
+
+			qup_uart2_cts: qup-uart2-cts-state {
+				pins = "gpio8";
+				function = "qup02";
+			};
+
+			qup_uart2_rts: qup-uart2-rts-state {
+				pins = "gpio9";
+				function = "qup02";
+			};
+
+			qup_uart2_tx: qup-uart2-tx-state {
+				pins = "gpio10";
+				function = "qup02";
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
+				pins = "gpio11";
+				function = "gpio";
+			};
+
+			qup_uart2_rx: qup-uart2-rx-state {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qspi_data0: qspi-data0-state {
+				pins = "gpio12";
+				function = "qspi_data";
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio12", "gpio13";
+				function = "qup03";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				pins = "gpio12", "gpio13", "gpio14";
+				function = "qup03";
+			};
+
+			qup_uart3_cts: qup-uart3-cts-state {
+				pins = "gpio12";
+				function = "qup03";
+			};
+
+			qspi_data1: qspi-data1-state {
+				pins = "gpio13";
+				function = "qspi_data";
+			};
+
+			qup_uart3_rts: qup-uart3-rts-state {
+				pins = "gpio13";
+				function = "qup03";
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio14";
+				function = "qspi_clk";
+			};
+
+			qup_uart3_tx: qup-uart3-tx-state {
+				pins = "gpio14";
+				function = "qup03";
+			};
+
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio15";
+				function = "qspi_cs";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio15";
+				function = "gpio";
+			};
+
+			qup_uart3_rx: qup-uart3-rx-state {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qspi_data23: qspi-data23-state {
+				pins = "gpio16", "gpio17";
+				function = "qspi_data";
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				pins = "gpio16", "gpio17", "gpio18";
+				function = "qup04";
+			};
+
+			qup_uart4_cts: qup-uart4-cts-state {
+				pins = "gpio16";
+				function = "qup04";
+			};
+
+			qup_uart4_rts: qup-uart4-rts-state {
+				pins = "gpio17";
+				function = "qup04";
+			};
+
+			qup_uart4_tx: qup-uart4-tx-state {
+				pins = "gpio18";
+				function = "qup04";
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio19";
+				function = "qspi_cs";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio19";
+				function = "gpio";
+			};
+
+			qup_uart4_rx: qup-uart4-rx-state {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				pins = "gpio20", "gpio21";
+				function = "qup05";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup05";
+			};
+
+			qup_uart5_tx: qup-uart5-tx-state {
+				pins = "gpio22";
+				function = "qup05";
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio23";
+				function = "qup05";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
+				pins = "gpio23";
+				function = "gpio";
+			};
+
+			qup_uart5_rx: qup-uart5-rx-state {
+				pins = "gpio23";
+				function = "qup05";
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				pins = "gpio24", "gpio25";
+				function = "qup06";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				pins = "gpio24", "gpio25", "gpio26";
+				function = "qup06";
+			};
+
+			qup_uart6_cts: qup-uart6-cts-state {
+				pins = "gpio24";
+				function = "qup06";
+			};
+
+			qup_uart6_rts: qup-uart6-rts-state {
+				pins = "gpio25";
+				function = "qup06";
+			};
+
+			qup_uart6_tx: qup-uart6-tx-state {
+				pins = "gpio26";
+				function = "qup06";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio27";
+				function = "gpio";
+			};
+
+			qup_uart6_rx: qup-uart6-rx-state {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				pins = "gpio28", "gpio29";
+				function = "qup07";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup07";
+			};
+
+			qup_uart7_cts: qup-uart7-cts-state {
+				pins = "gpio28";
+				function = "qup07";
+			};
+
+			qup_uart7_rts: qup-uart7-rts-state {
+				pins = "gpio29";
+				function = "qup07";
+			};
+
+			qup_uart7_tx: qup-uart7-tx-state {
+				pins = "gpio30";
+				function = "qup07";
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
+				pins = "gpio31";
+				function = "gpio";
+			};
+
+			qup_uart7_rx: qup-uart7-rx-state {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio32", "gpio33";
+				function = "qup10";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup10";
+			};
+
+			qup_uart8_cts: qup-uart8-cts-state {
+				pins = "gpio32";
+				function = "qup10";
+			};
+
+			qup_uart8_rts: qup-uart8-rts-state {
+				pins = "gpio33";
+				function = "qup10";
+			};
+
+			qup_uart8_tx: qup-uart8-tx-state {
+				pins = "gpio34";
+				function = "qup10";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
+			qup_uart8_rx: qup-uart8-rx-state {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio36", "gpio37";
+				function = "qup11";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup11";
+			};
+
+			qup_uart9_cts: qup-uart9-cts-state {
+				pins = "gpio36";
+				function = "qup11";
+			};
+
+			qup_uart9_rts: qup-uart9-rts-state {
+				pins = "gpio37";
+				function = "qup11";
+			};
+
+			qup_uart9_tx: qup-uart9-tx-state {
+				pins = "gpio38";
+				function = "qup11";
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_uart9_rx: qup-uart9-rx-state {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio40", "gpio41";
+				function = "qup12";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup12";
+			};
+
+			qup_uart10_cts: qup-uart10-cts-state {
+				pins = "gpio40";
+				function = "qup12";
+			};
+
+			qup_uart10_rts: qup-uart10-rts-state {
+				pins = "gpio41";
+				function = "qup12";
+			};
+
+			qup_uart10_tx: qup-uart10-tx-state {
+				pins = "gpio42";
+				function = "qup12";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
+			qup_uart10_rx: qup-uart10-rx-state {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio44", "gpio45";
+				function = "qup13";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup13";
+			};
+
+			qup_uart11_cts: qup-uart11-cts-state {
+				pins = "gpio44";
+				function = "qup13";
+			};
+
+			qup_uart11_rts: qup-uart11-rts-state {
+				pins = "gpio45";
+				function = "qup13";
+			};
+
+			qup_uart11_tx: qup-uart11-tx-state {
+				pins = "gpio46";
+				function = "qup13";
+			};
+
+			dp_hot_plug_det: dp-hot-plug-det-state {
+				pins = "gpio47";
+				function = "dp_hot";
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
+			qup_uart11_rx: qup-uart11-rx-state {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio48", "gpio49";
+				function = "qup14";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup14";
+			};
+
+			qup_uart12_cts: qup-uart12-cts-state {
+				pins = "gpio48";
+				function = "qup14";
+			};
+
+			qup_uart12_rts: qup-uart12-rts-state {
+				pins = "gpio49";
+				function = "qup14";
+			};
+
+			qup_uart12_tx: qup-uart12-tx-state {
+				pins = "gpio50";
+				function = "qup14";
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
+			qup_uart12_rx: qup-uart12-rx-state {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				pins = "gpio52", "gpio53";
+				function = "qup15";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup15";
+			};
+
+			qup_uart13_cts: qup-uart13-cts-state {
+				pins = "gpio52";
+				function = "qup15";
+			};
+
+			qup_uart13_rts: qup-uart13-rts-state {
+				pins = "gpio53";
+				function = "qup15";
+			};
+
+			qup_uart13_tx: qup-uart13-tx-state {
+				pins = "gpio54";
+				function = "qup15";
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
+			qup_uart13_rx: qup-uart13-rx-state {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio56", "gpio57";
+				function = "qup16";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup16";
+			};
+
+			qup_uart14_cts: qup-uart14-cts-state {
+				pins = "gpio56";
+				function = "qup16";
+			};
+
+			qup_uart14_rts: qup-uart14-rts-state {
+				pins = "gpio57";
+				function = "qup16";
+			};
+
+			qup_uart14_tx: qup-uart14-tx-state {
+				pins = "gpio58";
+				function = "qup16";
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
+			qup_uart14_rx: qup-uart14-rx-state {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			edp_hot_plug_det: edp-hot-plug-det-state {
+				pins = "gpio60";
+				function = "edp_hot";
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio60", "gpio61";
+				function = "qup17";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				pins = "gpio60", "gpio61", "gpio62";
+				function = "qup17";
+			};
+
+			qup_uart15_cts: qup-uart15-cts-state {
+				pins = "gpio60";
+				function = "qup17";
+			};
+
+			qup_uart15_rts: qup-uart15-rts-state {
+				pins = "gpio61";
+				function = "qup17";
+			};
+
+			qup_uart15_tx: qup-uart15-tx-state {
+				pins = "gpio62";
+				function = "qup17";
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio63";
+				function = "qup17";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
+				pins = "gpio63";
+				function = "gpio";
+			};
+
+			qup_uart15_rx: qup-uart15-rx-state {
+				pins = "gpio63";
+				function = "qup17";
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
@@ -5898,24 +6568,14 @@ cci3_sleep: cci3-sleep-state {
 				bias-pull-down;
 			};
 
-			dp_hot_plug_det: dp-hot-plug-det-state {
-				pins = "gpio47";
-				function = "dp_hot";
+			pcie1_clkreq_n: pcie1-clkreq-n-state {
+				pins = "gpio79";
+				function = "pcie1_clkreqn";
 			};
 
-			edp_hot_plug_det: edp-hot-plug-det-state {
-				pins = "gpio60";
-				function = "edp_hot";
-			};
-
-			mi2s0_data0: mi2s0-data0-state {
-				pins = "gpio98";
-				function = "mi2s0_data0";
-			};
-
-			mi2s0_data1: mi2s0-data1-state {
-				pins = "gpio99";
-				function = "mi2s0_data1";
+			pcie0_clkreq_n: pcie0-clkreq-n-state {
+				pins = "gpio88";
+				function = "pcie0_clkreqn";
 			};
 
 			mi2s0_mclk: mi2s0-mclk-state {
@@ -5928,696 +6588,36 @@ mi2s0_sclk: mi2s0-sclk-state {
 				function = "mi2s0_sck";
 			};
 
+			mi2s0_data0: mi2s0-data0-state {
+				pins = "gpio98";
+				function = "mi2s0_data0";
+			};
+
+			mi2s0_data1: mi2s0-data1-state {
+				pins = "gpio99";
+				function = "mi2s0_data1";
+			};
+
 			mi2s0_ws: mi2s0-ws-state {
 				pins = "gpio100";
 				function = "mi2s0_ws";
 			};
 
-			mi2s1_data0: mi2s1-data0-state {
-				pins = "gpio107";
-				function = "mi2s1_data0";
-			};
-
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";
 			};
 
+			mi2s1_data0: mi2s1-data0-state {
+				pins = "gpio107";
+				function = "mi2s1_data0";
+			};
+
 			mi2s1_ws: mi2s1-ws-state {
 				pins = "gpio108";
 				function = "mi2s1_ws";
 			};
 
-			pcie0_clkreq_n: pcie0-clkreq-n-state {
-				pins = "gpio88";
-				function = "pcie0_clkreqn";
-			};
-
-			pcie1_clkreq_n: pcie1-clkreq-n-state {
-				pins = "gpio79";
-				function = "pcie1_clkreqn";
-			};
-
-			qspi_clk: qspi-clk-state {
-				pins = "gpio14";
-				function = "qspi_clk";
-			};
-
-			qspi_cs0: qspi-cs0-state {
-				pins = "gpio15";
-				function = "qspi_cs";
-			};
-
-			qspi_cs1: qspi-cs1-state {
-				pins = "gpio19";
-				function = "qspi_cs";
-			};
-
-			qspi_data0: qspi-data0-state {
-				pins = "gpio12";
-				function = "qspi_data";
-			};
-
-			qspi_data1: qspi-data1-state {
-				pins = "gpio13";
-				function = "qspi_data";
-			};
-
-			qspi_data23: qspi-data23-state {
-				pins = "gpio16", "gpio17";
-				function = "qspi_data";
-			};
-
-			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
-				pins = "gpio0", "gpio1";
-				function = "qup00";
-			};
-
-			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
-				pins = "gpio4", "gpio5";
-				function = "qup01";
-			};
-
-			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
-				pins = "gpio8", "gpio9";
-				function = "qup02";
-			};
-
-			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
-				pins = "gpio12", "gpio13";
-				function = "qup03";
-			};
-
-			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
-				pins = "gpio16", "gpio17";
-				function = "qup04";
-			};
-
-			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
-				pins = "gpio20", "gpio21";
-				function = "qup05";
-			};
-
-			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
-				pins = "gpio24", "gpio25";
-				function = "qup06";
-			};
-
-			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
-				pins = "gpio28", "gpio29";
-				function = "qup07";
-			};
-
-			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
-				pins = "gpio32", "gpio33";
-				function = "qup10";
-			};
-
-			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
-				pins = "gpio36", "gpio37";
-				function = "qup11";
-			};
-
-			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
-				pins = "gpio40", "gpio41";
-				function = "qup12";
-			};
-
-			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
-				pins = "gpio44", "gpio45";
-				function = "qup13";
-			};
-
-			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
-				pins = "gpio48", "gpio49";
-				function = "qup14";
-			};
-
-			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
-				pins = "gpio52", "gpio53";
-				function = "qup15";
-			};
-
-			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
-				pins = "gpio56", "gpio57";
-				function = "qup16";
-			};
-
-			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
-				pins = "gpio60", "gpio61";
-				function = "qup17";
-			};
-
-			qup_spi0_data_clk: qup-spi0-data-clk-state {
-				pins = "gpio0", "gpio1", "gpio2";
-				function = "qup00";
-			};
-
-			qup_spi0_cs: qup-spi0-cs-state {
-				pins = "gpio3";
-				function = "qup00";
-			};
-
-			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
-				pins = "gpio3";
-				function = "gpio";
-			};
-
-			qup_spi1_data_clk: qup-spi1-data-clk-state {
-				pins = "gpio4", "gpio5", "gpio6";
-				function = "qup01";
-			};
-
-			qup_spi1_cs: qup-spi1-cs-state {
-				pins = "gpio7";
-				function = "qup01";
-			};
-
-			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
-				pins = "gpio7";
-				function = "gpio";
-			};
-
-			qup_spi2_data_clk: qup-spi2-data-clk-state {
-				pins = "gpio8", "gpio9", "gpio10";
-				function = "qup02";
-			};
-
-			qup_spi2_cs: qup-spi2-cs-state {
-				pins = "gpio11";
-				function = "qup02";
-			};
-
-			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
-				pins = "gpio11";
-				function = "gpio";
-			};
-
-			qup_spi3_data_clk: qup-spi3-data-clk-state {
-				pins = "gpio12", "gpio13", "gpio14";
-				function = "qup03";
-			};
-
-			qup_spi3_cs: qup-spi3-cs-state {
-				pins = "gpio15";
-				function = "qup03";
-			};
-
-			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
-				pins = "gpio15";
-				function = "gpio";
-			};
-
-			qup_spi4_data_clk: qup-spi4-data-clk-state {
-				pins = "gpio16", "gpio17", "gpio18";
-				function = "qup04";
-			};
-
-			qup_spi4_cs: qup-spi4-cs-state {
-				pins = "gpio19";
-				function = "qup04";
-			};
-
-			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
-				pins = "gpio19";
-				function = "gpio";
-			};
-
-			qup_spi5_data_clk: qup-spi5-data-clk-state {
-				pins = "gpio20", "gpio21", "gpio22";
-				function = "qup05";
-			};
-
-			qup_spi5_cs: qup-spi5-cs-state {
-				pins = "gpio23";
-				function = "qup05";
-			};
-
-			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
-				pins = "gpio23";
-				function = "gpio";
-			};
-
-			qup_spi6_data_clk: qup-spi6-data-clk-state {
-				pins = "gpio24", "gpio25", "gpio26";
-				function = "qup06";
-			};
-
-			qup_spi6_cs: qup-spi6-cs-state {
-				pins = "gpio27";
-				function = "qup06";
-			};
-
-			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
-				pins = "gpio27";
-				function = "gpio";
-			};
-
-			qup_spi7_data_clk: qup-spi7-data-clk-state {
-				pins = "gpio28", "gpio29", "gpio30";
-				function = "qup07";
-			};
-
-			qup_spi7_cs: qup-spi7-cs-state {
-				pins = "gpio31";
-				function = "qup07";
-			};
-
-			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
-				pins = "gpio31";
-				function = "gpio";
-			};
-
-			qup_spi8_data_clk: qup-spi8-data-clk-state {
-				pins = "gpio32", "gpio33", "gpio34";
-				function = "qup10";
-			};
-
-			qup_spi8_cs: qup-spi8-cs-state {
-				pins = "gpio35";
-				function = "qup10";
-			};
-
-			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
-				pins = "gpio35";
-				function = "gpio";
-			};
-
-			qup_spi9_data_clk: qup-spi9-data-clk-state {
-				pins = "gpio36", "gpio37", "gpio38";
-				function = "qup11";
-			};
-
-			qup_spi9_cs: qup-spi9-cs-state {
-				pins = "gpio39";
-				function = "qup11";
-			};
-
-			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
-				pins = "gpio39";
-				function = "gpio";
-			};
-
-			qup_spi10_data_clk: qup-spi10-data-clk-state {
-				pins = "gpio40", "gpio41", "gpio42";
-				function = "qup12";
-			};
-
-			qup_spi10_cs: qup-spi10-cs-state {
-				pins = "gpio43";
-				function = "qup12";
-			};
-
-			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
-				pins = "gpio43";
-				function = "gpio";
-			};
-
-			qup_spi11_data_clk: qup-spi11-data-clk-state {
-				pins = "gpio44", "gpio45", "gpio46";
-				function = "qup13";
-			};
-
-			qup_spi11_cs: qup-spi11-cs-state {
-				pins = "gpio47";
-				function = "qup13";
-			};
-
-			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
-				pins = "gpio47";
-				function = "gpio";
-			};
-
-			qup_spi12_data_clk: qup-spi12-data-clk-state {
-				pins = "gpio48", "gpio49", "gpio50";
-				function = "qup14";
-			};
-
-			qup_spi12_cs: qup-spi12-cs-state {
-				pins = "gpio51";
-				function = "qup14";
-			};
-
-			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
-				pins = "gpio51";
-				function = "gpio";
-			};
-
-			qup_spi13_data_clk: qup-spi13-data-clk-state {
-				pins = "gpio52", "gpio53", "gpio54";
-				function = "qup15";
-			};
-
-			qup_spi13_cs: qup-spi13-cs-state {
-				pins = "gpio55";
-				function = "qup15";
-			};
-
-			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
-				pins = "gpio55";
-				function = "gpio";
-			};
-
-			qup_spi14_data_clk: qup-spi14-data-clk-state {
-				pins = "gpio56", "gpio57", "gpio58";
-				function = "qup16";
-			};
-
-			qup_spi14_cs: qup-spi14-cs-state {
-				pins = "gpio59";
-				function = "qup16";
-			};
-
-			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
-				pins = "gpio59";
-				function = "gpio";
-			};
-
-			qup_spi15_data_clk: qup-spi15-data-clk-state {
-				pins = "gpio60", "gpio61", "gpio62";
-				function = "qup17";
-			};
-
-			qup_spi15_cs: qup-spi15-cs-state {
-				pins = "gpio63";
-				function = "qup17";
-			};
-
-			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
-				pins = "gpio63";
-				function = "gpio";
-			};
-
-			qup_uart0_cts: qup-uart0-cts-state {
-				pins = "gpio0";
-				function = "qup00";
-			};
-
-			qup_uart0_rts: qup-uart0-rts-state {
-				pins = "gpio1";
-				function = "qup00";
-			};
-
-			qup_uart0_tx: qup-uart0-tx-state {
-				pins = "gpio2";
-				function = "qup00";
-			};
-
-			qup_uart0_rx: qup-uart0-rx-state {
-				pins = "gpio3";
-				function = "qup00";
-			};
-
-			qup_uart1_cts: qup-uart1-cts-state {
-				pins = "gpio4";
-				function = "qup01";
-			};
-
-			qup_uart1_rts: qup-uart1-rts-state {
-				pins = "gpio5";
-				function = "qup01";
-			};
-
-			qup_uart1_tx: qup-uart1-tx-state {
-				pins = "gpio6";
-				function = "qup01";
-			};
-
-			qup_uart1_rx: qup-uart1-rx-state {
-				pins = "gpio7";
-				function = "qup01";
-			};
-
-			qup_uart2_cts: qup-uart2-cts-state {
-				pins = "gpio8";
-				function = "qup02";
-			};
-
-			qup_uart2_rts: qup-uart2-rts-state {
-				pins = "gpio9";
-				function = "qup02";
-			};
-
-			qup_uart2_tx: qup-uart2-tx-state {
-				pins = "gpio10";
-				function = "qup02";
-			};
-
-			qup_uart2_rx: qup-uart2-rx-state {
-				pins = "gpio11";
-				function = "qup02";
-			};
-
-			qup_uart3_cts: qup-uart3-cts-state {
-				pins = "gpio12";
-				function = "qup03";
-			};
-
-			qup_uart3_rts: qup-uart3-rts-state {
-				pins = "gpio13";
-				function = "qup03";
-			};
-
-			qup_uart3_tx: qup-uart3-tx-state {
-				pins = "gpio14";
-				function = "qup03";
-			};
-
-			qup_uart3_rx: qup-uart3-rx-state {
-				pins = "gpio15";
-				function = "qup03";
-			};
-
-			qup_uart4_cts: qup-uart4-cts-state {
-				pins = "gpio16";
-				function = "qup04";
-			};
-
-			qup_uart4_rts: qup-uart4-rts-state {
-				pins = "gpio17";
-				function = "qup04";
-			};
-
-			qup_uart4_tx: qup-uart4-tx-state {
-				pins = "gpio18";
-				function = "qup04";
-			};
-
-			qup_uart4_rx: qup-uart4-rx-state {
-				pins = "gpio19";
-				function = "qup04";
-			};
-
-			qup_uart5_tx: qup-uart5-tx-state {
-				pins = "gpio22";
-				function = "qup05";
-			};
-
-			qup_uart5_rx: qup-uart5-rx-state {
-				pins = "gpio23";
-				function = "qup05";
-			};
-
-			qup_uart6_cts: qup-uart6-cts-state {
-				pins = "gpio24";
-				function = "qup06";
-			};
-
-			qup_uart6_rts: qup-uart6-rts-state {
-				pins = "gpio25";
-				function = "qup06";
-			};
-
-			qup_uart6_tx: qup-uart6-tx-state {
-				pins = "gpio26";
-				function = "qup06";
-			};
-
-			qup_uart6_rx: qup-uart6-rx-state {
-				pins = "gpio27";
-				function = "qup06";
-			};
-
-			qup_uart7_cts: qup-uart7-cts-state {
-				pins = "gpio28";
-				function = "qup07";
-			};
-
-			qup_uart7_rts: qup-uart7-rts-state {
-				pins = "gpio29";
-				function = "qup07";
-			};
-
-			qup_uart7_tx: qup-uart7-tx-state {
-				pins = "gpio30";
-				function = "qup07";
-			};
-
-			qup_uart7_rx: qup-uart7-rx-state {
-				pins = "gpio31";
-				function = "qup07";
-			};
-
-			qup_uart8_cts: qup-uart8-cts-state {
-				pins = "gpio32";
-				function = "qup10";
-			};
-
-			qup_uart8_rts: qup-uart8-rts-state {
-				pins = "gpio33";
-				function = "qup10";
-			};
-
-			qup_uart8_tx: qup-uart8-tx-state {
-				pins = "gpio34";
-				function = "qup10";
-			};
-
-			qup_uart8_rx: qup-uart8-rx-state {
-				pins = "gpio35";
-				function = "qup10";
-			};
-
-			qup_uart9_cts: qup-uart9-cts-state {
-				pins = "gpio36";
-				function = "qup11";
-			};
-
-			qup_uart9_rts: qup-uart9-rts-state {
-				pins = "gpio37";
-				function = "qup11";
-			};
-
-			qup_uart9_tx: qup-uart9-tx-state {
-				pins = "gpio38";
-				function = "qup11";
-			};
-
-			qup_uart9_rx: qup-uart9-rx-state {
-				pins = "gpio39";
-				function = "qup11";
-			};
-
-			qup_uart10_cts: qup-uart10-cts-state {
-				pins = "gpio40";
-				function = "qup12";
-			};
-
-			qup_uart10_rts: qup-uart10-rts-state {
-				pins = "gpio41";
-				function = "qup12";
-			};
-
-			qup_uart10_tx: qup-uart10-tx-state {
-				pins = "gpio42";
-				function = "qup12";
-			};
-
-			qup_uart10_rx: qup-uart10-rx-state {
-				pins = "gpio43";
-				function = "qup12";
-			};
-
-			qup_uart11_cts: qup-uart11-cts-state {
-				pins = "gpio44";
-				function = "qup13";
-			};
-
-			qup_uart11_rts: qup-uart11-rts-state {
-				pins = "gpio45";
-				function = "qup13";
-			};
-
-			qup_uart11_tx: qup-uart11-tx-state {
-				pins = "gpio46";
-				function = "qup13";
-			};
-
-			qup_uart11_rx: qup-uart11-rx-state {
-				pins = "gpio47";
-				function = "qup13";
-			};
-
-			qup_uart12_cts: qup-uart12-cts-state {
-				pins = "gpio48";
-				function = "qup14";
-			};
-
-			qup_uart12_rts: qup-uart12-rts-state {
-				pins = "gpio49";
-				function = "qup14";
-			};
-
-			qup_uart12_tx: qup-uart12-tx-state {
-				pins = "gpio50";
-				function = "qup14";
-			};
-
-			qup_uart12_rx: qup-uart12-rx-state {
-				pins = "gpio51";
-				function = "qup14";
-			};
-
-			qup_uart13_cts: qup-uart13-cts-state {
-				pins = "gpio52";
-				function = "qup15";
-			};
-
-			qup_uart13_rts: qup-uart13-rts-state {
-				pins = "gpio53";
-				function = "qup15";
-			};
-
-			qup_uart13_tx: qup-uart13-tx-state {
-				pins = "gpio54";
-				function = "qup15";
-			};
-
-			qup_uart13_rx: qup-uart13-rx-state {
-				pins = "gpio55";
-				function = "qup15";
-			};
-
-			qup_uart14_cts: qup-uart14-cts-state {
-				pins = "gpio56";
-				function = "qup16";
-			};
-
-			qup_uart14_rts: qup-uart14-rts-state {
-				pins = "gpio57";
-				function = "qup16";
-			};
-
-			qup_uart14_tx: qup-uart14-tx-state {
-				pins = "gpio58";
-				function = "qup16";
-			};
-
-			qup_uart14_rx: qup-uart14-rx-state {
-				pins = "gpio59";
-				function = "qup16";
-			};
-
-			qup_uart15_cts: qup-uart15-cts-state {
-				pins = "gpio60";
-				function = "qup17";
-			};
-
-			qup_uart15_rts: qup-uart15-rts-state {
-				pins = "gpio61";
-				function = "qup17";
-			};
-
-			qup_uart15_tx: qup-uart15-tx-state {
-				pins = "gpio62";
-				function = "qup17";
-			};
-
-			qup_uart15_rx: qup-uart15-rx-state {
-				pins = "gpio63";
-				function = "qup17";
-			};
-
 			sdc1_clk: sdc1-clk-state {
 				pins = "sdc1_clk";
 			};

-- 
2.54.0


