Return-Path: <linux-arm-msm+bounces-96021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJHaDvs5rWndzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 09:57:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673122F1A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 09:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84DD301CFBD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938A736074F;
	Sun,  8 Mar 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPU/e8Kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC23603D9;
	Sun,  8 Mar 2026 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772960225; cv=none; b=kvW0G0DBVOZTcPyTEEAIov0hnyHacjk/JF3EL63+Km/9ZX6ZW9UNLXnx4HECUjppjwhNTI+RysuPbY78L9msIIpqRGmLGC05JFTeDM1s1Fh/vbpbAla3TqzGuHknO2qwv/fjn969JuQgPMvzOclxMKIORpce4xjEWMqs6A2ywb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772960225; c=relaxed/simple;
	bh=x3L8/hSJukNMi+lmDq/Se3gidbTHfKkxioCsvzYz/9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FljA3yLxJAfulNn4SMpfJozzVWptTXTQKQw6EisY+6YphgoagdqxojIupbCKoiFn+UEdse3DUZa5WgvM2QNCSo5RhAocwr7Qg+IZvqJj+iH4456bBgn19Fyi6MUx2bDaPCFEyme8umFanA8vlUOaQ9VdaprM8CXr0fNH6zy942k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPU/e8Kh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772960224; x=1804496224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3L8/hSJukNMi+lmDq/Se3gidbTHfKkxioCsvzYz/9c=;
  b=dPU/e8Kh57hbt9VxXkO0UP4ucbUkM9Ak+CFsBhjTwmMSK19jN77RVbfh
   /vrMTmVwKjFz+O6pYW/mmmiUyYyoaHsaovz1NXBU1ljuOhHVAkjTdqycE
   MWUL8lfeZFWAe5QKs/Ku4tIhIQQ39/TlkQ48zuMaQQ65goVHdkDtwGaGq
   Q2XjAWQy03pl2SOfQTERYEJETm2RpOeJvFIgJb/7gx17o8vyDaqKkNHLc
   /mVA1PUHVdSWhPlRINIAI5Z2mhFS9luN38WRncGlrq5CLPdl+pT5MUyIx
   JVG1c01Aq/GJtecSGQZ2nzvRMji2/XCuPU+U8lfIzH7Mpp86LCqMxSH6F
   A==;
X-CSE-ConnectionGUID: SowMNRNYTV+R5gI00tNMqg==
X-CSE-MsgGUID: ooY5WhT3SBK+m3LPTHE0zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74202442"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74202442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 00:57:03 -0800
X-CSE-ConnectionGUID: qaGVg+KyTWmMdGABz88xqw==
X-CSE-MsgGUID: KiZ3vj7/QA+yk4CkqqYqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223920453"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 00:57:00 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz9wX-00000000305-2YXB;
	Sun, 08 Mar 2026 08:56:57 +0000
Date: Sun, 8 Mar 2026 16:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev,
	Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
Message-ID: <202603081641.KSZC3Jla-lkp@intel.com>
References: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9673122F1A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96021-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.955];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Kishore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kishore-Batta/Add-documentation-for-Sahara-protocol/20260307-194417
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c%40oss.qualcomm.com
patch subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection at probe time
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603081641.KSZC3Jla-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081641.KSZC3Jla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081641.KSZC3Jla-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/mhi/sahara/sahara.c: In function 'sahara_select_variant':
>> drivers/bus/mhi/sahara/sahara.c:270:32: warning: the comparison will always evaluate as 'true' for the address of 'chan' will never be NULL [-Waddress]
     270 |                         if (id && id->chan && !strcmp(id->chan, v->match))
         |                                ^~
   In file included from drivers/bus/mhi/sahara/sahara.c:12:
   include/linux/mod_devicetable.h:867:20: note: 'chan' declared here
     867 |         const char chan[MHI_NAME_SIZE];
         |                    ^~~~


vim +270 drivers/bus/mhi/sahara/sahara.c

   260	
   261	static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
   262								  const struct mhi_device_id *id)
   263	{
   264		int i;
   265	
   266		for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
   267			const struct sahara_variant *v = &sahara_variants[i];
   268	
   269			if (v->match_is_chan) {
 > 270				if (id && id->chan && !strcmp(id->chan, v->match))
   271					return v;
   272			} else {
   273				if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
   274				    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
   275					return v;
   276			}
   277		}
   278		return NULL;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

