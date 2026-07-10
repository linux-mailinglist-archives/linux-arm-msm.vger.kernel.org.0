Return-Path: <linux-arm-msm+bounces-118236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2WXLLUTFUGpN4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:11:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2757397BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=E5301W6t;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B9B13001860
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D52A314D37;
	Fri, 10 Jul 2026 10:06:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C34028CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:06:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678006; cv=none; b=XESZNk8EBRhjDHXSmnmyQlwlLuxTIoxhi8zW8yMp/BMrrWL9aTV8oi6xZq9ip3pX+QAWZe8+UDd4Kl34WrEG9B+vPbjhfrf9WQGUQKvtuRALnaD2+4Nw0xmjdhbr2IoiSWu3vuxdUryUNkxC2SUOENrTUTp7+E8/5xcuChvIhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678006; c=relaxed/simple;
	bh=OHeQBKLU7Wl5dB7AgxWq3rCkCzuqCpatvDXPwhLwL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn+rwvQ5qMdxKVG6TgE+cLclGFHt8PasUHGoFVbJ5626aPe4huAF0hhKpH0T3G+eDG9J4lo7cQEAsf36Xuw+bg2tlaj1JIEC1/FZ/hxV8RHD3aCs29lkBhD0z4E7paEHox+KKz81wxYh8+YgUIYQIi6HainCIz01ZZLSR63+HRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5301W6t; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783678004; x=1815214004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OHeQBKLU7Wl5dB7AgxWq3rCkCzuqCpatvDXPwhLwL/I=;
  b=E5301W6tm1BontTAqh9ty/wSwvi9u9fetBzWY6QNzCnSacamgTrXjCFW
   4fhSYRKkAU0vyaUwivmcWJw0/Fbfz3w0+cPmfulrFv8xTMf9ya4IJ+FUs
   6JIPcv/wr4OTpdx7U/2uJGrAlf7HjNpcsJd08pEA6/N6C8zYrVP+aQGNA
   nrF5o21A23cWgyAA91nu1gAUfLP141730OVACV5GUse3Rl1ijCierJ0bY
   aU8oqLaFau305jfwJL1iDnV3yv0i6+U6gowZyG6WU99CQuhevqHrofBb1
   QsenyqeqNsHBPiKD51b0qQtC9bVdJsFA/OKia6K8MVO2rqn84jKjlca9p
   Q==;
X-CSE-ConnectionGUID: vc2ReiAgTz2zPrBUrrKavA==
X-CSE-MsgGUID: fqbOafCJSXe+08MUqR6uUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95528812"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95528812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:06:44 -0700
X-CSE-ConnectionGUID: jlXg6/e7RcuVIcN7IqqIbQ==
X-CSE-MsgGUID: h0dHgIYnR5KU3F4t8zjQiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251487830"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:06:42 -0700
Date: Fri, 10 Jul 2026 12:06:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] tests/msm: Add perfcntrs test
Message-ID: <20260710100639.xrdyl6lbiidsgvjj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
References: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
 <20260708161224.507091-3-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708161224.507091-3-rob.clark@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118236-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kamil.konieczny@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:igt-dev@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamil.konieczny@linux.intel.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:from_mime,kamilkon-DESK.igk.intel.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC2757397BF

Hi Rob,
On 2026-07-08 at 09:12:24 -0700, Rob Clark wrote:
> Add tests for new PERFCNTR_CONFIG ioctl.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> ---
>  tests/msm/meson.build     |   1 +
>  tests/msm/msm_perfcntrs.c | 196 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 197 insertions(+)
>  create mode 100644 tests/msm/msm_perfcntrs.c
> 
> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> index 2ba5b4db2279..0a7f35662c03 100644
> --- a/tests/msm/meson.build
> +++ b/tests/msm/meson.build
> @@ -1,6 +1,7 @@
>  msm_progs = [
>  	'msm_bo',
>  	'msm_mapping',
> +	'msm_perfcntrs',
>  	'msm_recovery',
>  	'msm_shrink',
>  	'msm_submit',
> diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
> new file mode 100644
> index 000000000000..42f77456939e
> --- /dev/null
> +++ b/tests/msm/msm_perfcntrs.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <errno.h>
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_msm.h"
> +#include "msm_drm.h"
> +
> +static int
> +__configure_counters(struct msm_device *dev, bool global, unsigned nr_groups,
> +		     const char **groups, unsigned count)
> +{
> +	uint32_t countables[count];
> +	struct drm_msm_perfcntr_group group[nr_groups];
> +	struct drm_msm_perfcntr_config req = {
> +		.flags = global ? MSM_PERFCNTR_STREAM : 0,
> +		.nr_groups = nr_groups,
> +		.groups = VOID2U64(group),
> +		.period = global ? NSEC_PER_SEC : 0,
> +		.bufsz_shift = global ? 10 : 0,
> +		.group_stride = sizeof(struct drm_msm_perfcntr_group),
> +	};
> +
> +	memset(group, 0, sizeof(group));
> +	/* selecting countable 0 for each counter is fine: */
> +	memset(countables, 0, sizeof(countables));
> +
> +	for (unsigned i = 0; i < nr_groups; i++) {

checkpatch suggest using 'unsigned int'.

> +		strcpy(group[i].group_name, groups[i]);
> +		group[i].nr_countables = count;
> +		group[i].countables = global ? VOID2U64(countables) : 0;
> +	}
> +
> +	return drmIoctl(dev->fd, DRM_IOCTL_MSM_PERFCNTR_CONFIG, &req);
> +}
> +
> +static int
> +configure_counters(struct msm_device *dev, bool global, unsigned count)
> +{
> +	/* CP group is present on all gens.. SP would be another good candidate */
> +	const char *groups[] = {"CP"};
> +	return __configure_counters(dev, global, 1, groups, count);
> +}
> +
> +static unsigned
> +get_available_counters(struct msm_device *dev, bool global)
> +{
> +	for (unsigned i = 0; ; i++) {
> +		int ret = configure_counters(dev, global, i + 1);
> +		igt_warn("%u: ret=%d\n", i, ret);

Why warn here? It will make your test fail, imho you should use
igt_info() instead.

> +		if (ret < 0)
> +			return i;

and this imho:
		if (ret < 0) {
			igt_warn("Unexpected error\n");
			return i;
		}

> +		if (global)
> +			close(ret);
> +	}
> +}
> +
> +

One newline is enough.

I will merge this as is with whitespace/style fixes with the help
of checkpatch.pl --fix-inplace. If you want improve test with
above s/warn/info/ please send a fix.

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +int igt_main()
> +{
> +	/* device instance for global counter collection: */
> +	struct msm_device *dev_global = NULL;
> +	/* device instances for local counter reservation: */
> +	struct msm_device *dev_local_1 = NULL;
> +	struct msm_device *dev_local_2 = NULL;
> +	unsigned num_counters;
> +
> +	igt_fixture() {
> +		dev_global = igt_msm_dev_open();
> +		dev_local_1 = igt_msm_dev_open();
> +		dev_local_2 = igt_msm_dev_open();
> +
> +		num_counters = get_available_counters(dev_global, true);
> +		igt_info("num_counters=%u\n", num_counters);
> +	}
> +
> +	igt_describe("Multiple process should be able to reserve the same "
> +		     "counters for local counter collection");
> +	igt_subtest("perfcntrs-local-coexist") {
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_counters));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_counters));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +		configure_counters(dev_local_2, false, 0);
> +	}
> +
> +	igt_describe("non-conflict global and local counters");
> +	igt_subtest("perfcntrs-non-conflict-global-local") {
> +		int num_local = num_counters - 2;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +		close(stream_fd);
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +		configure_counters(dev_local_2, false, 0);
> +	}
> +
> +	igt_describe("conflict, local first");
> +	igt_subtest("conflict-local-first") {
> +		int num_local = num_counters - 1;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lt(stream_fd, 0);
> +
> +		/* release the reservation for dev_local_1: */
> +		configure_counters(dev_local_1, false, 0);
> +
> +		/* should still fail: */
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lt(stream_fd, 0);
> +
> +		/* release the reservation for dev_local_2: */
> +		configure_counters(dev_local_2, false, 0);
> +
> +		/* now should succeed: */
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +		close(stream_fd);
> +	}
> +
> +	igt_describe("conflict, global first");
> +	igt_subtest("conflict-global-first") {
> +		int num_local = num_counters - 1;
> +		int stream_fd;
> +
> +		igt_require(num_counters > 2);
> +
> +		stream_fd = configure_counters(dev_global, true, 2);
> +		igt_assert_lte(0, stream_fd);
> +
> +		/* Should fail because two counters already allocated for global collection: */
> +		igt_assert_neq(0, configure_counters(dev_local_1, false, num_local));
> +
> +		/* release global counters: */
> +		close(stream_fd);
> +
> +		/* Now reservation should succeed: */
> +		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_describe("multiple groups");
> +	igt_subtest("multiple-groups") {
> +		const char *groups[] = {"CP", "SP"};
> +
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_eq(0,
> +			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_describe("duplicate groups");
> +	igt_subtest("duplicate-groups") {
> +		const char *groups[] = {"CP", "CP"};
> +
> +		igt_require(num_counters > 0);
> +
> +		igt_assert_neq(0,
> +			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
> +
> +		/* release the reservations: */
> +		configure_counters(dev_local_1, false, 0);
> +	}
> +
> +	igt_fixture() {
> +		igt_msm_dev_close(dev_global);
> +		igt_msm_dev_close(dev_local_1);
> +		igt_msm_dev_close(dev_local_2);
> +	}
> +}
> -- 
> 2.55.0
> 

