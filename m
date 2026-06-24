Return-Path: <linux-arm-msm+bounces-114380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/i2BNsYPGpHjwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:50:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0E6C07CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:50:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rdWs215Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114380-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114380-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76A1A301048B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 17:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7213DD52C;
	Wed, 24 Jun 2026 17:50:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6C399CFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 17:50:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323415; cv=none; b=KINMOOIBqAP7G2t4c98FtfLTg0763VRKL3sS7aMY53Zh4DPMCSAENjM/bdqGjwMEcmbNEBpr5TtyG+tf0TkOJPGs/HG/lQKL09iwDeNyddv8dEspT55k1nPUuY4USSf7uxxR4o3DxeeHbx6sP9BaTMEmX0+ou1vMpuFR3PoeisA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323415; c=relaxed/simple;
	bh=eZTu51HHRJvIW/ZKGlQIrOMMhbkH7c8hYVY/WqqaGdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5FvHTrWBnqgtTjgnRhn+0SCXZ9B6Zsf6wbAdWn8MKFq90yrb9au8GG12mtuaxPynj6tgvMOJWiX+wSw+oRIhR0hU1+d7zUsnGuzWeNQsKmFRIXLx3N8H9rxphnOBprWCZHVZngs9Bk8DRsnbxNxixlof7ptsW4VUQiTUoJDq1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdWs215Z; arc=none smtp.client-ip=209.85.128.182
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-804239c418bso18294407b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323413; x=1782928213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/uILbh1n2PkpNOCtS0svqEcnFHuP4Pdw3ur3cUKxxI=;
        b=rdWs215Zj6EEWB+t/2h2CV8USLc9pfcMR9+T+SXmwAQsjSxrsxSOq+CxV4CLPfonld
         CORxLts7Yam6MAUwxmWH24ROiYsOeCDprJhhrx0xUAcG9apgkbxvkF9/O212YqJO9UZJ
         Ag1yxKHVglbjWi/ruXdyeoEJx6NO2MvSeR2I6BRT19xluHH/JGorE7JRP+0AAbchRhNz
         UDDAJhtoDBkGPsBgrmtQBAhz7ptpUcqfbHVgmBXp96I/k07ADNk9UrZFtNoQNXRxMoIJ
         SPuVsCaubSZc5aT7bZSOaDYEtE5oD1KNLUEsUOTFvc+mm8BzJRThDqwWeCAda5N/UsnG
         4RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323413; x=1782928213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/uILbh1n2PkpNOCtS0svqEcnFHuP4Pdw3ur3cUKxxI=;
        b=MwVjHhFR5rV2BSdhMU+WqiRPKRHfkHClWCR/SJ/zDnHatNu4PBg0FJlGtjcCFEJ8sI
         KfLcA1i5OKxC/kPSqIQoEEPaKFQ/DpWWx5u213WhAiqB2RoKSmvD+JC1ZJsb3V486J+v
         FeuIJ6GfZX2iNgs8phZvQ9tm+id0GLS7ndFAtWds6hFEs8IlJHGbsGMLkAP/Yp5Vj/bt
         FpyxmoEPahwtP5nGVICJ1M4hL+zwjvQwEqWXZl2rj7goVLvYR019OhiAhuo8BC5meTC/
         thAlcFx1euHASzxwVir2GkZIBEWhvCHaxBDQqwQVfmgDeybehsmKXAev65UDA4ZKt+Wb
         w+Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rr4e2eQPdugsOLy//TIxDrheaoP71nNFXZFJS1y0n77WD8BbxETgxxdriSkazgwewE1wgUaf/p1jWAPq+TZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoqe1XS8jBH3BV/+cp3UYC94wLUlXosHK7CbhEljjpwTtFLEq+
	EAICiPwLzNDZl9EM2qdl6xGJ5Qtj9gr/IUFLuFBfnNLu2njwDm3YLunk
X-Gm-Gg: AfdE7cmSPGCHtiLoYE5uC8Vu5/DoU6vyvkYY20TbbVqvzVnaGF5plH/dmxb+mwqSzLh
	B7puQWGrJg7OkZWoyy6FHs22q2a7k3x5/fRGdyjvQzMx1ND4X6D3MmN+QvCEtQ7ietO1+1NT/Xb
	Wq4jvQFOrnZWF3TCBbN0oC4bp9ZMOs49NOneEFgKKGdglvhjQtqURIWGWKOTns6BNfg97Wnz93R
	q8aBPu6gl/x7y8jtpL9wC+OTe0H/croyDm/mvVjG6pwE8/D8V2e6OrI9A7u5a/FgOtTjz4n9nhR
	ruwkqfP8JNZwqRxJ1Q5CQWo77Kls5M5G2aRdZh9wTYa7pexPPPCqdgKAsc6XOMWmvCNCzH/9gTS
	HkiLJXLEMD7GRRfKc2coPYleCjbxgqn3FHPE2TS7FZVDqfvJSL5mQMUF8lzlhm78LOkHg0Bz6i/
	7g4r9WdJtPAa8QXs+7iOERtq8fL0ew8jkI2fhI
X-Received: by 2002:a05:690c:6306:b0:7e1:e20c:1e3e with SMTP id 00721157ae682-807ef91a515mr44538487b3.28.1782323413407;
        Wed, 24 Jun 2026 10:50:13 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm61339237b3.0.2026.06.24.10.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:50:13 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] misc: fastrpc: remove map before remote unmap
Date: Wed, 24 Jun 2026 19:49:32 +0200
Message-ID: <20260624174932.7419-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114380-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70C0E6C07CB

FASTRPC_IOCTL_MEM_UNMAP found a map under fl->lock, then dropped the lock.

It used that map until the DSP completed the unmap.

A second unmap can find the same map and race to fastrpc_map_put().

That can cause a use-after-free or double list deletion.

Remove the map from the lookup list before the remote unmap.

Reinsert it if the remote side reports an error.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 6a5239b1c..6ced210ca 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -365,7 +365,8 @@ static void fastrpc_free_map(struct kref *ref)
 
 	if (map->fl) {
 		spin_lock(&map->fl->lock);
-		list_del(&map->node);
+		if (!list_empty(&map->node))
+			list_del_init(&map->node);
 		spin_unlock(&map->fl->lock);
 		map->fl = NULL;
 	}
@@ -2064,6 +2065,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 	list_for_each_entry_safe(iter, m, &fl->maps, node) {
 		if ((req->fd < 0 || iter->fd == req->fd) && (iter->raddr == req->vaddr)) {
 			map = iter;
+			list_del_init(&map->node);
 			break;
 		}
 	}
@@ -2088,6 +2090,9 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 				      &args[0]);
 	if (err) {
 		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
 		return err;
 	}
 	fastrpc_map_put(map);
-- 
2.54.0


