Return-Path: <linux-arm-msm+bounces-107965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH8sO4NlB2qE1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:27:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747A5562DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD92831301C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 18:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4103F8EAE;
	Fri, 15 May 2026 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0iYix8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B930F7F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868510; cv=none; b=mobzijD30ecabKGiYVHMbAORyIxEFNnB9fUsi5bDib3GP/UbWJr/0GPnGw6yv4Gw6PnIUyyqiU2sSGBI2ep4q74Q55CYkl+ORwZrWK0NmKH7LdJURjgfoq2clVzR0ZIB44AqLWIGJnrjGyAjVeOS6rwqEJ2E185STuek435EmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868510; c=relaxed/simple;
	bh=uZ7ygsnr96oe6CK9wJ9zGBwa1AUV6F/q7+OBvaywCn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WNgePW5Ia/ITkWBhZzBPwvW9OD4GnuoAmOmSN2jlxY94QOgDXcwFiTqQC3/wIFhV6jjx5N3xkAHiZxsjkf5Hmplqwi1cHq54rSDAauKDPjGLpYKTqBQcMLvvHJTTtkDLDLkd8Todhw2o77ZrZoON6sjH0cwZlP0avvXoESXkuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0iYix8s; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd4f81505ccso6374866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778868507; x=1779473307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=la+O/bFtpnyaY0c5pxjy6SLIjk1Ilk22rZ0fIeKn2mA=;
        b=U0iYix8s4BlXPNZghhnrG2fXfB2g4UqzAjTJFPYT82FOcQ5WbjPVrMPQKmb1L9SjrK
         EO4omDBZ9OdpRa+vNTJfqWl1UXepKYlPSxTOJxeswmSu732E/5yzPGWzEfk2frDFmHVk
         p+C15GIfwSJcNevKfX+lUcUUzZkGWcQbfsfUeNNag0mom4c80kxLIIob/O5/twwQArpj
         J2ez2w9Kqh5PqYhcP22X0A9YX9+pWAK2gbat9rrFdbGgGqFR2gH9fyd7LNqBxwEix36H
         vnGo7CiMYVfgwKcOdWnJLxvxs4Gwg8UQRX6Ic06KonTylMPsFMpHf3T0vqJAD42DMMeA
         V2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868507; x=1779473307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la+O/bFtpnyaY0c5pxjy6SLIjk1Ilk22rZ0fIeKn2mA=;
        b=qTY8xgbInRU1Q2ttvVKc0E6TdkTh0lq3EkJWA5fvDjg51F5/wzN085Tk+d+kM4Vepg
         Go4fZtQkSLD5DThLhdbwmbcAH/y6PQrPtT20El/kqQb233qr44mYypDfi82L46gntBk+
         cuFitorEnkct3LNfVSHhDwJKAC5NDD2yC27B3hfFsH5wiY+PlS0lTKBtWrshgIauaS/z
         k0tYr/MldF2GdRFCX9YfN3UA1TSHkETOOak4AidN1lt4U8ixwus7NGnub8o25QCounIw
         s7YqqKrdR5CRcR5KCrunqD9xXCqXM2oR8lpe92jbt3WmTIM/m7POXqeinnuO0WUDZMlo
         59kw==
X-Forwarded-Encrypted: i=1; AFNElJ8dGTQE0oyr26JkwXexT+erVOOvlIpm6PFpVWnm+x+ZkyX5ETEsiKd/0cCUugusAtzKbhudPHq2Zx9Sh3Zn@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuuoS9CCY9H3RvOFlZ9zu/WIFN8c4XtgMdTCzUQE3WDbSSGnI
	4CzBGwuJ/3apJA0XaPVYJketbRpr+Tld3J7Mm2KOUel1187oJUD2o/M9
X-Gm-Gg: Acq92OG+Ri6pxyR21sHP+/HGhhPzFI9QwPl7S4BNJ2Fuiro3+rDGvOyP3MZsahjhdCJ
	hO2lhJ+AvOdQoODO9yI1NTGQD630X4c73wC0usNLoU5JnQwpefdTPJ8BS+m92PXXArwolJdW+T3
	5p4G1mEiF22yWIAz7rOx7WgXoWEOPXUotmJfkAQUBk+x83Qa5HCFtLmw8r/2lEh1RoMzXT5xj6T
	F5lDaxRkaR+AlZQA0dDjHEWwNkJhz4I4PkTFNtVHmMJm+tVj4wv9jmXZQFieB0rnqwS6cbFdgzv
	p34yAoPoH0d3IMZBlrPvwkFxlfMVC/jkaMC98Biao3zpkdN3WvjKKhXXQv9aWqGhaqg5Sb3Ckqt
	sXxCZM8b16HN/DnsaZrCb7VKzrOopDHfBFGPvq6BHZ1IxkfeTQ0cb8RcUYNGsunQLM/i1GmThBh
	V1ChrRXXq0whQ1S4oGJsUbpvlF4hD8YxJe
X-Received: by 2002:a17:906:6185:b0:bd0:6dbe:22b1 with SMTP id a640c23a62f3a-bd5177ec5dfmr278321866b.12.1778868506983;
        Fri, 15 May 2026 11:08:26 -0700 (PDT)
Received: from pc-oliwiera ([2a02:2a40:4bf0:bd00:6130:de6:bb7:addf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm263471566b.9.2026.05.15.11.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:08:26 -0700 (PDT)
From: Oli R <sigmatwojastara@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list),
	linux-crypto@vger.kernel.org (open list:AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER - DB...),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Oli R <sigmatwojastara@gmail.com>
Subject: [PATCH] treewide: replace /usr/bin/python3 shebangs with env python3
Date: Fri, 15 May 2026 20:07:59 +0200
Message-ID: <20260515180806.246914-1-sigmatwojastara@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9747A5562DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,amd.com,infradead.org,redhat.com,arm.com,linux.intel.com,google.com,intel.com,linaro.org,efficios.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmatwojastara@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Use /usr/bin/env python3 instead of hardcoded interpreter paths
to improve portability across environments where python3 is not
installed in /usr/bin.

No functional changes intended.

Signed-off-by: Oli R <sigmatwojastara@gmail.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py                     | 2 +-
 scripts/macro_checker.py                                        | 2 +-
 tools/crypto/ccp/dbc.py                                         | 2 +-
 tools/crypto/ccp/dbc_cli.py                                     | 2 +-
 tools/crypto/ccp/test_dbc.py                                    | 2 +-
 tools/perf/tests/shell/lib/perf_json_output_lint.py             | 2 +-
 .../selftests/devices/probe/test_discoverable_devices.py        | 2 +-
 tools/testing/selftests/rseq/rseq-slice-hist.py                 | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 2acad951f1e2..10316f517a7d 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Copyright © 2019-2024 Google, Inc.
 #
diff --git a/scripts/macro_checker.py b/scripts/macro_checker.py
index ba550982e98f..7dbb114a57d5 100755
--- a/scripts/macro_checker.py
+++ b/scripts/macro_checker.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 # Author: Julian Sun <sunjunchao2870@gmail.com>
 
diff --git a/tools/crypto/ccp/dbc.py b/tools/crypto/ccp/dbc.py
index 2b91415b1940..cd56a63aa8ce 100644
--- a/tools/crypto/ccp/dbc.py
+++ b/tools/crypto/ccp/dbc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
 import ctypes
diff --git a/tools/crypto/ccp/dbc_cli.py b/tools/crypto/ccp/dbc_cli.py
index bf52233fd038..bfe34f01e619 100755
--- a/tools/crypto/ccp/dbc_cli.py
+++ b/tools/crypto/ccp/dbc_cli.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 import argparse
 import binascii
diff --git a/tools/crypto/ccp/test_dbc.py b/tools/crypto/ccp/test_dbc.py
index bb0e671be96d..0ee3da6c6be7 100755
--- a/tools/crypto/ccp/test_dbc.py
+++ b/tools/crypto/ccp/test_dbc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 import unittest
 import os
diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/tools/perf/tests/shell/lib/perf_json_output_lint.py
index dafbde56cc76..dccafd507bb7 100644
--- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
+++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
 # Basic sanity check of perf JSON output as specified in the man page.
 
diff --git a/tools/testing/selftests/devices/probe/test_discoverable_devices.py b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
index d7a2bb91c807..72a94bbfbc7b 100755
--- a/tools/testing/selftests/devices/probe/test_discoverable_devices.py
+++ b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (c) 2023 Collabora Ltd
diff --git a/tools/testing/selftests/rseq/rseq-slice-hist.py b/tools/testing/selftests/rseq/rseq-slice-hist.py
index b7933eeaefb9..2c43b2e2bf0d 100644
--- a/tools/testing/selftests/rseq/rseq-slice-hist.py
+++ b/tools/testing/selftests/rseq/rseq-slice-hist.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 
 #
 # trace-cmd record -e hrtimer_start -e hrtimer_cancel -e hrtimer_expire_entry -- $cmd
-- 
2.54.0


