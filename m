Return-Path: <linux-arm-msm+bounces-107682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PvEELACBmrFdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 19:13:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E05451C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 19:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9EA53008A42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9F9387599;
	Thu, 14 May 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbTPgzWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB8347BB5;
	Thu, 14 May 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778795; cv=none; b=Ofsc5BTUuKekp7lQCVZrgdpf65V8U2ZmBRit48dmTBSDFzbenfPC092RlTstvP1wtuK/xzoDfxQD9yBkYyKcjmK85I6XoAOheud6YQISR8FUtXw1cTS3+nsiMvWQH5djEpfRYA1cppH+iqEy9DFY0sn8lIyQfiJvMH6rs3IkwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778795; c=relaxed/simple;
	bh=/1pplkGFJvD/CxnKzV0sXrRhH2siesGL5c3CytScgvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vsmln0oC0RYCuGzTs1Q/+Zcb8G/oXjUDiCmYwcADWzW0Lp7c9+C8ZoEcyWy8fcTPWFVCy7oK23eIxL8/1BZWylCADjpXOo0ql3juSeVmryWIMZbTwFub+h6UklrGQM9ZuzEmB9UMzDmKL+GZ53fZI3zAjx1AX5RYHORG2AWYPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbTPgzWS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778778794; x=1810314794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1pplkGFJvD/CxnKzV0sXrRhH2siesGL5c3CytScgvM=;
  b=jbTPgzWSu/ZHbuP26so4FQXw3cDXaHffOaBf57bdbQTeW8v5bmmkFtja
   jU5z1qSoWLaDsHyNTfNEwtRbot1ik3UWPmi9tSUMOZA5HsCSHXCUvWiEK
   22vvBFlSPvQP6jc806YvdPB+6HJ/WSEa+ACvaLJT32VdH6NjvxkZva8C/
   01BDuGIaUEGwiS6ByYwuDRi34ccAUl93fuV0gzUe+f6+re1tTkC9ThUGk
   kkZdQJrwSIE4sQkkIMoV5dwktBbmcuRBkz7/hoRqB/XCTCHZ+eAD0U/h2
   IQuCdXgFOAZjkqGRY9dF5Npw/FqryYeBUiK1QfFhTRd28N6zUHVwP8ZCb
   Q==;
X-CSE-ConnectionGUID: oFuS/D+qQeKEGTTD78FjTA==
X-CSE-MsgGUID: 6fSvS0X1SYWF/6e68ykxfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90036252"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="90036252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 10:13:14 -0700
X-CSE-ConnectionGUID: +TUi61o2SbKoP/93OHwWnQ==
X-CSE-MsgGUID: Wqt133HsRyy4JR9tvGeliQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242444557"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 10:13:11 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNZcS-000000006q7-1jkF;
	Thu, 14 May 2026 17:13:08 +0000
Date: Fri, 15 May 2026 01:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	manaf.pallikunhi@oss.qualcomm.com,
	Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] thermal: qcom: tsens: widen temperature limits to
 match hardware range
Message-ID: <202605150118.EgOsiHWm-lkp@intel.com>
References: <20260508100700.772985-3-priyansh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508100700.772985-3-priyansh.jain@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9B3E05451C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107682-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Priyansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Priyansh-Jain/thermal-qcom-tsens-atomic-temperature-read-with-hardware-guided-retries/20260514-191243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20260508100700.772985-3-priyansh.jain%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] thermal: qcom: tsens: widen temperature limits to match hardware range
config: sparc-randconfig-r072-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150118.EgOsiHWm-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150118.EgOsiHWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150118.EgOsiHWm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/qcom/tsens.c: In function 'get_temp_tsens_valid':
>> drivers/thermal/qcom/tsens.c:815:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     815 |         if (!ret)
         |         ^~
   drivers/thermal/qcom/tsens.c:818:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     818 |                 return ret;
         |                 ^~~~~~


vim +/if +815 drivers/thermal/qcom/tsens.c

   806	
   807	int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
   808	{
   809		int ret;
   810		int hw_id = s->hw_id;
   811		u32 temp_idx = LAST_TEMP_0 + hw_id;
   812	
   813		ret = tsens_read_temp(s, temp_idx, temp);
   814	
 > 815		if (!ret)
   816			*temp = tsens_hw_to_mC(s, *temp);
   817	
   818			return ret;
   819	}
   820	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

