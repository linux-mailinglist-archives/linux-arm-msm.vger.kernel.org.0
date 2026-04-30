Return-Path: <linux-arm-msm+bounces-105380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lsO5Lu1p82k72gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:40:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860E4A4279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9738C300250D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD47D42E013;
	Thu, 30 Apr 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pu9rvbR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3828242DFF9;
	Thu, 30 Apr 2026 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560040; cv=none; b=b0SjXQUcvOFz5jiB/bnEa1vkK+yUY5yU9OrjsHNUb+wPgpYH5kIhnGml9D5r1M0y+IIk/LY8sl9aQuAzPw/LhimfLxTBR7QJDsbzzbDQY+15rQhmeQG6ilwahP5X1MGg+XLsAnjbi+NyUlnig0LzIweZKxUhws1Sakp21gilWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560040; c=relaxed/simple;
	bh=Uxkhn9DD+DFJbMY9C+14AqkwrejCU5kbMiN3ov30ERA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grfqMOiFLS2d7uO4VDRGEAU2e8OhE2rTEo3fpHDAeiNvbbx82MZ2lPxlf0a19wrLR/Vb4YjfYnisEajiMVP32Z3P1IhsRXoAfFWMC1P/9kRGXV62ro/XH+gFPxel6sr5SvQE1ZuaFq0/DzQhSgf3+uX5SsERql16DQiu2PbrwxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pu9rvbR0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777560038; x=1809096038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uxkhn9DD+DFJbMY9C+14AqkwrejCU5kbMiN3ov30ERA=;
  b=Pu9rvbR0NO6IxwN3GO9unMBBGIQTFpsJvBAKoipmoGR497wwAt6IXITo
   81oqCqVRG/pfXDZfV5gVH2JmDLQfTfIqXTMkm1IY1MSi3N83I9cKrhWja
   vUiPS076lUlU4EYJXv7NHhM7av6irbmcgQu/PYCYEq4L7kra3fW/3xUHY
   qjVyZhrDTCvLHCEOeq7uPvnJiI8Y6LnDLWX+z0DLW1K/Cv6vitd7qYb9k
   FfUPVDyTPuKDdfTRcwTUXgQ3OgDwoZYrXu/rVWwsPRC44fGmZoeasiBRy
   Ziw6KqGsWIZKoG3y9zC6vGO9ahj16nzpFvwYRJOnoEdIpUCtZUNflDn+P
   g==;
X-CSE-ConnectionGUID: G+ftVxCNQnCn4PCua11Ftg==
X-CSE-MsgGUID: HKKWv8UeSzmLocRU+P3o1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66042199"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="66042199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:40:38 -0700
X-CSE-ConnectionGUID: wKgL+zH6SWmdeqfLlX3gJQ==
X-CSE-MsgGUID: DD4FyhGeQseHCmG5ZsRvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228091586"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 07:40:34 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wISZ4-00000000CU4-0bpl;
	Thu, 30 Apr 2026 14:40:30 +0000
Date: Thu, 30 Apr 2026 22:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, praveen.talari@oss.qualcomm.com,
	anup.kulkarni@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev,
	Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid probing debug console UART
 without console support
Message-ID: <202604302204.1qhU6zO5-lkp@intel.com>
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
X-Rspamd-Queue-Id: 8860E4A4279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105380-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,git-scm.com:url,01.org:url]

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
config: csky-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302204.1qhU6zO5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302204.1qhU6zO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302204.1qhU6zO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:2011:43: warning: 'sa8255p_qcom_geni_console_data' defined but not used [-Wunused-const-variable=]
    2011 | static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/qcom_geni_serial.c:1995:43: warning: 'qcom_geni_console_data' defined but not used [-Wunused-const-variable=]
    1995 | static const struct qcom_geni_device_data qcom_geni_console_data = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~


vim +/sa8255p_qcom_geni_console_data +2011 drivers/tty/serial/qcom_geni_serial.c

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

