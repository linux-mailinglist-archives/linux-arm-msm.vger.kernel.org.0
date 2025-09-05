Return-Path: <linux-arm-msm+bounces-72210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F68B44FE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343581895806
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873692459E5;
	Fri,  5 Sep 2025 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9B1z/vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D101DDC37;
	Fri,  5 Sep 2025 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757057523; cv=none; b=chitmZVuTtmEIieeIzKPppKAduQFoSCAs3IO4PjVZwEN0Lfa1w3owJ/CtDeDVQmzzIsEdxeKFV/S2Eu2sz5OKaE8NfsO/N9BelDBqv5ju1ZG8bzMjLT5Ha96dC2bgKcfQGFABv3QCxQHBbrYVkWvSK3dD3BGWLKnq6zuS2hUo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757057523; c=relaxed/simple;
	bh=hT9AxadC5iAK+JNW21MjSBtwwyo1LI3n1xgeNnxspHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwWzIIZhYcgYKapEEkXLvZC5CpcxsXcvE5wUb3VbMVlDB8qJhKkrH8qNhx9N+vO5SR+0NPS05y0ojHo+o5NKtxg8uuDgZRI7Vt6hbEgSHWK/ovnPSNEYy/lAYD8+o3gsW9XjLgBeCNbWmb9+Rd+labOt9t1zwLk4vNxP5nYEXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9B1z/vP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757057522; x=1788593522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hT9AxadC5iAK+JNW21MjSBtwwyo1LI3n1xgeNnxspHE=;
  b=l9B1z/vP0n5sGGvJOw3agwBoVNGyPjsrgQUSX91lrpfE9UEPHSLz3jRN
   mZfmR+w4GFBB4El3r2AvV7ebQp6A4+HBjdB3DU5Lt6mc4C8NdmP4W5Zo9
   qp8mg8ozaPz3NUtz8ztofqtXv61KiaSAJqi+QH/TXQIHU+fGrTD2E4uNG
   q6GTjx/fERh16euXwXxvzpD0PUxh5tafmqSi/goULj/+28Mr3dIHXsGlH
   JVvl6J9xdf2OEcgloJ42l2pXgbiOrj6510dn7FMPSlfgZYfGkBZCyV50k
   3JoE6LelHaR6FLU4YhnmjgDK9SrohlPfOQ/xh6NXKKz5pQK7dCypr5iXx
   A==;
X-CSE-ConnectionGUID: 6X6djPZETs+JeVBdjcGQ/g==
X-CSE-MsgGUID: IPrY3Ph1Tu6rMUoUhYXlUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="63047296"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="63047296"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 00:32:02 -0700
X-CSE-ConnectionGUID: wK34IIBTTkm5b+TvUQ45dg==
X-CSE-MsgGUID: N4k6vEQgQie6WHUbCQT8BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="172540025"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 05 Sep 2025 00:31:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 10:31:56 +0300
Date: Fri, 5 Sep 2025 10:31:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	PSE Type-C Linux <pse.type-c.linux@intel.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <aLqR7ECma5JFojcU@kuha.fi.intel.com>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
 <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
 <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
 <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
 <d7nbjyz27pcvsic2gsho6ft6pjubmq2x4she5kvcd57i6dirns@bte5b5aap3wb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7nbjyz27pcvsic2gsho6ft6pjubmq2x4she5kvcd57i6dirns@bte5b5aap3wb>

On Thu, Sep 04, 2025 at 11:17:09PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 07:14:59PM +0000, Jayaraman, Venkat wrote:
> > Hi Neil, 
> > 
> > > -----Original Message-----
> > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > Sent: Monday, September 1, 2025 12:50 AM
> > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: Jayaraman, Venkat <venkat.jayaraman@intel.com>; linux-usb@vger.kernel.org; gregkh@linuxfoundation.org; PSE Type-C Linux
> > > <pse.type-c.linux@intel.com>; linux-arm-msm <linux-arm-msm@vger.kernel.org>
> > > Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL command
> > > 
> > > Hi,
> > > 
> > > On 21/08/2025 09:21, Heikki Krogerus wrote:
> > > > On Tue, Aug 19, 2025 at 11:47:58AM +0200, Neil Armstrong wrote:
> > > >> Hi,
> > > >>
> > > >> On 14/08/2025 18:30, Venkat Jayaraman wrote:
> > > >>> Add support for UCSI READ_POWER_LEVEL command as per
> > > >>> UCSI specification v2.1 and above to debugfs.
> > > >>>
> > > >>> Following power related fields will be exposed as files in debugfs:-
> > > >>> peak_current (Peak current),
> > > >>> avg_current (Average current) and
> > > >>> vbus_voltage (VBUS voltage)
> > > >>>
> > > >>> These files will be updated either when a READ_POWER_LEVEL
> > > >>> command is sent from OS or when a device is connected.
> > > >>>
> > > >>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > >>> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> > > >>> ---
> > > >>> Changelog v3:
> > > >>> - Rebased to kernel 6.17-rc1
> > > >>>
> > > >>> Changelog v2:
> > > >>> - Removed extra space in declaration
> > > >>> - Made the call to debugfs_create_file single line for clarity
> > > >>>
> > > >>>    drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
> > > >>>    drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
> > > >>>    drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
> > > >>>    3 files changed, 60 insertions(+)
> > > >>>
> > > >>
> > > >> This commit causes the following warning:
> > > >> [    8.646179] ------------[ cut here ]------------
> > > >> [    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
> > > >> [    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0:
> > > kworker/0:0/9
> > > >> <snip>
> > > >> [    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
> > > >> [    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> > > >> [    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> > > >> [    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> > > >> [    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> > > >> <snip>
> > > >> [    8.944023] Call trace:
> > > >> [    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
> > > >> [    8.953328]  process_one_work+0x148/0x28c
> > > >> [    8.957502]  worker_thread+0x2c8/0x3d0
> > > >> [    8.961401]  kthread+0x12c/0x204
> > > >> [    8.964759]  ret_from_fork+0x10/0x20
> > > >> [    8.968474] ---[ end trace 0000000000000000 ]---
> > > >>
> > > >> on:
> > > >> 8550-hdk:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
> > > >> 8550-qrd:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
> > > >> 8650-hdk:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
> > > >> 8650-qrd:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
> > > >> x1-crd:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
> > > >> x1-qcp:
> > > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160
> > > >>
> > > >> I guess the version should be checked.
> > > >
> > > > Venkat, can you be prepare the fix for this?
> > > >
> > > > thanks,
> > > >
> > > 
> > > Gentle ping, can this be fixed ? Should I send a revert patch ?
> > > 
> > > Neil
> > 
> > The Fix patch, for this warning, is ready and approved, can submit once the initial patch is merged.
> 
> Can't you submit the fixed patch instead? It would be much better than
> merging the known-broken patch.

The patch is already in Greg's usb-next and he likes to keep it
immutable.

Venkat, please send the fix.

thansks,

-- 
heikki

