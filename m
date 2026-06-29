Return-Path: <linux-arm-msm+bounces-114864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ji6DrwaQmo30QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCA6D6D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:11:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i6ip19xQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E29193048F39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3843ACA58;
	Mon, 29 Jun 2026 07:01:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA03BD22B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:01:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716468; cv=none; b=a0VAVzUP8iKKtDhRGWglZeKqRcJC8D/ft9MLOupBz4DXaAS4TUfVZYEjCtTerXtCSpqxHsJogwALhE7I7vULZtZFJJpD60l0AKlZl5bqzX9yvI/JXWQTwQktLOn2dZvfni+cwKC/J3BIIiHcGWjvFGCmybILHYf2FPRLkE6KllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716468; c=relaxed/simple;
	bh=/4a7lvlZt6VPb2Hto/1MQA+dWCNb14/jhVcije0Qp54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ms0AyP2oGk9TjgKwFpjpisUudzzL5QqaZjpkmfjf12J838tXmR5BRf16Mv8zVZKLaMbfsrqqGUrxcjfTMlzgAmACSiOyeK4Wnta8/5zf+gZRcwAQ53wo8qYU0viTJP5619PCWybErWsS/aHpgozLtvAusqhUSGL6sWOVDwgBwJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6ip19xQ; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845b965c1c4so1410895b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716467; x=1783321267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaAJjrMCD5isGLxECbZuAKv0TSxEiNKfMsdBQ7QDIlE=;
        b=i6ip19xQjr/CV4oWQzI78JQIjv41rbMsJsURC1V/v6n5fua1MuqM2IL8S7JQMoPi4V
         lQpoz7KKH232YqdPHuK7g3WaEWekE/J4/kzSkaoQ1yRZLnxa3+eH5Wye6CPSnJRormLI
         jelyGw2Si0cPniNaVxTn2B6HJxk8YBOVIyr765iDIUaN8GqXp8NKdRIWBRK8vTXFreHX
         W3tf6/nbQ2KcfjVSqST+/HR36I06CsA7TdTWQ96szqK/BRJVuf98jwVobBfNMZLjqVlP
         P9Zto2fyGZWtcwxT6KXF2sQEVb8CqOw94PuNGmYkDieI4H7hkACJd7UN06Vyt4iTX+SI
         KGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716467; x=1783321267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaAJjrMCD5isGLxECbZuAKv0TSxEiNKfMsdBQ7QDIlE=;
        b=kRvEJMu0X3d1co1qHmlgi+fEpb4jJi3znXjQAxnlVL/eu7uVfVqFVmwClbTF4qDdHn
         F3XdROqYTGtvLuK6dkvnxHKrxUh+hvWGtQwZh5ppy3ytHpYaHotPa/WHESkiVJ8263ir
         OPqHLYxdlty0afGX3QUSvrbk7zXmk4O1M3eyJlGZXnG33fZZL6EghmLhjpCozncXsCwC
         lcqDNqaPPZ8Q/FEYApwcKHvNj1TyNGFKh0Llad8rk8WJUKUjJKhRYIkzUbnQSp+E1fit
         lXBwlCJLnDXbIku8KuA3rKHVLYT6e6nFmyV4P1K0HcegRu5KXm/C55lVw/IoZwi98I9W
         TxMQ==
X-Gm-Message-State: AOJu0YxbiySdbVgtChVE/wIRI3mtVxy7yBfWvXAOb0rRysstGRN58OpZ
	TOPrnKqEF5XnbywnedjCevXrCdLEISE3kCKfHWuY15LD8GFNn6j8v86R
X-Gm-Gg: AfdE7cl5dyldSyk7sOsd8sHcXZRWabeSjQ18XXxgPcZKDUjzoVyOvw7sqzyt7bun/O0
	RjW7PRNKpJi0rEkTmTY8krpNUKta+SOkacoeRdHmLJMMGBRJUfEs9CPjMFrOTHuKsj1435JoYCq
	TinA6eu1NhfWi8YaXEhELyrgo7YquWz6UiXSK69fcie9crYNyNt/bQgYrKjp7WOUbmEYh0TAy0b
	PShHOUpArQ9i3BoD2/Tiy9UPx5MARdLtLLDWVcSqtp0wl8RrLTLAU5Z9oBaAkgXfo9yPT8oUqXM
	jD/yjDeoCdgGphlgz5uNpW0pain4bogDdvkELBN0vtzfcsRznCEIkBzHOMHo1CzFkh5V7rAmMxu
	Bm8dINuz0QazCETjQUuP0Fmkv+eShb4vdc1Z5mQc1n+aF3xuiiTDa9bsjemtX/tWNlFjijgfFYt
	IAFLbDCIerQ5o=
X-Received: by 2002:a05:6a00:c87:b0:845:a302:2281 with SMTP id d2e1a72fcca58-845d25fb441mr7743151b3a.35.1782716466712;
        Mon, 29 Jun 2026 00:01:06 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:01:06 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl
Date: Mon, 29 Jun 2026 14:59:05 +0800
Message-ID: <20260629065905.15651-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629065905.15651-1-mitltlatltl@gmail.com>
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114864-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2DCA6D6D1D

Now that the predefined MCLK pinctrl configuration is available in the
sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
duplicate MCLK pin definition from the camera pinctrl node.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 3ddd44e16e67..5d652be69e44 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -674,8 +674,9 @@ camera@10 {
 		reg = <0x10>;
 
 		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&cam_rgb_default>, <&cam_mclk3_default>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&cam_rgb_default>;
 
 		leds = <&privacy_led>;
 		led-names = "privacy";
@@ -1552,13 +1553,6 @@ cam_indicator_en: cam-indicator-en-state {
 	};
 
 	cam_rgb_default: cam-rgb-default-state {
-		mclk-pins {
-			pins = "gpio17";
-			function = "cam_mclk";
-			drive-strength = <6>;
-			bias-disable;
-		};
-
 		sc-rgb-xshut-n-pins {
 			pins = "gpio15";
 			function = "gpio";
-- 
2.54.0


