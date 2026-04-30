Return-Path: <linux-arm-msm+bounces-105278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDANDPPP8mnOuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4049D0F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D203F300C587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 03:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636234D4CC;
	Thu, 30 Apr 2026 03:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BG8NlHaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53811FBC8E;
	Thu, 30 Apr 2026 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777520622; cv=none; b=kfkWuPFkdZbaqcPfneylm0Dgj8NcX/8LOZYlMeAPx0mzvKM4Q0r8pMOt78efShGAq+Az4KaEem1JfxaicobcfoCXfRGErSmgRly2+3JA1wSd35zsfx85F5CbzfjppBsOV+BP3a14TqGEHIdRR3ecEzRFvyblELo4qQvFaAqTU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777520622; c=relaxed/simple;
	bh=sADgS20dzGTorMLScEHXlWECdOD7s+6LyTDkNgNjNBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4/xll6IsK+m0Agit6yYDWnJ857anIGtp6Jr7Kz/fYENu6mfjlEfVVp0SRpinoDl+NV770QCG5EseTR41bxhTl9RKnIljOFKvriRMrOUNapOXtPHVBDDaOrjmjT2SDkSxI43ooBf8Rr3lxqGSKlrWgvw7PcYcDLSIZFp2TPskCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BG8NlHaO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777520620; x=1809056620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sADgS20dzGTorMLScEHXlWECdOD7s+6LyTDkNgNjNBg=;
  b=BG8NlHaO923SULfHEr5lmEgZ5qT2galifNUCuju/xgMf07QfT9oEbvdk
   pJZqRref+bFEzCKy4Suhpl6nh0aZe6NILFJDB4H7fg1au3fvRf+wnCWos
   u2niBdF4NppL40Te2uRxMCSsmvqtq7BpHrUZw/544sehek5J7Vs0D80en
   MjBFwX8efr65lsvg1YijEctWENVxTWccSEuPZkDU/pNOCNIa51eyT9pb9
   5c/p14rzruaqllptrWUa+81BfVqMBF7W6pPpdB8VznmQGth94P9YU71+J
   9rQ3i7P6NNqZxA6oaf7LQoswBaEhrukTkFlFbqKbN4GpG8HQ3deNAqoBT
   A==;
X-CSE-ConnectionGUID: 8Z6T2a5fSuip70RKpAYMew==
X-CSE-MsgGUID: 2xiq8pMDRVKO27gq/LxmOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82317507"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82317507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:43:39 -0700
X-CSE-ConnectionGUID: 5LLG8mA4SdG6nasqzg+z9Q==
X-CSE-MsgGUID: c6WpgVOORaul66b0lrkkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="272575621"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 20:43:36 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIJJ-00000000Bti-2Q0i;
	Thu, 30 Apr 2026 03:43:33 +0000
Date: Thu, 30 Apr 2026 11:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, praveen.talari@oss.qualcomm.com,
	anup.kulkarni@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid probing debug console UART
 without console support
Message-ID: <202604301151.rPBXnWLg-lkp@intel.com>
References: <20260413072501.263871-1-aniket.randive@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413072501.263871-1-aniket.randive@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7EC4049D0F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105278-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

Hi Aniket,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v7.1-rc1 next-20260429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aniket-Randive/serial-qcom-geni-Avoid-probing-debug-console-UART-without-console-support/20260423-150710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260413072501.263871-1-aniket.randive%40oss.qualcomm.com
patch subject: [PATCH v1] serial: qcom-geni: Avoid probing debug console UART without console support
config: s390-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301151.rPBXnWLg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301151.rPBXnWLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301151.rPBXnWLg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:1995:43: warning: unused variable 'qcom_geni_console_data' [-Wunused-const-variable]
    1995 | static const struct qcom_geni_device_data qcom_geni_console_data = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/qcom_geni_serial.c:2011:43: warning: unused variable 'sa8255p_qcom_geni_console_data' [-Wunused-const-variable]
    2011 | static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/qcom_geni_console_data +1995 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1994  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29 @1995  static const struct qcom_geni_device_data qcom_geni_console_data = {
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  1996  	.console = true,
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  1997  	.mode = GENI_SE_FIFO,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1998  	.resources_init = geni_serial_resource_init,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  1999  	.set_rate = geni_serial_set_rate,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2000  	.power_state = geni_serial_resource_state,
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  2001  };
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  2002  
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  2003  static const struct qcom_geni_device_data qcom_geni_uart_data = {
40ec6d41c841e2 Bartosz Golaszewski         2022-12-29  2004  	.console = false,
2aaa43c7077833 Bartosz Golaszewski         2022-12-29  2005  	.mode = GENI_SE_DMA,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2006  	.resources_init = geni_serial_resource_init,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2007  	.set_rate = geni_serial_set_rate,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2008  	.power_state = geni_serial_resource_state,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2009  };
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2010  
abffd1e6c4f1c9 Praveen Talari              2025-11-10 @2011  static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2012  	.console = true,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2013  	.mode = GENI_SE_FIFO,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2014  	.pd_data = {
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2015  		.pd_flags = PD_FLAG_DEV_LINK_ON,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2016  		.pd_names = (const char*[]) { "power", "perf" },
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2017  		.num_pd_names = 2,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2018  	},
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2019  	.resources_init = geni_serial_pwr_init,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2020  	.set_rate = geni_serial_set_level,
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2021  };
abffd1e6c4f1c9 Praveen Talari              2025-11-10  2022  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

