Return-Path: <linux-arm-msm+bounces-108502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPPfE59eDGq5gQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 563E057F2E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AECD3022C33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC30F4DD6FC;
	Tue, 19 May 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQRVbMxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E84BCAC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195434; cv=none; b=pg2yeZW3jQsjvlWIG2bRUYZzLlFPokbgVJSK5tBeyuJJfKXwZ6p2WpIQITOkwdHPmsDIULztHRZAN0JP3ajigyYJVY1Z11ENRNIzEwDPzA6gBt+ihhbUz1//F6UF5+YKonYxLdHoINAL4WYy79X/BFZ1fA2/klZv3pQdJfD9H6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195434; c=relaxed/simple;
	bh=XUJDd4xUHVWu57IdXVomBU+JbtBGQJowIYaHzRYn3x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPmCPw5/YYeRJVq9qHKLTeV8W8zH4IrWGiBIPFu7TMWvICFg/SEqK+4ONDhpRKukTiAGv26v+a508ZWwWcLjALOHUKQv2AY6rwActGknbH+kwK8WP5XGiH2B6TRlTcHabNYI8T7WAYcjD8gCVmcqcyKX9qrQmwUa9vzKOUJDT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQRVbMxl; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8016d642b2so1819556a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195433; x=1779800233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=LQRVbMxlvP91Cvne5OezB2607R3ROk65uhYknlNMpcF1aaCpkLx9aR8VPbc/3aDJkh
         qaRMU03S0u+/S2dHvp8q8uTTiNDLTbufNCPCkSLmwI+UpBiJXI3icZqXsZmIk//+E3tX
         YVE3jPLCL/g0qPw8d4S+gvq+AKKULRiAOqMio54eTznHYQcj4evxa9vnDjwx2uIlq4Im
         XVBCRqGYMXOwPhbue0YWojzXGceVy7BmpUBNNNYkn6zhiSaNdll3zPvhGE/8lwIkDX9M
         6xuNGZXV9agHNnwZRB2LRezPUtGaYXL2YvbH39uvfiS1yq/Ag650G/sXJdQWU8jFI9U4
         +E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195433; x=1779800233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=iim6UZA4ln/nfu7pRpTCJaFLUirTROh+cglkxQkcp3aN1RaG6joBLeFXEFiaPcGHtH
         oQhOkS7VSXpPqSV0CeL7LQ4gsFhrwOyXcfTAdnX7Klenf3QBMJT6a9tzfM7+AQE0S603
         qb/H560mxo1EFomKcakxoU+V/Z+7e0bodEH0o/gLFg9AdoSqd8xa5LZy7ZZd2l5CACbL
         FkRXQDQoD9RX9YHMaQVSrYhWqxXLZR4DH4TJFPO1+lJg0W4vvGzM642BIDbX0mXoO2+C
         CGXLIIJp5h+4mGn6wE2E3Onz8GqzIY82hF9q1mbYD9fTh+mZSQkQw+VKiwQjqjcPOMeW
         ZfSg==
X-Forwarded-Encrypted: i=1; AFNElJ8frs7JB+zCj7vp2IiGTNHclORp/cPy0h1d4wJvHTt9Ov7n3ragYiIfkFjBpVwT4OaZbuQ3QPF9U0Z5vPnk@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzANhpve9Ejf3s7uez2ZRo61j3mBh5/FTOntgb3vGfxySvnNT
	lK7DQODyLukXiAilXmsoB8XknYc9k6NhXMD4WnoTg5gWYpKdX+Ffb1h8
X-Gm-Gg: Acq92OGupbw5NXgrv12lRorAsYT3CPsvVXY/g6wic/W/qoE6878lBgB3J1NQZTEH9MF
	Xtm5+4pc6mghLVW0t+zxy7NMi5zMHVZ3h/KdTjHAoPjstXoXas4kmo+q0mmELAfyr+6Qj6AAIPr
	mrL6fivUA7HL5jsWzYGPPrWOpw1stmYfwDnzf0ld/mWDIBlmZJ6W5W44ttI1qj8EzvSCU8JYNjX
	7ZS5OwS/IlpANgdfV23Oow81dZBecrsWi90BW+LhwJN8hIjSglDw8p9j1ntaBIKO/QbmzCTCs+L
	kZMuFi4tCQ2AvaWGaolkbOqjsiTyX+3lmiKoqS5E+Ha3vvYbwnB0Or0Lk5brea2Pnf/nBi5ZWZ6
	DG0zgVtP9XAuEgRBx/h+j7K01ML/cmDszSDAQg3qwMcaptjESi+74b2F+0IC3Jbmv0+dVb9mDfk
	6MbBvIwmbEFM8/ZZ2Eq9aT+EmIL5Zlo83uQ3Yc9qs8m018m4ugMX0xApWbTQ==
X-Received: by 2002:a17:903:37c6:b0:2be:1eb1:eaf3 with SMTP id d9443c01a7336-2be1eb1ebf1mr47575795ad.11.1779195432731;
        Tue, 19 May 2026 05:57:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Tue, 19 May 2026 18:26:53 +0530
Message-ID: <20260519125655.23796-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108502-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 563E057F2E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)


