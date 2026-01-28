Return-Path: <linux-arm-msm+bounces-90968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PucIDbyeWns1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:25:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CBA04E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99B78305DEFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7030233FE0A;
	Wed, 28 Jan 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tExHgi1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A553451B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599359; cv=none; b=MNIdRvVpsg/G4H+H1PuBj/sMwULhHnRkQ8qNe8YMRu4/L5Bu7dyqPpATKVUoaNaFEd26A4gc5cSAf7ttFxpJk7/fZQbwONrtmkfr+B7tlrSNHin92TL0Uap7Hva+gZfOSSC3MqcSrE91lKGWEmsZSmgThjHPz6xUUQj3CL/tqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599359; c=relaxed/simple;
	bh=q977yKz7zQ/PFR5OpD0DFq5KMw+GCR2Fas1jk3OALOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K8hESi+Rmew9B4Ij/c5FT/Cj7OTFJOTU/ACmSPop/e4bj2bT3bC3fs4BCt9f84qmkR0FV9XD/aQN/3T8hmo3eEcsziViQeBEfLzgLC5DboF2ziAEUnX1Q6nwK3SWnDWCHX/4IxvfT/KxFHNh5+04C6SJbRCcCClLjNxJn2bbJvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tExHgi1j; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-37fd6e91990so72138651fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769599355; x=1770204155; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=202w4WqqYho9WJKneX2iwEgQBvnIKInbtC7YMNyp//c=;
        b=tExHgi1jzCM47oOLrs4mE+YuJ2LXMVSd6TFTE45ChnVqqdaVZpTjSiUPd1jMqTVP7B
         2t3tNkGDS0Y1c+B+sutu73+ZpM4IkTj27ygUNz9JDWg6p6jgNGq/LpJYaDqiAyfGDnlW
         wFJzhcImVJ8opPMHL2fiuBu2iSk4m90vwfw2N2u8orhfvrUSOtc/JBY/+xJgtU+xaR9x
         2dHogxZG8qooCyqGS8cF6U2Yl8iXlVEgo+mHDyY3o4HZOGeyQt7Z9YWWoOrZOvg5gqks
         mghP07Oe2Gk/y+qpThn/qbQwQ3USI9nA+gCmoG46O6pMRR7sPS6+uyCzp0Ffu5bw5YjD
         kYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599355; x=1770204155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=202w4WqqYho9WJKneX2iwEgQBvnIKInbtC7YMNyp//c=;
        b=gUXpB0OYSfUmRZUk3+zjej+WAnv0qY4PDtgNB7nEU19zfj/JQE89avtmA0D9fOOsJq
         PP1F1ZqDHeTsYiXsSJ7CQGwWZyZO9EUDb+wo01ZGVYnofDOswoDvG7aQrVxocFWoU4RM
         FKCdW3p1fzZqnpszbn/FWZuqzjzJYVRl9fz8qUW0SCR/92qL1xTFLdVJGh6eyqBlNEPz
         mrQF8gG2a0TAM+gVw2cgJVQh3WxR+/h0RtAFXZpRe8xVGTl03hCo2YXr3lTOITnySKAv
         83FSz6F6XHj0ErgGRaepHNrSA4UUCmzVlbuv7MxfV59fe85AXlFC9nCTlokxrqijtTdC
         ubkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXG4HHd3hJqtVBk2fsj90QuXD1AUi2EJJLvz94idyHxMKBYLaCGIb4kL8XE0k7xeH2HGRdA7k7Wv3pJMOv@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR/4oJvpCAn/zAhJ+dBWtcyoBHUDSAR9Bbgho4ztCTK3E1Ml3
	b1Rz9EaYTxEzPDk8B3P2QW4TuYcAsPJ6C11nwK/Kx05guRLn7ryqQbbWf6nv/07Rv90=
X-Gm-Gg: AZuq6aJKzX3RCpz0BRNAW4GpYEUHUGzq0Us1zKvBuuJ144tskLzS39hB4gKIMwV/nw9
	ZXXMv6DZy3VMgBPSB/jPsvSnedR0ODDVIs9JqDAhNVLTt5LGIOKI3tD92Qe/TXVVPu4qbzsC8CE
	Ym49w+FGe/c4AIWbfUz8O5+j0kzLWgOpxnEgI+IZSeoM8P0RgY79SynUTcQIoO15dEF1TkxANOZ
	YxKfyljBTd/sX/UweFMxpMFRrt3RN2YLNSe8IUD3ysJo11DID2sCxlKbZxf+tWW4dTmVuJrbnQp
	c3yOXlV/wXq7l2rkCSIyJwKCDvoE3b3yS9eo99TN9/fujjwjcIP1+wsIGoO7jnFDVyCiMj33ae5
	I/eVkkD1vUxIt5gHjlogAkhV4J+4/iVgMnCNW18nWWPeBWq/srnFzYnYZ+1OGKf/dPSePxmqXUX
	XVQAbghF5THQF1G/kqGxf1GlzXwvmJgWBPE8vZUamag1Dnz+dmK9CX2YM4pe2+wKBIGw==
X-Received: by 2002:a05:651c:198e:b0:37a:2d7c:3ce3 with SMTP id 38308e7fff4ca-3861c8645e2mr18910031fa.14.1769599354907;
        Wed, 28 Jan 2026 03:22:34 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm3035611fa.49.2026.01.28.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:22:32 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 12:22:28 +0100
Subject: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eJcCyNTA92cgsTiYiCZqZuWWaFrnJRsaGiUbGRpaZKoBNRaUJQ
 KFAYbGx1bWwsAEYfJvGYAAAA=
X-Change-ID: 20260128-sm8250-lpass-lpi-fix-3bc112c2994a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769599352; l=1316;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=q977yKz7zQ/PFR5OpD0DFq5KMw+GCR2Fas1jk3OALOg=;
 b=vZmguXgmSeyKMY7oO9jg4WybdJYBewOX24i0DxXIPG15y0dDTH2ULOm4clo6sC/Mskzw7voWO
 jvGqemt5B50Aymb8YzFBSGLsqCgwl3TcIajjPuEYdLAqI1a2nDXOUNJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90968-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E9CBA04E5
X-Rspamd-Action: no action

The i2s2_data function is available on both gpio12 and gpio13. Fix the
groups definition.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index 64494a86490e..c27452eece3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -73,7 +73,7 @@ static const char * const i2s1_ws_groups[] = { "gpio7" };
 static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
-static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
 
 static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-sm8250-lpass-lpi-fix-3bc112c2994a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


