Return-Path: <linux-arm-msm+bounces-100580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNjyGy2wyGlRowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:53:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD143350BDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 741783030EB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541BC283FF5;
	Sun, 29 Mar 2026 04:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfrb8t84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE5257423
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759725; cv=none; b=dwaYeEixcDociJ18VPrfWcRuy6FUUhteJVYR7k7b8LzzHqseN2xCFXzhzDV/HndVKX4KWf8M8V+031eMedXVGVgOwk67AWqNDqXGmHaBVF29S0EUl5ugRFG+qpstuTWlQxpX1fo9UJh54+5mHseO2a9wmdTKt/E2uPGLCOd2Pu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759725; c=relaxed/simple;
	bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekpJhyICHyJUN7y6juCfWGbhAH6Vl0GK5YYC3mWObS5okRtqE4xQGSheyHcpQGFSIUJieUpY8pq+5Udk+Sg6bIHoDApVBcHgJBJub9XyaXHuOkzoXRLQDSEFhjoZ7bZd9PWzvhdi37TgOL0VIJPit3W5rproFLYzurPBOcGyapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfrb8t84; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2195516a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759723; x=1775364523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=Cfrb8t84GVzZSR4Lt1kRYfO0ko9FjSdKK4Ei9RTcJdVmaKiWeCBDW4t8XP0LXcyErp
         xuybftdsI//cUrnW5uv9tf7LEXQ8fnlyw6n8UQcCAMvKy+fbrm6wzfqxI+ScQwGb6c8/
         DsLzUfZSmxzf4eNmu4GIc06+/M4DSLODrw0HKvpCbyUjGd6D9/ISKI2nRK/YCUFZ1j1q
         BD+1yaRvJ8XQRwp1wxjyONkDrwn5WgCYNGVRSNVPrVJalSNEb/mEMGDTNMi4oBBuCc97
         4dmL50ZKHfa/TRZbBd6lglRvwYcbddAouehyNfSs7UORZo+8HoiMoOCNYjfmd0A4Kyp1
         9QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759723; x=1775364523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=ZuGh5pBlZLztVhrWtkl4PDLvyzS35DPK5Pwrrt6JOfcUa0ick28hboYC5iTRoibNzJ
         me7e9ETJyYKNQtaeJZ5glx4Yo6iOOCXZNo+i7dp3pdqiTVFe90By+CU78JhN9AcJUr84
         m7gGtw6GjurMzVw2Mmu29Ve16p5SCO+6z6qYOppL+dVvPLv315VwFFEg2unT38z5XiJg
         MFg1QyFagvoU5b/lsOusSXl2LZBFkh6MvZQIQMP8+B0xhpoVy4wc3gR9/J04dRjFyiQV
         TYMXHO/ohZxIuV3fdhEM8gbwDZ0MXG8sQz5dHn4GukcISNv/u+qA0oANiYKkHV78SOvp
         kXLQ==
X-Gm-Message-State: AOJu0YzQmf2hPjjk+KAq20cB0Tto4fAfKeL9rRrrBoFzF95dKUUVVZ9K
	2a5elOHo/EJYx48ng303q1Yy+gOC3hXs8+D4buC+mOoI9yznuMHM0oFb
X-Gm-Gg: ATEYQzwqgcO6wrc0KAV1LwPbYu4tQb1Nw2Knes7jCnQ0kJrRdkvqcaeL1dd8wTaGN5l
	+PiIQ7055Q0ZW2aHaueg4tQ4aYXQpom0xsLt7+GiEzMRsuistEu60sqCYzcYis3EbyufqOZE6G4
	2+Bn3UcCWQnT5GdKNUxKmuS8JcV60mMCDCarr/6vBo9Vr20VQV1jFIiT9GmRFUQWwYeL8zhJX7+
	hAYuv62kim+xq++w4J85p2hW/1g7G5Hkx1S6gZGGHQMr1kgu1SRtLSIBiVrMKgUt5Olb4b03sXS
	BTzeyRhBP0QSXnEQJy16S4RvlA4WGeqV1dz/GSFdQV8kCL9n5iw8PORCLiHkol9RQjtSYDJLkqj
	0HvOEvAB/hSbI2o0QoE39I4zD4R8Afn+p8xgrGqLXv/F3JUMEooOUoDHw7HEE3k8VuAxFnvchGy
	O5WPwwbdtNFF6fwCdMQrycguc0Lc8J
X-Received: by 2002:a05:6a20:3ca3:b0:366:2341:4980 with SMTP id adf61e73a8af0-39c877ea3b0mr8236099637.11.1774759723299;
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:00 +0000
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1331;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
 b=utg7Uwku12WE374EulRQlObbGDRvquq1XC3xzBT3xs7T9PgEdTCMDHi0vxob22zpSO8m2qXKN
 NaI+fh1EoyTCxSeMHUAqZTybPYpieZFIj0B1IMfExt++r4LaSQdtFnj
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100580-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD143350BDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a1..f66ff5f7693b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0


