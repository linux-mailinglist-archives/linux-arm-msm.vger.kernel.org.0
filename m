Return-Path: <linux-arm-msm+bounces-99927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NGDHEYlxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:11:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8132A521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B9BA30AF39A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554AF4218B8;
	Wed, 25 Mar 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTfOEKSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A34219F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462090; cv=none; b=i2L7qg4WDqjXhUzuC0Sxa5t4f05esugYOsbl2S+VSUQrRTuI9uqmW3ViLOIpaNIQ/5Y6NSvVwXT1y+Sn58HMAXQkG4OCuC0creM07OJt1yCoVev+B5TVk/rQ1Bb6k28ZHMiyfkv3Lf0QZHRrsyDymlHG8VY73KHJVvdrQ4Zm5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462090; c=relaxed/simple;
	bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCxMzOXztmaVrPgcnB0Lvv/EOhA95iJa91VwQNgkYsEJZVoR4K9Jh8KebYeQWD6yHWends1qEarodJAReCmma6sSicyjOjF9n4YzEJzXQDXk76sPS4fDp+BTaZVTq4gZyc8ttIXLE4ahXRdpduIA46bb+hehJR9uXKA7U3L39gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTfOEKSa; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35c1a131946so210510a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462086; x=1775066886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=HTfOEKSa0UsVi1IyeIBW21dH0CkWnNyCZvtnpCq64nqTrxx/gwBEeQEH1NgOh69nYk
         iyuWqy5g1EYobSJabk0ZjAN+B88R3BvMpts9jTANvOi6RyND1201G6Ooqwxsu3Mb6iXg
         QsQQ3ovu6hWYidyBXsBZQKE2QTFxy6lcbY1I9YGL4Bd3+LOzTST8WGs3Z4QY30Cnffby
         RxfJcOPNQBEGD2TzJqnktjdexcVNh5nJifoUTFDPn/8VseXvwtK8/EEJS7WfSVVpK02n
         oCNZ7Em+9lHgD+C3WEUWb3oKvc+zVb1M6tQ0ilN689mkpMtfcfalZz3OKwxcxtQDDlSc
         0xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462086; x=1775066886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=MqfIQhkODw/tv3TKBfMtfZXr1jsLRmnz9otgZptkzCrbuqux3UP2jJk8UDF4YbrpLS
         K7YzT5d4CCOcN3SGPBdSVanauRhY//sbsC5DKd6cC7fHtS3GhzmizKfYBRLtzZRWeUsd
         igCHA8+Wq1+DbyPgO38oyoCt0KCX5WHLDhleGQGNuGZfiBqoOnl8c7edukBgJRc7FhFv
         ctEAS3R0DZbej2FiUemaXGlI4daOPjCq/daL1e1/69ovbADEGeBcxHNE0bKunDhT6XxU
         Lzti60cCD7Zh+46HcQ/0O3aJy7OrwSJHxPX1ReWf//6LZF+DqgxAl/87zloAQkGZMYXa
         KCag==
X-Gm-Message-State: AOJu0YwORL+ZkLoX6w0vVzBkMEi95/JA+y8ozwRuEFoUHghrJ1JPG+/k
	AGgCs2N32Yklz9GJ83qkQunBw+KJwdFvqY7G9psN8k1cpaCGpFi4f7sR
X-Gm-Gg: ATEYQzx5Hje0qixIlNVZ/CaMe/3PIF+igoU5P+pT2ocANg3iwSRBuB/9/cORHY+iI/a
	+Jh6fHGEi2V3IhLtSMl2mrJwTCSOVtSxFRfWcerrV9hmLwuost7ewdJHFqIrWoiAAnwWMvS+HfW
	tO5DinNAKZtia5gbhBdbxAKZqy8aLYdnf44pMVYlhzmsP8u2GHeT5Y+lXHbri9jLZ2D3ysXvq24
	VOsgDBDHeYNZO9bWRKA1b4Hr9dZi6XM2/m1LycLtmSJDsVZsaVWwZ9B/jJu1lB+RfHFoSNGv8hG
	4DU4OMomFOKir8+Fn+WHYOcNZKI0vlKKf3288/6BItIkBJjEq0+Bl3QKluFFAzzhRZf8dH8l2Fe
	W4nEcICx1ZOAqRBwacBiudNOUNYjYHNBa24cz39uVTqR+w3V0lC4li8VSJ9UB9BCkwbXr96/ifh
	HpwWHLw+Anw4itBieNIwnrjheeNnzf
X-Received: by 2002:a17:903:acf:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b0b07c2bf0mr45862795ad.19.1774462086431;
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:28 +0000
Subject: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1197;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
 b=xZJmCgqXcGCWixUEcWyXsMJDHpUeq+hjuOchlhVJEYjDrfI+FLSAHAJs+YKk2IrxN+R0oUgyd
 2w1srb4BwFjDfpikffzIsB2PCvgsmYpunChKq7qQ30GMdg8Q+NdoGm2
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: DDF8132A521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IR transmitting LED is connected to SPI8 controller.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693..7d848117317 100644
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


