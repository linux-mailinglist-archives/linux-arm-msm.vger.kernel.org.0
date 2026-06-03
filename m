Return-Path: <linux-arm-msm+bounces-111008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mV74KAA7IGq4ywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:32:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB66389E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:32:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=DTYMYdk9;
	dkim=pass header.d=redhat.com header.s=google header.b=uKWcsd7F;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE508308DF09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE8948AE38;
	Wed,  3 Jun 2026 14:22:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACDA48167F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:22:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496551; cv=none; b=AG7qeNwZlq9YQ5DjopGlHhgJ/ZSA8ug9L84Q2nl8mvC85kH8uv0s5iRxzwls3zAZTFhs2wi5jT5dXpzMvtrNdsgAE+1+LQAKJ/p1BV/joV+nbi2KehKApLHYsq8PCF3l/FakORhgOwMZFr8RHOhJ/tf0UZ5EV26pgKC1lx6V7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496551; c=relaxed/simple;
	bh=zy9SqZgZxUx6odgCUdJ3l3chdPu76ryK/kRXQOy9IZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6orIZxbaEfgeRPt4YQdXwaXyLfirnhg2T/U9K343N1ovgHicuW0HshGpApDCGkB73GFjrWKvZAwb+FztgKl208ethpTfzIpNS3/4/tPFmynlzepqTRHGsevi7x8zNv4dMfSJ2Y+E1I5OqL8yWdTg0rDsbeHToIL6QaW3mT+vTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTYMYdk9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uKWcsd7F; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
	b=DTYMYdk9BalkLgOcuVVY4dQoaiUBvZsnHx/cO4kXyQGYp157/yRCBG/OcK56P2Z5a947xV
	hG1VqDFD9hO6XWe0cogBdyWeuvD0DXipENKIjAeD6uatR+FFpmiVSF9BVEWwu3D4qm1wT0
	RuzRxzubJRp85fsO927nujBrvEGkXig=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106--047d9voNvmZnWPBAhIHYg-1; Wed, 03 Jun 2026 10:22:27 -0400
X-MC-Unique: -047d9voNvmZnWPBAhIHYg-1
X-Mimecast-MFC-AGG-ID: -047d9voNvmZnWPBAhIHYg_1780496546
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91574ad681eso529332085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496546; x=1781101346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
        b=uKWcsd7Fgwtg9+yzPsQHPbui06xGX/cC9irnx3cZK+Rsv2ddJZWs/gvirzvkA9351N
         VEzgmVnmCcLq333amKI4fEPcBRfZXQm7g5WDSyxse0xUPqAtt7lnhFZkeXm5CZrb6j3w
         MsffaJqwRIloC0Bn643wuUj5OdBqvUkJgozw3zU56SoShGRS7/uRGF9WyiBiiGw+qzli
         gcylpgRiBrlQOrohB0AoRJpJ/Y1LjNVgH0TnzZa07oxQ7bCcicaRFPrWDeUN7xQDqM7h
         QvSY3Q1ykfZgl6TXZ9GIgzh6H58nxWHTIzNOgpX91F4Nne0l0Jv+8Rc7yg0t4KNM6i+W
         KyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496546; x=1781101346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+64RL1MUhJVflWQ0/Hrf9COdjHtondF6tiwJq41sfAg=;
        b=bfpYHM4BvL0vn5CtHweaPDwtOWxGdLjbFybCyrLqkXuF4NQVlI1mC6OLih55Uz1rHz
         KUbWh1iZpX7iYbRx/2IJ4WmpxpimJ2b2RpBNvBooJviAlqqOo0mIvok4NO556VupmQTA
         n0s2wLtZKPGbay9qzGe0yZQ2SX3f10uOePltMaopSrPsFHKvFw8+leUeOc0ajcK6+1aV
         QrktAhPMQXFfYqljZFYgq7TFnXhMQRIx7BzGyw2tt3zppdc+owekagdcAQGGlva/P8Eh
         E415Gn228PU1f0C5qwo8hawhxKypgt/DNIKtZuicJMTTqcy2Q0wrlvP2u5g6F9jz5/4D
         9VNw==
X-Forwarded-Encrypted: i=1; AFNElJ+u9gSoRkKfB//0ZNFyRO3tk6nE9DLQ5gZareGKZNwyX5i1e3TyGBeN9R6u7jZ1B1+ITarLBbGr2xQeOaa+@vger.kernel.org
X-Gm-Message-State: AOJu0YxBulnbOkR0tIAJOa0PFbyRZyKHAgyJe28eQKNMmZfRMeLw8FAC
	C7nqgyjHa38lyGMKIBRfGv+qTvmjuJ9s8dSQ9cmV4+M0obXPMH9M7T3/WZjM+Aa29D6l2Hdje0L
	ycUUvqGzOGvzL7JH9AyvGKi7hnsGEAalxgdtzyxDEsgPJ7nQSjZ6EwG1+TiI0DXBs8K8=
X-Gm-Gg: Acq92OGrFdzFDRbpAUD8jnyE7/HkUvFKkVkT9Fh23VuBeeSl8/SVJZ/QXk8RfweAT7I
	ZHRYioBOGzcilWoHhEY+h6zMTqHJvebqDsjn/xtVixNjKrCvhz4c9BngjQbkFvb6bYyzSIqfIDA
	9EH0ClwSmF4lboBEecYIUyUt3w/PPAGdbe7tJZPaIUyZ4IDEs3RDxBfcy5+wnis4RKDJym4UCBN
	ti7+MmVbl5lxY2nU1AEyTi9Lzaim92rqLdTTgCG8oHlBMp8GdIMZ9NqrZAH4YExSG9fFuYv0diH
	2GvU1GVOAEr1Xdlg8kmPd9ttLJMJCDtnl11WenYt1/ajJOWYwXuRIk3y3CWeTkzUd1cbDkWkhf/
	VBiU7md4QbzEGzZ8TQ5z5YSxgZA/XBjlcu3WWKguVeIaZG/nn0vQ8syTtoulkfZOJhD1bPd8=
X-Received: by 2002:a05:620a:4096:b0:915:8f08:5f9d with SMTP id af79cd13be357-9158f086545mr424084885a.56.1780496546322;
        Wed, 03 Jun 2026 07:22:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:915:8f08:5f9d with SMTP id af79cd13be357-9158f086545mr424078585a.56.1780496545742;
        Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Jun 2026 10:21:49 -0400
Subject: [PATCH 4/4] clk: implement sync_state support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-clk-sync-state-v1-4-457120eed200@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8197; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zy9SqZgZxUx6odgCUdJ3l3chdPu76ryK/kRXQOy9IZ8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULGaIv3q08v28UiOhF9xnOK1ME46ulmFgsbzGllhyk
 OPz69h7HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk+TIjw5uvxyYeDeKVLDEw
 NIgI+tqzbMPZpNiAt990l6ZVT6/7fI7hF9OyhgfP0juy/bnjzx8+mXbZRMpF/0tQ1Ix0o/qHKkt
 /cwMA
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
	TAGGED_FROM(0.00)[bounces-111008-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68BB66389E3

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

Let's go ahead and add a framework-level sync_state callback for the clk
subsystem. If a driver doesn't have a sync_state callback configured,
which is the 99+% use case today, then let's set it up to use the
clk_sync_state() introduced in this commit so that no driver changes
are needed.

At the time of this writing, there are currently only 7 clk drivers that
implement sync_state, and all are Qualcomm SoCs where they interact with
the interconnect framework via icc_sync_state(). A shared helper has
been created for this platform that calls clk_sync_state(). It is
expected that any new clk drivers that want to implement their own
sync_state will also need to call clk_sync_state() at the end of their
custom sync_state callback.

There will be several stages of disabling unused clks:

- The first phase will be executed at late_initcall and it will only
  disable unused clks that do not have a struct dev.
- The sync_state callback will be invoked for each clk driver once all
  consumers have probed.

This is based on previous attempts by Saravana Kannan and Abel Vesa
that are linked below.

This change was tested on a Thinkpad x13s laptop.

    [    0.308051] clk: Disabling unused clocks not associated with a device
    [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
    [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
    [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
    [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
    [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
    [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
    [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
    [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
    [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
    [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
    [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
    [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
    [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
    [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
    [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks

Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
---
 drivers/clk/clk.c | 71 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9cb2b42d1be4..ab3f8becda0c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1442,14 +1442,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+/*
+ * Returns true if @core should be skipped during an unused-clock sweep for
+ * @dev.  When @dev is NULL the sweep is the global late_initcall pass; when
+ * @dev is non-NULL the sweep is a per-device sync_state pass.
+ */
+static bool clk_core_skip_unused(struct clk_core *core, struct device *dev)
+{
+	/*
+	 * At late_initcall, skip clocks that belong to a device — they will be
+	 * handled at sync_state time.
+	 */
+	if (!dev && core->dev)
+		return true;
+
+	/* When called from sync_state, only process clocks for this device. */
+	if (dev && core->dev != dev)
+		return true;
+
+	return false;
+}
+
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+					 struct device *dev)
 {
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->prepare_count)
 		return;
@@ -1467,7 +1492,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+				       struct device *dev)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1475,7 +1501,10 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (clk_core_skip_unused(core, dev))
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1508,7 +1537,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1516,7 +1545,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static int __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 	int ret;
@@ -1526,7 +1555,10 @@ static int __init clk_disable_unused(void)
 		return 0;
 	}
 
-	pr_info("clk: Disabling unused clocks\n");
+	if (dev)
+		dev_info(dev, "clk: Disabling unused clocks\n");
+	else
+		pr_info("clk: Disabling unused clocks not associated with a device\n");
 
 	ret = clk_pm_runtime_get_all();
 	if (ret)
@@ -1538,16 +1570,16 @@ static int __init clk_disable_unused(void)
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
 
@@ -1555,11 +1587,16 @@ static int __init clk_disable_unused(void)
 
 	return 0;
 }
+
+static int __init clk_disable_unused(void)
+{
+	return __clk_disable_unused(NULL);
+}
 late_initcall_sync(clk_disable_unused);
 
 void clk_sync_state(struct device *dev)
 {
-	/* Will fill in */
+	__clk_disable_unused(dev);
 }
 EXPORT_SYMBOL_GPL(clk_sync_state);
 
@@ -4345,8 +4382,16 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->dev = dev;
 	clk_pm_runtime_init(core);
 	core->of_node = np;
-	if (dev && dev->driver)
+	if (dev && dev->driver) {
 		core->owner = dev->driver->owner;
+
+		/*
+		 * If a clk provider sets their own sync_state, then it needs to
+		 * also call clk_sync_state(). dev_set_drv_sync_state() won't
+		 * overwrite the sync_state callback.
+		 */
+		dev_set_drv_sync_state(dev, clk_sync_state);
+	}
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;

-- 
2.54.0


