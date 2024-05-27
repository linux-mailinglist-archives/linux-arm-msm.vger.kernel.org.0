Return-Path: <linux-arm-msm+bounces-20641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A08D0992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 19:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F161C216FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 17:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1650615F324;
	Mon, 27 May 2024 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsBzqnQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710DB155C8D;
	Mon, 27 May 2024 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832476; cv=none; b=miZ6ZHEfPs1Ic5KPtj4k869D5aY7ZKuEHzjpoUDn8kowZ+J2jN5fgJAmNp3qPFwAy615Uyr6Y8S6rg2MzJ3F5s98M4fryb1rmGi5CY2AkHACyvfL21gQP2qcEk+gITykJKkPP0pXqgSQ4Dc0JgPr3sXWo0HTnC7VEVgFppy1Vxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832476; c=relaxed/simple;
	bh=pQD9hTPYdYG3waVVdZmos5TrgAbzf/0R6TMZHpPrboM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r49bZo+xdMa/EMekvcir67BlPeJSlCAh/4RxIk5+ZyvC3IRkUk2w+nwIDL9g3apECG3DFS7R3y75Y3hfuW3L0UerJVYbNOzYoGfFQ/xc4Wy7eVCelKYfpRI1xFxVnrll5wFhmAduZdA59TSko82wHk8hCT7x7E0B92hmGm8Uokk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsBzqnQX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716832474; x=1748368474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pQD9hTPYdYG3waVVdZmos5TrgAbzf/0R6TMZHpPrboM=;
  b=LsBzqnQXyV3Xx1nnFXM45EjldD5DLqMJzGQQZDqKS7kkEGKACYq9+jAv
   T8ggPNgT+yezRrsbtpkoLlqBeaKM1K4VtCrnRhaKLKcSFuwoiyP4qUVyn
   ABJbKAWtbG7BOdMXJVjLwWPLqusEFG0A5CD9K/6ovsXqqfcgrqgNuYm8z
   Kdsr+zJcwbIBWtXG0JBwxz/UeUZHSGmpuwoxLqp3uIyxPDvD/WFeTBB7v
   8sbDUz37eePAJ+sL8pG/bE0rhKN8Zi1C+hsy7w5o0jWsU4uVCuXDcWZtk
   R7X0Y6nimQNbgGxL7SOBLMS3DPka4pR5djDXk94c9fAz0AitLjiTfGZjP
   Q==;
X-CSE-ConnectionGUID: lM7sI2tDTAy/3D6scbpjWw==
X-CSE-MsgGUID: 7OLsxJ1sS2CI5t7wgxmn4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24574928"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="24574928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 10:54:33 -0700
X-CSE-ConnectionGUID: Ix3a3+nnSBC1vshm3rHFRQ==
X-CSE-MsgGUID: vJghpWlyTH6wYE8nRgwRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39617573"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 10:54:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBeYF-0000000BKuj-0myM;
	Mon, 27 May 2024 20:54:27 +0300
Date: Mon, 27 May 2024 20:54:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/2] serial: port: Don't block system suspend even if
 bytes are left to xmit
Message-ID: <ZlTI0pYuv7_g6x-V@smile.fi.intel.com>
References: <20240523232216.3148367-1-dianders@chromium.org>
 <20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 23, 2024 at 04:22:12PM -0700, Douglas Anderson wrote:
> Recently, suspend testing on sc7180-trogdor based devices has started
> to sometimes fail with messages like this:
> 
>   port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
>   port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
>   port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
>   port a88000.serial:0.0: PM: failed to suspend: error -16
> 
> I could reproduce these problem by logging in via an agetty on the
> debug serial port (which was _not_ used for kernel console) and
> running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
> 
> Tracing through the code and doing some printf debugging shows that

printf()

...or...

printf()-based

> the -16 (-EBUSY) comes from the recently added
> serial_port_runtime_suspend().
> 
> The idea of the serial_port_runtime_suspend() function is to prevent
> the port from being _runtime_ suspended if it still has bytes left to
> transmit. Having bytes left to transmit isn't a reason to block
> _system_ suspend, though. The DEFINE_RUNTIME_DEV_PM_OPS() used by the
> serial_port code means that the system suspend function will be
> pm_runtime_force_suspend(). In pm_runtime_force_suspend() we can see
> that before calling the runtime suspend function we'll call
> pm_runtime_disable(). This should be a reliable way to detect that
> we're called from system suspend and that we shouldn't look for
> busyness.

...

> +	/*
> +	 * We only want to check the busyness of the port if PM Runtime is
> +	 * enabled. Specifically PM Runtime will be disabled by
> +	 * pm_runtime_force_suspend() during system suspend and we don't want
> +	 * to block system suspend even if there is data still left to
> +	 * transmit. We only want to block regulator PM Runtime transitions.

regular

> +	 */
> +	if (!pm_runtime_enabled(dev))
> +		return 0;

-- 
With Best Regards,
Andy Shevchenko



