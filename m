Return-Path: <linux-arm-msm+bounces-101616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDliMk9/z2mvwgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:50:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E1392575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A473087D22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E7137E301;
	Fri,  3 Apr 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjvpktfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28610311967;
	Fri,  3 Apr 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205964; cv=none; b=r1zyYQXSHOMbqfCw7jAsX23K8aQAyRUYfL095XABLS6UEcxdpwFA5MyFgIZbufzwGpqvK17XY+1QtOeyYGpPCVkv+CuKDc9a11TK5uIArzlEfylMo8BbE4fXsH78FFi7E2AMONG6lhkKAXMTftzh995qFZcQejrhYyy1/NIslvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205964; c=relaxed/simple;
	bh=dGzvD3WMZ7ApgfNMnWpS6QRAoMFpStksJNke3nP04jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNbLsFuUMqBBrzQueI/iIx9AlVXihY/4zq+/NWr69SpsO2KrisYe9QsZdbps0hO8SHWMygiGcrM7u55vTKT5VSdxtLHQ7IOlnYzJoD9tf1IfrlGzJH7EJ61XeFi9EYfeB4hOksRjEYfmqZnRrZBZh+2dReaCIxTsJd0bBDogHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjvpktfc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205963; x=1806741963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dGzvD3WMZ7ApgfNMnWpS6QRAoMFpStksJNke3nP04jI=;
  b=mjvpktfcEkfO7KN9UthY9URzvb0VJBITBygHCct6pz/8w1E0m6sIp1xb
   4cITCt30ViHWY93NtIqcB8X/0UEeUIMiWqFVXWxzuS4rs1Bru5wrBXefO
   dPAPpbKXB2qzY3RFgjbuIG6P+oYtXZYAELwScq0TQC8pRMgKj/4cmPLkv
   eWM54pDziFD4nm/RIssyUsaJ6pgdA1kzU1Jr9XwIfsLyfBqLfSYAG5Eiz
   86fDiAdHq+uGm4tSOUKU1H4hVb0+lU3cGChTauB2UIuERjbAcLStu00TT
   KLpGFI6r9IEZJNfJtDnmhpkNSfLsYiYKzqoZuMcbgJk6UmC+eUpracYw9
   A==;
X-CSE-ConnectionGUID: Ea9F8h5rRzu5+QTFUe327w==
X-CSE-MsgGUID: IlLIHZFbQ8OmDZp2LE9aQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889045"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889045"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: EslWojyKRh+qDZ3ITd05Sw==
X-CSE-MsgGUID: N93IYWjPRiC1dISNdbkVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368975"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000015x-1jED;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 3 Apr 2026 16:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
Message-ID: <202604031016.SQiyhL8h-lkp@intel.com>
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-101616-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 750E1392575
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maulik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Maulik-Shah/cpuidle-Deny-idle-entry-when-CPU-already-have-IPI-interrupt-pending/20260316-155453
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260316-cpuidle_ipi-v1-1-d0ff6350f4e2%40oss.qualcomm.com
patch subject: [PATCH] cpuidle: Deny idle entry when CPU already have IPI interrupt pending
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604031016.SQiyhL8h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031016.SQiyhL8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031016.SQiyhL8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cpuidle_enter_state+0x3d: call to cpus_peek_for_pending_ipi() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

