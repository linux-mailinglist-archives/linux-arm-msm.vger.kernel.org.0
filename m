Return-Path: <linux-arm-msm+bounces-114704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KOWpJcKrPmoXKAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:41:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E83606CF30F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=ZoRNQqEq;
	dkim=pass header.d=redhat.com header.s=google header.b=STmAdN7B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114704-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114704-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A7431796AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51663FE363;
	Fri, 26 Jun 2026 16:33:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938973FC5B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491601; cv=none; b=pa8nLX45+ah/KZ9tOLiD8FZKFYI7P+13jjng2ZVLvJERDuX58rPk+4KCc6HGJ/N8fVUVoGw2LkNXRqHLRrWwXmbo0ogT+TDhpKGlm9EVrw3Jsnc1oEvQRvhiUgDEIJ84nd79qyQFOhuIzn+txgVsiSpMOk52iISp0GyG4y0kfw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491601; c=relaxed/simple;
	bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0NMSeCTEnpyF6gK7qRKD1rzIkV9GYxPfcNqwEu2EHTmkt7bofNU5TvmpZyWqeXXJU2YlssDdBMuBMMj1xVpjIXCP5+oRc6nWdyeHHO2PN4gjIe5T/LYmoOQ8nUIqKst5Z/Cme03/jViZ/ysZoKDkEdwO8dinWesa2iEXazvNjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZoRNQqEq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=STmAdN7B; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
	b=ZoRNQqEqcibMhv/f6XMi1Ao4TaX835B+5FYx1slxk48KHG4ZP97KoAAH+7cG9jWiDg/nlI
	tBC6p5en0cPpM+dDJMZ3yNyxX152Ss/nEOYuO3rLST1t5GkRjXZpdhne/BR1l4xoVFFqYf
	Ml87uWR2xndv2Wc9q2beJRn7BULp6ek=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-42lN827XMmSeyvKcqsgb_Q-1; Fri, 26 Jun 2026 12:33:18 -0400
X-MC-Unique: 42lN827XMmSeyvKcqsgb_Q-1
X-Mimecast-MFC-AGG-ID: 42lN827XMmSeyvKcqsgb_Q_1782491598
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9489f62bfso9568876d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491598; x=1783096398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
        b=STmAdN7BiXfj9mr2V2tmvIkbouqsF1EVfdz9Q3lUOZfvDEIH1WFIK1B+ie/bJ3AsMN
         5YCCjggTvR4M+H43SvrTPvMnOMm2OY7VPWa61lpQwPk25jNLYq+fZ2VQSVI8KrCTioLz
         awljmQrcOj0nhYA6+o7m5tYphyn0+kM53Yja707aILEAbsJlpOMmmQjR7vKlVOTtAz0s
         dI9N5SGNx9uj4Wog/xrtVM4ugm2ELJfbGR3dPdn8cojdkBqorICbPHNkDPygbO1sH094
         c1RTeQaawrZ74DBl/vG4lOUttGRfou6BB43qtdpJk/4m6MYAAvSdofRK8zyFUvpY2O3w
         U9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491598; x=1783096398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6ZmeaLy1Q8HlDQIKJFG0Hw1Bpilw3Yl9TkyPcS5OMs=;
        b=QUY8WtooochockfI/BiLPOlsCyDZvooxE0cygbSMWMjuaG7Ca2kJB6Zd8t74NrIkN9
         hQIEuDh4uOsHhFc0TZXim/Vdw62Ad3pDmAMQQ9mLpavFZLd70x12gcfRg8P9Wd3TFL84
         CW1R3XBWxNcZwF4PuDWqInRK+SX+2cjPggfHzhKEgOtrMNa7vPj6Ef3ObmBf6aWjeGWz
         NDGLPWbvoexGCuiFyfJNu4sWSRYrWKj48cbweiEsNuPeMkV/upEDSfQRFKBNfzMot/58
         ToYmGj6UU4CbO3fp1fMjIkZIqelRnJwlTh4Lxlrc0wL6B2OSU22/e2PcmdqlWw//s2Cs
         qXUA==
X-Forwarded-Encrypted: i=1; AHgh+RoXYIY8FOpzDxOKYUWL13S4iuMbPLYtsXRgLexC+a0bnu54Vd3t22YGKFBUbaatMAVgzTSRqCJeTV0jMnye@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlIvm2lKx5Trft0D/ntn3Fy4SfQLT+qpd43f2xKph02rR6E5I
	QYiKrpZJi7naiy4fNipZY1yHR/L3hpUchItk+EGN9+crycaQDb88hnikermExqOzIqHbaVhEF0E
	x0j99cQwy/TOfA+a6SHuMcsPHaqq6kVj/uqDNS/dRocHaMzOdx5WyuuT4zusrPv/Iz34=
X-Gm-Gg: AfdE7cmOUuAsXDjfDKxLQ+DSf3lWqX15FDP0f4AyxsjYn5ONFDKkPvVbbEOzg6JKNlU
	7tSAoxNH5jmVelyF+gHQQXqbhYCKDfOKjTqOLGGTXJrmxOrQ86fDFiXFNqzUzjVzidBzF6jKYun
	2TpiraD6iWYgLHMhsaDvgCjRkUGraxL1XgJwmNb9npgexXf4EYIg/JCa6IqnpoAzso8/GsDsveP
	fr/lGE6JGkrVreNkhk5N2+v8h1dbeKuKYZDbi4SHvsTFP0zVDTIZqm2Z4GknXx2J/64ElGu0+K5
	aMsNch+tK2dZC4NJzQjVUjm4v8JlHxM/vwax1rsAlKvRaWtpTnS+06xRVYV8VdPzuL7tlul7SHE
	e34DEgvGbStjE7RtwF6WB9+yR72iYgi9D9sW4pZUVP5h9ysUYGQ==
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22132606d6.6.1782491596095;
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
X-Received: by 2002:a05:6214:600a:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-8e978d76f48mr22129556d6.6.1782491593301;
        Fri, 26 Jun 2026 09:33:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:43 -0400
Subject: [PATCH 2/4] pmdomain: core: migrate to dev_add_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-2-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Web8zHdcbJNnjkhQ3uoss4lsJHrT9sJ1VoYl5dI7U3o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh7yYNlUc+TIRZ0G1oVmcwt2ZrWt1NHLOxWge5JT1
 qG0wX5TRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJ02f4p+C9WPnitnMB29Yo
 i7lum79r8RQDrdfx2yaJpEntXJe5rJyRYcK19uscWg+CuEJXNv13LBWZMbfX9+3CppYlEps+7Qr
 mYwYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114704-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E83606CF30F

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains, resets, etc. Having just
a single sync_state on the device is not sufficient since other
frameworks will want to add their own sync_state callback.

Migrate the pmdomain core code from dev_set_drv_sync_state() to
dev_add_sync_state() so that this works nicely with other frameworks
that want to add their own sync_state callback.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..22791353249c 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2697,7 +2697,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
 	} else {
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2771,7 +2771,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!dev)
 		sync_state = true;
 	else
-		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_add_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 

-- 
2.54.0


