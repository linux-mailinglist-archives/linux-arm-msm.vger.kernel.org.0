Return-Path: <linux-arm-msm+bounces-108861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDNMKk3tDWpb4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:20:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B038F5935D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20BE23053C99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B0372B24;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od3vVqIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43A367B8D;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=WsUDfzHuFtRkQLmC2D2YpfB3jspf1Y9cvpuPlJhtPnmkRLMGb+ChvLzB9YI7aBbXsLwhqfMQSdIz4zuolg1Lkmk8s0ujfWuhpaOTTej5QKe1QsxOHe1AH0YAOoOIXicb7bYB06xQIH63RQ/PNZwQfRQJhwn0rDXhph4SmlLf1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=T7ixgJATbtiNqWCiShqQhrQpfemSzKpwMeeRfU+mkZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/ZEtoUJEqgYOIGSrbVHmym73U/yZd6VPI+BBio5UyVLEPbIvNUB77CrC5W4kOFCb/qa+Lr+zFm6MBrzqFVUhAoVmmRMqQ7s7Y8T5lM8dRjXCBJ1Id8/bkPJJkhBr8+0LcqPNYMPQxbY0u9FVCLbUFxmk4uMLQgSoTzI2rT5SEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od3vVqIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22214C2BCF5;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=T7ixgJATbtiNqWCiShqQhrQpfemSzKpwMeeRfU+mkZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Od3vVqICKDYQkDCwvE3Fl20ylnBWY5UucRCCEWHD8CsvrLX9fxEbVpL8bRHykcTmv
	 PnlN1fqK7W+OomO9Cko8dthzBBHa/pfXnb2NUDWGtH0QnFJP7KbKDwMdgO8Vzy/GcF
	 COY0pYikMkAhkyqktaBFE3l3+hEk1io+SJnFDT70bbZuZ0yi7pzv/Px7Bv1VLB7n9d
	 uu1piYhyJ5jmh/4c972gn/2qFPA37Hkl+m8py4nwYRxaU0S1DECfb4+vApmtWCV+a7
	 XXXb9DMQM0cvJNYvQyI1MIQGi5OTv6FS8QACcHvD8tyKb81h0jjPSjhjeDCSrLxTtX
	 trTO/o0QSaJDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19616CD5BAB;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:09 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1796;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=laHptHDVcqodWotuInI4TOhBzYCitWFmkNnL90r2puk=;
 b=ELGTpbD9se5Jeclc7Z5xfOhf29cTYVC0764Fc3jfUQH3LSJDDj6Pe2ah4ok9/i2Q5vEoQT5ep
 9Q0nCe0e86TC7VwgFU+gILU9Hf54Np/JLzKhTJNbSgbtvG6GU4VowFY
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108861-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com,oldschoolsolutions.biz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: B038F5935D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
working on the Surface Pro 9 5G.

Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
sc8280xp-based "blackrock" model from Microsoft, found a reference
to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
fixed the issue on blackrock, as it does on arcata to enable
external screen when using the left-side top USB-C port.

[1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/

Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 49c0ecfc6c055ef2cd85db022d9340ecb88b7fc4..50fabf8961fd9869a31f24a69da854348fc1d891 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -287,7 +287,7 @@ map1 {
 	usb0-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&usb0_sbu_default>;
@@ -1101,7 +1101,7 @@ tx-pins {
 
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
-			pins = "gpio101";
+			pins = "gpio100";
 			function = "gpio";
 			bias-disable;
 			drive-strength = <16>;

-- 
2.47.3



