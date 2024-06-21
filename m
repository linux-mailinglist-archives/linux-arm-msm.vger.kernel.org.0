Return-Path: <linux-arm-msm+bounces-23531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFFE911CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 09:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7E21C215AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F37168C0C;
	Fri, 21 Jun 2024 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cshbk9pF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955415A49F;
	Fri, 21 Jun 2024 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955421; cv=none; b=t/eGUnckFw2pDTSsTNLg8/x/NRaPKK1lXJB4rAzELMP6q633zQyovwVhK6M4JsriK3Mmvy4keL7jleNOLD6O3LvdM+gYYH9zXoPImUzyLXN2lFDbEmM60x+cSMx1fq+Nrdd+bXgE/T3ZIyJQLfnXlV4I9HAZFYzJDhb06eGCBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955421; c=relaxed/simple;
	bh=ke+r23BTDD21jUujjqNFtd8m4jT5jsEpK++8SapryWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+azsJ8eFVpZbmiAuTUSk1ziG/0X5IrKO1Lyogc8HWWeIUvV2xWlxdsBJuaOUVKbbEvm1f63uuL7o+NQj68ihsz2hi9/MlOVkoIrMQ09xWvJJcRSFA5ranRAg0JFZ4RooXkbAFMOSYhxj9nGD40iOzV7DVSeM2HKhypq69aPwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cshbk9pF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718955419; x=1750491419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ke+r23BTDD21jUujjqNFtd8m4jT5jsEpK++8SapryWI=;
  b=Cshbk9pFFsBlWr0OAN8t1Gmslv1zOlEZv19bHM0uukAmB/e/GwXjExPJ
   /YHtblVAczMOGZmN3sd8pHx+CtA1fgxd+9Rsvdb/jVOF/00WQmXG4zKUr
   oX0t0HT+pN8NdpNs63gmWS0WeUh21qQPl5L/97QNkHuxtJqyjWu2kXvH9
   Vo9vJEsms8Us4kZuRdTH17+ZtkzWHdLQ+73z51nj67SZmis6OLg2zawf2
   yEQ+0b+O4X0QHlbQxwTWuL5QIGIrujoCe6O+UX1nYZL/Gh4Wa2RBw1CqJ
   AHMlZYu5KkIpbx7DwS9KCDcrkHpXlbUsZMVaVakLZzQJOwa4+wupgJI51
   w==;
X-CSE-ConnectionGUID: nIBgm0OBSrmevCqlJy9YAA==
X-CSE-MsgGUID: RvTvCc6VSSa7cwuzqqg00Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41380600"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="41380600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 00:36:58 -0700
X-CSE-ConnectionGUID: ToHq5LJEQ1KUNWNh6d9r+Q==
X-CSE-MsgGUID: /UwiEcC3SJ+H3frnT7NadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="46854468"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jun 2024 00:36:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKYpF-0008Ky-1m;
	Fri, 21 Jun 2024 07:36:49 +0000
Date: Fri, 21 Jun 2024 15:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jinlong Mao <quic_jinlmao@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Song Chai <quic_songchai@quicinc.com>,
	linux-arm-msm@vger.kernel.org, andersson@kernel.org,
	quic_yijiyang@quicinc.com, quic_yuanjiey@quicinc.com,
	quic_liuxin@quicinc.com, quic_yanzl@quicinc.com,
	quic_xinlon@quicinc.com, quic_xueqnie@quicinc.com,
	quic_sijiwu@quicinc.com
Subject: Re: [PATCH v1 2/3] coresight: Add coresight slave register driver to
 support data filter function in sysfs mode
Message-ID: <202406211517.KmJFaZkV-lkp@intel.com>
References: <20240618072726.3767974-3-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618072726.3767974-3-quic_jiegan@quicinc.com>

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240617]
[also build test ERROR on v6.10-rc4]
[cannot apply to robh/for-next atorgue-stm32/stm32-next linus/master v6.10-rc4 v6.10-rc3 v6.10-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/dt-bindings-arm-Add-binding-document-for-Coresight-Slave-Register-device/20240618-181003
base:   next-20240617
patch link:    https://lore.kernel.org/r/20240618072726.3767974-3-quic_jiegan%40quicinc.com
patch subject: [PATCH v1 2/3] coresight: Add coresight slave register driver to support data filter function in sysfs mode
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240621/202406211517.KmJFaZkV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211517.KmJFaZkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211517.KmJFaZkV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-csr.c:21:
>> drivers/hwtracing/coresight/coresight-etm4x.h:237:10: fatal error: asm/sysreg.h: No such file or directory
     237 | #include <asm/sysreg.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +237 drivers/hwtracing/coresight/coresight-etm4x.h

03336d0f4d0d74 Suzuki K Poulose 2021-02-01  236  
03336d0f4d0d74 Suzuki K Poulose 2021-02-01 @237  #include <asm/sysreg.h>
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  238  #define ETM4x_REG_NUM_TO_SYSREG(n)				\
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  239  	sys_reg(2, 1, ETM4x_CRn(n), ETM4x_CRm(n), ETM4x_Op2(n))
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

