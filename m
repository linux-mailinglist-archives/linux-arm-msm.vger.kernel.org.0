Return-Path: <linux-arm-msm+bounces-114382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Btl7Lh8oPGqCkggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0276C0D06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jk8FOC5c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114382-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114382-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20B53028EE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 18:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429D9305E28;
	Wed, 24 Jun 2026 18:55:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC50331ED4
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 18:55:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327315; cv=none; b=qRWHyuLevHDWvX4EY1XKTsWGjRmiU0xAJRxC33MdiapadLTdoepO9cZSutYqgYB7iKv5RUrF4lCOHkgwt2Tr2PSrFSxfO/MAe49dXe9e4IKz4kR5pxJMta0xQ5KRJXH8intow9V0x+pURhK0atzOofvQDUISZqgdit6NmBvM8ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327315; c=relaxed/simple;
	bh=Q3CnFFs9ChJTjG3+XxXkpaVpvorugGv4uTTNtQEh0ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYPhGAI3znRHXaaKbW23r6G/JF7g/iqm8zGBSXev7w9jKU24t7e/DUjQc/HIvx9kdGhAFKIFMm9wOVKSK6kerKuTFwwScHJykYy8SsBIfl6oDHeb9Wu3WGs9CT3zz7qCGpcyCeFEqz3SaXdldwhOCGJmxiiPs1M6b4W046qukos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jk8FOC5c; arc=none smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7e86d46b02dso19634557b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782327313; x=1782932113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YgHnl2lJKwXfRhDrg0bud/BfHOtjapxwR6hn+EBYNI=;
        b=Jk8FOC5csTxTuuSDWZxBBYLK8DTyAkNsNoiWLocfgyag8BlqZNtzYm6QPSCqW92WYe
         fCQvow/9IezLw8g3JUjSunseZaKO60U5Ctcv+1e/QlP6DfoT9fCXQhza0HYf0SMWiOvy
         KEo6o2rLZBhJHKA+BR3O+kvqNSl0N7tZ4P0eEOO3tv/M0SljHw/kW+sCjwptxOnXwE9T
         kF6xUXp37XAyimZtvYzO/+B2E2m6dLg9omwmZase9qNeyoxHDpK9UGLih+xpT60ZJac+
         Go4azMoElheV+BSHXvjZ+KwldM8aIZX5liccKItwZthho+mfocDu5uLAu7ZfOTbOnkgu
         g/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327313; x=1782932113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YgHnl2lJKwXfRhDrg0bud/BfHOtjapxwR6hn+EBYNI=;
        b=DLhgN47kqx6hqcUfFMeA3rX614fDt9/JcWghWc2I2lD/h1aWoou6aVuW9uwVpAwI7P
         MQZ+nBRIKfMrT8RCF3wYuhBFuYQa//OjTf7BekwPd3ly7Tg/G1MbWCEMi49AIE/yr+WH
         lMK1AnAXqp4z5jKxlgzaxzDLU5bfT3+MF8gWk/1KqOLXSs/52h9dT6YPfjKFYzbzTh/g
         tsEABMMNcsDGtIlF5dsupXDTIuGPHFauw21+LUAjk3l2bzLq5hG/fZrZv1sZJm2V5FgT
         89uecTjzhgPDSsGuunktEnwLUT6GRUtkYgLVrl9gajdN4oLfn8TR5aDZ1/jrbYYT9yEC
         AmEg==
X-Forwarded-Encrypted: i=1; AHgh+RqDHcQFNVj+JI5LELrva2N8YkpwWkWHsPmiWjo9ChQHeiuiT87gRejw4/g+4q+wz5Hv8GMe1mbS5xhX7sFz@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6w8nKK2AHLXkm8mMQSlN6u2SxA8cI9e1ZqxLHx4bYpTPpx99
	ugsdDFEkRGuI1QZuNTeTJCNY36NdehiTBCKhMjdqoqXqCc4Ogf+czuiH
X-Gm-Gg: AfdE7ckCfu1704QiM+GlyOVkBQSMTXTV5luaILmE7hOOIb3BaksQtLLP7/tHJeh3Iyi
	cV/16u0EB/HAZRHL0qkANTcLuL3ikLJqm/+NkifGdADzj2XIZ+vYuLGc3qVQ5fbGc+4moqcHE5l
	0EKMaKtavU55YBIp1a6Cfy+Z1BOtyJQtZxChUrD7TnzopuqgOppGsuA2rbTJELJZK6TfJnEtdgU
	YkZDGySEFA4jvcg85dm5iARx9YNeyoKF+uBpIYTVqiSkytyaDHzWvTU1sziL/cwxx6lQ63eChz2
	ONXYqgRbZ074+udjA7gzr6XoVY4tSUZ+I9YFO802o4OhUyfE9rbPlEPlwtHvv+I2Kv9nAKQzZ9h
	/l9hvVMT7DL/VJDCkO0STrANya2DEFApEKyKYiSD0MzEzhdGyVs52hNoEW2jmsBIfcwCdDboWb/
	dhj8E1THTJR9az5x0kV28TUOI+pA==
X-Received: by 2002:a05:690c:e241:20b0:809:9422:8c47 with SMTP id 00721157ae682-80994228e31mr20933047b3.22.1782327313072;
        Wed, 24 Jun 2026 11:55:13 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc2730sm61645687b3.34.2026.06.24.11.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:55:12 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: initialize invoke refcount before publish
Date: Wed, 24 Jun 2026 20:54:27 +0200
Message-ID: <20260624185427.1451-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114382-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C0276C0D06

fastrpc_context_alloc() adds a new invoke context to the pending list
and the channel IDR before initializing its refcount.

A racing DSP response can find that context by ID and drop a reference
before kref_init() has run. Initialize the refcount before publishing the
context.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 6ced210ca..42fc128e1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -703,6 +703,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->cctx = cctx;
 	init_completion(&ctx->work);
 	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
+	kref_init(&ctx->refcount);
 
 	spin_lock(&user->lock);
 	list_add_tail(&ctx->node, &user->pending);
@@ -718,8 +719,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	ctx->ctxid = ret << 4;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	kref_init(&ctx->refcount);
-
 	return ctx;
 err_idr:
 	spin_lock(&user->lock);
-- 
2.54.0


