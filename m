Return-Path: <linux-arm-msm+bounces-116630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbrTE/RAS2obOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:45:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15D70CAE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:45:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cCJF9DNz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C34A030028AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC63D3BE16A;
	Mon,  6 Jul 2026 05:45:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CC371D0A;
	Mon,  6 Jul 2026 05:45:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316720; cv=none; b=G0LhXpcqU/fJ+W6T9BSkJpHA/awlXeYUw/Xtyw0tm09UlrTgMErL0LwFmhiV8qDTrk9boOFicdm+UMvcFCdJWKirIQ1TNTXrYIXNRWqGwpdrOjbQdQNs7XuHt4EnWpdp3onxr5aB6HG0w1Y9r8Af6XintlWi9sGEuSoxrDaZjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316720; c=relaxed/simple;
	bh=lsnmS/u8NCo9XXYFOWuyuTUeIcFEKQZni4hHgmFmNoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nab8JVFtXtI/EnSGloJX4hPZsQ+rflqIGph6Ps5k+wfUr9G80OR7PBZJiqIBU67T25mUp5yDYy0dGG6i8cxIe7MyLyyUU+YYTIQ3OKAEffkaQVfZCxU6Vu9QrppyTqh5ttzGcks6C4Zq7pRVxYqACshMN1R2Loy4Ku5yvoYL6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCJF9DNz; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783316720; x=1814852720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lsnmS/u8NCo9XXYFOWuyuTUeIcFEKQZni4hHgmFmNoo=;
  b=cCJF9DNzCHB9baWOK7TPEoA6IolWqWH6bQpuhMfUfhltXNrpnRzYwqA6
   RCjBYxYSA3XvHQl9BHHF6x13eqMej6tb4YWa5bJQk1v7hDnOQNQXPhn/y
   WZEb78aXz9ClSYjsbvsZ6+ZFuksA8KBjqrq8KzpzS7Q02XjhbWHbpttOZ
   GmcSsYqmQ7QkBhMpUjH8dC1T/hVlDK8qZj8Wg1wg6j2CUKygElpnNsvs2
   zAN8wHy8FtjOw3ZtUSnvqKA5CKSPO78NFrCCo8nRSN0FaUoX6/V+NPP6B
   eXJulMaZTdCCzPFDEDHFSS3VHuwvVILfzPyPbkAhXa4c2uM4GKc+a55GY
   w==;
X-CSE-ConnectionGUID: vZ7jMdbDS/CEW6kqI/P3PQ==
X-CSE-MsgGUID: 8nGYu6CDT3ua9VnF64jN7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95318101"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95318101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:45:15 -0700
X-CSE-ConnectionGUID: HRLQl3dDRPuI4zFfbzEdcg==
X-CSE-MsgGUID: BMVnKobxQBunIaatW5GVjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257201279"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:45:11 -0700
Date: Mon, 6 Jul 2026 08:45:08 +0300
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
Subject: Re: [PATCH v3 0/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <aktA5JZIcbbDP_hs@ashevche-desk.local>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116630-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B15D70CAE8

On Sun, Jul 05, 2026 at 10:23:32PM +0530, Jishnu Prakash wrote:
> Support for the main PMIC5 Gen3 ADC driver has been merged now.
> 
> In order to complete adding support for the Gen3 ADC_TM auxiliary
> driver, some more changes are needed in the main driver, mainly to
> improve its shared interrupt's handling mechanism.
> 
> Patch 1 simplifies the interrupt handling in the main ADC driver
> by declaring the interrupt as a shared one and dropping the logic
> used to call the ADC_TM notifier for handling ADC_TM interrupts on
> the first SDAM whose interrupt is shared.
> 
> Patch 2 removes an unneeded print in the main ADC driver.
> 
> Patch 3 adds the auxiliary thermal driver which supports the ADC_TM
> functionality of ADC5 Gen3.

> ---
> Changes in v3:
> - Collected Reviewed-by tag from Jonathan on patch 1.
> - Added new patch to remove an unnecessary print in main ADC driver, as
>   suggested by Andy.

Add Suggested-by tag

-- 
With Best Regards,
Andy Shevchenko



