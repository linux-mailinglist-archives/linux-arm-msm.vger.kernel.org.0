Return-Path: <linux-arm-msm+bounces-98536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ96KWvXumkXcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:48:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C52BF970
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 642C23462DBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2353F8E04;
	Wed, 18 Mar 2026 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/uz44L3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF8238D54
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849927; cv=none; b=TKIstqpz8kr6b8Ptdz1Ys3Bj2ImZNW3g5FjGGwKv+q+ZPZ/4YIDzX6WcC2QvA71JTH14TKnorg819s7nFG0QK0r5tS4q1n+7uHwK8BXeyQCbBezG1BceJidqQ0bvLXnU6E6sP7rBTXTYb20WtKGTmz57hkKOJHziDByLJQAPboQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849927; c=relaxed/simple;
	bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvzo4Xw424z5BTo8ariDd4tV2BJ0/gSD8GpEuQjSN4co8RvWgKD5jXzybU5GjNhVqDRSXM5+M8QKQav6thtguwY9tbD3OQtewhHdlPEZVR0cF+zRJvQwqAw70dge5Wqi3zC+EdL5N3xqdf6O1yBYs8TYBgma3sxZNkN7b5gLHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/uz44L3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso3835e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773849917; x=1774454717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=F/uz44L3b2SWdC6l06V3z6CbgrUhCHM7WchU4WvIFVdTNQERARlmIs+2DowAwE5Mcy
         f3MKt+mWCS2dOoU/Qw6Ap2BZBmKwMaV953YoLkErWC9yf2gQhhsT0Vmwo7Om/gTEdc4x
         JotFRL+IPQezmvJHYyrUCbJjFsnYCDoNjaQW9RldO+WN61KIeyYKdsZw+yKGg0UCb0pS
         SRqgcq8cOdrznJrEUEvRPuu5oAHG43qYoVbB/eZdTYO6nfe0ReH4t4tzBInHZCRO4+Fy
         6oofGrc4n2p2mQRvKrUchaB2aTyWf/3AqLr/DEcBq3xMeyzB0dt6K0kE+3UiSzKB62Oh
         nLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849917; x=1774454717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=j4TtcinxM9dHHWdBhRBSpxg9OP+mQgcsehmzNKeE2OG0oFF4cyULrMqawSFke0mBuL
         pYmm5DzXrQQ363mC5Fsi20rhssE65flbChxNRUt88PiWmEXNJXNNoaavPWd5uGV4/ecP
         K4/fIfi+3LGBaZxkdf0ISiITX3IRtkqJdrvA4CPuG2NGvAZLZDDk8piEQpf2416xYdn2
         0idJl+0fsnN8u6sY0EZy4DpPCY2xZxQMyScTpfimXmdumGi6e1v0ZybClaehMjPh27gv
         aZvh168xUX5gglf6CzXG9YUtZgOilK1t+B/Sq1bE74TSr1xyXEckq0F0+NAqDX2QG4qO
         DL1g==
X-Forwarded-Encrypted: i=1; AJvYcCVFk9zsUXO5jk9dJq5r2K0yQHasqweJCvsGj9v4CDCUGFmwxjPNL9jQHc+AkU1xWQ6DFKlcM1fk2iUbaB0W@vger.kernel.org
X-Gm-Message-State: AOJu0YxdStn3ozW526jEqazElvWoy/Lm7pRshc24/wHL25feze/lnAgv
	CrSTDplpw8kveWOG4TyFloajpDlcZWCSHVtfUAbLkpSTVxpF3mKyNo6X
X-Gm-Gg: ATEYQzxJpw2KNS5O6qmp7mgaG+dVoFsoQ5mTGhTr1LfFFwyAI+qug7/spLX00onX9lM
	ZdR+z3HP+eT9Qn6DwuOsacQg02uTWVrfXF3buqX4FtE9+0OC2rjmHG2+KVnZRuaNx7TW+Ui5NoM
	VvWIYHivwC49ZVqrNUyqQTGZvsrJvuTHPEI/21OlsRpldUbj5E6r4rrQgFjoU7JFNCn66lXMJDZ
	ZjtnmVzrvesUl12ZNv5YDhThLC0sRNH07p1LnW/RnS0rP9jyF5fPsHE1Z4Pxg7lYNUhJEF+SNTu
	WCd8Wxb31fxPjwBKr9MC+/zsd3PwPj47CRM6XB1ycWrGWsmADWUBJyPVMUN287vJslcXOr+fKHK
	rtAtA9KPawUyxKXlJom2dHbT5w8qlN0BkJbxSaySB9Jo2I1YdzgY6njGxb5X4AQCPEc1fV92l3G
	HORmJSZHhbUc9wRYJbRlPlsZMBNSFTzFtI/z1DvmKh3VpdFcps5FZpkdH+Yvq2a62v+ZOt/VAdg
	A==
X-Received: by 2002:a05:600c:83ca:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-486f446dee9mr60800635e9.32.1773849917122;
        Wed, 18 Mar 2026 09:05:17 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8baec5csm2282225e9.15.2026.03.18.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:05:16 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Mar 2026 18:04:48 +0200
Subject: [PATCH v6 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-panel-patches-v6-1-7a30c2f85e0b@gmail.com>
References: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
In-Reply-To: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
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
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849909; l=1398;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
 b=TQHggHRPaa6/4FzPIkqTMIOpA7S4t9AmV+QlZloldI26s/thYR/QwHca9pFK7MT4G8Ux66P92
 CYVUoKwIZZBCrT54aPY9NRIZiPlIsy+1I6bs2i20fTkzDhL1puXAvRz
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
	TAGGED_FROM(0.00)[bounces-98536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,disroot.org:email,protonmail.com:email]
X-Rspamd-Queue-Id: 324C52BF970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Samsung S6E8FC0 DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


