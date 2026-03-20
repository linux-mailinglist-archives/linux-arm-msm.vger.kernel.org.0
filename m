Return-Path: <linux-arm-msm+bounces-98934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDX6J8xcvWl09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:42:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A832DBF1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8ED653019E2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF8F3C279A;
	Fri, 20 Mar 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhL3jiRA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FABE3C276F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017711; cv=none; b=CGnU3nzJoC3uPQzTQMYQ8rb/+I1tUwEB8PsP5SXy5/H/mQX/TXzBasztyoy+EBoegM/Bxwn3nduexEr3IFNotdPWNcKS0qZuwBIJKQ7XhyVf4cOew6eQ0BHBZstL9ZYiqvvme2413xLyIkLmJsHU16770PizTwPFHDyGLAr8m5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017711; c=relaxed/simple;
	bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKhnb/Z4gfuT9Ar8FnvulecjYi+jm6YFVZfCgvfITyRRrT6XruZZARkRyyn7gz0vb+XuSuRVYjGlF7jYgWvWeSoJENbhhjWgKqI/QsK6oqb5qbof0oA9cwQwC3xpgmGI+3XCm8yu1NDiFuzLkAI/t9CsJb80OSf5aHGsaAlXvys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhL3jiRA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so14987765e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017709; x=1774622509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=QhL3jiRAL8DIqFHA3lextf4XDTv0HbXfUgx2PIkLLlmumCHSoxB3gU4eUD39w4JZfn
         BsTUvlMETRzmw886VNmTUO/8SnkfYTQD8oXIfVmqdRoYLEnLq5bLDB7ko9P28cRE+yLa
         k8yaAYiTr4tMdhe9KCZ++ZIZqq+hdoh0BY6E0jbn+8KUGCwVuCfJBoN3BwDoSUazsWRJ
         36EWRzzuhUMbYBIlSf3r/Bld9uOtbtOX7cSGSVhYs0yAHHOLJuKzruMyP86s+enk4y6x
         AvBIzZeZxYu+zhk4L6b5ZTNm3priklsBbGUmTOSlhzccVNd+ZabCKiQt+R/xjXFt0iEt
         FxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017709; x=1774622509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9Ej4pASsqYp2gOGlmVa1Dopz4W2+LI/x1nMQtFrz0U=;
        b=AmDdSAyleKNM0tHFUO4O+5Clnk2xERVQiZTSOtJe6Cv2rnGZWr5nq59OBxcsnyYZDA
         7b+hlENFdrFpvoskV42sANoKjprIB9D/G8dC96Bb98RbXmLS9pBb6s/11cccSCLNh6Be
         AN7/+jpFPGe/o7FPY5JS8YOjCGeLMiJhb45+XiiKY/9lrtqmxMM7SglVxgmJKApIq63W
         PotneViAvEVAuROVdNG900MvISo0Rm5OcuYgVdu0KXIZtolwD2SxMVWD22YHnbVSEQ2Q
         QqYJ0NbDhzlkDdSEPYSSIxyEyxpSNc2PefnAxN9lJSBhCRBPwK+8+tpeQGxKtbz85LbX
         xWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4WhEbvoQwyLubwokrMsK51DvLd4WNK6MtC5v1MPLKiuBNRXtIgP3MxeyOSGYVY1G5s11a82nYr8PNcvbg@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCQjqZ4RpVmw/L7eRd1o2Z5LJGT30kqfeAOfJeYWIIjNesQED
	TOgpfx3FE+aBQCh9yT+nSQc8LQcc/kytp7fprJckvAxyR9Cz7oZyCzQB
X-Gm-Gg: ATEYQzyNR2pPMQy1Pzfy/JmwWXHcQnkSf91zkdkp6dd3AnjRn1ADnDYZTmw6kISllqd
	8lCynG99kjyDPoFt5PLErlNCmwVQJfh1GE44ZKS0UDe8Nqu16kUJY1eHQd9V+SKFAPN4faoyAAK
	pLk2WP+A+GFI0XctWLlkauPURfUX3zhWhW58Izb+aATN1Fj/eEcbVTgYfoBq6kdRTNeT+v0IVa4
	p3CA4jLqNDxDvkOGkinjnKSpksV8TowGfcDOQphKAUcN6jbmgSHVre2cTLKxWwByZ5uQRy+9Ypq
	KB6hXVfS4H5xTZpAUgzpV2E2OiSsqZ2BPp5GNEO4QssFAM2/Yy/vIUHaxnWr+uN02w/9VS4KiwL
	lUcJbzrDodUqhDKynkpolyYePF+6whShZfsnLeKlAPyDN8NXBtqOPJ+Pe/wtVV5PmeDbqzPJgR3
	6BrvjCKTCxaeVqAqof0/vNPcuCMhNRad30x5Tqd/0cFKpeZwRpq4T79RckZEpCBLQ=
X-Received: by 2002:a05:600c:4705:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-486fee0983dmr51086015e9.17.1774017708638;
        Fri, 20 Mar 2026 07:41:48 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm130648835e9.5.2026.03.20.07.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:41:48 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Fri, 20 Mar 2026 16:41:38 +0200
Subject: [PATCH v7 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-panel-patches-v7-1-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774017703; l=1398;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=Ns/WNy0Z7rKIF5KEEaOQ5y4gyFT2BopG513lDTCUOlE=;
 b=XpIs2OcjqEG0kwK3wW8POn+gnlHDANJIQ4sIneTR12hoxNhYKjaoyFsaAgphcR8f2uJpzGufb
 V8hHXGwDPfbDp9PdBfgmYN/lwavA5WLin9fiVAgLgfQuAN98DvbFCSx
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98934-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,protonmail.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B5A832DBF1F
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


