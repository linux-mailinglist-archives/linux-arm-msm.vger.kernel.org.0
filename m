Return-Path: <linux-arm-msm+bounces-101998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKcRFygN1GnQqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:44:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA53A6BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58AF530300C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2EE3976B1;
	Mon,  6 Apr 2026 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A92RdNil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C73976A2;
	Mon,  6 Apr 2026 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504660; cv=none; b=hatmFw00etUtixTdSgPzwTcgf2ofYkwXlDPqyagEKHtqNpd0amAWe5m3Hp48WZM01lUDankTRYmvcP71hMl6ev0ClNWZ42gozV8jBOrJcVxV2KFOiEdsFxc0TX08Eyx3WiBIrDYJ2SURkvX8skkbhMJxmfyxClQPMakdtFwFDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504660; c=relaxed/simple;
	bh=aYjZG/LiOjRzhLY5EjduFtQGkbbha0i8XWgRRRh5vHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URcKvFyGDvq7tLcCqiNd0CQRc41zdLMubwWuxW07b4qXmhNYzhNCnGOVA/n68VBax8X1r0spvdjwVgA7hIhf41PCIbv06DiNURsiYqFNxhs+rZKTNW/LKICQKPYJM84hvUK+qIupgzNjsL2XvjfIVb8r4RN+x19Zg1U8dXqtF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A92RdNil; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775504659; x=1807040659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aYjZG/LiOjRzhLY5EjduFtQGkbbha0i8XWgRRRh5vHs=;
  b=A92RdNilIphOmVRLF0OJ4Z/h4ucrHJnq2d5hC8gGBzjPR/bUbW0YBcCb
   4qRdIZ0n20gIQdZdWuPwG3lmd+4df3WD41+npza2Mr/QV0iV6Qpv/Ik9r
   moMuL8fMJWinZ91IlNbciT88K++q7yNP4MAkzfgnt6yfnwr/3brD+9Xxv
   mHqHdpHZWmw63JfG0BNbVjAsBuNBhBzKw5U0o1xYno85WD4B7ym2W5Md4
   Q8+mkYESOx83TXXG4UMtjSJNP1hdmOrWhze9iGDBvlRF3MHPQnBB8CxGD
   kf3hO/oQMULZOO3/PIq8xoYhbQGp0LBOxXVb2HlPADs5zYVf4wKp/5W/8
   Q==;
X-CSE-ConnectionGUID: 968u3zvnTXq1ABF/YUpwFw==
X-CSE-MsgGUID: Lp0Hoi7pRfuq7lJfQo3neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76582650"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76582650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:44:18 -0700
X-CSE-ConnectionGUID: ga2Bm8tmSY25FEM0KxH4ZQ==
X-CSE-MsgGUID: OLqkXm3lRuKYTXtRmFALjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="258409456"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:44:14 -0700
Date: Mon, 6 Apr 2026 22:44:11 +0300
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
	linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logs when reading values
Message-ID: <adQNCy14vfk0FCrn@ashevche-desk.local>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
 <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101998-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 1BEA53A6BC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:52:18PM +0000, Antony Kurniawan Soemardi wrote:
> Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
> return values to report errors, reducing unnecessary log noise.

...

>  	ret = wait_for_completion_timeout(&adc->complete,
>  					  VADC_CONV_TIME_MAX_US);
>  	if (!ret) {
> -		dev_err(adc->dev, "conversion timed out\n");
>  		ret = -ETIMEDOUT;
>  		goto unlock;
>  	}

In case you need a new version, the above can be replaced with a better
alternative (assuming the ret is defined as not boolean and it is so):

	if (!wait_for_...(...)) {
		ret = ...;
		goto ...
	}

-- 
With Best Regards,
Andy Shevchenko



