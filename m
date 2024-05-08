Return-Path: <linux-arm-msm+bounces-19536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AB8C0706
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3499228326E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AC7132C39;
	Wed,  8 May 2024 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7sNgSIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F413329E;
	Wed,  8 May 2024 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205580; cv=none; b=MUau+vm1Mi3J1xhCBbgO+2DgOu8VKle81GBs7ZvI2pEcBkvTguw8VCKWn9p3huEFHudPleq6boWtDpvpwK5TmxYu8BqcAwF9MSqghtaBBEmwpmgibShVAbKP11u9/0roTK5ZrA169jQpZvidxziHrxkvMbgjjbl23QaVU+SQFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205580; c=relaxed/simple;
	bh=pnFOD9IX//ofvuncrblliTyUlG1w100hGR9knvZhZXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiOAmL1U5zVo1p6NfKhVpG/IWxyrSJOC+zg8GzHlYbmViZhymRrFSlzOt/4Nv3hO55O4B1DeLCyyAl+YBtE9sfbkIFav/yXUzuzXFMIfCZnfeYmcG6TGTzK6m5TwNNQM0A7N8sR/Gio1Y4JB8h8/muDZbakEdhRE+bQqBbq512Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7sNgSIV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715205577; x=1746741577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnFOD9IX//ofvuncrblliTyUlG1w100hGR9knvZhZXk=;
  b=i7sNgSIV8f7sdH1aB618Fbc8he+3gmydSVVq2nmfjjLkpPcDiZzBh5q4
   OYoVe9ClyxvxU32aodR3KevYdKzCistQED7hGkHlWBCksgc3XwvMD4v0N
   reJZJVoxKUX4wShYE3RNpBxa3FlChzcplylJusEudwRhIdkTu7toXWuLj
   BIMTShLpNvyblzet3obpqFkzE6D+wezgEEptSpO2PMu/fLq4YbAAFjX79
   V2AYKL1jGnPp2yVODZ8JTtE9K0S1u1ZBrlDFXJ1Y1trnJMPAtYfVbq+bp
   VZ4t5xX7v/xMgiSzuie4xMUOp6a3fG3vrkydHwDwuhYT9/VMWJGOaHOTZ
   A==;
X-CSE-ConnectionGUID: IGmSuFltSaOpMpwVP21kfQ==
X-CSE-MsgGUID: FqcNKXJDQ8GjeD7H7i4WWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36476923"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="36476923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 14:59:37 -0700
X-CSE-ConnectionGUID: OBZ7gJWjRU6dx7I2duYT0g==
X-CSE-MsgGUID: cGj9tXwVSUed+lE7Fh8jyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="29120162"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2024 14:59:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4pK0-00049W-2T;
	Wed, 08 May 2024 21:59:32 +0000
Date: Thu, 9 May 2024 05:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add static PD restart support
Message-ID: <202405090528.O8hhDGHk-lkp@intel.com>
References: <20240508054250.2922-6-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508054250.2922-6-quic_ekangupt@quicinc.com>

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.9-rc7 next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Redesign-remote-heap-management/20240508-134613
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20240508054250.2922-6-quic_ekangupt%40quicinc.com
patch subject: [PATCH v1 5/5] misc: fastrpc: Add static PD restart support
config: i386-buildonly-randconfig-001-20240509 (https://download.01.org/0day-ci/archive/20240509/202405090528.O8hhDGHk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090528.O8hhDGHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405090528.O8hhDGHk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_get_domain_list':
>> pdr_interface.c:(.text+0x22b): undefined reference to `qmi_txn_init'
>> ld: pdr_interface.c:(.text+0x261): undefined reference to `qmi_send_request'
>> ld: pdr_interface.c:(.text+0x275): undefined reference to `qmi_txn_wait'
>> ld: pdr_interface.c:(.text+0x2ad): undefined reference to `qmi_txn_cancel'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_restart_pd':
   pdr_interface.c:(.text+0x451): undefined reference to `qmi_txn_init'
   ld: pdr_interface.c:(.text+0x48d): undefined reference to `qmi_send_request'
   ld: pdr_interface.c:(.text+0x4a7): undefined reference to `qmi_txn_wait'
   ld: pdr_interface.c:(.text+0x58f): undefined reference to `qmi_txn_cancel'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_register_listener.constprop.0':
   pdr_interface.c:(.text+0x746): undefined reference to `qmi_txn_init'
   ld: pdr_interface.c:(.text+0x796): undefined reference to `qmi_send_request'
   ld: pdr_interface.c:(.text+0x7aa): undefined reference to `qmi_txn_wait'
   ld: pdr_interface.c:(.text+0x7fd): undefined reference to `qmi_txn_cancel'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_send_indack_msg.isra.0':
   pdr_interface.c:(.text+0x9df): undefined reference to `qmi_txn_init'
   ld: pdr_interface.c:(.text+0xa33): undefined reference to `qmi_send_request'
   ld: pdr_interface.c:(.text+0xa3e): undefined reference to `qmi_txn_cancel'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_locator_work':
>> pdr_interface.c:(.text+0xdf4): undefined reference to `qmi_add_lookup'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_handle_alloc.part.0':
>> pdr_interface.c:(.text+0x1159): undefined reference to `qmi_handle_init'
>> ld: pdr_interface.c:(.text+0x1177): undefined reference to `qmi_add_lookup'
>> ld: pdr_interface.c:(.text+0x119b): undefined reference to `qmi_handle_init'
>> ld: pdr_interface.c:(.text+0x11a8): undefined reference to `qmi_handle_release'
   ld: drivers/soc/qcom/pdr_interface.o: in function `pdr_handle_release':
>> pdr_interface.c:(.text+0x1567): undefined reference to `qmi_handle_release'
   ld: pdr_interface.c:(.text+0x1572): undefined reference to `qmi_handle_release'
>> ld: drivers/soc/qcom/pdr_interface.o:(.rodata+0xd8): undefined reference to `qmi_response_type_v01_ei'
   ld: drivers/soc/qcom/pdr_interface.o:(.rodata+0x1f8): undefined reference to `qmi_response_type_v01_ei'
   ld: drivers/soc/qcom/pdr_interface.o:(.rodata+0x278): undefined reference to `qmi_response_type_v01_ei'
   ld: drivers/soc/qcom/pdr_interface.o:(.rodata+0x358): undefined reference to `qmi_response_type_v01_ei'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_PDR_HELPERS
   Depends on [n]: NET [=n]
   Selected by [y]:
   - QCOM_FASTRPC [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && RPMSG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

