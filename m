Return-Path: <linux-arm-msm+bounces-113476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZWaSJci7MWpcpgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 036446955AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=FWScpUhl;
	dkim=pass header.d=redhat.com header.s=google header.b=lix9icTE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C341830433A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2C637FF6A;
	Tue, 16 Jun 2026 21:10:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D0302753
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:10:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644229; cv=none; b=kM4dFFSimHW6B5IeD0Zh6Gv/IEbG6qqsxk4wCPokm77qx7br3AcpXjRKcwPM7Z7aey8d+29QQ6M2KDSOyTO/GGBf/TkqtIw8zizJqDIZjDhoWbwoApnXGvpLLCtUFOpRBZqWygiXK06XaWZIZBBcPTQW+L7gL1do0pKtDwLdgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644229; c=relaxed/simple;
	bh=taSF5g+TYPmZ3BTF82P0LBh5qfQ8aapUDFKnR5l8sjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9c3NgQW4xlfMwBvmQ+sVunqOa41dTpIVD+0BRJPvRs2ktbupmIYDpaE0HbQ7uYcwk0jnsopz1dE9fjOKWRlQFYGVcu4+zV3NGgtvjQfH4H/O5a5GT2NaFUfZNdNYIsM9oVH3r6RC1KlkcYzgfbyNCmh/pM858WRYv4rH5D1bmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWScpUhl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lix9icTE; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
	b=FWScpUhlIpYuyHgDM0R4leX67sovNAJz4abCIGYERMUGMQ9n+Epjl8JM2y/mHQbtljfDk3
	qJI4Dfqhpn87AW7uS4wDd6U78S1nmvb8d0C5CdYR2pI2Q9xkhYMe1XN8Bp1GWwzWD/tyRj
	5mqygbUR0A1FBnH+S7i1tpRotbgYLFQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-RdtfRcffP6-L9tfOIl7F0A-1; Tue, 16 Jun 2026 17:10:25 -0400
X-MC-Unique: RdtfRcffP6-L9tfOIl7F0A-1
X-Mimecast-MFC-AGG-ID: RdtfRcffP6-L9tfOIl7F0A_1781644225
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1c3c26bso56335336d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644225; x=1782249025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
        b=lix9icTEaxjn+/oW28dkiuOLHduh9lQ4OwQAPBl/ZVJaF5ohtzHhCBothpXDVnYVlE
         IT/A+vAW7y7ZDNfn9k2b6JALpYmqtY00L5//64X29vHHvxrs3xJO4EJaJA6w7vZKou/E
         4fTJHCHm1Jw8/wZWN3ARQO/ow+orbSvVDtXxkUUhfCFcWu6Y+o+RUYbv4gbQ0AXx0i/p
         M7VKXORo9jX1Kb6kJOJMXeRGxNRm1YvdRlbR0vhX0uLwSy5ryzTbAOOf397NVL315hyA
         rc4qpEnASETEIG2kRmXRF4wPaABflm0TVQiptXzNoUqhp8gLMo9Bpg+KNfgAEB61WHmk
         Xzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644225; x=1782249025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipm7hlDqDrha69S2Bdvy+K8Rj+oFl4BJO6KYoEsGaSY=;
        b=X3tMwipgLe2gMtm0gdyDKjSF646Xgb/TzWnVaKeOJNFvzEOS89wPXpKBX0aLZPxQvX
         NTUzTNtbmlCzageY7ste2Qqnf116GSxcPFqTgm9uXWlEvmTTczDbC9nfI0IUg/Q6eu+o
         kLgsEbQqxlsXE2Y5WVQT1NPo/KREE5f24xFj8Liqa5YIycBOcfjI1cFeJiOar7IVg9pE
         1llFZMc9D3MyQiHTg7IqBPrOFEzR/PYI54ndNdQ/4Q/fRImJ9QFDoscdkYDoaHm7yPW1
         IsBgH58FL9A6l37s9eq6AE4VZoO4FiEXfQfTWBvCsC3q3txBSD0zolBXswS2m8Tb8ox0
         fdMA==
X-Forwarded-Encrypted: i=1; AFNElJ95dbLpmrAGOQTiNYGRijRit2YDYnRUtqMKVlx/LZvhgK73GhAqEYFYo+eky7x2tcs5F3SZzngm4aPdP8hX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5d28bHMPJSS7+Tyz7QuCZeKMGhWxNvVMaJlEW3LJ2OWsnRcdj
	iUHB0kXHZNG3ltan7gJ3d8b4gL1jeeiRK10wN4ZpIPv0l4ug8nBDJT1OGu0I6YYNQIX73Q9rvbI
	E6KhEHTTvofKN+Ybz79fqdbN1XU/IqBDZDJe9AXV5DsbNrQVqDS4TWlEXcyiRO+nfCe4=
X-Gm-Gg: AfdE7cltu88l/fvKCAXgpmLr7kTWVCSeZq+D6MZ15zpjV9SGG/pmhnKLYLp8UQ/o7CF
	rrnyuqv1pxV0A13u1M1ELYcv4c54IoQwzZJy8Ruu/jdSqJAIf+17FtviaI0Ow++o51mmlrSKD1q
	BAzddBDUoGrJtJLpAzE+CEWyZS1/Jvb2ovHAhChAx0W2+CSF8+pPmK5IP1CDQNMl4DGlqTEb9zi
	G/BM4+aTckLkuoFj1mKSnEjvt+1hc8J1gvTjAob5ZoWg4UxSJpG1sZ4zRvfojqbr6cktLSIgsgx
	aC7ndeDqzwOQ7LmeWIemlIBOCGcOoVsC3cXgM3ZXzOVLJ70eSLxjUG4j+AeMje0n1vCuhsDw3l2
	GptzNWi6KhmQiyGB5jyCWMTHOlf/oIQqIS4lrLeJw+VqQWSdNjLSATF0J4j+XcQ==
X-Received: by 2002:a05:6214:494c:b0:8cf:de18:929c with SMTP id 6a1803df08f44-8db5a8256c2mr15971986d6.1.1781644225202;
        Tue, 16 Jun 2026 14:10:25 -0700 (PDT)
X-Received: by 2002:a05:6214:494c:b0:8cf:de18:929c with SMTP id 6a1803df08f44-8db5a8256c2mr15971606d6.1.1781644224738;
        Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 16 Jun 2026 17:09:43 -0400
Subject: [PATCH v2 1/5] clk: introduce stub clk_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-clk-sync-state-v2-1-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=taSF5g+TYPmZ3BTF82P0LBh5qfQ8aapUDFKnR5l8sjU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd+8oi127i4G5q8JJdLql2Mb1M0U+imx9ZKbgN+ev/
 stkD4ZdHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkkirD/+CHOq9iVxy0qnnf
 22hUzjTBY9aZx4/fVTF9jlc6pHHqCD/DL+ZuwVX/ni0OZvKsz8h4mfeu0y5/cVLB2y6mNQeva6R
 N4AUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113476-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 036446955AC

Add a stub clk_sync_state() since this will be needed for some clk
drivers that already have a sync_state callback. This allows introducing
all of the necessary changes into the drivers before actually adding the
real clk_sync_state() implementation. Doing it this way ensures that the
tree stays bisectable, and the individual changes are small patches.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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


