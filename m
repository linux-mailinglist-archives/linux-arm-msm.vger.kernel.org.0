Return-Path: <linux-arm-msm+bounces-70067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADEB2EF73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C25D166267
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D342E7F03;
	Thu, 21 Aug 2025 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhHBl8yI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8B2571D8;
	Thu, 21 Aug 2025 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760870; cv=none; b=HQcPcMCVgwfsLNAJ9ladz8WyKakPhptFqFXQCGGFMksKPpsRpC5dfNTaEhS8+gsSbrqGTWLDZnA3C3gL3j8xAQfI/DOV9ySLjm12QR20PAYb31rPebPnH5b9U0vi+yM8eG7HPDkwg30SfD5ms378Ch+JJ+SyQFsjzxbolWgV2Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760870; c=relaxed/simple;
	bh=Y49KgVHyLP6A3vhGl7HYj5NEDFdMxHLJ65OvxFGHAgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb3a39du3sD/s5ci5Qty8SL3oXUc65+zUXdmM5M19HXfRt6on4ymIPss/LovcfMa+yMEA2oVrMBaNMBqUQu1u5SJ3eIdq9ecQst8/u7poFdy4oagZYUkgh+LlivHoyqxFi099z0UJMd5WsZymDd+b4rnarKvRbRfZbVeJtFK2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhHBl8yI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755760869; x=1787296869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y49KgVHyLP6A3vhGl7HYj5NEDFdMxHLJ65OvxFGHAgk=;
  b=hhHBl8yI9L9x1/2vvhZTQjT7vpldemnOu7Fw0/5ItxaF8lkxkd4WqfoM
   xP2LjWPG+YbBE0hzy2sbvjzBo60WTP2kruzq37B4nv+egx1Iii1nJAGni
   CVZSRPppJfXpXifAA7VnuQYDl/wcl3TBEOY1tZ5KDn172wq8eQJLc9Wil
   BMLSsQcr2U2G5bju/Jp/0KLg+6AYcTCsqvB/GRNj3JXv6gCGdUm71cfTT
   1g3Osh1s6ah0rtT534TarmnWEKmuhdQd3Kfqt7Q/V7NjGCHBxcJihCmKL
   ZAvTinKslEFn3RJ4d52Kv8WuQ3Bnunz7wpfE4InDjUCjCr+Vu6JF5CjQ0
   w==;
X-CSE-ConnectionGUID: mT7fnRXxRRWsn36w96EBaw==
X-CSE-MsgGUID: nqJGrwwYTYGb60Y7wFpRGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69415136"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69415136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 00:21:08 -0700
X-CSE-ConnectionGUID: wKCnNorBTuqiaxeo2qZPxw==
X-CSE-MsgGUID: 5vTFsg5rS/iMPAlUrVyX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168760277"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 21 Aug 2025 00:21:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 21 Aug 2025 10:21:04 +0300
Date: Thu, 21 Aug 2025 10:21:04 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	pse.type-c.linux@intel.com,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>

On Tue, Aug 19, 2025 at 11:47:58AM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 14/08/2025 18:30, Venkat Jayaraman wrote:
> > Add support for UCSI READ_POWER_LEVEL command as per
> > UCSI specification v2.1 and above to debugfs.
> > 
> > Following power related fields will be exposed as files in debugfs:-
> > peak_current (Peak current),
> > avg_current (Average current) and
> > vbus_voltage (VBUS voltage)
> > 
> > These files will be updated either when a READ_POWER_LEVEL
> > command is sent from OS or when a device is connected.
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> > ---
> > Changelog v3:
> > - Rebased to kernel 6.17-rc1
> > 
> > Changelog v2:
> > - Removed extra space in declaration
> > - Made the call to debugfs_create_file single line for clarity
> > 
> >   drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
> >   drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
> >   drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
> >   3 files changed, 60 insertions(+)
> > 
> 
> This commit causes the following warning:
> [    8.646179] ------------[ cut here ]------------
> [    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
> [    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0: kworker/0:0/9
> <snip>
> [    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
> [    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> [    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> [    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> <snip>
> [    8.944023] Call trace:
> [    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
> [    8.953328]  process_one_work+0x148/0x28c
> [    8.957502]  worker_thread+0x2c8/0x3d0
> [    8.961401]  kthread+0x12c/0x204
> [    8.964759]  ret_from_fork+0x10/0x20
> [    8.968474] ---[ end trace 0000000000000000 ]---
> 
> on:
> 8550-hdk:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
> 8550-qrd:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
> 8650-hdk:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
> 8650-qrd:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
> x1-crd:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
> x1-qcp:
> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160
> 
> I guess the version should be checked.

Venkat, can you be prepare the fix for this?

thanks,

-- 
heikki

