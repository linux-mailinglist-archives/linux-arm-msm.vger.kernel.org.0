Return-Path: <linux-arm-msm+bounces-33216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDE1991C8A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 06:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220E6282DC3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8EB13E898;
	Sun,  6 Oct 2024 04:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu7lKPiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9EF250F8;
	Sun,  6 Oct 2024 04:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728188991; cv=none; b=UQLD/uRNZHA3c6bENsWy7RbdLL/I5SHII7wODMNwP3Thd9KU92OKaR6aFx+eLsQ3c+7GgmyeyTd8dWyUxtXl0KVtDYu4ynTy1Wmqn0ZTRGpXEcql/rVGMK/7sw4XoPR1s2Morz0/gV+bvmJRcTNZYvLq3dfTZAD3GwdJeAvWvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728188991; c=relaxed/simple;
	bh=RPqJD/C7y0gBMClUK33fxbnxtlFlwArlCPQ7Hdm4OyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfiJeBuhOGaJEwaURXw9HdTHtAWRZi4hnCulTEW/cAudJ1MZ79grl90DSKwqxhVToNb2M8RMwBSwmupZ1e+Fdkpdo2mNw/X1uZ9KlmjEhP6TlG8W8kkMm/Zg73jmI5tUoKgh6RKPMc0nJSXYKZMjdKlK8D8gv+y8zFpP5RPJ/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu7lKPiA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728188990; x=1759724990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPqJD/C7y0gBMClUK33fxbnxtlFlwArlCPQ7Hdm4OyY=;
  b=Mu7lKPiA7FkX3nHz6Ood5nztJ7Le9vkVwhYYEGon+EkwGVbpYT9G0Ac8
   JV84oxpDeLy54oqc8H0KcsWyVFv7SLyjHBi7mcHjLN42IMuZh367UcrE5
   zd6s+GMrCFPxfLeNo2imYpa5hNazFqQ8msKrAImKSkZEvRd3LGgbnJWW7
   fTUCtjt4xc9e01i+gJa31FSwj+/qakGze537PcEBOZ8JZpnGTZ2xFHhCg
   btEsx1XeuuR+7hUS0VuUoUpRj3edzb8/0UWO45kJzCAogU+1KglREyusV
   vZhCYMOcnbCEf/XzoafJqYZB/eRvxy7kNzG3DIfVssbNVEvYA/OoIY9+I
   A==;
X-CSE-ConnectionGUID: cT2WKGpcRCCeoLya1BvUMA==
X-CSE-MsgGUID: NKMHiEqlRBKtUA1kMePKQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27539417"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27539417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 21:29:49 -0700
X-CSE-ConnectionGUID: kPUeUwsyT8iIGdo58i9b1w==
X-CSE-MsgGUID: VgY47a4iQBaGQv9wsSYbzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="75549317"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Oct 2024 21:29:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxItr-0003b6-1R;
	Sun, 06 Oct 2024 04:29:43 +0000
Date: Sun, 6 Oct 2024 12:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Komal Bajaj <quic_kbajaj@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add iommu map_unmap helper function
Message-ID: <202410061256.KV3EbD7H-lkp@intel.com>
References: <20241004212359.2263502-3-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004212359.2263502-3-quic_mojha@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-common-Introduce-iommus-and-qcom-devmem-property/20241005-052733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20241004212359.2263502-3-quic_mojha%40quicinc.com
patch subject: [PATCH 2/6] remoteproc: qcom: Add iommu map_unmap helper function
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241006/202410061256.KV3EbD7H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061256.KV3EbD7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061256.KV3EbD7H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/qcom_common.c: In function 'qcom_map_unmap_carveout':
>> drivers/remoteproc/qcom_common.c:645:38: warning: left shift count >= width of type [-Wshift-count-overflow]
     645 |                 iova |= (sid_def_val << 32);
         |                                      ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +645 drivers/remoteproc/qcom_common.c

   611	
   612	/**
   613	 * qcom_map_unmap_carveout() - iommu map and unmap carveout region
   614	 *
   615	 * @rproc:	rproc handle
   616	 * @mem_phys:	starting physical address of carveout region
   617	 * @mem_size:	size of carveout region
   618	 * @map:	if true, map otherwise, unmap
   619	 * @use_sid:	decision to append sid to iova
   620	 * @sid:	SID value
   621	 */
   622	int qcom_map_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t mem_size,
   623				    bool map, bool use_sid, unsigned long sid)
   624	{
   625		unsigned long iova = mem_phys;
   626		unsigned long sid_def_val;
   627		int ret;
   628	
   629		if (!rproc->has_iommu)
   630			return 0;
   631	
   632		if (!rproc->domain)
   633			return -EINVAL;
   634	
   635		/*
   636		 * Remote processor like ADSP supports upto 36 bit device
   637		 * address space and some of its clients like fastrpc uses
   638		 * upper 32-35 bits to keep lower 4 bits of its SID to use
   639		 * larger address space. To keep this consistent across other
   640		 * use cases add remoteproc SID configuration for firmware
   641		 * to IOMMU for carveouts.
   642		 */
   643		if (use_sid && sid) {
   644			sid_def_val = sid & SID_MASK_DEFAULT;
 > 645			iova |= (sid_def_val << 32);
   646		}
   647	
   648		if (map)
   649			ret = iommu_map(rproc->domain, iova, mem_phys, mem_size, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
   650		else
   651			ret = iommu_unmap(rproc->domain, iova, mem_size);
   652	
   653		if (ret)
   654			dev_err(&rproc->dev, "Unable to %s IOVA Memory, ret: %d\n",
   655				map ? "map" : "unmap", ret);
   656	
   657		return ret;
   658	}
   659	EXPORT_SYMBOL_GPL(qcom_map_unmap_carveout);
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

