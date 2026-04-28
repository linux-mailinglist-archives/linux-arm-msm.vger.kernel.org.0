Return-Path: <linux-arm-msm+bounces-104955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGCFCWaM8GkuUwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:31:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC15482A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26F5931F9837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA003E274A;
	Tue, 28 Apr 2026 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVWS5IAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54733DA5B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370648; cv=none; b=NJo3I+UsoCOH4HFULabRHzJlozuWPxqbD4aAWukdLx8USq6h1HSpyypecIAhQLOJ1Y3HXcW/dDtI9btMDEenqWXnTXagiuWS7Gj+iLEbp6weCPy4eLSf5XvLMw36GUSualI1nXPnvUot1tpdf6LSKEWyDLMdYgzRYH57TK+4ukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370648; c=relaxed/simple;
	bh=KAs7GpO6pRk7YM65weAKFN4jQHungiqMV/ndnHGTNBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lv0uxg3eLO5LSGiI4UGdi+6FHI5eJs+iNcEQKipsjCAqsmFisSe6W/kNAj5r+AGl5zo0955903zePxCl4k6dhASRdHOmhnuZMBJ0lIQhlAQZsAieWX4DSRbNFM+u6TxxfpQKlaO31As+BaHzV7J9xSWqal0r21YgrEpXn+nZCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVWS5IAt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891f625344so101447255e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777370645; x=1777975445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EaJ4+olCt0ESjMkUsLHtcaVD2PslzC6qCqa9YfkQU9A=;
        b=KVWS5IAtsCUmk6beQQ9YnAnGiWaE7HLD/TJcb1ahRRJv7356SzQsgIBz4aYjLn89R7
         RiZdSmiiBxCr3mcGKDOA991HtDk02KuCtb5s02BjefcJQYEW8bIlv1SQ68Vu4Kd1Ifww
         Wl3fytSdZv9IDkAgpZdktrcS+asQHHJDg/oJNVt0tiiO1Fk+54y7rbIsMMTeLYICS6zK
         rNcnq7/ffFVrG+0T+qfdus0o33KkGtPtXbRXr7XgYUT0CEPr7sFVPUm+Hpx9oHhKT4cn
         i0mJUoSthPYBOPfK0Qb6LZk4DuJ0VySyEwulH1IgGVWELTvPXf7JwYQt9N+DLO9U80cP
         bAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777370645; x=1777975445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaJ4+olCt0ESjMkUsLHtcaVD2PslzC6qCqa9YfkQU9A=;
        b=oDjLTAJAvHJTrSGyYDL+xBbuOIQH3tb0JMk7VSrw+IXrbd0uL1OAt4ECr9hQeBu5BO
         foHBUYZLzNTZfBf7S5S5eJB9FuS6eeu63VNjuPffWIGxnbHFDL794Us5qOSKIt0bKsJS
         Gyn4vaUH9+OmGXSljIc5fCZzmfJpNPOUUmymPyXSH28Z+cCjiyPKr/8n2b3JxryG2WJR
         gS576mwD4BUyUPq6IHn1lUJhOdrNRKYKHs4iE98zIfpKNlMftzLh1w/v7XTQrAKkVwES
         zXWPvZpT4K13Soboy8J1nj9ou+tTmsbpsk1YxjEYyGv/Sr9yK3K7ewF3JOj8XfQpaHCm
         7mCw==
X-Gm-Message-State: AOJu0YwyoEkEp3ZVtmSWN8eQtSoHyviclW9NQzVU93zgi29p3kzARRMz
	SMEQ5ISLwDhAHwiYrNrPaW8LNDc8SuXIwaeAi+Aq3kDzdJqz/M2JeoYa
X-Gm-Gg: AeBDievewB3D0gGujqagdoI1ufPy0n7mc2rlWwOpdZh7Fgo3TRYNiav2mcOQcx41rM4
	Zgi6NZ26mgFYhoC4bFjBYHJBIPJX6uoJjjkE+ZoKjyDJIIWKd8UdCDMjMNxN66ORWqac7yqMZ2A
	PWKjXIKubf0dn07uU0hoZuCtJCsBBg3YWynv0jGLOsOqOpCcQRTu+bGiEOM66Np4ZqclyFGRg2R
	Cr1yyDDa7dd9hKFp8ygncDRMQPFyr/WhlVSFzuKnL1TIOmI598xWS/VTeozacBp6lGHtolp7p03
	BXIBaHXft6N4mkbUStEdktLCaep0ewHePTJyYuRtEq/VH51lIEU9TbmcrkIPRFoWZpSbYrqH2Yl
	3uLvkXHzohc9SkTuQwgl5adLzs6Wh+9ZWzfP1NQZlyAi/EUXK0nMydpQHqRY+RWVpuJF9jrYrm8
	PPc5xgc8H461SA1AGmMp7q1vjhScML67FNuC2ZN1VjTxDDwtzoCa+XUyF5NwBx5/VI50oQ+hCIJ
	571CR1j/sG3Hz4HlDQSUV9KX0PF2djhlC30ykdnvfY8EFf3
X-Received: by 2002:a05:600c:a403:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a78a391b9mr21393605e9.10.1777370645029;
        Tue, 28 Apr 2026 03:04:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8851:8e5e:9c47:30d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775e126csm23640705e9.5.2026.04.28.03.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 03:04:04 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: display/msm: Fix typo in clock-names property
Date: Tue, 28 Apr 2026 11:03:38 +0100
Message-ID: <20260428100338.3179722-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5BC15482A93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104955-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix the typo "clocks-names" to "clock-names" in the allOf/if conditional
blocks.

Fixes: 9be5c47908e66 ("dt-bindings: display/msm: expand to support MST")
Fixes: 7403e87c13847 ("dt-bindings: display: msm: Fix reg ranges and clocks on Glymur")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added "Fixes" tags.
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


