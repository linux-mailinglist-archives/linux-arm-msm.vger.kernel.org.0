Return-Path: <linux-arm-msm+bounces-21192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16E8D59B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF7BCB230B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 05:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D70200DE;
	Fri, 31 May 2024 05:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQbYYQ7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BDB5695;
	Fri, 31 May 2024 05:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717131730; cv=none; b=QVrIf+AtxvD93niEGdCRCiDWWDLGG3VNEDUDmvzipydKCifR93BhcetpJAA6bepxMw8P2SH9IHbphdyXlP7tZPOZ0rAAPk+I3zBfVoAGIMil2sCCi7m2hN7BV+shXJCiq+WcyKcIIg2vKFc8WKOv6pry7+7WJaLGrVqKyZcIvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717131730; c=relaxed/simple;
	bh=4N9KHsBP1wbJ/0aYx0i2uWsnxPGZQ67bUuINhN3ub40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTY95o1YQN8dsOILoUd+xYNeQKfaLZKJ7lcmeET0O6j2sGb/1PZ9Dst6vVnUUe/TFPjXJZmV7sQPP2bUeNlCtgzRwjEGbAmKqWEzygXcXl2VqgSW3Geh65KtE+hN42uRBUCdlBdlGXm7qMCPFyNygGhvU7VUJ/zi0Do1Oea/Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQbYYQ7t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717131729; x=1748667729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4N9KHsBP1wbJ/0aYx0i2uWsnxPGZQ67bUuINhN3ub40=;
  b=dQbYYQ7tpyYt6sbTcbcD8NWCicpFyMhVupBBMQG0IqGdQsTmG+lHaayW
   VAiPiZV3GwJ/dEPIRJbaOxHfkmTdF4I/TLWfNRraBlFL9PqyBoKzNEV8h
   AMEqjxtR56rSF14sLcDNXVhzfQQgNiEg2h+dvkJ8zOK5kJ8tBXSoZQoxj
   mGa9PbsdUEhwdg1U97zlDRWae3Qh8eP1H57XVjq32epup3g/2i8C99XgE
   nuGnv7CHqeo2XmpaKRzNUFfWpevTPKlZzMVIRK0dhb6aSrNkR3RgYXQys
   YcBpaw/utf5dc7xsIywqGco0OW2MqWBAQAfotAjOYGXqhJ9sb9J77R/bH
   Q==;
X-CSE-ConnectionGUID: 7mxvPrJuQ5+Ke5bGIvt0Ig==
X-CSE-MsgGUID: aEmhpK4DS6SfRNJTMoik+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13481452"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13481452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:02:08 -0700
X-CSE-ConnectionGUID: e8zA9gmEQbG70cEt4sPB9Q==
X-CSE-MsgGUID: 8G6uIrz3TSCpj1iUZYGw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36084717"
Received: from rrware-mobl.amr.corp.intel.com (HELO tlindgre-MOBL1) ([10.125.108.14])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 22:02:03 -0700
Date: Fri, 31 May 2024 08:01:55 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] serial: port: Don't block system suspend even if
 bytes are left to xmit
Message-ID: <ZllZw3g8pF82lf8D@tlindgre-MOBL1>
References: <20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>

On Thu, May 30, 2024 at 08:48:46AM -0700, Douglas Anderson wrote:
> The DEFINE_RUNTIME_DEV_PM_OPS() used by the serial_port code means
> that the system suspend function will be pm_runtime_force_suspend().
> In pm_runtime_force_suspend() we can see that before calling the
> runtime suspend function we'll call pm_runtime_disable(). This should
> be a reliable way to detect that we're called from system suspend and
> that we shouldn't look for busyness.

OK makes sense, one comment below though.

> --- a/drivers/tty/serial/serial_port.c
> +++ b/drivers/tty/serial/serial_port.c
> @@ -64,6 +64,16 @@ static int serial_port_runtime_suspend(struct device *dev)
>  	if (port->flags & UPF_DEAD)
>  		return 0;
>  
> +	/*
> +	 * We only want to check the busyness of the port if runtime PM is
> +	 * enabled. Specifically runtime PM will be disabled by
> +	 * pm_runtime_force_suspend() during system suspend and we don't want
> +	 * to block system suspend even if there is data still left to
> +	 * transmit. We only want to block regular runtime PM transitions.
> +	 */
> +	if (!pm_runtime_enabled(dev))
> +		return 0;
> +

How about change the comment a bit to describe why this happens so it's
easy to remember the next time looking at the code. I'd suggest just
something like this:

Nothing to do on pm_runtime_force_suspend(), see DEFINE_RUNTIME_DEV_PM_OPS

Other than that:

Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

