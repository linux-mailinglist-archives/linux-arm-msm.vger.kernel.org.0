Return-Path: <linux-arm-msm+bounces-111004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eAteE9g6IGquywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A656389D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=gNABRc1i;
	dkim=pass header.d=redhat.com header.s=google header.b="ikghDgM/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63834318B7F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADE8481236;
	Wed,  3 Jun 2026 14:22:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A85481256
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496545; cv=none; b=VruZWqlCDOltcLimZqDoe3KSCGhFpGqwJiZwxuxcO7Tsb2BCFePRY+OHUFRNqUION+e/LTncY+K0OJEjGh/wFW4IBEtYhK2HViwlHkKR5g+JCmXLajvAIRgXACTWrf1KsmBTUym5h8RER2RPPjSa36Lvp8ePABSu2v6D65FTxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496545; c=relaxed/simple;
	bh=KhCbpgV6AqhdwmwMlKi4yi2ia3rmtjcamegp0BrEsrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kc6wHF2QfD5oUBcSP3c1Xg9N/rfSXixUSqcvpDBprRLqqsvR6Gusv6lqhXQjRua9yaPeuFgtjwR82yuU4MQrvgFQW7CXhmPszmif/2yt6Li1MUlYF2E/jG72u7qmOSaPEerm6ZvFWWGbSrJ9RFDZzhNuyXaV5YUQI0o5CwFdcso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNABRc1i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikghDgM/; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
	b=gNABRc1izLwADxlVq+NaPfjRAvdTkH2svyQkI427WZBchBvGHCbJl8v06WIwB56QwWzq+a
	F45xHRhzHqMEKFd/vl1df2J9AZS4YQPtH4Ya45yn69Vdn5AD9ni4SVL4S9HAfPLXawVSE9
	0tznDarHagm3dFL0/HOi5K1e7xwydJI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-29qExrjmP92ikygpOyik1g-1; Wed, 03 Jun 2026 10:22:21 -0400
X-MC-Unique: 29qExrjmP92ikygpOyik1g-1
X-Mimecast-MFC-AGG-ID: 29qExrjmP92ikygpOyik1g_1780496541
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91578c374easo526220285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496541; x=1781101341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
        b=ikghDgM/jDJyNVfummPp4tEtuF7ypOI+4O9XprVKiLqL7uOV8l6aHtvKhIbtsM3X4C
         heXDxm/1Kl93b5mNyvssYr2RtEkuYUkuC4yq08IKRU3Qo6zDZVIWFt4iz2NEfgAImGbN
         puEVgJIEtJg503GYtLBO3yYKdr/HCdpj6qOoJTzqAIYvpkEFJBQGVLeqT/wjg1hyvID/
         FuFI9PO/QcWnxIuC/bHP7GB+7BH512k1ig8EXiGEQxEYjN+HEE2KNaOu8a+CAcb8DFNF
         V7boHEqorOkaPOVoPTnlqcgFkziHrdNbVWjNklY4SJQnhXvCICDA/7adW+bepr4c+WmP
         ujgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496541; x=1781101341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=391N46PAZ2bnWpBAooB+cdPDZzJ5sfwLhKuZHitisjA=;
        b=jcc3HQX5p70HFywDK5rKfn1MLoYFGptDdezqvCkWT/DXIlVB9vcoZGUCi+Q5YTHzw0
         N8VyBPCijI2dYAf2gAFyZOocKVlkDPdOjLO+M3Hdp8K/dkRZzq0sW6zM8VQw4GNqKm5R
         fh5EBhcSjzsYuCUmv2pc739tIb8ZjtSLFICWtWv1n+U72Tqq2kYQJQNkpfi4OftV/Y2L
         ot8rardB6lo3XYfujnFEoJPBz3aHREGwz7/H+eJ0FZWirzCG6ugJ9O4dFd+zzfZVpZeA
         U+PpV4XemN2UwK2cq1Q+giK+hrVbpf2JO756ApfMjtunlSwOOTqvIKUvfizz4ZBSxzzf
         ZLtw==
X-Forwarded-Encrypted: i=1; AFNElJ/qpPfcQUnMmPKB6O4YWlN5PnZq/R8RORyO1WrK7n5SaFD2TeF4oDvJclX0NiVy6IPp6ZUYxxMlw6adSQGk@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNuoX9x0DOaYxnjHsgUy7WP9OLh4VgQYYnI2mCVGHDtHrExyU
	wPHlmcb35qHnaFZ9o+En77bT0s/xxzUfCadiGJ7a81h0/yQ5yIgENE3QLW9Vag93qs32BgZp/ZT
	1e6IRP7pHVgIC2B3KoVn0rYQ1mcnvPP+J6su8hiTW6XJQR320kOUY7sTzVrPZMj7zZ4U=
X-Gm-Gg: Acq92OEbMkUrzvfaFtGChU1DH3GRXvLy3MO7esl+wcfXTjl2Hbo2DL+DKxrD3t13mLg
	06FZDxLhyc/NstwyyHjNRSgzvy+4wr6wuUHeTfOL9Wf7vUXVrc2cLe2P7VG+vRPmtMo7XnhTccK
	48sCakwesazuQlgKJdS3KMx/BjgvtMx7VYnw5O0ueAwqiurw1q+t6PW45zSO84kpz7BwhAw/EFC
	Zt+vY3z8AWtzdeVSz/CESIReuZSkQYOcCDBrWRuXaO3rjYaqVIfndgFU0DgnRKF+mw+PuUvYMCR
	Z8YYF8Y8osUs61lOATIHO/jRo3pGtpZLaoIxkg+K0wtpgcY/xF4C46ZL1WzY+U79hZBnehIps33
	5xbaaW7tFwwbzA8d0FTNVAkPg3SNi4BUHH14vhYSGdgNMzrEcsX//Q1t7m1TDzIWofpbI7XQ=
X-Received: by 2002:a05:620a:6403:b0:914:c226:ecbb with SMTP id af79cd13be357-9158a70ae5amr640309185a.23.1780496540917;
        Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:914:c226:ecbb with SMTP id af79cd13be357-9158a70ae5amr640304185a.23.1780496540504;
        Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:46 -0400
Subject: [PATCH 1/4] clk: introduce stub clk_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-clk-sync-state-v1-1-457120eed200@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
In-Reply-To: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=KhCbpgV6AqhdwmwMlKi4yi2ia3rmtjcamegp0BrEsrg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULKbMV7q2I9Wyj6Nk7o6tCoV/u9azlzxQKt2ekH0rw
 Ev4j0N4RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOpWcfI8E9nld7atKsKNV+D
 72neYlBaam3ccfieKrf3Kkv17SxcoowMMx8+vnx/h/X8A5z78k0a65Y5fIo21f14f/rRWzzyMpZ
 tzAA=
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
	TAGGED_FROM(0.00)[bounces-111004-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5A656389D5

Add a stub clk_sync_state() since this will be needed for some clk
drivers that already have a sync_state callback. This allows introducing
all of the necessary changes into the drivers before actually adding the
real clk_sync_state() implementation. Doing it this way ensures that the
tree stays bisectable, and the individual changes are small patches.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c   |  6 ++++++
 include/linux/clk.h | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..9cb2b42d1be4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1557,6 +1557,12 @@ static int __init clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state(struct device *dev)
+{
+	/* Will fill in */
+}
+EXPORT_SYMBOL_GPL(clk_sync_state);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..31a0c9224c46 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -846,6 +846,20 @@ void devm_clk_put(struct device *dev, struct clk *clk);
  */
 
 
+/*
+ * clk_sync_state - sync_state callback to disable unused clocks
+ * @dev: the clock provider device whose unused clocks should be disabled
+ *
+ * It is called by the driver core once all consumers of @dev have probed,
+ * and disables any clocks belonging to @dev that are unused at that point.
+ *
+ * If a clock provider doesn't have a sync_state callback, then the framework
+ * will set up clk_sync_state() on your drivers behalf. If your driver needs
+ * a sync_state callback, then that callback also needs to call
+ * clk_sync_state().
+ */
+void clk_sync_state(struct device *dev);
+
 /**
  * clk_round_rate - adjust a rate to the exact rate a clock can provide
  * @clk: clock source

-- 
2.54.0


