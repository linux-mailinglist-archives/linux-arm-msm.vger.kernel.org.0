Return-Path: <linux-arm-msm+bounces-98102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIIGLHoUuWkPpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:44:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7672A5DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FF60304D140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C3439C657;
	Tue, 17 Mar 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnfZFoFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693DD39C62A;
	Tue, 17 Mar 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737063; cv=none; b=LIqwOHQIWtPJ0/7WWdOuzJSJvvndbWLYpd+2a7mqmWqKDEUMgV4iBeQctwllRYmBoBE0QEagxUNwoTnoS5+puod60OagbK+15Z8sd0TqQGDMq4Tfz01V8tTVG6uvqxbhoS3w7y5SvLiM7tqT3zYKws+RFHuesbyD0817Kyy9QFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737063; c=relaxed/simple;
	bh=reN1ExzdLEqD8HVCpoyL9v3MG4Jeymcn9UW3+OEgzww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lINZ72aE4eabIF4YI0YYJfVNKSUA93JXp69dfocFNLWn4RdcF6eVLTErROXVZMLQstGjh8BzU2ZDS3cqDnMKZrbKPOO2GWnZpUtzjxVBL1j4OAziSGPWNBWTtCZodq7b7rCxr/ZTwX5rkgNvtmBama5QptxOIpvm2E+rnBq4Rb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnfZFoFV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737061; x=1805273061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reN1ExzdLEqD8HVCpoyL9v3MG4Jeymcn9UW3+OEgzww=;
  b=PnfZFoFVrh7i2aUVq+NELG2Aqa34IIFRu7/kIjk1aRYG+E0s2XdIuN5Q
   xV2PHUEatARujsZxYBtTD9HMjg0yBd/m0g3qvwo/qFVXs82uVjma/bNyw
   dWQ+w++15IydPytOQMETRI/9MTN7vsEA0A1bgIkBHEQYTkNjGAtLblvDp
   te4+TlCESBdEOHFAHE0phO3PUbAzfiFVep3cBxJy+LEE6h7ZdiAe976Rx
   V19Qk01sFArYXFy3GHCzKEj0P6ULsn0i8jEajZXbHtrSWypyslJoti1HJ
   1Ex3hhPFD/6gcnXRSFbGqmFis+RR16tCF/iReO6MuyHFoAXjKDHiH25n3
   A==;
X-CSE-ConnectionGUID: TtfT/9oyRBaPSy5GFB3wvg==
X-CSE-MsgGUID: 3FT0cR2wRx+D523WCa0NXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946574"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:21 -0700
X-CSE-ConnectionGUID: i4TMYhh1SJmDtT9VPYv95A==
X-CSE-MsgGUID: MwtWjn/sSB+XIPDkipta6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432349"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 01:44:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004j-3H6m;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202603171518.XQOgdjNN-lkp@intel.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98102-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E7672A5DB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-refactor-ctcu_get_active_port-and-make-it-generic/20260315-052703
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319%40oss.qualcomm.com
patch subject: [PATCH v15 2/7] coresight: tmc: add create/clean functions for etr_buf_list
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171518.XQOgdjNN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171518.XQOgdjNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171518.XQOgdjNN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-tmc-etr.c:1979:50: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
    1979 |                 raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
         |                                                                ^~~~~
   include/linux/spinlock.h:283:37: note: expanded from macro 'raw_spin_unlock_irqrestore'
     283 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                                   ^~~~~
   drivers/hwtracing/coresight/coresight-tmc-etr.c:1969:21: note: initialize the variable 'flags' to silence this warning
    1969 |         unsigned long flags;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/flags +1979 drivers/hwtracing/coresight/coresight-tmc-etr.c

  1957	
  1958	/**
  1959	 * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
  1960	 * @drvdata:	driver data of the TMC device.
  1961	 * @num_nodes:	number of nodes want to create with the list.
  1962	 *
  1963	 * Return 0 upon success and return the error number if fail.
  1964	 */
  1965	int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
  1966	{
  1967		struct etr_buf_node *new_node;
  1968		struct etr_buf *sysfs_buf;
  1969		unsigned long flags;
  1970		int i = 0, ret = 0;
  1971	
  1972		lockdep_assert_held(&drvdata->spinlock);
  1973		/* We dont need a list if there is only one node */
  1974		if (num_nodes < 2)
  1975			return -EINVAL;
  1976	
  1977		/* We expect that sysfs_buf in drvdata has already been allocated. */
  1978		if (drvdata->sysfs_buf) {
> 1979			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
  1980			/* Directly insert the allocated sysfs_buf into the list first */
  1981			new_node = kzalloc_obj(*new_node, GFP_KERNEL);
  1982			if (IS_ERR(new_node))
  1983				return PTR_ERR(new_node);
  1984	
  1985			raw_spin_lock_irqsave(&drvdata->spinlock, flags);
  1986			new_node->sysfs_buf = drvdata->sysfs_buf;
  1987			new_node->is_free = false;
  1988			list_add(&new_node->link, &drvdata->etr_buf_list);
  1989			i++;
  1990		}
  1991	
  1992		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
  1993		while (i < num_nodes) {
  1994			new_node = kzalloc_obj(*new_node, GFP_KERNEL);
  1995			if (IS_ERR(new_node)) {
  1996				ret = PTR_ERR(new_node);
  1997				break;
  1998			}
  1999	
  2000			sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
  2001			if (IS_ERR(sysfs_buf)) {
  2002				kfree(new_node);
  2003				ret = PTR_ERR(sysfs_buf);
  2004				break;
  2005			}
  2006	
  2007			/* We dont have a available sysfs_buf in drvdata, setup one */
  2008			if (!drvdata->sysfs_buf) {
  2009				drvdata->sysfs_buf = sysfs_buf;
  2010				new_node->is_free = false;
  2011			} else
  2012				new_node->is_free = true;
  2013	
  2014			new_node->sysfs_buf = sysfs_buf;
  2015			list_add(&new_node->link, &drvdata->etr_buf_list);
  2016			i++;
  2017		}
  2018	
  2019		/* Clean the list if there is an error */
  2020		if (ret)
  2021			tmc_clean_etr_buf_list(drvdata);
  2022	
  2023		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
  2024	
  2025		return ret;
  2026	}
  2027	EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
  2028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

