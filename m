Return-Path: <linux-arm-msm+bounces-108301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IHKHjmoC2oGKwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 02:00:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DC57552C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 02:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0908F301AAB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32FB33A9F3;
	Mon, 18 May 2026 23:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR7d5+u1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A226738C;
	Mon, 18 May 2026 23:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148512; cv=none; b=MQVbrDzB5sYcI/wDCwbOzk2+CmHSnbqNbbhNw0X1hunjU40DZGqAFCjNgvppz5Rq+5cz4IzKiRgIfC3BwmSSUFgkgSvinDFI2BQW6ji3g7pVJuvPiNslyclSqQAy/TijJrYQJEsAo/UHNBG7I+5YqtMvyw7cM5l3AdHfRDn2Jv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148512; c=relaxed/simple;
	bh=Oq+gnuMQRWjKoACeXqW8Y4zLGstl6ODlk5GgQd7tCZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dQoyK2eeDoUkaAQ8iWAzQrtNIe88OGhXX9594AwnWIhkYxZIwEeuFv3VpGpe8j6NzFW8l1E8Sk3R/3MiZbI3W6AOvwSXcbj/b+OrQMutzJ6pXcmqsc0Xsp2YDaNAPI2VJX/N2gzRbail5UMwLTmefCCOt39pTxUqEvIwB6Zd7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR7d5+u1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81D7C2BCB7;
	Mon, 18 May 2026 23:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779148512;
	bh=Oq+gnuMQRWjKoACeXqW8Y4zLGstl6ODlk5GgQd7tCZ8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SR7d5+u17pNQYr8ELcR1xR6JkyTOzTM7GiEFnfi8yqYX6yxpe+CXZdjyY770E8O5q
	 3h1r06qdamKnBL5bVPZYGdpEbdDkH47F+T88CHYxX3Y+iNTmdg7jZdBPVebyI6RkZk
	 gNR5jWYEmalMXgdnSOEXSwBKOoyHVUUwPculI94XbhrvNK3/AUMNKGVP3vlfwpFZhr
	 Wg8YsIC0Qa6lB+Uy4DD84inuaBjXqED4JVElgKDBkc4MMd7TSpyCzUwBgZnF9cDb4k
	 SRCQaJmL4M1LiMW5hsE55y5GtoZgnVIs5133RoHmzam32zoMsljjxPSWRY3BHwB3/g
	 TUvzofbsc8PrA==
Message-ID: <097fe9ea-bd19-4aec-a854-f00b050603a6@kernel.org>
Date: Mon, 18 May 2026 18:55:08 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: replace /usr/bin/python3 shebangs with env
 python3
Content-Language: en-US
To: Oli R <sigmatwojastara@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <freedreno@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER - DB..."
 <linux-crypto@vger.kernel.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260515180806.246914-1-sigmatwojastara@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260515180806.246914-1-sigmatwojastara@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,infradead.org,redhat.com,arm.com,linux.intel.com,google.com,intel.com,linaro.org,efficios.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-108301-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7C8DC57552C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/15/26 13:07, Oli R wrote:
> Use /usr/bin/env python3 instead of hardcoded interpreter paths
> to improve portability across environments where python3 is not
> installed in /usr/bin.
> 
> No functional changes intended.
> 
> Signed-off-by: Oli R <sigmatwojastara@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org) (tools/crypto/ccp)
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py                     | 2 +-
>   scripts/macro_checker.py                                        | 2 +-
>   tools/crypto/ccp/dbc.py                                         | 2 +-
>   tools/crypto/ccp/dbc_cli.py                                     | 2 +-
>   tools/crypto/ccp/test_dbc.py                                    | 2 +-
>   tools/perf/tests/shell/lib/perf_json_output_lint.py             | 2 +-
>   .../selftests/devices/probe/test_discoverable_devices.py        | 2 +-
>   tools/testing/selftests/rseq/rseq-slice-hist.py                 | 2 +-
>   8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index 2acad951f1e2..10316f517a7d 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   #
>   # Copyright © 2019-2024 Google, Inc.
>   #
> diff --git a/scripts/macro_checker.py b/scripts/macro_checker.py
> index ba550982e98f..7dbb114a57d5 100755
> --- a/scripts/macro_checker.py
> +++ b/scripts/macro_checker.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: GPL-2.0
>   # Author: Julian Sun <sunjunchao2870@gmail.com>
>   
> diff --git a/tools/crypto/ccp/dbc.py b/tools/crypto/ccp/dbc.py
> index 2b91415b1940..cd56a63aa8ce 100644
> --- a/tools/crypto/ccp/dbc.py
> +++ b/tools/crypto/ccp/dbc.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: GPL-2.0
>   
>   import ctypes
> diff --git a/tools/crypto/ccp/dbc_cli.py b/tools/crypto/ccp/dbc_cli.py
> index bf52233fd038..bfe34f01e619 100755
> --- a/tools/crypto/ccp/dbc_cli.py
> +++ b/tools/crypto/ccp/dbc_cli.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: GPL-2.0
>   import argparse
>   import binascii
> diff --git a/tools/crypto/ccp/test_dbc.py b/tools/crypto/ccp/test_dbc.py
> index bb0e671be96d..0ee3da6c6be7 100755
> --- a/tools/crypto/ccp/test_dbc.py
> +++ b/tools/crypto/ccp/test_dbc.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: GPL-2.0
>   import unittest
>   import os
> diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/tools/perf/tests/shell/lib/perf_json_output_lint.py
> index dafbde56cc76..dccafd507bb7 100644
> --- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
> +++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
>   # Basic sanity check of perf JSON output as specified in the man page.
>   
> diff --git a/tools/testing/selftests/devices/probe/test_discoverable_devices.py b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
> index d7a2bb91c807..72a94bbfbc7b 100755
> --- a/tools/testing/selftests/devices/probe/test_discoverable_devices.py
> +++ b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   # SPDX-License-Identifier: GPL-2.0
>   #
>   # Copyright (c) 2023 Collabora Ltd
> diff --git a/tools/testing/selftests/rseq/rseq-slice-hist.py b/tools/testing/selftests/rseq/rseq-slice-hist.py
> index b7933eeaefb9..2c43b2e2bf0d 100644
> --- a/tools/testing/selftests/rseq/rseq-slice-hist.py
> +++ b/tools/testing/selftests/rseq/rseq-slice-hist.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python3
> +#!/usr/bin/env python3
>   
>   #
>   # trace-cmd record -e hrtimer_start -e hrtimer_cancel -e hrtimer_expire_entry -- $cmd


