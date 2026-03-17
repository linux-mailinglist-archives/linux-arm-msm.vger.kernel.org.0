Return-Path: <linux-arm-msm+bounces-98143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC5sDxYquWkAtAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:16:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B272A7AE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 286CD305F671
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAF03914EC;
	Tue, 17 Mar 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esgxgUOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCB3A451A;
	Tue, 17 Mar 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742255; cv=none; b=eTTuM9ZLbO3xSp9B8seq0A/aPM29JPEVDHFTywL1B7dKzHtPOZAPd5vaYtnoGN/yNI8bOaOElYmr41vOBqApEy25cqTqpyghTWidfTphVT1MCuNFptmU5wUMnRH37qYkzPSjCmTT0sA33LKO9Hfnu4eK46LwlfRT9DoA1n8tVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742255; c=relaxed/simple;
	bh=pjLtVEXYu6Ezm9WVwTnSwzGyT6cFbKsaKtpF/hqBJGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkpUddJ/3tRtTsffFWQM9c5P/VGCauqFamIOrHCsw8auTaCWT309+ndAgNHRTGwRIgpOyOoJXbq+CMBG7S3GuOYtvqOwR23Zi7mIN0hk5CS2H5Q2PxRKPrZcXJpFKT4XeUzZqXAQuvwq72JW2Vv4Zk78jj0aaJLt3MSLzxIQt2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esgxgUOI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742249; x=1805278249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pjLtVEXYu6Ezm9WVwTnSwzGyT6cFbKsaKtpF/hqBJGc=;
  b=esgxgUOICDba9Dv0wpSbMJbD2Q6KeQPuXWbJpm0T7+5vwCteEdvRu/g+
   8dj0juKZ9C1YWMbx8cuuMKgQOESwLNOIBRDQ38sefsNGl+SONL/F0uYnH
   QY34yqJmMRYg6UdEpSuaazXjvI47a9HbOYBKmA6ilybHuSWwy32rCM610
   e5ucc8HclTX/dRBcbbVQdflOH78y13jwvFqGCHfA1amQYZIAagW4x6QOG
   ubb5pEOeDwjpiN4NYWe3fUemX+OE/G4zqnsQlWZCPtz5GG2Q1uYxcHm2g
   Ip0qRBAE/NohjGakkSKtQjRJ1HUkuKvBclZl+vveBA9MJ7iMW9FvNEmIy
   g==;
X-CSE-ConnectionGUID: KP2ytwgWQHSAKdAMRo2JGg==
X-CSE-MsgGUID: dOv+UKQYRCaZ0pPSInKulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73947785"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73947785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:10:47 -0700
X-CSE-ConnectionGUID: rZW/vNdCSgKXquYHdxLMXA==
X-CSE-MsgGUID: P9pMYPriQluzlqeXNUdWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="224396867"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 03:10:43 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2RNo-000000000Dd-19DE;
	Tue, 17 Mar 2026 10:10:40 +0000
Date: Tue, 17 Mar 2026 18:10:08 +0800
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
Subject: Re: [PATCH v15 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Message-ID: <202603171821.OtWlpARW-lkp@intel.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98143-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 98B272A7AE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-refactor-ctcu_get_active_port-and-make-it-generic/20260315-052703
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319%40oss.qualcomm.com
patch subject: [PATCH v15 6/7] coresight: ctcu: enable byte-cntr for TMC ETR devices
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171821.OtWlpARW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171821.OtWlpARW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171821.OtWlpARW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:177:3: error: cannot jump from this goto statement to its label
     177 |                 goto out;
         |                 ^
   drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:179:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     179 |         guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
         |         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:18:1: note: expanded from here
      18 | class_raw_spinlock_irqsave_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:24:1: note: expanded from here
      24 | __UNIQUE_ID_unlock_802
         | ^
   drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:179:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:419:15: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:12:1: note: expanded from here
      12 | __UNIQUE_ID_guard_801
         | ^
   1 error generated.


vim +177 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

   156	
   157	static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
   158	{
   159		struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
   160		struct ctcu_byte_cntr *byte_cntr_data;
   161		int ret = 0;
   162	
   163		/* byte-cntr is operating with SYSFS mode being enabled only */
   164		if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
   165			return -EINVAL;
   166	
   167		byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
   168		if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
   169			return -EINVAL;
   170	
   171		if (byte_cntr_data->reading)
   172			return -EBUSY;
   173	
   174		/* Setup an available etr_buf_list for byte-cntr */
   175		ret = tmc_create_etr_buf_list(etr_drvdata, 2);
   176		if (ret)
 > 177			goto out;
   178	
   179		guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
   180		atomic_set(&byte_cntr_data->irq_cnt, 0);
   181		/*
   182		 * Configure the byte-cntr register to enable IRQ. The configured
   183		 * size is 5% of the buffer_size.
   184		 */
   185		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
   186				       etr_drvdata->size / MAX_IRQ_CNT,
   187				       byte_cntr_data->irq_ctrl_offset);
   188		enable_irq_wake(byte_cntr_data->irq);
   189		byte_cntr_data->buf_node = NULL;
   190		byte_cntr_data->reading = true;
   191	
   192	out:
   193		return ret;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

