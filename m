Return-Path: <linux-arm-msm+bounces-104757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHjwDAKH72ksCQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:55:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6F475B10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B84AD306348D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C7434EEF3;
	Mon, 27 Apr 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9/4GEtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6034E74D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304827; cv=none; b=hgMwh/pM9xq5eQfdiiea7Xjp4OlcKWWI2YSs7F8ctM+YaHdASlCztqk/9WhazZN5qlGCVQL1RPb2jbmaR34RzGXfQbunuFFmGCGh1QSqr4LoLJa5ZVuO1UaxBNSJpzBzIqqtY77w1052LdZ2FDBMIySPci9tpHcOhKWbibPzdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304827; c=relaxed/simple;
	bh=DZkH2s9DxboY02/rZB68aD2kBB1YKCmT2r/yM/j/b98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUX4HyxJ7dyfvyvVZClvaCxypeLY16O+yCvokfvI/Kh+Rb2SgoTAaiQtwPbLCE/yupadBa5F2snEVvdLcvDBEodM1f8AiGaYfS7iu+ZrR+d++z9XsJzm4yBzh0IRVFJotciz6a4s+Q/MElzNtqL61EnB0NORwtWP64oVF2o2I8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9/4GEtU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d7e23defbso6125496f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777304824; x=1777909624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAfTMxnj/6IMVjfTHuWc/Km6sx3eQW0UAcM2xEXbSOk=;
        b=d9/4GEtUlO5ipRao3bBbCIyBo8SQUzDOZkFWTZ1BmrADR78cnolLAiODIIm1NsXK3w
         bWreeVUb0r4s3pL4T33bwFhh9g7aTWTvLXhvNHVEPwX4g7u2wbN4Xf9ea51AlZgQNeF8
         ktOGAWpn9mq5JUUcFV0nLVrShQKLOoEwtRp10wv0bTEl+4kULggIQMq9yyqJUuHIHYbR
         5/i6k/QddnujZDR6zZBDOTah4BLyFfUR/mZm0OQ0RWu//EzjEKVTrUuuDDVoyBGDVBRy
         TsiyvuPk7Fjdr3dGEtfg7pgGF6+vG9jB3fy1bjdN2DCcYN3J6Y0z7cnx/wR4M27lmF+s
         4giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304824; x=1777909624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAfTMxnj/6IMVjfTHuWc/Km6sx3eQW0UAcM2xEXbSOk=;
        b=n7AyJg0jPe6MLLyJNiz9D+MSQkXnSQwPOVFCR3fMmScnjxellZIhTfJ03efW1cMFH6
         G5lsM+CaEkFnPsUsvFQU3W7EI2rWjQc26K1yUWTXceTJjCjfp2S1jEMPeiT7FqQz1Hlb
         8JHxol0ie+VgUwO0Lh+OqiB3p1r42ZMzcoduWiy7kcSJxRwHTBI95JujURSHDjts9cn6
         l6ms5ulOmxvcEv99crMwRx9JnNo7CpF6BJboU+Q0hxZ1MEq+1utcjnzFp/JikK/jJsoV
         AwpxOWmNJ1I337YfonQg8Fo4UVOU65iFACMrpvWsotckoYMYaVJEIIb+LWde8n5AI5Hr
         Jw+g==
X-Gm-Message-State: AOJu0YwnccsNC//6HiM5YKtOpCHmT8g7JPMgDsl9kKC6A3yrZ7gbusi+
	JtBw7xctF0khGqBLNrtVCWKSq8X3MvAFAWywf5F36vg8ZSq8lIspbGuD
X-Gm-Gg: AeBDiev2xDgdJG616bPR+aXTZIST/XEL+DulAq72hSEarna7Y3rM/CcMO8X050Qxu8M
	GHvwOY7kPTh0Ilg6XGnpknMu3/bZ8/1C3hp0unlBEmQwqkL/Iy6ZCpZSwAC9XEQrW2GWxciaiOa
	5CThl4y95iMK/jRsb29iLGIh56cQ1BZAzp1x8t5tnfkw6hpjsm3oqoaoC4Zxul1vA52HazU7ztN
	X1C+aZ/MorZRNe7ULP5I5sm3nlk5QAnliAHqyE66r2ZoOx26a+CJRhcJd9gXkDEjezZdNRM6pku
	622wMBqEPjkLAncxH4H0DD3fecmqOzsHbsozWG9diXsIrnGSDMXqC9Sr3zDI9WZYmjiNlNI6w3l
	CD2AvJ3ABhWItcCdKoBt1Y70BSi63VRBFA7ts/EhxYv+RuH6ZzWp7EsoCPdZ0e4d08l29LMbMqG
	DGdKZPQJwXN7/Ya2jpvUgjkZgjVSn0lt+lZMCU61LLLKbW7Q9BWzBtM1OJUo8g5UcLZwr+4lL4Q
	NYbbRtZ2porxBRjMMa4QL+vee8JKb6KOps3WiikhjvdMO/S
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4411c18f7c5mr47093562f8f.37.1777304823718;
        Mon, 27 Apr 2026 08:47:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4dc24cfsm80537830f8f.16.2026.04.27.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:47:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: display/msm: Fix typo in clock-names property
Date: Mon, 27 Apr 2026 16:46:58 +0100
Message-ID: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37B6F475B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104757-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,bp.renesas.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix the typo "clocks-names" to "clock-names" in the allOf/if conditional
blocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, patch applies on top of next-20260427.
---
 .../devicetree/bindings/display/msm/dp-controller.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8239adb7f7d3..43ebd053f98c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -243,7 +243,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 5
 
@@ -264,7 +264,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 6
 
@@ -286,7 +286,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 6
           maxItems: 6
 
@@ -306,7 +306,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 8
-        clocks-names:
+        clock-names:
           minItems: 6
           maxItems: 8
 
@@ -326,7 +326,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 6
-        clocks-names:
+        clock-names:
           minItems: 5
           maxItems: 6
 
-- 
2.54.0


