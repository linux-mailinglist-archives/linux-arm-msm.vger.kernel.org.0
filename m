Return-Path: <linux-arm-msm+bounces-86127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFCCD5132
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C64830528E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF09329E75;
	Mon, 22 Dec 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyktjyRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD4329E70
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391781; cv=none; b=MKIRLwqVLMv+7hmkiPcoPZv4HLIkj53bSUC8LHeboTWEDZQFLVMc52Bd0N8OaL4mCkphHg7A2xkb6Tf/Db1yEv+TeNBqol5owALDJiuJpDbRpLi0skIqxA1GvDe39Oj/txdaV066U1xarYjM7poEp2MocXSHWcwFPLKJ/iQd0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391781; c=relaxed/simple;
	bh=By5iwCjaEqa2McMnoS7WlZkqnzNV5abBOXrSsH3vz5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fchgoX6GspobZCy/v+23/ZG69w/47IdOipGcXyqtjDlMdQBfN7KAPOcTaI3o64j34+IjYyZU+IW/7pQpI02tCFYtDaZSLCg3FOiE4Q6dOkVSRRk1OWFSODFrakFfdOF/7x2lcMH19dcmD/Ylu7IJHwi3x9ognV8iC9EVr8IWD/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyktjyRQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3969012b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391779; x=1766996579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=lyktjyRQ7FA8WukW5/xalyree1izD8fkxf9MteBX3A9dRYKCYJqjD+xUY7sqN3wF9b
         EpqkwocMkqg04GxKyZ1VjVk1naOP90wIxbEFEhJqllHZhuCa0uxRQqIT4Tb7lZznxn+i
         tvrG9Cs1WWceWOvquZIFGQJ5IslOYcRs3+ihhKooNmxM6WQDAiOkEVjsoB0gttaUR8Bz
         GEPesrY9JXfqv/8Ev98wnOIQc6gHg6OtFjkaUEgKSHPl1Mwl1S5H9iSUqpJi3IJ309Y5
         a8IAwHmWRxQrTo6PPuoqtxmTYKkyzoAOsIzrHKa0PBnqZj8g+5KjtcBe3pVK1i5ya6+1
         RqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391779; x=1766996579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=ewvLBikcyCEneo1egLOFAgY5qK0GA3Wj9adjAp6McZWqIqD5J0uL/4UvfKwgvhr+u4
         MegW1BacD5wFl5ejMAFKty/HNk2txswDmmdZ/SVKqRLlvfHZT5ZDPJdl9s7jrbrainxt
         YIBMntSE7HAeSVv/luphj1OS2d8UqE5K57tv4+dlRmXVLrfRKcqJW9C3qHYmMWZ7qjZL
         JlTTED7J9ZZTqaTwTNNlrpL3PML7xpTUwc6O9LMJQ1oknWdq2FcDgxfbJro0OUdqVlls
         WmFBeifiqk1q8ljfSWcl1d2zkK+YWznBMN8gZ32XrNH30TF2CdA6Lqbp8nU2Nbkd6+DU
         OR2g==
X-Forwarded-Encrypted: i=1; AJvYcCVYnoPANXXNjVCiN5rISXAxApHRJ1+WMjpZdE6OuaGIeWEiYRuhWwch+LUxl052qE+UImkNPxtQS/fXHUAq@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrHVYYpoCIpEJJvDbouxnN1UaR6UQ6muDK3FSOhyrochNEQiq
	ImW8UcX0W2dAZZsotv8IEfaRUmexGxb8QmODqE97GLUaxwDdFIO6rJzk
X-Gm-Gg: AY/fxX7agJ9RXoDEM51ldHGtCmQcxD9myqz0qF128due55MvdopvSGQ5c/nANBfoabo
	UDeK4uDdX6o4EWpWmow4NnRUDLkpipIIW7Em0lMd8BW+QOyj3/M2qPw1x9yM4SRSWdhMo3Q42EI
	QmAhxbNT48fMy3YSNvZVLK17rR6L5EN2AvxwLTUSL2Y3lc8RhO9ZE3/ZjmOHk/GOBvLHymNz02n
	xDvlHts45Zd0pNMsRY+O90K+6N/R+Q04bf5y26v6+xZoGBaq4t8CyupUqyx8dntBxs3eum7F/HI
	lmR/1OpH+v970esGPXaNOqQmZ+NarMiMq+XuZfvlXjLUrv0pfRYS0w8UvU9sgmkV4j9KzuS5XxG
	BGmzPVmmNY0ZWMQIJGAJFMsDvfZukWBJytnFWPDJeTupKAgMlIUUotKYFMLx36GGjQchZRzCbx+
	UFR1iPKGmAtx7ce/BcVug=
X-Google-Smtp-Source: AGHT+IGPhjVEd8hFCFWSuzrJ6/8E9Tcr4jw08Ck32qa0ZVNPKd3V6Hm2f6vkNyl5Idf/bQen/LCS2Q==
X-Received: by 2002:a05:6a00:b902:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7ff642154b6mr9938622b3a.14.1766391779554;
        Mon, 22 Dec 2025 00:22:59 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Mon, 22 Dec 2025 21:20:26 +1300
Message-ID: <20251222082049.1782440-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0


