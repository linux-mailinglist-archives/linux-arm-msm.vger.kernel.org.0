Return-Path: <linux-arm-msm+bounces-109684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM4jCyxhFGrsMwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:48:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B85CBE52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A7B530054ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD503F1AAB;
	Mon, 25 May 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Admtch7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A7388E76
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720488; cv=none; b=fCbEByEd2lVP1rvjvAFlQXCW98zhceGpmf0Omf7dS5RPP4Y0LerQ1RgMOTC3T2ZjSkKPZNfQTg3LDgCwjkwrydPMBw4w7iBnel/S8dQwFcojEbZ8SUId+w/gI449kho7fkkg95Ub0sLsIf5RS3KJHoI229nRzqrmi6l+PPBLOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720488; c=relaxed/simple;
	bh=ow2Pp8Yde2ialN0PVZ+ngSDDkSxMoIzeQ2w8Qc4ooeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKObA3mV4q1zExlCN0q8qy6Ir3tb9K0rF3KcaNiC5a1b5ZsjV+cLMb/VocQXkaZps5Y6FffFjoK/3L7XKXR8/d88jJxhkBsY3D9Z2cKOJUZCzVDSzEANXvda5uCukL6HTEojaQD+HIp6oRtmnGrvrfK6ceAmLJKYxDG7q5aNiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Admtch7U; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3695bf7d082so8705759a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720487; x=1780325287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=Admtch7UI0gu5S8ZMD2Q1X5linI28LEuf2Znabbk/HF89K7f/+QpiKWvfsRGy1riXr
         zolhcnbGN2MoA7M2jfcEhw3bh9/hvifTRHtsFOQt3rrz7/Jf5kY78O0p4TMTm+A+lqVe
         LldrbdJog8Se0y6HZMUYuLWOOndczHvpMDOXWGCiJ07GxhHZgq9dKrDq9iFLjSaDesu+
         YVfVTWovmuG9ghuT5InQ9mC55D3dXEP5kCoD4Vbh0M9MtOC+3z87bMoYTHh9sSCffmLv
         wSmSeYuqYYLoSiFbE9/rHj1Tcd/73zBcy8VOOaWCAkEpfg8oEcE4KhCaHqUEoHeKIIfj
         VsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720487; x=1780325287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=EXH0BCaBk/Ao38JPTSjJQ9BIdOpSfef1CV02RaZf7JCtdM1xOKR8Xl5oHVv4qmUkPC
         EodllGr0QKxS763nvQqWY4X7SUmIl6J+beUe9v2VgCUNIGaTjRRhDAc/kGi5t2uQJlF2
         k8mRO8Hu0oigBfZe1uPni/qRwonyFWhMcZaPeYpIE6O3ifTuG4qUUe/QWvr2neZz+nnE
         /yfFh0eGZi1P22Il1uEUzYbJ03VjdRQu/ag6v0O8LnKZxDlrrASDJUVJC9OX/WWh7YrT
         9ec3oGn3krzSPKWgyAR+hZSlfJGnbkBtpKoyYj4JYLbbYz+lTBSA3EYZAdlQfQuVEWNy
         +7hQ==
X-Forwarded-Encrypted: i=1; AFNElJ+z79jCLWBeZOSg4U4eahGWZnSPP6ZcqmS6EQQbJixKCKlw192j3jthfhvH32dn7ylWl24rIur9TsAAe6Sp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6AJb6Ia90u3ArfH0eLLUYKnkaCIStQr61dEvwIlb/hGPSKu5Y
	Mh0BtnwdKcXgPEXXRPhP05CHWdyirA+WxdTC42oCfYRl03EQVQSQUvfR
X-Gm-Gg: Acq92OE9IlgNsyfVd/Rc6aue3/anN0ikLXW8VLBulRPWtKhI4ZWQZBA1pZAZq9QeYLG
	0Kf6Ht+ak4/EvwEg4xQs3jreEi2uElorrfOdrCaP2PpUU3bmK3/oKm7s4CXElmHxD2VIvi5nz5B
	3TV3CjrdJa/zMCAQikPfhe4iFe9S+8cSe38vu9c44nOcEM/uoHPn5Y4RMij6a3bUGp9Pjju3CvB
	8ZhAcu6bkvBrhQtXjk131eY7VT04ilA8QNMTsVKZ00pyD536pUaXk7jsgyFhUfgVXPkBi12m1TD
	T8EXJyfERGeVslS5HwiGlK+zbtLlS0NEeyZ8LdM/1dzvIrPJrMbAXiUSfjfK2zLkUzF5BJOJgr4
	DEney0CJmmLO9rJQoteXJvV/IHiwiTrAKOsup+nt9P3Dkww//QpxjtZYhOUwOKVpUVdKYM8AzKm
	nHC5JzD9OS/tQcxS1NvNfyFt5MFvSA3dG1JWLE1xYwSDP9Jm06yJozX4l20De5
X-Received: by 2002:a17:90b:2e88:b0:369:a359:b18e with SMTP id 98e67ed59e1d1-36a67449708mr14002024a91.9.1779720486941;
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:48:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Mon, 25 May 2026 22:46:12 +0800
Message-ID: <20260525144629.498630-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,hisilicon.com,glider.be,foss.st.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-109684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tkos.co.il,sancloud.com,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.64:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lumissil.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B63B85CBE52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0


