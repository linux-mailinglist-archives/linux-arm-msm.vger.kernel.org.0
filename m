Return-Path: <linux-arm-msm+bounces-59259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8EFAC2A23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31CE2A42848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F3A29B22A;
	Fri, 23 May 2025 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C958QBAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE629AB0E;
	Fri, 23 May 2025 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026834; cv=none; b=nLX0t38TLq0TivFHYfSNlWKaHZh/XlM22wOyqmE5LjJqmpYIf5U5DHvhCaxhPoEYXl97FsOPBEBwRsr6QhcVxq4g52huEAmqfG1/AS66MjkI8y/V40AJE6qHwRIub9a/L/3VgHsxgi51fliWBVLbUmad87O8ieumvpzECPc1mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026834; c=relaxed/simple;
	bh=aPl01hl0HF/y+fjBiqpumEymlqEj6USzOz+MtuzBp60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVqcTBQ2bsh8cLHMLhfOhxlT7i4NkEBO/AcW1rYDRDNATbmeeYgdUiICAptm1Jycvjc5U31ZeQSEohbj/4uZBfyzwusLxNbeKqs8Btt/Db8vV5HCIhvF8Y1LDatRXYGUiyGQrQuX9U8CPlcSxEMR3UnQZK+pCWUbfGy5+HHmnlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C958QBAN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748026833; x=1779562833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aPl01hl0HF/y+fjBiqpumEymlqEj6USzOz+MtuzBp60=;
  b=C958QBAN42XDWls0C5GdhkQUUWBs1liEMEqankVbyiEuT956TfLBn6Sp
   xgDQYvhDyF8EB1G05aa7QrAafBu6au6xaNLolNUBHcg5nX38xPi6DKUXT
   KcKFqABR0vyOPsLxgimdIN86SkCApGL7HvqD6VS2yrBcpodXOI9k7QnNQ
   Kk4C7N76YHEUV7eRe6iTt96sUluOn8OhtuP3dDPwNWsmyY5E2g8MjJr/U
   hBeSFAjtQj6jkSSWg0Ce8oFu3Z1fIx8DFZjAnx+ihw94WMIJbejI7LmYA
   R5O1tyU53OTvCjdwr/FExGsHk5uHTyV/uoIqI2B7wAjNyVxZWT/5/ELb6
   g==;
X-CSE-ConnectionGUID: f3nMVAuOSwC3jzkV1Zsegw==
X-CSE-MsgGUID: Z5xHxySVRkWSdPveEdVZIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53886858"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="53886858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 12:00:27 -0700
X-CSE-ConnectionGUID: IqaW5hpeRy+7lHFzMImncQ==
X-CSE-MsgGUID: Bo8TqtGAQ/qeIkD7+pv8eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141816157"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2025 12:00:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIXcy-000QfE-24;
	Fri, 23 May 2025 19:00:20 +0000
Date: Sat, 24 May 2025 02:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
Message-ID: <202505240200.w0D4DdAY-lkp@intel.com>
References: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 460178e842c7a1e48a06df684c66eb5fd630bcf7]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-sram-qcom-imem-Allow-modem-tables/20250523-071359
base:   460178e842c7a1e48a06df684c66eb5fd630bcf7
patch link:    https://lore.kernel.org/r/20250523-topic-ipa_imem-v1-3-b5d536291c7f%40oss.qualcomm.com
patch subject: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
config: xtensa-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240200.w0D4DdAY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240200.w0D4DdAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240200.w0D4DdAY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ipa/ipa_mem.c: In function 'ipa_mem_init':
>> drivers/net/ipa/ipa_mem.c:623:17: warning: variable 'imem_size' set but not used [-Wunused-but-set-variable]
     u32 imem_base, imem_size;
                    ^~~~~~~~~
>> drivers/net/ipa/ipa_mem.c:623:6: warning: variable 'imem_base' set but not used [-Wunused-but-set-variable]
     u32 imem_base, imem_size;
         ^~~~~~~~~


vim +/imem_size +623 drivers/net/ipa/ipa_mem.c

   616	
   617	/* Perform memory region-related initialization */
   618	int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
   619			 const struct ipa_mem_data *mem_data)
   620	{
   621		struct device_node *ipa_slice_np;
   622		struct device *dev = &pdev->dev;
 > 623		u32 imem_base, imem_size;
   624		struct resource *res;
   625		int ret;
   626	
   627		/* Make sure the set of defined memory regions is valid */
   628		if (!ipa_mem_valid(ipa, mem_data))
   629			return -EINVAL;
   630	
   631		ipa->mem_count = mem_data->local_count;
   632		ipa->mem = mem_data->local;
   633	
   634		/* Check the route and filter table memory regions */
   635		if (!ipa_table_mem_valid(ipa, false))
   636			return -EINVAL;
   637		if (!ipa_table_mem_valid(ipa, true))
   638			return -EINVAL;
   639	
   640		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
   641		if (ret) {
   642			dev_err(dev, "error %d setting DMA mask\n", ret);
   643			return ret;
   644		}
   645	
   646		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ipa-shared");
   647		if (!res) {
   648			dev_err(dev,
   649				"DT error getting \"ipa-shared\" memory property\n");
   650			return -ENODEV;
   651		}
   652	
   653		ipa->mem_virt = memremap(res->start, resource_size(res), MEMREMAP_WC);
   654		if (!ipa->mem_virt) {
   655			dev_err(dev, "unable to remap \"ipa-shared\" memory\n");
   656			return -ENOMEM;
   657		}
   658	
   659		ipa->mem_addr = res->start;
   660		ipa->mem_size = resource_size(res);
   661	
   662		ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
   663		if (ipa_slice_np) {
   664			ret = of_address_to_resource(ipa_slice_np, 0, res);
   665			of_node_put(ipa_slice_np);
   666			if (ret)
   667				return ret;
   668	
   669			imem_base = res->start;
   670			imem_size = resource_size(res);
   671		} else {
   672			/* Backwards compatibility for DTs lacking an explicit reference */
   673			imem_base = mem_data->imem_addr;
   674			imem_size = mem_data->imem_size;
   675		}
   676	
   677		ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
   678		if (ret)
   679			goto err_unmap;
   680	
   681		ret = ipa_smem_init(ipa, mem_data->smem_size);
   682		if (ret)
   683			goto err_imem_exit;
   684	
   685		return 0;
   686	
   687	err_imem_exit:
   688		ipa_imem_exit(ipa);
   689	err_unmap:
   690		memunmap(ipa->mem_virt);
   691	
   692		return ret;
   693	}
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

