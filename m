Return-Path: <linux-arm-msm+bounces-98262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFrSK3KjuWlILgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:54:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CB2B1408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBB9F311E5EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EAF3F660D;
	Tue, 17 Mar 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6SN5zeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032873F7A91
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773444; cv=none; b=YHliv74v0lo2R5Logx8p79Uv1pDG+1jcgnuWj62jxt7LR8i3sTY52HqSofPKsIOj8pbbf4roHh5OmdMRYJGjCbVrZyC3P+ZGGM1RwgJdm0Rd2lLZfjM3j+MLq9Ne3c6GaNR93u/qy894K7n4286UUpdQ2PQxzE3730cwH7zokjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773444; c=relaxed/simple;
	bh=Za75U3v3+V3X3Fwu3C6KSoWJsyv9mKaunMybFhFCtn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HF6WtFvcZJiu3CWDr905Iqr9AAFrjgLewkg+HR8GrlW719EbcVyK/Gcr3zBIufrSnI97MdOFwPglKrcCo3cGhM9DlwAgpJ3tQXPKsye2NyDIIBZMo0Fe4d+UjYyMATxhbK4jvPGF/AM5x5vT/cVPh+uN6oA48zYgvATassoxNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6SN5zeK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso69521505e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773440; x=1774378240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DKiHHhW4IpTIdEWa3aiwC66PJec1HZ20IV3gMhmB/E=;
        b=C6SN5zeKlP7C9EXqXCUlA+oSBmlo1EQiAhln+XXK+0jb0N5hiMQOTgH7TENF9D7D5O
         RrCEQfl150Dh4VH8zjde3Ds6SX/ae+/JCUVILCv9fSRoKHEFGfcuOaZZxWIDBlq78dOR
         GffugjLLWPJwlidrKy/A1fJTseQgi9R2xu8XjWJd2EmCgjLhLleWU+yA3f/bMZb4X2zI
         938dWsZ4RoRITpfLcaoCNN2+7wAC4z9pYPzxdxGMkayprzj9M3xI1ihjXakjZ2Up7hp1
         4uMX0fIRkjucTEkvgdzkE8dkTgFX9TCQlHofT4TMIIkv2KJsuWtC1iOS0YYmnzt/KBDU
         HFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773440; x=1774378240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DKiHHhW4IpTIdEWa3aiwC66PJec1HZ20IV3gMhmB/E=;
        b=fn1cmIWtqoeRUrbjnMfKJjs6RclbwxkyoXHR54fFWXUYXT0u4VQ+oR55js8qpcH8yA
         xGi0aXKO83xAnwXa7MKwTc0luQQknI2LetHIS+0dE5aXUCu/0+uJVWBj3r7ZkJCcWeU7
         jxtUlm+2RGPipZ9s58rv+PNR7C87wOuxniGiozFkBd33Vy2Se69lniqckWAvGld2a+2X
         K3SZ/yBLtsEh+7y17c894Y3rzKvfBGqs3DMgRxiMWGFgH1woOakd8Nm5+WEUKXiq0x5z
         oE8i+oYJ5pAvftIAkzff/DZSRz0qQAd+AG27P7WOQ2n/dRTzQcHyTmeMQmSVhu39P1l+
         zAGw==
X-Forwarded-Encrypted: i=1; AJvYcCXAZrxoXz64iqJHJReJMQBoM4+Xwze1BiqXqidBGLwsKaVJYi7WAROe5ky89kmJoZTsqyWX0+je9CUm7a4R@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsdltX3FGoBypCRW1z0vWOCQ0WoQ1wQ129o0akNZ2aEgLkCXz
	YpaF9NddJTCoqs1m4Qx/GhOtzUYNCd8v2cungSB/kWjPP+k/TeeNJF2L
X-Gm-Gg: ATEYQzxj2ZbD1unHBL4+nrPPEUvqJxSDTm399zUqOSY7PO+o68v8u7MSWAb63cK3g1F
	WKmOZrO5VlAYVawLLMn2Kc87Y6eLWBLZz1MYcr+n1wlSiy6bPURUraVG7y1g9Cp9kutfMbrb54H
	Vi58shiYVRhqeRE6Y0jrpTIWbkch5u5uJfIPUs8vBeZifWLwUrdCxnfqvSTcvD1z821EQyejMPZ
	cv3ipmS0XpJ4h9cLdnpc64TIyh5sHSIei5diAb2n0N2ggpfl3adE93xPqxmqzA2XvHIaC1XQKBm
	uc+QveQE+Nyx2E6Ui9UCTA/1fvBOEYWAXKt1CehzGmT17xR1MLjykuC4tnicpWa9Hodtf2jiyjd
	6RHyMsEDw47HR02KId0WT18twWjF2Fq0FnHeReq1i0oX08tSYyKEo/oCvZ7uYHn6ZPJX1Dnlm1J
	OKnT7e/VWgJ1lFXP80wnayGWzoZ7X0RkeIh12LmY1gTkHG4TN1ziNA1l9vetcor2g=
X-Received: by 2002:a05:600c:b8a:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-486f4570873mr11068705e9.31.1773773440252;
        Tue, 17 Mar 2026 11:50:40 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm152863595e9.3.2026.03.17.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:50:39 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Mar 2026 20:50:29 +0200
Subject: [PATCH v5 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-panel-patches-v5-1-ef99f7b280da@gmail.com>
References: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
In-Reply-To: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773773435; l=1325;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Za75U3v3+V3X3Fwu3C6KSoWJsyv9mKaunMybFhFCtn4=;
 b=TZx/v52umP+9usaTTk4zKeDPsS507pIZ4B3HkCgcUrOc9nx+Uw3xh9sW8h6tffUC5rA56+sYW
 QxD8Ma8NnomAdz3IJsJpFL8HbpgkBH3odn+O3ISBMWr+8p//HMB8JHV
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 1B9CB2B1408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Samsung S6E8FC0 DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
index eccfc66d7fe24fbe86e3c25f35beb0855c4fcee6..b271de575e15071bc8370466428bedbf41a93d11 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
@@ -8,13 +8,16 @@ title: Samsung AMS561RA01 panel with S6E8AA5X01 controller
 
 maintainers:
   - Kaustabh Chakraborty <kauschluss@disroot.org>
+  - Yedaya Katsman <yedaya.ka@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: samsung,s6e8aa5x01-ams561ra01
+    enum:
+      - samsung,s6e8aa5x01-ams561ra01
+      - samsung,s6e8fc0-m1906f9
 
   reg:
     maxItems: 1

-- 
2.53.0


