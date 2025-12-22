Return-Path: <linux-arm-msm+bounces-86122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D8CD50F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962F83011A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510B33161BC;
	Mon, 22 Dec 2025 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJXpRmsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E93161A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391723; cv=none; b=dwrWkIp2+Hy44fzlQwtZbN0O4vLwsoGoO9X1Wj7xx0bqNL1i5Wymc7XnOv3hdlZgT5QJ5exJZIbeuwfT1DrWNEtkr3ZkMpO/9LVphKj/ASeux75CFEpllhVlXzcL83xpeB2RCE3L/Pk1K2mYK3x69gzgBwVO0YT7EuRJjHx29lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391723; c=relaxed/simple;
	bh=EqxGeITc2UKYaMAzZMDYQfg02UCHl3X6FUpCJ4R9urE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2+DhpjbDy115aFIomWGE9Qu2OFeV5POKTQZsj8DHG1z7tUUKVPjHj1xmtKiSJXaDWJVqZZ+FMFukWP6JzjVCfFD9PA40LA1UJiJguJ4hejLMxZmfYGyzyC2a9Y/5xO9+Nv2pKMHq91Xe6yOGp9XHORYdcW+XN9ylLhhNByP4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJXpRmsj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3689412b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391721; x=1766996521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=eJXpRmsjLS3VyGb8byupvVr5yTocjvkDkbcR3XuO6rdwDL7aCCy0Hg4jHwQOjjgmJ6
         oWJ15u6kkZhZUdF3NyqIqTAa6BVl5RYexz5XbXRbemf6AZqctZD2x5aosKb44UpMSXJM
         xZ/sYgWGEQjd9nRs9VJJ8X+jnsEhoSBzgE80MXKDCfOPvvfKhJGskO+m/I6hYmqpvrMx
         GLBuDeR2oJqueRHPKUoA+13rfESg7uvJ/sL958TEmv0nSijITW1TYTvQRXJB98WKAod/
         UBBucn1bWWIxxYIlUms7Aj5/jVlmeF0iL4i82SPWK0SssLsBVU/hzxZwqJ4/OVPjVFu2
         ADow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391721; x=1766996521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=Hab9oPTXyty/mwhtNSWVG2EgpOYdlmhPwgBENN5x5BNatbOKTMGW4nu7f16fO1lGqv
         IazkFPhMObBvsAsGgyEjOfn6+icFyZ3KMj0SIbsPilWApOMFQ73Jb9bSKQgsiHvE3Xtn
         rlPQ89zZyOcN1hxJAq+4KWZ2u88CdkOstxPu59oVZr95+N068jL1jTAT4n5g/8k5QGXC
         ZCpQx9ood3w22HlXLXAOZTB2GxK8GZwY7CWy2KXBl68tzYDLBIiIVDhH0l/sJQqkYfaC
         yOgZTsfkJYxc5IddIkyGQYr9M51UBDhkf9T92MEomxtlesYMOBZ+rB62ggXib/ABUv82
         0qGw==
X-Forwarded-Encrypted: i=1; AJvYcCUYxGMOWZlH9trxCAPUVGG4jbCB556GvnR/Aa8f1XfVvwkgNEFCUPw4iIAwSi8VO3IY6aCGSD1T9cogiAme@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlVMZ9oAEDw8GJ2JPRgMFqMOI7HSjz3yjzZ9HBH3AzOfEYpEm
	S7GNtzCcEzrPOJbldc9O4royoHhqdcoerFED5xPPqkdziRkLs7g7kry8
X-Gm-Gg: AY/fxX7CY2G496XAiT7DjE4W1wTD9CtwzxbzlI6/Mv6AQw3JiQjwfmw2zdYgStFuomS
	F0M+Zq4HpbA4aHSsUImEjON7fO6+KKHErHgIrGDMkeT5kNPCbzlDRvkyUdTOE0sEsFOjdkFo6ju
	SNbliXEbJ8gABKA4wYKFJVWrdpBFK5GunxSLPtgSrV2bMtEQMF/jByqN0+QPqDvSa4Wnvb5TR95
	nYIrUtMcPgRAVhnD0zhBAIcYqnNSpp8l7WFBqAFiAyAJ5E2ZudQoaDCW9fuWqoGYQNB43lQ7Njt
	q7CTSUlTW1pMFsgxYw5GRBcFe7v+6MbU2UCTMFYzGAvv4V/pP/f8zO65emNMEg71kdqvejO028D
	ReMxclGVQx+K1lcF9WijwyA812bEn8WdEcpdzzem2cxfMEv+RaFYe44eMJUzzMRWoq3ZQh/epoC
	jHJLHlONO2
X-Google-Smtp-Source: AGHT+IG3eUuB5Tb1s+Zs70IjrZagHo/mf8fIHvmKfCB1AS8Rh4HCdjBPUwGbrg6oNBn8UN6DCsv0tQ==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr10043630b3a.27.1766391721087;
        Mon, 22 Dec 2025 00:22:01 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:00 -0800 (PST)
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
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 04/31] docs/dyndbg: explain flags parse 1st
Date: Mon, 22 Dec 2025 21:20:21 +1300
Message-ID: <20251222082049.1782440-5-jim.cromie@gmail.com>
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0


