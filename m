Return-Path: <linux-arm-msm+bounces-101999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIWYIqIN1GnvqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AC3A6BF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA953026167
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D964D38E11C;
	Mon,  6 Apr 2026 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOSrJdDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7401DDC1D;
	Mon,  6 Apr 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504796; cv=none; b=hUrzEeFmkOSNx5QnD6dBY5qNsd0ghPQg4Uv40+M+0j6BYCK7Q1ImyYHyR8DloPNrGfSD7R0H2PETeNTx6xiKk2I2rXr+nO2sMWA5IFkzbuH9EitN0GHVlv8TH18ebc9pM/WpKseZMTroX2YKtut+RTIs9WItMx9688EA4JLLx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504796; c=relaxed/simple;
	bh=7usF/yd0TDGLRijcOYFSBsZ0sFAaMLoBmPUeKoya2A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW4czjZYy27L4Mh4cjkfk1CLF2Kbpo4Ex/GXQvreu4mA5/NSxcfodXVPuPzyJV85xhYlUkXkdqfAdQ/mY/od6dLhRdGXrPM1TNtSxfepEYQf3WAPZbR9AKHaTW5hOteHpWcPMWgrUKbxKq9V5/P8aU5TN6QyHP1MRse3/OohGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOSrJdDc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775504796; x=1807040796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7usF/yd0TDGLRijcOYFSBsZ0sFAaMLoBmPUeKoya2A8=;
  b=jOSrJdDcqzlSy+R19fq77IUcJ7Sxh9u2HGn3pGnLpyyPLt1aMT/yhgvb
   4ZNwriRyJbrg7axDmAGfiDML2QBN+99k1Qu7FW2Xo6dyoqX7Q4e09wQI4
   aF9lwvdyidRk8KRxixxrEo8cQQnW5W5fnNqUM5OCdYt1LASrtdyn2iSE1
   e7+KrF9cYSUNhNC6z6ncGOBtXaiv2/w7mhuk6TMKJKJrDzFBxk59jmGQP
   PJTfZaEfAxO0aM5XP3OqXG/zw1MxIS2/7zk872LXkdjmQWqsia4U4MfWk
   +uhJ/Eonv/zc3U8QChCDaYkajT3ulqt4J54N0kBlmNyiRB9IWP8znLJAh
   g==;
X-CSE-ConnectionGUID: NN86p9DwRnG6aAaoN4s0uA==
X-CSE-MsgGUID: QjnTtADWQH+htHPWwxVcTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76582796"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76582796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:46:35 -0700
X-CSE-ConnectionGUID: AG7SYnk7QLGyYOyorcX+1Q==
X-CSE-MsgGUID: CUZuN7eUTwmzOj9q9H9MAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="258409801"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:46:31 -0700
Date: Mon, 6 Apr 2026 22:46:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Message-ID: <adQNlfiq4aaOJ2ll@ashevche-desk.local>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
 <20260405-pm8xxx-xoadc-label-v3-3-9fe179c283ec@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-3-9fe179c283ec@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101999-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: D64AC3A6BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:52:21PM +0000, Antony Kurniawan Soemardi wrote:
> Implement the .read_label callback to allow userspace to identify ADC
> channels via the "label" property in the device tree. The name field in
> pm8xxx_chan_info is renamed to label to better reflect its purpose. If
> no label is provided in the device tree, it defaults to the hardware
> datasheet name.

> The change has been tested on Sony Xperia SP (PM8921).

...

> +static int pm8xxx_read_label(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, char *label)
> +{
> +	struct pm8xxx_xoadc *adc = iio_priv(indio_dev);

> +	struct pm8xxx_chan_info *ch = pm8xxx_get_channel(adc, chan->address);

When you have a validation the better style is to split definition and
assignment. This makes code robust against (theoretically) possible changes
that might reuse the same variable for something else.

> +	if (!ch)
> +		return -EINVAL;
> +	return sysfs_emit(label, "%s\n", ch->label);
> +}

Again, no need to resend now, just make it in the next version if that version
is asked for.

-- 
With Best Regards,
Andy Shevchenko



