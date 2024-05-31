Return-Path: <linux-arm-msm+bounces-21312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6D8D65B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E93D31F21E29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1110557CA7;
	Fri, 31 May 2024 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+yjWoVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970A4C7C;
	Fri, 31 May 2024 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169427; cv=none; b=KxNYqM5Ama1tRB88aRp432zPq5Kjj7KRqyGLZlmMHfU28xh3u/ZuJcwuzvyBs64/sRdRUGsifiERzZcTKmBo/+8QRzRMJLZYLS/kOJVh5Hngfxv0A5aOhgy1usKe8ixXTUcfbEPOyGM8mhyc0u//Hye2J0OxHaDvGnJhodXgChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169427; c=relaxed/simple;
	bh=LMKo8cO4a5a84Rip7QNsCoS0nQcXswBiCLWRnMnn6yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6rfwoAIi25iZ7Mi1p7+pHDCRp9Q88QTeJpzg0QLbkh4rV0V+y1SCz4t5be7+DRrsuSx6mICRlEhrGLSk1OsEyw8UqxyViIzsokAifqMKqui2bSzU7WjhkC9gllzoRVw4hExqCreNCdMDQxitW+gxJCUk7YLHAyqi67Pw3c1k4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+yjWoVQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169426; x=1748705426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LMKo8cO4a5a84Rip7QNsCoS0nQcXswBiCLWRnMnn6yQ=;
  b=g+yjWoVQWyyKapB2k4A0YXAIfY61qZfPY1Zt+4HpcYgVJhQFhqRKMbu4
   /xm2IhOYP5PlLfksTiYv1pdK7EwW7kiDpTc8+9NBWZ6R0jcCMkdzL+JmU
   9rG8FsyH0hws4wiUH2KZ1WoGg3T08h1DkOgmUX9z8CmvDNcOJtIVrp1/N
   GJIEFHDLHnv/KhrCTPp/8tUoIz3b7ibsw9awQjCxkijcThRCyAXvCKnua
   rTYkSJ1Rleh9WrhTg+jPtLPnAMeV50DKjjfMiaPZ8Mn6lyPB9mjVxVUUu
   01XD/KmCBvTIpbpNoLBUVbptXQ7h4+9XmNl4WdUZVXIS/sMhJTA/xVnks
   w==;
X-CSE-ConnectionGUID: S5qer6VeQqKTjOua9K04vA==
X-CSE-MsgGUID: AaJyaOCUTWmgNCX6qO+qxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17514218"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17514218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:25 -0700
X-CSE-ConnectionGUID: l5lsMTrXSpaytGx0KmxbDA==
X-CSE-MsgGUID: vMNB4v87Tj2UN1JX9a5lsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36209148"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD4Ct-0000000CVRR-3uji;
	Fri, 31 May 2024 18:30:15 +0300
Date: Fri, 31 May 2024 18:30:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	stable@vger.kernel.org,
	Tony Lindgren <tony.lindgren@linux.intel.com>,
	Bing Fan <tombinfan@tencent.com>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v3] serial: port: Don't block system suspend even if
 bytes are left to xmit
Message-ID: <ZlntB9t6glOZC_HX@smile.fi.intel.com>
References: <20240531080914.v3.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531080914.v3.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 08:09:18AM -0700, Douglas Anderson wrote:
> Recently, suspend testing on sc7180-trogdor based devices has started
> to sometimes fail with messages like this:
> 
>   port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
>   port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
>   port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
>   port a88000.serial:0.0: PM: failed to suspend: error -16
> 
> I could reproduce these problems by logging in via an agetty on the
> debug serial port (which was _not_ used for kernel console) and
> running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
> 
> Tracing through the code and doing some printf()-based debugging shows
> that the -16 (-EBUSY) comes from the recently added
> serial_port_runtime_suspend().
> 
> The idea of the serial_port_runtime_suspend() function is to prevent
> the port from being _runtime_ suspended if it still has bytes left to
> transmit. Having bytes left to transmit isn't a reason to block
> _system_ suspend, though. If a serdev device in the kernel needs to
> block system suspend it should block its own suspend and it can use
> serdev_device_wait_until_sent() to ensure bytes are sent.
> 
> The DEFINE_RUNTIME_DEV_PM_OPS() used by the serial_port code means
> that the system suspend function will be pm_runtime_force_suspend().
> In pm_runtime_force_suspend() we can see that before calling the
> runtime suspend function we'll call pm_runtime_disable(). This should
> be a reliable way to detect that we're called from system suspend and
> that we shouldn't look for busyness.
> 
> Fixes: 43066e32227e ("serial: port: Don't suspend if the port is still busy")
> Cc: stable@vger.kernel.org
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

...

> +	/*
> +	 * Nothing to do on pm_runtime_force_suspend(), see
> +	 * DEFINE_RUNTIME_DEV_PM_OPS.

	 * DEFINE_RUNTIME_DEV_PM_OPS().

(in case you need to send a new version)

> +	 */
> +	if (!pm_runtime_enabled(dev))
> +		return 0;

-- 
With Best Regards,
Andy Shevchenko



