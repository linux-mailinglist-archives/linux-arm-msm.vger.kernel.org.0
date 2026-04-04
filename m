Return-Path: <linux-arm-msm+bounces-101790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG1rEXZm0WlwIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:28:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D139C37E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EFA6300A63A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E72C33374F;
	Sat,  4 Apr 2026 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0Q4n1XK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184A2777EA;
	Sat,  4 Apr 2026 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775330930; cv=none; b=kvyqCuZ43bGHOZpTEYt0VDW+5XjwGhBviQp9hOyF/rl3+1aIgVlnNcod2GZrg+zmU91ublbjvNMN4cm9Te0r6qYfsgbwmFi++5r3X5xYyzgsoUAsbk0YPVjQ8BwrU3n/nlJZ2cBRKh6tJ3MLflnYFlGQHg3s06f7EzQh0rwVKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775330930; c=relaxed/simple;
	bh=VQCEEUwUJqDsIf8prYM4Lz4WWr0WbKkpEwJVmF8hRGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rwt4ca2a62lQEoC7DlQ4Dzqs3QQ7dF/W1Jnh7ZH2pSjWd+HtLVAlFUYip9gE6cvHmmdLKUwmS+1gE5GItm97rSCBH62kITia7ucjqjfDOUBcEXAR8qGt9ZrafTaKyyf0KBMsHOp5Tm8JWTY4q0KAvkdNmks0j4wtgZyU5fpbGKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0Q4n1XK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775330929; x=1806866929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQCEEUwUJqDsIf8prYM4Lz4WWr0WbKkpEwJVmF8hRGE=;
  b=I0Q4n1XK74PLIzA+7tQiBWJ0Jwbm3QSn6PGUnpa0XdDtwrYWGQCbhX2A
   BPubTN3ce+HSY1tt0TJQxn0vYifCtywgpR3eaHCNgFu9T681unSgsbF+j
   NLF47j02KPwVObWZDl/OLnezJlYvNngftesGakbtJgdSyoTUKbxe8CSfu
   I2d6iYiLVCJ1eHnVV20a/pvEJQrQd9a3XQs1nLOpmrfHo0KLYFpWMvAnN
   EtmfWhSV8VFuyFAtZjApupE9XUsyElkNjUq6YZD80/shlPFuY1OUXxTjs
   PDA9QIB4ySzre2TZ7WTGdUh5hu/MSI4h5Xx3F/20M/c6AI75yRIYHq8se
   g==;
X-CSE-ConnectionGUID: cQgHxmAXRByUwetJOaBKqw==
X-CSE-MsgGUID: gX+NYxEyTuq1zB+eBGTjsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="87056149"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="87056149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:28:48 -0700
X-CSE-ConnectionGUID: jhPt5ZJsQYuNqr8wmH4Tzw==
X-CSE-MsgGUID: PXj1gLPjQSqws2Lbfg6eZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="250760756"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:28:44 -0700
Date: Sat, 4 Apr 2026 22:28:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
Message-ID: <adFmak_zqPneU0Fr@ashevche-desk.local>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
 <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
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
	TAGGED_FROM(0.00)[bounces-101790-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 962D139C37E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 12:54:29AM +0300, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 09:23:18AM +0000, Antony Kurniawan Soemardi wrote:
> > Remove dev_err() for missing channels and rely on -EINVAL to report
> > failures, reducing unnecessary log noise.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Does it also prevent users from spamming the dmesg?

That was and IIUC is the main point of the patch.

-- 
With Best Regards,
Andy Shevchenko



