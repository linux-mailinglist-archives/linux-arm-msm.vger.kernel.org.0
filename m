Return-Path: <linux-arm-msm+bounces-100537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fRAGHYzAx2lNbwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:50:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAD34E438
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 12:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70FD0301412E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 11:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B01386C3E;
	Sat, 28 Mar 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv/QZ9Kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0841B29BDB1;
	Sat, 28 Mar 2026 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698632; cv=none; b=sRaXnA1F9pf7eZt/7/blMg/2V1/PI6uytJY4LP4nIsHQCi/u/EeBEq8ng5LX7TUMnOPMdecToXEW5NJ5zjjVCJDMB2mf04jYYdadOWqysSWPmlSKpUIHhYrKKVE1skt1ZF7WPyP8Zln0Wjiur6ozZjU6fFOufQC6dp2NK0ndVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698632; c=relaxed/simple;
	bh=0seqYhxQDMsWGpCXIvBhZ0959G2SjpqTcl9BBunVtIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1l/0dNdiMa6YpCICqUsdWiNzPXCeK8yeOjIOTEiq7Q7kH/oFQApdSn5kN9cnJ1TuZjJs3r2ouPn+WFrQCOit0M2vK8Rs496h76MAOs7/OgykFXA3apxPe70o7qlEyHD+FORqPnNqKW33PWCWiuwde2gTl+6xA5iMEvelg/gpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv/QZ9Kq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774698630; x=1806234630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0seqYhxQDMsWGpCXIvBhZ0959G2SjpqTcl9BBunVtIY=;
  b=Fv/QZ9KqdwUd3fd0rEOrzCk+JfgrKl82YyrHO7OFrYNtvUim5fh+tw85
   Nvab5aIFTk9d+1UIkD9xTKvmA6i9iaP7CCuFl3OFrD/3c5vDKAFiKya6V
   FwCvWGrVzKjSx4NKQQK4tp7BBT1B7Tlyz3smF5M5b4nm4lmDIVw0ej7iY
   h9aWvZyfrPQ1o7CH8rY4vxrDRiFkwGo6vsEeo+DVb+jxKSDXDqXX2orIq
   HZWpg/SZAuyi4UQQT1BDYauTxb06isYgG5B9LIv0rBbH0ZXSQJyofYl9G
   zZQh35TditDneSP8HHB+TQnqbIucw8hglxBJr3TG5+x8Rd+gol3JBaUNg
   A==;
X-CSE-ConnectionGUID: oYkIh9KWRJeyjG21eclkvg==
X-CSE-MsgGUID: NgNt88yhQRK4GBv0Rhhq8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="101215715"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="101215715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 04:50:29 -0700
X-CSE-ConnectionGUID: skjAKRmaSv294qckSrQz/w==
X-CSE-MsgGUID: 3mpm0e1sR7mUpD/vTggDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="263505839"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2026 04:50:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6SBM-00000000BNR-32zG;
	Sat, 28 Mar 2026 11:50:24 +0000
Date: Sat, 28 Mar 2026 19:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <202603281911.4W11adGI-lkp@intel.com>
References: <20260325191301.164579-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325191301.164579-2-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-100537-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2EAD34E438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/remoteproc-qcom-pas-Map-unmap-subsystem-region-before-auth_and_reset/20260328-004624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260325191301.164579-2-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH v2 2/3] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
config: arm64-randconfig-r113-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281911.4W11adGI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281911.4W11adGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281911.4W11adGI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/mdt_loader.c:496:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/soc/qcom/mdt_loader.c:496:20: sparse:     expected void *mem_region
   drivers/soc/qcom/mdt_loader.c:496:20: sparse:     got void [noderef] __iomem *
>> drivers/soc/qcom/mdt_loader.c:505:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *mem_region @@
   drivers/soc/qcom/mdt_loader.c:505:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/mdt_loader.c:505:17: sparse:     got void *mem_region

vim +496 drivers/soc/qcom/mdt_loader.c

   469	
   470	/**
   471	 * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
   472	 * (typically contained in the .mdt file), followed by loading the actual
   473	 * firmware segments (e.g., .bXX files). Authentication of the segments done
   474	 * by a separate call.
   475	 *
   476	 * The PAS context must be initialized using qcom_scm_pas_context_init()
   477	 * prior to invoking this function.
   478	 *
   479	 * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
   480	 * @fw:         Firmware object representing the .mdt file
   481	 * @firmware:   Name of the firmware used to construct segment file names
   482	 * @reloc_base: Physical address adjusted after relocation
   483	 *
   484	 * Return: 0 on success or a negative error code on failure.
   485	 */
   486	int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
   487			      const char *firmware, phys_addr_t *reloc_base)
   488	{
   489		void *mem_region;
   490		int ret;
   491	
   492		ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
   493		if (ret)
   494			return ret;
   495	
 > 496		mem_region = ioremap_wc(ctx->mem_phys, ctx->mem_size);
   497		if (!mem_region) {
   498			dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n", &ctx->mem_phys,
   499				ctx->mem_size);
   500			return -EINVAL;
   501		}
   502	
   503		ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
   504					    ctx->mem_size, reloc_base);
 > 505		iounmap(mem_region);
   506		return ret;
   507	}
   508	EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

