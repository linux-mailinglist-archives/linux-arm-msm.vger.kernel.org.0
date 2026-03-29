Return-Path: <linux-arm-msm+bounces-100582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EADlD5ivyGlRowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:50:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6A350B7B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 06:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72CA33036EB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 04:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3099B285CB9;
	Sun, 29 Mar 2026 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pETnFdge"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A888A2836A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759739; cv=none; b=mErT2WH/nhVTXwQZtQPnbbunfYPMpRvVnovULsG/WveOOg/fc49Oqn/tmRAY2kQZF2RsBaLnFBLc2D4PPJb8ZqrNYBq7YD00y+8KXRHEGXI99Qg4zzswBp82UzekEqiJCU9C7gRXN8XB6QbyUCgAdCzg6RnA6q6ugZJZ5gOiEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759739; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itoU3rxTz1WBje4H7wzeZ/eLfwvfiBY/8LW96iQ8SGzHx1fv7b3cE6emvGN8v+EKQalixKJR9+1BwVePwZp6fYeBxuYoFI19GycRXlZsNR+NJ0QqyN2sBQNmmUPb75h5i9H/p9d4RxwvbVtqJvvUJbWopym3vW6ARB227sQvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pETnFdge; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82a7539851fso1545153b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759737; x=1775364537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=pETnFdgeZDjhWJx7qdfn+Q3+x4F2R0sIk8fjtKm5gRbkSs9Z24WqpPBn9ub0yFhl0I
         DC6bIs8bmZWtmKmaB1F+lyqfJUApA5rZ4h5YiaWKtLcVeDdFm+bPxbM1W4nrAJo2+5EU
         w+ahwNwgmNWJ27WfRY+/o5xwrezmb69/virhHfjMG3mtbjGoSh3rJtqBxWTzsCKvbsng
         BLiHbk7V/odSxcUpiIyomaegBVI0X0pJSfoMOzPLTTczme0wagdbWCgznrIU4HEa+Lkq
         DPKWlzxNb5mF6f9Bx72TjgvWuU6lZ99CVqzYFgwqYipVqe+JlHp0Q3gEhgCCAFXhNmUK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759737; x=1775364537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=nNsynmKJh2YFyAxb4b8VoBOxNiG9kAmW7ki2gMxpDH1Ow/VWbRGyyOAdR7AyaMF2j1
         SxYQ+ga7o0+pimaPYAIb/ZgWF226xtMQNggfTDrAX2yJTeSqVihYapMnZArQcaTS3CZq
         TZQyyytND6f0Qf5SSQH4A3CRA57Zmaqnx1QTtefqoKJGmznyU8BaUn3hkWufOtw4/ERf
         FRZNRQikhS/cjaBPc7nr6H3x+k+Lm1iVc7Nz7Ift5Ue+20JQuINtuWjO28tOGaZpJK/8
         BEbBhf9PPwOwsmODdsLXOvFT8E2IRifjf3QL2Qx5OoMGJywOeQINKLRzbSKX4F760/xt
         O6Ag==
X-Gm-Message-State: AOJu0YxkgMEXk0GUaq2TwADEkguRW2KDrMP+m4kvnDrl8cyndtstSONs
	QDUzGbi8zRF8ILVxjm0/jFehIsTZxyBjk4261wBHWZyHYWY9M0aoueXv
X-Gm-Gg: ATEYQzwjjFz+HRAg+MDceW4wNrq5H4/4wLs2Sj1vkp04CqHVT5vGCE//cCHtKeZSIDc
	Z42rB8I/Eeu5pQiQEabWB72fspfZvhhtiy8ub2z+bRxtnEBpIuURKIcwf1GXOqOURfVlVuUd6Kg
	r2fkDB7QIKybCHsQaMLE5ulixyvMNO38aJdSmZKAoHsNCq9yR5xKLMbwbX+RWM7kLC51UOyQeAK
	l66uTS9QrH7TzmIz+0QDEBjLvLuV9c3QzUxgxlWiR9CPeMMlaLfg4Nu39ASwOyZyPQHASmPsU97
	bg2XgiIdZ5E9kYWVQTJTCpco4uZnMwAEnQTXI2d6Unuw3G8/+3NZwANH0Hu1Pa4Dq02x5QBT89f
	oqdqyxLrBcGWUid8T7FBWZFcwOFA9bzcr443UdCOumOUvaG2Y+Ia2VEdbjgogQZLHlY1NQG/ZQD
	ytIcpYZlTNVRlN1Ciavu2OOUODfXXi
X-Received: by 2002:a05:6a20:938e:b0:398:a128:d463 with SMTP id adf61e73a8af0-39c87a3c214mr8660465637.35.1774759736982;
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:02 +0000
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-7-870e0745e55e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=AjUWH+AdSOG/5ukRpNAwaXcythhtMm7E9TAuzpnElRgLKa+TAvWs+43AuNxf5Ryx8NJQ1jxE0
 4oBI9xuIcl0AadPRbyVh5WjXVeiB3FcSq+LKxcHqBqYrYdg9M7tkFIx
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100582-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AEB6A350B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IR transmitting LED is connected to SPI8 controller.

Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693b..7d8481173171 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0


