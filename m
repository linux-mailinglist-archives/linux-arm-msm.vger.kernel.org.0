Return-Path: <linux-arm-msm+bounces-108022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFEKDWFpCWouYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 09:08:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355D55F9A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 09:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240883009F92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 07:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6B63064AE;
	Sun, 17 May 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwToY7f+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A8282F12;
	Sun, 17 May 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779001694; cv=none; b=G3bOghUsXszqbb/hrFbslBFUdAqRV9NWqPSjdUS9/kMvjAjlqn3QHUqClVWzIwHIYC79sQzzcDpBZnrNMVJGWZg+zE/ESM16RatfKTxuFw1IVb4h8FZ8IWJTc5ofPPnl/XrrY6UuwqJ8Z1PnlLfBdOZhH3h+CSFg+Tpr2Tolqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779001694; c=relaxed/simple;
	bh=sPRnTzU+dJcq83qSDb71XWGiExHcCE/eGd012FRHJKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5BQ0WvGRywuv9GON8thCZdIYjAAIz6fvFOJxIH7EBAQRPMbwmXx9Va1lpRk9NsEu6t9Iuj8Yrm6WoJ8qLcBKMgpQHIDemQVMUKlBxdBffGtgeWzglxhuNMrG4CF5jjYMzFbSI/rHxtTZP285FNLzHWq8qS8Qhy2CgoXUTW7D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwToY7f+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779001693; x=1810537693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPRnTzU+dJcq83qSDb71XWGiExHcCE/eGd012FRHJKU=;
  b=UwToY7f+bO/xIDvN/AaFTwvwdnyQFOas/CPyZNdHyLHRNZkNrPhDOR+8
   vTlnvdlvl9SnJ2m00AY/156zohsXtURmU1Tvu92z6IlxEGVRg0rmgLAml
   PJseGfMKFvjp4El18+TSHkO8LH5bqnq64Z0S7T/wkndloUxN2AVPkMKhd
   jb4AIB31ESnNh1aVZO7XQd6hoXXIXNL0Ia4JNBNxzRizKYD0B533ayFfp
   B/GBqkM3ofFKuiAmm5icgMCSwlHdIOH9Jypd8vd50plQ4JYdvBsCvFKpu
   aM0KVaHXLNnPehTRXOgQffjudxvUTxVgW5YaGzYz/NpUN+d1cR6DX6Wqv
   A==;
X-CSE-ConnectionGUID: DFT/Xy0+QAqO8piqrX+WYw==
X-CSE-MsgGUID: no54KeLkSm2SrtzOw+eMNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90200207"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90200207"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:08:12 -0700
X-CSE-ConnectionGUID: zLs4LkmzQBexprDyHCQS+g==
X-CSE-MsgGUID: pzUDhFfCT0y15UOy96bdsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="262635385"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:08:08 -0700
Date: Sun, 17 May 2026 10:08:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ with
 ADC_TM auxiliary driver
Message-ID: <aglpVX2NeQ8jxN6Y@ashevche-desk.local>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
 <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-gen3_adc_tm-v1-1-39ba29f9b4ab@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 8355D55F9A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-108022-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:23:44PM +0530, Jishnu Prakash wrote:
> The SDAM0 IRQ can be triggered for both EOC (end of conversion) events for
> immediate ADC reads done in this driver and for threshold violation events,
> based on ADC_TM thresholds configured from the auxiliary ADC_TM driver on
> TM channels on the first SDAM.
> 
> At present, this interrupt is handled only in the ISR in the main ADC driver.
> When the ISR is triggered for an ADC_TM event, this driver notifies the ADC_TM
> driver by calling a notifier callback exposed from it for this purpose.
> 
> To simplify the interrupt handling in both drivers, share the interrupt between
> the drivers. With this, ADC_TM interrupts on SDAM0 will be handled directly in

"will"?! Do you mean this patch deliberately breaks the working setups?

> the ADC_TM driver, so remove the notifier callback and all TM interrupt
> handling in the main ADC ISR.

-- 
With Best Regards,
Andy Shevchenko



