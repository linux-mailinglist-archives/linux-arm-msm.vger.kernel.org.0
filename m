Return-Path: <linux-arm-msm+bounces-93851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PXCKjLknGn4LwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:35:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FE17F9C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A0CE3035BE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB9037FF46;
	Mon, 23 Feb 2026 23:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGo9FyHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04837F8C5;
	Mon, 23 Feb 2026 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889701; cv=none; b=nM0H0Jiy69D2V5Vz/Eufuj2aodQHh8+91zGOkiZIFktoa2r5+QQ7vGVlpUhzij+gORy3kaaT3/e2FjVMapwDjab5Bws8nu9gCqznGrisJEUN9snzh8pKgB2qiTMfqTP6DuHg0ULh6o0hn8+IeeJMmqoNCTcQiNtJ6j4YshlJS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889701; c=relaxed/simple;
	bh=12QBzguf+Sdz92WxcJUhXyt70Tdl6GQe5lxoiPkm+S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsiR62yH8YhPuUk61JKHy35lEDOiYAxIZcnYoKKT0IbMiBLc+ewWO9u92vA3mLqpSfUQ1BwmfIv49b2s+c1QeNIsFynWo/2PII/JSI68deGi7Ea+Lk7KCu/Z9MvOfPSjZh2x/kZpuL8RlrI4TUJAmo6glqCwrfbjpJM+tgbzWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGo9FyHb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771889698; x=1803425698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12QBzguf+Sdz92WxcJUhXyt70Tdl6GQe5lxoiPkm+S8=;
  b=iGo9FyHbguqGth8ZTqLl8UmiDyQNCwi+8HBUw3W6rqEWbknJpxw4NbcZ
   dU5AYKEpBNGO119gj9oF5zpMBXZxk2XE+mD0Xxhm4yC7rwAdzNzTSGNsH
   65FCJ8Sa4boqivC6ZidHs/f6QydGZc/aIkkLGIw22ZZMOC/M8BNogKQcj
   jhnlrRKrENm7x9wzsPpijNSLMgB3smH8WJmpizADWJbrbWmOgC+iD92vL
   yPuM1SCvwSP3LFD3PnNtU8dspnJCdLNg8sVxxOV3CP/MUFTYEol9JGfVR
   9jKeNelVKxgUuVVmC0H9nd+I3xxwAFCLmTHoOwMogv7P8EEmLqUi/HN0V
   g==;
X-CSE-ConnectionGUID: /tRDocv9RJOcoT/mT36vrA==
X-CSE-MsgGUID: gkn9Y0PbQSGklvbagmMAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72808685"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72808685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:34:58 -0800
X-CSE-ConnectionGUID: MXqlupThQmmH4PZM0z+Q+w==
X-CSE-MsgGUID: Q+Y5IiqsQ2iSTcUgG2X6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215568156"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Feb 2026 15:34:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vufS0-000000000wH-227N;
	Mon, 23 Feb 2026 23:34:52 +0000
Date: Tue, 24 Feb 2026 07:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
	quic_vbadigan@quicinc.com,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Message-ID: <202602240705.ujRk6agl-lkp@intel.com>
References: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_DNSFAIL(0.00)[intel.com : query timed out];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 8D6FE17F9C0
X-Rspamd-Action: no action

Hi Krishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-ASPM-Add-helper-to-encode-L1SS-T_POWER_ON-fields/20260223-192621
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260223-t_power_on_fux-v2-2-20c921262709%40oss.qualcomm.com
patch subject: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
config: i386-buildonly-randconfig-004-20260223 (https://download.01.org/0day-ci/archive/20260224/202602240705.ujRk6agl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240705.ujRk6agl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240705.ujRk6agl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_421 marked "dontcall-error": FIELD_PREP: value too large for the field

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

