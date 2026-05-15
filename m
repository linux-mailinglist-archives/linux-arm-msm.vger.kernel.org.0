Return-Path: <linux-arm-msm+bounces-107715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFIuL/uyBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:45:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC67549B2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5C9330216FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD347364029;
	Fri, 15 May 2026 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgtS8lN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAD363C5E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823782; cv=none; b=RYrJgCRyA2/BfXrknu9r/7MGEe4nsD785NLTS9WaaW3ROfxEhqLnyNh/aN05CZaUgBqKHZkD9tY38qNRT1DSFfn9V5Bs2IcwkB14uJzKbExmoXNQQCTsMkT9zMNh5788P1KkfXyg0U+ryXd+4N9sZyWWMYVsUGLlmb+WPeZeXM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823782; c=relaxed/simple;
	bh=PpKTrbBM4Os8Rc8SCG+XYjDDmnVB1a2xO0tDP9ChOPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4+PmXY9oEm2XoazGKHe879VgYDptEj8fKGeG3Sanbl6n+SSamyPrc0FJ5CCg2daq1qvn3jHa+11F2RxTkqUnkYcNjar9gS70ql0o/liy9gUwiUO75FtfuzSLQAFMeBLtAEu3G++WRVgRAT/G9tgsJjFjXA/9aCCux2mcLz7jsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgtS8lN+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8379e010b01so3887072b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823781; x=1779428581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3PjlyOf8sBl8btmWeVxVjjQtlMp0Y5dRKaD1umBdh4=;
        b=OgtS8lN+M8PI7PmackOsmBnijGCXED8pYUDNWm4hAHcxUwnaOMsSKvtOZ5/JTtuEfG
         IlYDC/uEs4/3LlXbS+gCFlnJGBxee5RVh3NRQbpLRKDWyW/IbfhJrSpX3aB10iUWft21
         jFIesrYPkUsGv5uSwlraY2Fl3y6Sfo8sQsinKU669Zj97qOQd8T+V4BLJVhmq7TH3Wqp
         EF7KCylwDdhB3C3428lLZsu6sYdt7ibMvSzT6gmlBA9P87j2sBkUdifmRBjLMHWDKZln
         7qg7dCWc0Oi7/pZWGv2yhIJBPVLoRtv0ydkxO7GgNcSZN0qfb1pogamFNmPya0RhJy/T
         e/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823781; x=1779428581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3PjlyOf8sBl8btmWeVxVjjQtlMp0Y5dRKaD1umBdh4=;
        b=Kboe2MeiYYIJL616WblS0UTFq4Uk+pldSdM6cDBMqh48NatqmNyjs31AffItI3yp++
         lpBOciNN1J4STHQf4G/hcO2yKdb+capUmFU6Mdx7K73mooOfv4srTNGzaj2e+5XYk9HE
         0LoycmAnymWoyZybr/GG4V780Cs23RU71HmThkI/O64LkSr+6Vu1UUbFMlML29fd8Qfy
         3Pb7xIL0m79bwgpddSLK7POULq47TACu1TmhKw4L+Cblbn8gAlNK816CdaQbnvYbp/Zh
         YNUeRRnM/5tYV06CS2zCeW28iPDZXUgE4Bg8sJbQhk9tcFwjfT45vYdWTyBnMCROR2pn
         qWvw==
X-Forwarded-Encrypted: i=1; AFNElJ9eQMw3cum8QMJ7V8QST37TUNtOz41F65ElMS/YfGFQokllwhzZ2ZI4qv+AlOtqU3+duG4q7TVigwh8AdLB@vger.kernel.org
X-Gm-Message-State: AOJu0YzupKwn2JKdC+xb5yXR2HkwuaaeaFz9HiIoa0e6LdzZRDRJESF+
	vrbAax7KXcWqq5m6cpsphYo6f2dND/xqGcx4+yXv8jesP8vbdactFAMP
X-Gm-Gg: Acq92OG9pGtR0RtNhV4KNWTz6HKZVeFg7qF+lhl0aqlS/Nxi9EyfVew+hU4QrJPBOSD
	yXCvgn9dj0Ce5ukCMlc5WSiQcm0dZJ6YiFxXNCK30gBec/PGnf5jF66W9XNFLi+G+3LMMHhmYn6
	Cnx0y87dn1kdi21tJZWN6YbnHQXhg1OWM+sz0ViE7wfOt7FPGm2BmShQUNCxvfShOnAeQXYfxLt
	T1nynwCemgODaebUyZ4DvWjFI/Hv2vp6vtT4WOs9+05xvueZ+RM0KdrEz3TD0F/IQeblDpdZzq5
	wO2qwFUixY90lhDldls6+lkaWABpjBMe+y6youhnY2Japw2sbo0HmwjALnAb0s8Ip0MiNDsUb3v
	L8FMUuMYo1YqG79QZVma3o/0a/gungrNvhv71NGW07aRjjyI+RLBqLrJYfSEkDRwdYKfh+OQLqH
	o/XEdfK9tXXIdSC6IABBMNxmbG6ichsUL9NrnfXwSn7LAudHj1tJbU8xyf5Aau+/AcCkhYEP+4T
	U0/d1y6/NkOu7Z8ERArm25+0/BKJ28dbz5QMg==
X-Received: by 2002:a05:6a00:3921:b0:83c:de0e:bac5 with SMTP id d2e1a72fcca58-83f33f3d3c7mr2755385b3a.49.1778823780683;
        Thu, 14 May 2026 22:43:00 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:43:00 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/7] drm/panel-edp: Add panel for Surface Pro 12in
Date: Fri, 15 May 2026 15:41:50 +1000
Message-ID: <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CBC67549B2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107715-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add an entry for the BOE NE120DRM-N28 panel,
used in the Microsoft Surface Pro 12-inch.

The values chosen were tested to be working fine
for wake from sleep and hibernation.

Panel edid:

00 ff ff ff ff ff ff 00 09 e5 c9 0c a0 06 00 07
0a 22 01 04 a5 19 11 78 07 9f 15 a6 55 4c 9b 25
0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 62 53 94 a0 80 b8 2e 50 18 10
3a 00 fe a9 00 00 00 1a 13 7d 94 a0 80 b8 2e 50
18 10 3a 00 fe a9 00 00 00 1a 00 00 00 fd 00 18
5a 5b 88 20 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4e 45 31 32 30 44 52 4d 2d 4e 32 38 0a 00 0a

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 497dcd48f57b..2cf52f03c217 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2020,6 +2020,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cc9, &delay_200_500_e50, "NE120DRM-N28"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
-- 
2.53.0


