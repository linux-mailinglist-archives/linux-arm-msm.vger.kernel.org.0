Return-Path: <linux-arm-msm+bounces-86121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD02CD512F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E899A304FFE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9E62522A7;
	Mon, 22 Dec 2025 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV2R04jI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF92F99BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391703; cv=none; b=rjba+zNSm3JhsdGgalH54REAefsSxFYfMHw/iJsrLnaNxtSyErPFlSIcvHHAzUU2PbAg+s34Ssc9IXTIYaaJE9C5BxGQFP6qzbHrzx4bnBJ65zuXntQgBoBqd81a8EjTXc30wD4ovrVAInEtkwVa3vcLvqQs08bJuNZaw0TEzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391703; c=relaxed/simple;
	bh=Dl6cNQBg3u7SGfQmdKJXxn3my2NuuDbw75ihDoc9xW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzbyKECb+d+FUSw1yf5h0C7DiMjLp714EAErZjgAkTrDVv75fS+3FW//IgwwU8E/0K1r/oxtyVGExWK0b5apdQtCHUkpmCxph+F90UTWXrfKJbeZgYOLDRpI9QRv6t/M4XNfa8uY3ECB4F4HcGKt3SESRY/nI3OpWthrpSe2jVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV2R04jI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2862760b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391699; x=1766996499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=LV2R04jINREh1Okw2I106DJlrnuKeUfPQ8xX8uTneaYLWhodNLQmUoBhSuYVD7OU5r
         FblkIXBIL4fXc/TnQs4wG1FbL4plkh+j2yy7MIL6Ih3HTIqCQNqYTU0Avx4GxRmYxb3m
         P9OT7ptDq2Fov37m0+4c8J34MpwTZLyASn5yhhPxOXJiscYTlD8hTP9QvLWvKyrl/+LD
         nihPTmqVZb6oYCXWc3oHoetw069Mr9HHytysgXq1ZOyZpLRLfFojuroxOyGjwZS/s7TR
         u3sDVPxuLsr2PhLYCvnIl5g19nN3Jrlxb0teVhYzOx1M4MKXZ0GNIacCtx+rJyUpetMr
         E/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391699; x=1766996499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oa5wcVDeV5J5v7vkbrVOxP4Roi/4nUDRF2hheke3WoM=;
        b=HcUKHyJtzGNi+51PPvkBf8TVdalyjo2lpHqWE6iTv1onQzkN2taQk93bct9Gyy70pI
         uyaQGCFtTksydWDoHaa4KiVrFrZDQR+sxJ5vk2d1zMdIKhFwao3oykIpey9Druo6BybD
         ZCVICMW/4NpTjTOerFa9BMJXgBDH+/1zVn3KwqMur+k9dxWtyVcVoXH0bSgJlRYxtcRj
         oCgWQXQqI/Z4cfumSTJWX1tdJAQpk7m+1b2tlpPPNKLHlDwZA4e74i18wLi9Eu5N5B+Q
         eJlGkxAOl9UNnISCjdzp6vOoC62MOkjKbCqhDCXTmzRQvTYhMyqSmjIRLrQ3XZuuF8Jt
         tXiw==
X-Forwarded-Encrypted: i=1; AJvYcCWA0n/e8HvqsbDl5WVZDVScHaVkH+MDWRCe6Du7ixkIe41XHcxbhzhb9OyLuZpiDBaDQPy+y3WTT2mnLwgs@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqfvLivNzv/4hZ60elL7mibqj3eL3qpSBBBZY82O44bFXDIb/
	4cOAMk+RuEmppECJwrU68Edgj/9tLmyFv6nO/sU53UJSMBJHp7Af6eMW
X-Gm-Gg: AY/fxX4VSXzVmUZ8N32zZ6+pMVF2jM3IWMCngJySKgSsUhxn5rr1WPCcgsSW/X+AMLW
	TIScer10vm/tNEndIit0YiOW4Uqr3gRhIgp+wItw2gKjHww4wErDNURZ8S9MJFAwKFzXEs7JIW9
	ogb2tzB0RoCU6WFxiitWVg90kkWWDz+BjqT8wME+QwnLwvkX5c4IykynVwZA4VIGQab7867f4Vg
	HUzDDkq/qxIVyNqZmSked4l1OQJ+X5Sl30zPvt1ixqQ+T7+w4/jx5eUr/7iG3tfPcnW9dUQxutu
	3xgW0Eyu0ZZsnvcKg+RqH7Ib1B+XsxhvgwpXzEj9Z3LPduO/XKRsshseOJb3JzffcbSPKt25C5N
	Vr6VzgTK3HGKPk2TqIWERtyvai6FP4aY8o100mE9jQHxkLktH0/FxYHEVXoULjFLm2P2yCLsDCY
	V+KxXDyCXA
X-Google-Smtp-Source: AGHT+IGcO+eahZ8Qfw1ltSxeW3EKuc0v2WQb9oj5sDZDssHMRosJcxJCeuE1JFMWMkIMkTP6ZaGDLg==
X-Received: by 2002:a05:6a00:300a:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-7ff65b89e90mr9317037b3a.31.1766391699395;
        Mon, 22 Dec 2025 00:21:39 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:21:38 -0800 (PST)
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
Subject: [PATCH v7 03/31] docs/dyndbg: update examples \012 to \n
Date: Mon, 22 Dec 2025 21:20:20 +1300
Message-ID: <20251222082049.1782440-4-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.52.0


