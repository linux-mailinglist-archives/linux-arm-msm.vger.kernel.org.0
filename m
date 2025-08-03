Return-Path: <linux-arm-msm+bounces-67517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88066B191C5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 05:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69303B8D7B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 03:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BA11386DA;
	Sun,  3 Aug 2025 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGHJ1LNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF8242D8D;
	Sun,  3 Aug 2025 03:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193514; cv=none; b=CL6RPRNG/cxKY2jMiyUe8v6PuUl1+qnYV+LT4UgQ4lQZt3dHUTLxFbB64/zU4RKb1TSlXvlIXI7k+Ac0k60bFlfheZv/7FV4DbDvSnhUS8ahS8AMVrK26z/FSwM7CEHNdK/NkgCVv55CKK4yU/i1x226RVBSh0JO8KXFK42RJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193514; c=relaxed/simple;
	bh=vCudJxKMdzkoU/DyEok0Rill822aXelf5qxnBmbRnRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZFz9ixFc7F1u6XqpNBSa+CKFmjkDIwytipKXs3x+jnsUscahaDdMa5zIfYm0zzV0DviJCbMaV4j10OT2coKfCQ7RkPCOKJPf9EfiiM52QIlUOqcdhkjZ8oxj4mb/f1ZEnXpLTqGPDrKCmkEM/u8X2n45yZNu2IyTIG7Wz36YaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGHJ1LNM; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e40050551bso23417345ab.2;
        Sat, 02 Aug 2025 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193512; x=1754798312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
        b=KGHJ1LNMQvk6zqXX4HCV3ryt85x0okiJkO5oSs52OyZ8s/H5i4gdXmcBMeCsNCssi+
         t6OgXpHgN1u5/Rk2LhKYMKFHBHn8vrHLt76K+bjtaDzyHFpZdVKRzPfCiYdw6mdrIUyw
         PMaszO9lXHYAFnpExlEAySXl7uTL1ltmmRlhWJ0B2HtzSUGJH3qlrdlfKrSSQX2SbP5y
         1eFJGBIpuJvJ+bnv+IyfVrFWJ3Y8BlmrJEocjjyGRf2PO6YoN//m20GgZ9U6bTRsY3ib
         1tFbyR6cIJQd91SrDQIxjmEEHVqXPJhY3Ps8jE8MPfXG5IYqUa9dK0+iWpu+zh4a1tI4
         U/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193512; x=1754798312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
        b=RwqEgePhkPXHuskNxHGQVgJX7ggVW4RosVQ4m/ajaxBES3/hmKfhIhPH7dtk44UbQR
         +ra1bVpF7TaIEGgDVm0TnLRJiaZdKDO7BOHEgPby4jSKo7txBMgjSN+MVoXB7OiRqfCz
         mxbFVgGGtngGn3lPgPIZx3Xf+TeRFxXlz68XoUTj+Lm/zWxwBCnEvuDRoCpObWHO/bh6
         e6ktMbXkAFRLA2Ie7lBd34PMYPxMIEQgtGGtBl+JJNGO5RX+gRPOttp4TM5+C1iUhGpA
         mvyuZ2drPpqDYTgrrIPyrttNXvldN5ZJQZE11kZJWdAiYxpJfEmu0Gv8zLWr5shF1gYV
         9lzA==
X-Forwarded-Encrypted: i=1; AJvYcCX3WsBGKLxCopjURhA3YkDvTwO3NdqYRJYZvK0C2spPYdAEy78FsoV/rJiD61tyv+tdpHx8n0drPuHoOMoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRYQoSi3lPYKKZTGKWB/AkdlN/Rl/9LsDeojMhXDP/5C2soFa
	98QK3RFaIs+Dts5G+VI04Sy4MXQ/p09ef0dkw6F3xLgDrPmwPAb0Y+HE2AS+CWx9PN0=
X-Gm-Gg: ASbGncsewpnwPIYQYvN8PeH/gXO++Z5hRlKDeEzWXASdSSlztVPXEOl4fodr1tnzLfZ
	5OnA+mPn7tWEl6kOUrll7eHjELWdUm2U+zqF/nHkCWou7iDdhWHsD3XUhipPlcg9xGLMjHR9P3B
	s8xKF+Xh9ZbY5FuISeE8cNIusd6G2BIwsn79dsiytYopBmbqrLgcBUzPK1p+xI/15l31EYJ0D2W
	oIbZKXkT9YbKNLjPCPzqAxynIEWr+ZjHiRXxGhMLns+9x6JarZIGe8OVDWiikb3VAX9QX4Z9wSU
	sgTXqKEyJavfoMxCrARAUTO6wGzL2W+q3F7vdRQ6iHMfXUhFsxoL0zvTd02zJnuKo5O0Qw9FJn6
	3sBHTw+tpuUKfF9NoUfhSAVH/lrbAaCSpBGutrY9lB1yPwfmROhCOc4yh4dcMkE/FZvqeafFGgg
	AAPg==
X-Google-Smtp-Source: AGHT+IGPxms8wwqy9B3Lg0t/TQmY+5ADcF8m62tHbLa+p0mv2IAzywY5OepZnyyKE5NE6pgPzLJclg==
X-Received: by 2002:a05:6e02:2608:b0:3e2:c345:17f2 with SMTP id e9e14a558f8ab-3e41610a08amr92075105ab.3.1754193511817;
        Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
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
Subject: [PATCH v4 01/58] docs/dyndbg: update examples \012 to \n
Date: Sat,  2 Aug 2025 21:57:19 -0600
Message-ID: <20250803035816.603405-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07c..4ac18c0a1d953 100644
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
2.50.1


