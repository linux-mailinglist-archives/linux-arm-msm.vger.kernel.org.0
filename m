Return-Path: <linux-arm-msm+bounces-109766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHUOEOFyFWpbVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:16:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A122D5D4058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAFC63011F36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B093DA7EC;
	Tue, 26 May 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2oH35fR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD73D88F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790430; cv=none; b=INqdH53UfTiYuCLFCA8un2Hhe5qUaxJ+1k4eb5BWHSK2DNIEGR2cCFxvwEZaSShgB/vhiv4qzVVR4ei+KT/3GKYoT9f+Eusa9Lu4NXXq1bORBqVWtHukMfTkyWQ3fNAvom2CBbCgQzgc/w4m45Q5J/xHWa4OPQwuNbjamkwI9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790430; c=relaxed/simple;
	bh=KXT/1Fv2vY0qBQ7YZK5oezitLYF7NkVwsvmVEqkWBO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WERg8e3306JSW/AcXx1v1aZWkVXHUg5fymXpr0zuMCGEF56tB7mU3KLKFO16TMXQt6j/RR/CXLHmA/X4Bk3z6s2AjHfI+xJNq0K7RYtbP0ELFUxDYtpRTLKrZI2wYpcFEWZ8uCTQsvmqu9BbBpPiQrPynDSRN1sCPqy/oCkmcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2oH35fR; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2bd80b3aa13so68513265ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779790428; x=1780395228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KBjmr3Y0cox1kEm+tLFbRCL7MwnXyOCgIUHcX8wJ3Dw=;
        b=c2oH35fRiBpcAIXTNOXARIz2+o13wuZzkGVxdUUjwYGM840QbKLeQQvyyNG2hu0Lzt
         F76s19K9ujP9+0UWLPV9GwMsDyS6XTc3vEXR1EwKOl6nKFEpb7h92tXUnZFHcGFGx7E4
         iOMhvBRsXH55wajS7giugMRZqOSd2VGeIRJktM9Q8x8QfXe0q2r4lawwSFhd1LhtpB6j
         7IX/tNmVXuIHkcvXElgvnLeYw6YcHyVBrlmjDt+574MCsdIKOocAi9Mmb973jjeyUc75
         t96IO3B0aTyJtKTelccScptnb/U5eccuOO+dJFNbXKN2fRRKsYbVcDBBQ97t0xCRBpnl
         01aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790428; x=1780395228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBjmr3Y0cox1kEm+tLFbRCL7MwnXyOCgIUHcX8wJ3Dw=;
        b=jPEqn6nai5G6SuDqii0YEn+WxrtlyneRXk+sQlkHBVoikUHW6I5AwuHB+lBbog4Lxi
         e5dYyQxhyNpFq21Z4KVn6uH76Ucux1RAGqCFfzTYOuk3+jz/z1M0Igh5FSGAOsvi84X8
         5v8yq7JJlUjJzwBlFOAltdgALVx7SymySeURuY9B8pqb0fmeuwDJ3XwR5vCw/J4CEome
         Seb6hk3uX6jDcRQ+tZJk+kEKwCO4+4qqRc0rnA1f/DCRYMxgzWOCMPBB8psexqOCoQXZ
         R+wgrjiS1sKpP+2e5K5hm8A30XicHafYhRK+TMmN3wT/EVse0bueoh4S7xAy56+D2jjg
         1d+g==
X-Gm-Message-State: AOJu0YzVUwiHIu5CW1563zXhlcfBZ5NDNlVN93YG8P2T8QBe6qgvyXM0
	6HGDIiHPIIQOqX1M8UmsO4ldEUN4zccMUuxJ0iU9yXVAK8jBVTUvlK2p
X-Gm-Gg: Acq92OEhOAnD5ejI7jnY6USRDLq+wIdqY+uW2189LrGPgbkfSmvslmZA/PR1+qdCqQl
	qFcZMHm2mzOZvnmuU0c85glU0Sl9rsaPppKGS4IXIboOIe7T30dpge3oFQqXYmRNgXXpkK+xuDD
	7BLk3XBxoZxQgSVDhwNere0OLZwxFfmy97Ty2PldKpocOuBNfPTrc6Ck5adT61uJwM9DBLS6v9L
	mSaovvLEjHI5fwKlDmlVsjVcIOGI6BWV+qjGnGhmADAbv0Q1INUB3fru29xiZIRpPlFMMmj8YZw
	xpc9sPtA/OgZ2fj6vgiMm4WyYVAcpkAM3wHIH2cuO9v5OgTUuoHqt1kaQS4XMq4upLQmcYkzy17
	He/bwF+KObdfBoyUTkcE/H0p51OceHtfODDQ3YG3mv7si0OYrBbfMtcaHZoXZstTl/yR3/YE2gH
	y7gDhxdw2Qz4QSi5rMkpgzUH4GjwH/i8xm2tiWgAhpNbv7FKODTuMLiL/LMjGm
X-Received: by 2002:a17:903:2b05:b0:2b2:a267:784a with SMTP id d9443c01a7336-2beb07ba97dmr190764605ad.24.1779790428256;
        Tue, 26 May 2026 03:13:48 -0700 (PDT)
Received: from KIPREYXIAO-MC2.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ba00csm122517375ad.22.2026.05.26.03.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 03:13:47 -0700 (PDT)
From: Zhenghang Xiao <kipreyyy@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Zhenghang Xiao <kipreyyy@gmail.com>
Subject: [PATCH misc] misc: fastrpc: fix use-after-free race in fastrpc_map_create
Date: Tue, 26 May 2026 18:13:43 +0800
Message-ID: <20260526101343.44838-1-kipreyyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109766-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kipreyyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A122D5D4058
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fastrpc_map_lookup returns a raw pointer after releasing fl->lock. The
caller fastrpc_map_create then calls fastrpc_map_get (kref_get_unless_zero)
on this unprotected pointer. A concurrent MEM_UNMAP can free the map
between the lock release and the kref operation, resulting in a
use-after-free on the freed slab object.

Restore the take_ref parameter to fastrpc_map_lookup so the reference
is acquired atomically under fl->lock before the pointer is exposed to
the caller.

Fixes: 10df039834f8 ("misc: fastrpc: Skip reference for DMA handles")
Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
---
 drivers/misc/fastrpc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..123aa6f217ed 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -386,7 +386,7 @@ static int fastrpc_map_get(struct fastrpc_map *map)
 
 
 static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
-			    struct fastrpc_map **ppmap)
+			    struct fastrpc_map **ppmap, bool take_ref)
 {
 	struct fastrpc_map *map = NULL;
 	struct dma_buf *buf;
@@ -401,6 +401,12 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 		if (map->fd != fd || map->buf != buf)
 			continue;
 
+		if (take_ref) {
+			ret = fastrpc_map_get(map);
+			if (ret)
+				break;
+		}
+
 		*ppmap = map;
 		ret = 0;
 		break;
@@ -871,19 +877,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 			      u64 len, u32 attr, struct fastrpc_map **ppmap)
 {
-	struct fastrpc_session_ctx *sess = fl->sctx;
-	int err = 0;
-
-	if (!fastrpc_map_lookup(fl, fd, ppmap)) {
-		if (!fastrpc_map_get(*ppmap))
-			return 0;
-		dev_dbg(sess->dev, "%s: Failed to get map fd=%d\n",
-			__func__, fd);
-	}
-
-	err = fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
+		return 0;
 
-	return err;
+	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
 }
 
 /*
@@ -1153,7 +1150,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.50.1 (Apple Git-155)


