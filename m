Return-Path: <linux-arm-msm+bounces-63320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A1AF0CC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A444E1D86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 07:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F7E225A31;
	Wed,  2 Jul 2025 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Co/npETZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71396219E8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441974; cv=none; b=h3iu+IsY3sDC3u33JYonwQxdMuY9QfMS+qwXZrdz1iT19w8HCwwu+EAdY2C4jdAzu6GAwbiWg2pcKeu/0gpKuDo+kDZtyrUX3+3+X3srVKs5oUhWWgZ9aqNbJS5pIeXIPlUkt9QXbUqzwJsqh/V8AtJFzNF0/n9C9KMcCpBYcmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441974; c=relaxed/simple;
	bh=FMb3Uw5o+MNP/yfpYDdRJ10lMOZDI4vBOq65zrvw6lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZenrZ1dRZSDjbV9BoyKcTqdb5PzDSshSqVh/V4ONXG/a7evooUIAEcZsXbiBYkQTTFRWwb40rox8vw2KDdSTikk+t9IFwgKhYIMZuES/VfHMAQQY8FNpogeQWbjOSHdO4U2oXvc6IcFvBWvZGXCu2iObbeXiz0LF84o09RNEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Co/npETZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751441972; x=1782977972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FMb3Uw5o+MNP/yfpYDdRJ10lMOZDI4vBOq65zrvw6lc=;
  b=Co/npETZgJfgzpc1ZMLWA/AhP4BqsihBk9JtjwjFYOoPRm0dxJERZ12l
   6tTzXTtYFpV5AA2lMZAAY2svDFBdtcQXA4NN8VqjfCLWqJdU9l9LBFnqG
   zPP+RgjDavtk/yyq6Ea0H42aWEPhJWvDyEv3P+7e+xWksZfLkFyqNwX7S
   ljWte0xQc61xvnefIadxLL7HohN45QfM465GWXyUCEfmrYauOdrI9hjfH
   bboidfEpq2dU0VkHECoD5iVHDXTD6su8Hwv8SW3GEFSs8Ol06dgPvKnRC
   uxHyCaTZitm/6TYATUU7SmIH7jaaM5FcHf0Dsy3B9pG7nDhNAvYfuMegr
   Q==;
X-CSE-ConnectionGUID: PEzMe6L+TDuJaDVM4WaiNA==
X-CSE-MsgGUID: DVMICessTamN+S7Xz8k/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79166529"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79166529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:39:31 -0700
X-CSE-ConnectionGUID: XWru2ms5Sm6jtpAFnYLK4Q==
X-CSE-MsgGUID: Dp7cKx6pQ5mS3g1Ndik+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159517233"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 00:39:30 -0700
Date: Wed, 2 Jul 2025 09:39:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, igt-dev@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to
 re-arm
Message-ID: <20250702073913.epq47msgf7bjqmqb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-9-robin.clark@oss.qualcomm.com>
 <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
 <CACSVV0251in35dD-=hk9oy6USZCxHR-oWFy+Xk+YsSyy_LDYtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV0251in35dD-=hk9oy6USZCxHR-oWFy+Xk+YsSyy_LDYtQ@mail.gmail.com>

Hi Rob,
On 2025-07-01 at 11:02:07 -0700, Rob Clark wrote:
> On Tue, Jul 1, 2025 at 9:24 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Rob,
> > On 2025-06-30 at 11:09:02 -0700, Rob Clark wrote:
> > > From: Rob Clark <rob.clark@oss.qualcomm.com>
> > >
> > > Newer kernels disable stall-on-fault for a grace period, to avoid a
> > > flood of faults causing instability with memory translations that
> > > the hw attempts with the translation stalled.  Fortunately it adds a
> >
> > Is it system-wide or only for msm driver?
> 
> specific to msm
> 
> BR,
> -R

Ok, so please write it explicitly, like for example:

Newer msm driver disables stall-on-fault for a grace period, [...rest...]

Please also give a link to lore with a change in msm driver.

Regards,
Kamil

> 
> > Please improve subject:
> >
> > [PATCH igt 8/9] tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
> >
> > imho it could be shorter:
> >
> > [PATCH igt 8/9] tests/msm/msm_mapping: Wait for stall-on-fault
> >
> > Regards,
> > Kamil
> >
> > > debugfs file so we can know how long we need to wait for stall-on-
> > > fault to be re-enabled.
> > >
> > > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > > ---
> > >  tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > >
> > > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > > index 978ea18375dd..7e2f5c7eadc8 100644
> > > --- a/tests/msm/msm_mapping.c
> > > +++ b/tests/msm/msm_mapping.c
> > > @@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
> > >       return buf;
> > >  }
> > >
> > > +static void
> > > +wait_for_stall_on_fault(int drm_fd)
> > > +{
> > > +     char buf[64] = "\0";
> > > +
> > > +     do {
> > > +             int us;
> > > +
> > > +             igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
> > > +             if (!strlen(buf)) {
> > > +                     /* Not supported on older kernels: */
> > > +                     return;
> > > +             }
> > > +
> > > +             us = atoi(buf);
> > > +             if (!us) {
> > > +                     /* Done waiting: */
> > > +                     return;
> > > +             }
> > > +
> > > +             usleep(us);
> > > +     } while (true);
> > > +}
> > > +
> > >  /*
> > >   * Helper to find named buffer address
> > >   */
> > > @@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
> > >       ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
> > >       igt_fail_on(ret != 1);
> > >       igt_fail_on(addr != fault_addr);
> > > +
> > > +     /* Wait for stall-on-fault to re-enable, otherwise the next sub-test
> > > +      * would not generate a devcore:
> > > +      */
> > > +     wait_for_stall_on_fault(pipe->dev->fd);
> > >  }
> > >
> > >  /*
> > > --
> > > 2.50.0
> > >

