Return-Path: <linux-arm-msm+bounces-108863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN1CIPzwDWp+4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 155875940D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6AE934F9B14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165053CB2CC;
	Wed, 20 May 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsiHupVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213636EAB8;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=aU963gQN5y7QdbcTs678oo7DnxuK1NEuRFGCQaIaj4IvgCPJr/bYDtMuLCdEJWsdWQX8BmCBKI+S3W8f8ncpRaxQxq77d2osAbKyqFiyKsik5ASgu9BVkM2DrjWMyc2H8p9g7IvJgVDcLhccHTuH3UR26pGuBtawy2f//5d/XZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=G7HxiM6tVHMRA1+SUDkrf/cDunwAcZHJbVy1FJcDaBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CenH9srNocywnGBfZSIV0VYoKHOZMZLHU+BA8FW59EbpGntbU4qfKUOVidqpFvjm8SqdkDGsuVeOnBFW36ABxto9Rz2w5ck8sQQQd538aqB+/jYZQk2/gRXlk/VuwNyw28i8t59gjPBxXkO3eQpmbBtW0d/U0oT0LMIwj9nFtyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsiHupVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CF49C2BCB4;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=G7HxiM6tVHMRA1+SUDkrf/cDunwAcZHJbVy1FJcDaBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SsiHupVjJo9Ps48QsvW/PQvk/eAYIKe589CRtEep7PkhnsBEHJfsadgOzZ6z27abX
	 lqn1HZZoew+jYCBV53QWZdGx5/o4s4DXpe2Jsmvix6zUcqprFvYhjm4X97KidIY3Co
	 1q4G+n2GIrPd1TDeaDeWycVuYjL1quTHsc70HGrrE7Ce5sCuO+HgsX5W2HL7AlA9H4
	 D4+OLrBnGyPUCys25snvgivi+JFgosTjYRneOI3vTfNpHMkvYT7WX8pazGetLDmVmj
	 jG3f0nSIVAnZJ/V6GBkWCPt4KB8uk/y756nr4pg7vRB2LQyVgz90hXnRfyN9pcmTcc
	 h7PD4SxFpDkTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AEECD4F3C;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:12 +0200
Subject: [PATCH 08/11] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-8-9df52552bf87@gmail.com>
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
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=1758;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=GHQeiThCwLf6jCuaGumAVOSJSuFkPcBJgAyN9IpZc40=;
 b=TFq+TLgkt9rh2mmnQxevAtdFZW/mL6bEj3bCiaQuvnsozIHkbcz0PNr48IunEMKbZPEb4babO
 Rh0qYueURAZD0ClBY6MYkYiNZDPJfD5h1ABfmEBMd1FYvX2voBDBNqM
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.90 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108863-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 155875940D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Enable the lid switch for the Microsoft Surface Pro 9 5G using
GPIO pin 180.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index a300069b5960dbba28601c418951869c94b63938..4daff3a0ecf48ad2081a2fe98910adf0debef88f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -60,7 +61,7 @@ backlight: backlight {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&vol_down_n>, <&vol_up_n>;
+		pinctrl-0 = <&hall_int_n_default>, <&vol_down_n>, <&vol_up_n>;
 		pinctrl-names = "default";
 
 		key-vol-down {
@@ -80,6 +81,15 @@ key-vol-up {
 			linux,can-disable;
 			wakeup-source;
 		};
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
 	};
 
 	pmic-glink {
@@ -1032,6 +1042,13 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio180";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio135";
 		function = "gpio";

-- 
2.47.3



