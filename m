Return-Path: <linux-arm-msm+bounces-100331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNGoJ0GIxmlELgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:38:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7D345616
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D1C530BD03C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762DE3ED131;
	Fri, 27 Mar 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2caN0+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E938655F;
	Fri, 27 Mar 2026 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618219; cv=none; b=HJR6cRlsbmnMr4D39+18mQXzQ2kCZdtEuIuqv1nA8D7rYcT1RmdPAaHmeDXTuHNy2ixHZNl30uzPDvIv9DNj7Ie7vilotaKLEVJdsc2OSn/ViPa9rHrjOzZRyWm0Z5/3dXa/8qtGYMhUyLtbkil66MjI5C+wsjht6NmoB5LssVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618219; c=relaxed/simple;
	bh=5BGVxKnhc8w27oGyJiGN11xQUs8HA3TLrtWytOF51bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bal3RdOPrQzY21ERx2CPtNvEgi7OqnNPwOK+TyM1GHgg6ezl93cnCl4DdYOgwgJC/16wjXsRpKK2uXSQD31gzWjdDP4P2LpreFgIFTfh6NHKDRSFWRiZOIGYzAhWonSsGBy1KpbKnqw5NPyhZ8z9kIZx23/C1B9HOqBHCrQnbRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2caN0+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4528C19423;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774618219;
	bh=5BGVxKnhc8w27oGyJiGN11xQUs8HA3TLrtWytOF51bE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a2caN0+uO4hO72Lq8cvot0kOAUNeuU9iN2l0TomchpazLL3PnujD6zYD1xtZ3T1ge
	 hQj4swxQ4FbJfli3f0teDmdbGGxiEVZyVcYs1b/+QuCLgU1/cCtjFH8PLHIagv70S/
	 NQPAKyv9rIbIRChOt0IqE3LKJn0z1GBpt6nd51fPEGa2u23cqEWbBjQoz0tXJUTcU8
	 4xmDiEJ+r2UXA7ftuEpRaz0b58bCrCWehbWhfW1g0hdbbKi5exFCXmcveMV6wRUulz
	 BzwKJYWLgdBgrjIpIsMHmMjq6B8h+CKHNTIfQqyOQ6o364pBszfv0+3tKx9VldbElX
	 hlnI9kJ7Wy9VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D486010ED674;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Fri, 27 Mar 2026 15:30:52 +0100
Subject: [PATCH v4 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rimob-new-features-v4-6-06edff9c4509@protonmail.com>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
In-Reply-To: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774621871; l=1551;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=qjRJ0X+ghZb8YDf+gcP0JTOiaPJ3AI/2/QR/QNsMqZY=;
 b=nFg5wkNjlIPy6PXSIpFJr1FgiQfn3kXcgy+YIcsZLIkt0OKDd1DDtICYuTGE6ciE/SfMc8Y1h
 NFhe2Ewo7SpDfaz9T0KCVXeHsrng++BSOw/idV8GOX/m7Znp/l9Hcjn
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100331-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[5.93.78.104:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 15C7D345616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Enable the Hall effect sensor (flip cover) for Billion Capture+.
The GPIO is mapped to SW_LID events as in other qcom devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index a1280b0e7e90..8e3874740cf9 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -47,9 +47,18 @@ framebuffer@90001000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&gpio_key_default>;
+		pinctrl-0 = <&gpio_hall_sensor_default>, <&gpio_key_default>;
 		pinctrl-names = "default";
 
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
@@ -329,6 +338,13 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <135 4>;
 
+	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_key_default: gpio-key-default-state {
 		pins = "gpio85";
 		function = "gpio";

-- 
2.53.0



