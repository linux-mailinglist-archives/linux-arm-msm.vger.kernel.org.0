Return-Path: <linux-arm-msm+bounces-21203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 568298D5CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0478A1F21BF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8281814F9E0;
	Fri, 31 May 2024 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jstrGEHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B417BD3;
	Fri, 31 May 2024 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144453; cv=none; b=EIlRzqKrn+pdIRAOusErCFHZHzC/TbrPvG5UuCO/lUjeL1AUGkwMJJljmoLh9GOg5OhnexpwKRiycInThA5NvDkCgS5l9JhHFJtrpWp/mHsG4v7Ne8qC7UOUZaAXHVQ3WS1t4ZZHqDHbysD8q8v8nu83Dk3mQxSVFUI+XW0h+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144453; c=relaxed/simple;
	bh=QF9y72FW35E/OygFsYZ7X7acmvYINn8Pq3PGdnUcBCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCBZpV34STSNu2sj/04Nvf0yZQWkenstYcZ9kGuEkLwd011c0kTkg80A4341Nw5Xw0A6OFwt6WtGCtRf23Fctuf9UmeYLPZCie2lICp8QoISzCHa0Gk9lahkVorqrA8nUg+JVsSc9cKzPIQ0b7BlYYx/Twa4CP/EPOAra/kiXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jstrGEHg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717144452; x=1748680452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QF9y72FW35E/OygFsYZ7X7acmvYINn8Pq3PGdnUcBCc=;
  b=jstrGEHg01StL1EAPd70HtAfsGH1r0/sqgVEuegTI8lrSecbKz1RVHnJ
   O5OeXHLLzNn0txyA1jE4670aUC9lNx7xQ5h6Kkhcxvee8X3OzZx56JsFS
   DDgFvcnGXsc8RzP1oioJ4ppey/UfkDnZU7kScQhGggdMDFkJrd5sci5+Q
   ImZP2cFNkGyUmwSFcLyIV3PRSodVYv10DRFD504r7FjafHCPMvV4+Elr/
   7U2CQaP1v0wl94p1NwDHn4nRlCSriNZA2OihgDSIiHOjTLaGdiLHiTCoe
   kPyLr0koUg2X3Ax3fFzucQUrb7aBtxhVLXq4sNnP8la3Oaaj2vQcu2FWA
   g==;
X-CSE-ConnectionGUID: q3yjZC4EScmEgdNJ/C1yqw==
X-CSE-MsgGUID: tXjfpO0pRWCJABGDIyVoFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24237741"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="24237741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:34:11 -0700
X-CSE-ConnectionGUID: iqdmU3a3TQSNAfEiX1ieNw==
X-CSE-MsgGUID: O1GMYy5KT0qG9N7qV3JSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="41014389"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:34:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCxi8-0000000CPyf-1hVQ;
	Fri, 31 May 2024 11:34:04 +0300
Date: Fri, 31 May 2024 11:34:03 +0300
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
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: Fix the timeout in
 qcom_geni_serial_poll_bit()
Message-ID: <ZlmLe4d10TrnoyjQ@smile.fi.intel.com>
References: <20240530224603.730042-1-dianders@chromium.org>
 <20240530154553.v2.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530154553.v2.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 03:45:54PM -0700, Douglas Anderson wrote:
> The qcom_geni_serial_poll_bit() is supposed to be able to be used to
> poll a bit that's will become set when a TX transfer finishes. Because
> of this it tries to set its timeout based on how long the UART will
> take to shift out all of the queued bytes. There are two problems
> here:
> 1. There appears to be a hidden extra word on the firmware side which
>    is the word that the firmware has already taken out of the FIFO and
>    is currently shifting out. We need to account for this.
> 2. The timeout calculation was assuming that it would only need 8 bits
>    on the wire to shift out 1 byte. This isn't true. Typically 10 bits
>    are used (8 data bits, 1 start and 1 stop bit), but as much as 13
>    bits could be used (14 if we allowed 9 bits per byte, which we
>    don't).
> 
> The too-short timeout was seen causing problems in a future patch
> which more properly waited for bytes to transfer out of the UART
> before cancelling.

...

> +		/*
> +		 * Add 1 to tx_fifo_depth to account for the hidden register
> +		 * on the firmware side that can hold a word.
> +		 */
> +		max_queued_bytes =
> +			DIV_ROUND_UP((port->tx_fifo_depth + 1) * port->tx_fifo_width,
> +				     BITS_PER_BYTE);

BITS_TO_BYTES()

...

> -		timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> +		timeout_us = ((max_queued_bits * USEC_PER_SEC) / baud) + 500;

Too many parentheses. (The outer ones can be dropped.

-- 
With Best Regards,
Andy Shevchenko



