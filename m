Return-Path: <linux-arm-msm+bounces-98569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAjLDpM0u2lFgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 00:26:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13A2C3D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 00:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A02D302BEB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 23:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC8F37F8B5;
	Wed, 18 Mar 2026 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctPgWEbI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E8F3793A6;
	Wed, 18 Mar 2026 23:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876367; cv=none; b=PvYRz2aZ36cfcVhD0NzeKMm5me43irNpXw1VC0N+OeUOn90zpxYacGHOxtCZnZbTR0gMpBBNRrauprGjDHh5Ge13HbCU9N3JfsTJ3Y16YkmUa54QdmLfeWydWGB8qtsgD8iTuowQZP5fgO/oZOrnkqUXfqRG6HxIPiuJtDrsrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876367; c=relaxed/simple;
	bh=DnxFWM2WIthmGZAdm7uk5QrdXvgJguCOXl2ADrUaG5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzMBD/SzYwLcSq7lnBVl4IYWOuxGG3P4ZXHfRHGuqMrPusCJ5VANTCQoDRfWq7BLcwtRqvWXcnqRMBeaqkAYyGLjK7bh9ba0UmR1ikqIbyBBApo375GCc2DOzz1CCeO9IcTc/r3Zk0mmxnAGG2YAUv7iqmrL67+6pyY1Vr+utL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctPgWEbI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773876364; x=1805412364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DnxFWM2WIthmGZAdm7uk5QrdXvgJguCOXl2ADrUaG5E=;
  b=ctPgWEbI9VcMZeAlTgBmIFif1saGzY+LvJsAsLMuAggWnqZFgMWBZPXu
   Hg2Sae+vMwMJ5V5J/02rJiAgDL153dTyQ34Vb8wZPxdcnVEMSjWQpIOj7
   Tl8Dj+mOe0n/BeE83ybONy8uxK9SFz3C63d8kBEEgJp6eJT9uN+kSvAEA
   udTL3QBaL263LMSdrIkXWj2D9YM+SldkIBQgI4x9WQp4/qPZi1r1XfirQ
   42vxcUr+9gKOFeZ8xuyGKfYXAD4H+NcC3/m6c9sdCpPjGRTeFbCiKlqRd
   1AYyanX8ca2BCFd4IzqKf1QyOdbNpccZnIecD2APBUk+jMEDzUvPr3QoN
   A==;
X-CSE-ConnectionGUID: DP6gPrsFQ2iYke0zUA0Bsw==
X-CSE-MsgGUID: hfSM28wXQmS1L7+Q6Lfbpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92518543"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92518543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 16:26:03 -0700
X-CSE-ConnectionGUID: YwHq+s87SSmoaC4v/2Hjrw==
X-CSE-MsgGUID: 7AEU2KyPRlK/thwkuQm6Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222753293"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 16:26:01 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w30GF-0000000004P-0G0S;
	Wed, 18 Mar 2026 23:25:27 +0000
Date: Thu, 19 Mar 2026 07:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <202603190738.1VFMgKNm-lkp@intel.com>
References: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-98569-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A13A2C3D25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/remoteproc-qcom-pas-Map-unmap-subsystem-region-before-auth_and_reset/20260310-225821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20260310135205.2497789-2-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
config: arm64-randconfig-r133-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190738.1VFMgKNm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190738.1VFMgKNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190738.1VFMgKNm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
   drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     got void *
   drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *dtb_mem_region @@
   drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     got void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *mem_region @@
   drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     got void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     got void [noderef] __iomem *

vim +260 drivers/remoteproc/qcom_q6v5_pas.c

   124	
   125	static void qcom_pas_segment_dump(struct rproc *rproc,
   126					  struct rproc_dump_segment *segment,
   127					  void *dest, size_t offset, size_t size)
   128	{
   129		struct qcom_pas *pas = rproc->priv;
   130		int total_offset;
   131	
   132		total_offset = segment->da + segment->offset + offset - pas->mem_phys;
   133		if (total_offset < 0 || total_offset + size > pas->mem_size) {
   134			dev_err(pas->dev,
   135				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
   136				&segment->da, offset, size);
   137			memset(dest, 0xff, size);
   138			return;
   139		}
   140	
 > 141		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
   142		if (!pas->mem_region) {
   143			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
   144				&pas->mem_phys, pas->mem_size);
   145			return;
   146		}
   147	
   148		memcpy_fromio(dest, pas->mem_region + total_offset, size);
   149	}
   150	
   151	static void qcom_pas_minidump(struct rproc *rproc)
   152	{
   153		struct qcom_pas *pas = rproc->priv;
   154	
   155		if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
   156			return;
   157	
   158		qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
   159	}
   160	
   161	static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
   162				       size_t pd_count)
   163	{
   164		int ret;
   165		int i;
   166	
   167		for (i = 0; i < pd_count; i++) {
   168			dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
   169			ret = pm_runtime_get_sync(pds[i]);
   170			if (ret < 0) {
   171				pm_runtime_put_noidle(pds[i]);
   172				dev_pm_genpd_set_performance_state(pds[i], 0);
   173				goto unroll_pd_votes;
   174			}
   175		}
   176	
   177		return 0;
   178	
   179	unroll_pd_votes:
   180		for (i--; i >= 0; i--) {
   181			dev_pm_genpd_set_performance_state(pds[i], 0);
   182			pm_runtime_put(pds[i]);
   183		}
   184	
   185		return ret;
   186	};
   187	
   188	static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
   189					 size_t pd_count)
   190	{
   191		int i;
   192	
   193		for (i = 0; i < pd_count; i++) {
   194			dev_pm_genpd_set_performance_state(pds[i], 0);
   195			pm_runtime_put(pds[i]);
   196		}
   197	}
   198	
   199	static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
   200	{
   201		unsigned int retry_num = 50;
   202		int ret;
   203	
   204		do {
   205			msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
   206			ret = qcom_scm_pas_shutdown(pas->pas_id);
   207		} while (ret == -EINVAL && --retry_num);
   208	
   209		return ret;
   210	}
   211	
   212	static int qcom_pas_unprepare(struct rproc *rproc)
   213	{
   214		struct qcom_pas *pas = rproc->priv;
   215	
   216		/*
   217		 * qcom_pas_load() did pass pas_metadata to the SCM driver for storing
   218		 * metadata context. It might have been released already if
   219		 * auth_and_reset() was successful, but in other cases clean it up
   220		 * here.
   221		 */
   222		qcom_scm_pas_metadata_release(pas->pas_ctx);
   223		if (pas->dtb_pas_id)
   224			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
   225	
   226		return 0;
   227	}
   228	
   229	static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
   230	{
   231		struct qcom_pas *pas = rproc->priv;
   232		int ret;
   233	
   234		/* Store firmware handle to be used in qcom_pas_start() */
   235		pas->firmware = fw;
   236	
   237		if (pas->lite_pas_id)
   238			qcom_scm_pas_shutdown(pas->lite_pas_id);
   239		if (pas->lite_dtb_pas_id)
   240			qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
   241	
   242		if (pas->dtb_pas_id) {
   243			ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
   244			if (ret) {
   245				dev_err(pas->dev, "request_firmware failed for %s: %d\n",
   246					pas->dtb_firmware_name, ret);
   247				return ret;
   248			}
   249	
 > 250			pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
   251			if (!pas->dtb_mem_region) {
   252				dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
   253					&pas->dtb_mem_phys, pas->dtb_mem_size);
   254				goto release_dtb_metadata;
   255			}
   256	
   257			ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
   258						pas->dtb_firmware_name, pas->dtb_mem_region,
   259						&pas->dtb_mem_reloc);
 > 260			iounmap(pas->dtb_mem_region);
   261			pas->dtb_mem_region = NULL;
   262			if (ret)
   263				goto release_dtb_metadata;
   264		}
   265	
   266		return 0;
   267	
   268	release_dtb_metadata:
   269		if (pas->dtb_pas_id)
   270			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
   271	
   272		release_firmware(pas->dtb_firmware);
   273	
   274		return ret;
   275	}
   276	
   277	static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
   278	{
   279		if (rproc->has_iommu)
   280			iommu_unmap(rproc->domain, mem_phys, size);
   281	}
   282	
   283	static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
   284	{
   285		int ret = 0;
   286	
   287		if (rproc->has_iommu)
   288			ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
   289					IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
   290		return ret;
   291	}
   292	
   293	static int qcom_pas_start(struct rproc *rproc)
   294	{
   295		struct qcom_pas *pas = rproc->priv;
   296		int ret;
   297	
   298		ret = qcom_q6v5_prepare(&pas->q6v5);
   299		if (ret)
   300			return ret;
   301	
   302		ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
   303		if (ret < 0)
   304			goto disable_irqs;
   305	
   306		ret = clk_prepare_enable(pas->xo);
   307		if (ret)
   308			goto disable_proxy_pds;
   309	
   310		ret = clk_prepare_enable(pas->aggre2_clk);
   311		if (ret)
   312			goto disable_xo_clk;
   313	
   314		if (pas->cx_supply) {
   315			ret = regulator_enable(pas->cx_supply);
   316			if (ret)
   317				goto disable_aggre2_clk;
   318		}
   319	
   320		if (pas->px_supply) {
   321			ret = regulator_enable(pas->px_supply);
   322			if (ret)
   323				goto disable_cx_supply;
   324		}
   325	
   326		if (pas->dtb_pas_id) {
   327			ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
   328			if (ret)
   329				goto disable_px_supply;
   330	
   331			ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
   332			if (ret) {
   333				dev_err(pas->dev,
   334					"failed to authenticate dtb image and release reset\n");
   335				goto unmap_dtb_carveout;
   336			}
   337		}
   338	
   339		/*
   340		 * During subsystem restart, when coredump is enabled, region is mapped but
   341		 * not unmapped there, NULL check to reuse the mapping if its already mapped.
   342		 */
   343		if (!pas->mem_region) {
   344			pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
   345			if (!pas->mem_region) {
   346				dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
   347					&pas->mem_phys, pas->mem_size);
   348				goto release_pas_metadata;
   349			}
   350		}
   351	
   352		ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
   353					pas->mem_region, &pas->mem_reloc);
 > 354		iounmap(pas->mem_region);
   355		pas->mem_region = NULL;
   356		if (ret)
   357			goto release_pas_metadata;
   358	
   359		qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
   360	
   361		ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
   362		if (ret)
   363			goto release_pas_metadata;
   364	
   365		ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
   366		if (ret) {
   367			dev_err(pas->dev,
   368				"failed to authenticate image and release reset\n");
   369			goto unmap_carveout;
   370		}
   371	
   372		ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
   373		if (ret == -ETIMEDOUT) {
   374			dev_err(pas->dev, "start timed out\n");
   375			qcom_scm_pas_shutdown(pas->pas_id);
   376			goto unmap_carveout;
   377		}
   378	
   379		qcom_scm_pas_metadata_release(pas->pas_ctx);
   380		if (pas->dtb_pas_id)
   381			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
   382	
   383		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
   384		pas->firmware = NULL;
   385	
   386		return 0;
   387	
   388	unmap_carveout:
   389		qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
   390	release_pas_metadata:
   391		qcom_scm_pas_metadata_release(pas->pas_ctx);
   392		if (pas->dtb_pas_id)
   393			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
   394	
   395	unmap_dtb_carveout:
   396		if (pas->dtb_pas_id)
   397			qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
   398	disable_px_supply:
   399		if (pas->px_supply)
   400			regulator_disable(pas->px_supply);
   401	disable_cx_supply:
   402		if (pas->cx_supply)
   403			regulator_disable(pas->cx_supply);
   404	disable_aggre2_clk:
   405		clk_disable_unprepare(pas->aggre2_clk);
   406	disable_xo_clk:
   407		clk_disable_unprepare(pas->xo);
   408	disable_proxy_pds:
   409		qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
   410	disable_irqs:
   411		qcom_q6v5_unprepare(&pas->q6v5);
   412	
   413		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
   414		pas->firmware = NULL;
   415	
   416		return ret;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

