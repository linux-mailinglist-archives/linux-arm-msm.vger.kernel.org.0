Return-Path: <linux-arm-msm+bounces-99728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACDsOXHzwmnCnQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:26:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0A31C508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9036F303D6C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3634134C981;
	Tue, 24 Mar 2026 20:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYIVk2bR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077721D3F3;
	Tue, 24 Mar 2026 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383977; cv=none; b=jiJwY68kocCLZv7f5Fvpz1mbWV5bK/eu0i4kXPBozOpzFCq+7Ej9eUP5i5g7t/95l2SKwmxGZoeTCuybFDyxlNS1sp+Rkm5DcWjfM7IxjPzxwoTYSgg7nXgcc0pJ51vUNngBGyB4xSIjZ9z5WTCpr979Sj9W7ug+K5fxgTf6Bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383977; c=relaxed/simple;
	bh=GwJgGUd50LjbjPknsKsF1WEzAdeUxCLh3W5ACrHeFKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db4VWpJcbSbjztbTEmCfSZRGB+QXfkGxE/8DnNtRFPPKJ5Eg4kdqOz2YTUj9xsSEzVFSUIeGu1kipZlUr6dXW3f8lHZFyc6q8fE9IDJMS/4DQc31sfMRRxgF5GUaZruKcI0imfmZ3ThPi96AzY0rxmxSVv4+eJYMSnchGFhbhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYIVk2bR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774383975; x=1805919975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GwJgGUd50LjbjPknsKsF1WEzAdeUxCLh3W5ACrHeFKQ=;
  b=jYIVk2bROSvj1zaORpeaNQpMmhJ070wtXSKWWJmZEFKatuFufLUgyPAO
   qSjKuYvLJinpVS+zFpPHOmJWyYGe0w/OK5h+zR7gAwHkhT/Oxieuh6Gbl
   Dz9ORXJpS10ptXSgUbGVocj5WKqZn1ExVIvd43i8EKZzLCq05eRnuRgce
   7IweJ9cDJUAdL7P24P80j3Fw1Y9N0TiaTiPYlulqHznrinn3vHiZaz83y
   9kHZT8ClOItg0WnKA5rpHFsL3AG837u2xiyVzo+B/0T3KboVD+5ycHcKh
   MZDQCfyWBIOj8GRvrUyBx0fYhOp2kwNxHgWFt4ydCRBF2PaGP/FLJzubh
   g==;
X-CSE-ConnectionGUID: 5FaInDbvQQa1m4US0FrL6Q==
X-CSE-MsgGUID: N1EM9hrLRduir0fk5/9KLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86789301"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86789301"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 13:26:15 -0700
X-CSE-ConnectionGUID: P70ArQhkQRK5fyxDI0RJGA==
X-CSE-MsgGUID: RppNMgQJT5SX+EIO2JapUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221119744"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2026 13:26:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w58KF-000000005PB-3bAi;
	Tue, 24 Mar 2026 20:26:07 +0000
Date: Wed, 25 Mar 2026 04:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mohammad.rafi.shaik@oss.qualcomm.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <202603250417.fEMbsde2-lkp@intel.com>
References: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99728-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 89D0A31C508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20260324]
[cannot apply to robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qcom-q6apm-move-component-registration-to-unmanaged-version/20260324-160527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260323223845.2126142-14-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250417.fEMbsde2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/qcom/qdsp6/q6apm.c: In function 'q6apm_free_fragments':
>> sound/soc/qcom/qdsp6/q6apm.c:321:39: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     321 |         struct audioreach_graph_data *data;
         |                                       ^~~~


vim +/data +321 sound/soc/qcom/qdsp6/q6apm.c

25ab80db6b133c Srinivas Kandagatla 2021-10-26  318  
ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  319  int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
25ab80db6b133c Srinivas Kandagatla 2021-10-26  320  {
25ab80db6b133c Srinivas Kandagatla 2021-10-26 @321  	struct audioreach_graph_data *data;
25ab80db6b133c Srinivas Kandagatla 2021-10-26  322  
25ab80db6b133c Srinivas Kandagatla 2021-10-26  323  	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
25ab80db6b133c Srinivas Kandagatla 2021-10-26  324  		data = &graph->rx_data;
25ab80db6b133c Srinivas Kandagatla 2021-10-26  325  	else
25ab80db6b133c Srinivas Kandagatla 2021-10-26  326  		data = &graph->tx_data;
25ab80db6b133c Srinivas Kandagatla 2021-10-26  327  
25ab80db6b133c Srinivas Kandagatla 2021-10-26  328  	audioreach_graph_free_buf(graph);
25ab80db6b133c Srinivas Kandagatla 2021-10-26  329  
ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  330  	return 0;
25ab80db6b133c Srinivas Kandagatla 2021-10-26  331  }
ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  332  EXPORT_SYMBOL_GPL(q6apm_free_fragments);
25ab80db6b133c Srinivas Kandagatla 2021-10-26  333  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

