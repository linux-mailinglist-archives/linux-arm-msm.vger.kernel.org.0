Return-Path: <linux-arm-msm+bounces-111578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oGOjExiXJWqWJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:06:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4787650ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 18:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eSpQyy3I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D920E301D4C3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 16:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5A32D8370;
	Sun,  7 Jun 2026 16:06:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5629284682
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 16:06:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848377; cv=none; b=OCsn/C4DaOuCw9QohhhDveZe9hdNyVSDx2kXE9h1TxC5aInZkfshYei9ub7TqqoaypUoZWyWqxexVLwfJ4JplRyiPjW/oFqDFw9QxR14bSufVwagEAyzYLUdWJhpCMya4tE2jZiHI8Z0kafsGk5DcumMissdR/H+HVYkX1picLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848377; c=relaxed/simple;
	bh=1mj1GKKLxRXyhNjrEyGQbAylo9aW7O+mzSISPYCCv8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svtO3Rf2WUP4P5tyeljgkcQMD76GyA7T78b/04jBPPO/pufDpV9O2END0pkb5LzaWFNWlX7HoLSNu0ig34ON8q7qm7sESkT8HzNZbRUWin0R5bT1k80JKpB1PuHYiHcGJnQN1gsAFqiSPgB8B9sL24d2rgoqIrf1O6jzbT3Ifrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSpQyy3I; arc=none smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c857fba35cfso1610259a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848376; x=1781453176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZixtqWHrB57YQGe3UnYSG0Ka4Wp9atQ9CHPm9ciBvFE=;
        b=eSpQyy3IEMF32gGhwH+h4ijiDRfLSa4odsWaKzK8zlP12oLVoQHV4HJwr21gdeKXkA
         WUylJjpHnyHgYshQc2O4cyFEWpfr3jaHCrgHEv71/E5eBwRKLfBpNiJXyNqSI302E8FN
         nFO33yMEoKlcctGskmsCL0WxjCZTLq7r8ob0duBJdMiuQDzt0iLrxAb96lA41k2kl4Oz
         iNrizNVPfFJ4BiV3PSDOKsNgwyUxwjjUVxByjdzBjUIZhpm22l5gIlvE+jemE259/ufJ
         /hMI7xpf2FYqP+CAc7TFj5Ta66sEx7t7FZxd8l5gGMV8VP395ehREpaCw1U29rDbgyax
         PKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848376; x=1781453176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZixtqWHrB57YQGe3UnYSG0Ka4Wp9atQ9CHPm9ciBvFE=;
        b=q3hXXEmSgdocTsHNcVVbGhYfGbYPIvSTFtvah98czIwKzP2nuuzr8m3S/y4XNeMRzT
         BlnkreGraWMI5gTC9EkG6Hhe3FmmuyMt9ozOp/6FixT/2USs42e6VjKZMNnVqfG6tGQO
         87wk8MP8nw2vvqduCHtnhNOM+tEKH/6amS+swvhlM+GKmoBlEjpOnnctGr/PM1Sn+7Nl
         +RjZtXkN82od9v29O5w4B7vE2aCjG6M9Q8FgW4I2Wz+V5TzMdi4Bv79pAuHlCC5ZoODf
         HmkZOQg7L3Iwi0ZfQt1dMcxuAFk1uWUYMJYOJJzWf7rBiLG48MFV5lrx+fBKwwSl9vtb
         qHaA==
X-Forwarded-Encrypted: i=1; AFNElJ+bvVLFrkYRZfGFg2y/VqtonpHJCyOTEcAkPBhRoQrAk5Wt8+NvK1xX6SSOqUv8MvuS/D09A+jhEL7D26s8@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnZ3VMmLBYiPNgsXYnS2fBu086gKDg297Ezl41MVD790JsS/2
	foFvRvKYtAftewUzPs6Lt+ZR2HG3/oelRKH6SvOMsbuwGeuCZzw7z9dPVZzNN74vPh4=
X-Gm-Gg: Acq92OHizZJQJxqlMfpXI0/S1hXl5T0EtS7+sicbi70PkYTiAQARFHt9+Pzm+HYwGzf
	Xh04akHFvU6lzxdgab8q5Uy4zPFmVwtGSsmtLFxHwM6fYRb6SldMe+PUsPE10iLWsLHluwEivLN
	Jzl1XETrV1i0uV4Ilq7qLA+Jo8100jpohIlLWPi/b2DHlOyFfpbzgqn4IxCb2XipgDf/4gwrGQM
	ykiSal2JUjchCjyQWJfItyUM6IPrR9Y0vSptyhO8JlP115XNDO0eqoPDMiv/ENGT/BOaQR9PyH5
	VLngrR8HpeMf1CvK/rJeLoxPtNgdVmsCOYf1TQJV+A2/RpHNf/bHCKORr58S8KkXgdbFvB1IGLc
	8WUXZvUaMUFlnlpQNtd9+tjk0HQ/MmssFRpYNCw/gKsz5mQV9feR9ag/zNYc9nFjHxPlosn1WcF
	4Mej02jn85uIXI8C8ESZjuI8jJWDljC14=
X-Received: by 2002:a05:6a21:685:b0:3b4:8663:7e18 with SMTP id adf61e73a8af0-3b4ccf92383mr14930466637.28.1780848376115;
        Sun, 07 Jun 2026 09:06:16 -0700 (PDT)
Received: from nuvole ([2408:8448:9020:52d:18d5:d85a:8989:26c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm14857134a12.1.2026.06.07.09.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:06:15 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl
Date: Mon,  8 Jun 2026 00:04:34 +0800
Message-ID: <20260607160435.36546-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607160435.36546-1-mitltlatltl@gmail.com>
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111578-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4787650ED6

Now that the predefined MCLK pinctrl configuration is available in the
sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
duplicate MCLK pin definition from the camera pinctrl node.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index abd9c5a67b9f..5d652be69e44 100644
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
-			drive-strength = <16>;
-			bias-disable;
-		};
-
 		sc-rgb-xshut-n-pins {
 			pins = "gpio15";
 			function = "gpio";
-- 
2.54.0


