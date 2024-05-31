Return-Path: <linux-arm-msm+bounces-21205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB88D5CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BAB1288F4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8FF150980;
	Fri, 31 May 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL7WjIlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809C14F9EE;
	Fri, 31 May 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144605; cv=none; b=nUxfIlkkY0XQxtDGdqU/q9I3Tw1gTYTtN5Li9exQUCGcN8eCQ3Hzql+X3rgp2CkcWqTQUNgdGzDA+nFb74kCzCuXFduHAK4e3tey/It3TYNw/A25n/GUZ7Xm78wKSYcRH766pgfxdHeCJj2obUr0+5L02tkuXm9Qed5SDz+4wt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144605; c=relaxed/simple;
	bh=M29kEJ6dg69bMDHvyOUQgPml98WWax7KA+31KDr2z6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uf4uHOMmMk1YP/Ocv4zUvLLfGik87RUYxSy4xCMXEcEYDc+n1rq8DxJY6V7Zfowmn4Hh8d9NWbSnQhQLDONcoxPc6W3reRqWwvclCGbeQDLAddkPcp16UkWOMxgZN6JSXsOdDV3NA3jxxS9MTSLAra01rzdHFsJ8/x+Wv3E4X3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL7WjIlQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717144605; x=1748680605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M29kEJ6dg69bMDHvyOUQgPml98WWax7KA+31KDr2z6o=;
  b=BL7WjIlQYod9uJUs4LgyGNdXRJAoUaY9oT32wUMWBNtQri1d/bE4hMMq
   DYzac1lYLoIwaHmbRdltqvmfdN+wX9yp02hTdGbxQMidUqy6s0jtm4fIZ
   9VNlSp2fZ22t7A/j3e9FAWTmf06+mhjMfqrGM9/6DszIEPlIcnoylO4r8
   qReyH3GyhwncvTvPN3z0xypBBtg9Lbr63OdHpSvd31+7c/QcCYF8NPbma
   Y8Zm5RuP6c3ciaKwzVrAGhiqmDOe8F8pxQNmm47UY4i0WP+RPUT+j41tF
   CUoLpC1VbpwLnbQUG952Bcj6SgyLbCH1skt/MzNne3Osm/4OwzCr9m54p
   w==;
X-CSE-ConnectionGUID: wM6aTOULQlmljqQKOxZkvw==
X-CSE-MsgGUID: 8AwtI8bRTWelgZfzUbBLNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31173899"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="31173899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:36:44 -0700
X-CSE-ConnectionGUID: KTBX4n38RQOpaoGrgPPyrw==
X-CSE-MsgGUID: czHILSlrTOKLA0SaEXOLzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="40540438"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:36:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCxkb-0000000CQ0b-0T9w;
	Fri, 31 May 2024 11:36:37 +0300
Date: Fri, 31 May 2024 11:36:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v2 6/7] serial: qcom-geni: Fix suspend while active UART
 xfer
Message-ID: <ZlmMFBxkMlINr2JO@smile.fi.intel.com>
References: <20240530224603.730042-1-dianders@chromium.org>
 <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 03:45:58PM -0700, Douglas Anderson wrote:
> On devices using Qualcomm's GENI UART it is possible to get the UART
> stuck such that it no longer outputs data. Specifically, I could
> reproduce this problem by logging in via an agetty on the debug serial
> port (which was _not_ used for kernel console) and running:
>   cat /var/log/messages
> ...and then (via an SSH session) forcing a few suspend/resume cycles.
> 
> Digging into this showed a number of problems that are all related.
> 
> The root of the problems was with qcom_geni_serial_stop_tx_fifo()
> which is called as part of the suspend process. Specific problems with
> that function:
> - When we cancel an in-progress "tx" command it doesn't appear to
>   fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
>   continued to report that the FIFO wasn't empty. The
>   qcom_geni_serial_start_tx_fifo() function didn't re-enable
>   interrupts in this case so we'd never start transferring again.
> - We cancelled the current "tx" command but we forgot to zero out
>   "tx_remaining". This confused logic elsewhere in the driver
> - From experimentation, it appears that cancelling the "tx" command
>   could drop some of the queued up bytes. While maybe not the end of
>   the world, it doesn't seem like we should be dropping bytes when
>   stopping the FIFO, which is defined more of a "pause".
> 
> One idea to fix the above would be to add FIFO draining to
> qcom_geni_serial_stop_tx_fifo(). However, digging into the
> documentation in serial_core.h for stop_tx() makes this seem like the
> wrong choice. Specifically stop_tx() is called with local interrupts
> disabled. Waiting for a FIFO (which might be 64 bytes big) to drain at
> 115.2 kbps doesn't seem like a wise move.
> 
> Ideally qcom_geni_serial_stop_tx_fifo() would be able to pause the
> transmitter, but nothing in the documentation for the GENI UART makes
> me believe that is possible.
> 
> Given the lack of better choices, we'll change
> qcom_geni_serial_stop_tx_fifo() to simply disable the
> TX_FIFO_WATERMARK interrupt and call it a day. This seems OK as per
> the serial core docs since stop_tx() is supposed to stop transferring
> bytes "as soon as possible" and there doesn't seem to be any possible
> way to stop transferring sooner. As part of this, get rid of some of
> the extra conditions on qcom_geni_serial_start_tx_fifo() which simply
> weren't needed and are now getting in the way. It's always fine to
> turn the interrupts on if we want to receive and it'll be up to the
> IRQ handler to turn them back off if somehow they're not needed. This
> works fine.
> 
> Unfortunately, doing just the above change causes new/different
> problems with suspend/resume. Now if you suspend while an active
> transfer is happening you can find that after resume time you're no
> longer receiving UART interrupts at all. It appears to be important to
> drain the FIFO and send a "cancel" command if the UART is active to
> avoid this. Since we've already decided that
> qcom_geni_serial_stop_tx_fifo() shouldn't be doing this, let's add the
> draining / cancelling logic to the shutdown() call where it should be
> OK to delay a bit. This is called as part of the suspend process via
> uart_suspend_port().
> 
> Finally, with all of the above, the test case where we're spamming the
> UART with data and going through suspend/resume cycles doesn't kill
> the UART and doesn't drop bytes.
> 
> NOTE: though I haven't gone back and validated on ancient code, it
> appears from code inspection that many of these problems have existed
> since the start of the driver. In the very least, I could reproduce
> the problems on vanilla v5.15. The problems don't seem to reproduce
> when using the serial port for kernel console output and also don't
> seem to reproduce if nothing is being printed to the console at
> suspend time, so this is presumably why they were not noticed until
> now.

...

> +	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, 0xffffffff,

It's easy to miscount f:s, GENMASK()?

> +				       port->tx_total - port->tx_remaining);

-- 
With Best Regards,
Andy Shevchenko



