Return-Path: <linux-arm-msm+bounces-32708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC698915D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 22:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6BC31C22E18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Sep 2024 20:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73327161916;
	Sat, 28 Sep 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIwEGvXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E8155392;
	Sat, 28 Sep 2024 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727555798; cv=none; b=qJbyvLWyOHU4Bv57YbA85l2HqBZRXe5OTzhYPeBTdjD/Sj7TKg8dzl+BEXODoPoVXjXBejlExeT5wk64pVPw/e5ADYuKuYEp526jVwlH69py7hstZKHw8hCD5q/1EB2/8MxcwMudWQISXfUCPiUaUuGVGBV02J3y/WEvOpdFJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727555798; c=relaxed/simple;
	bh=UwHG3HqVOfImzYmMh1JIgFdKgk5LEdjVPTFFdkKkbCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/WyuB5VZuYxJoPa0ZrYGTOeDizOg3k3+p/3N1PVIhEgKo/M1AIZCai5895CWgga7R/eVpiEKEg+V0oCHVCyd8YaTTGzf1nXNDkOF6JKkLrrJGl4hn/J7Mly8jr0gvn0yodHue5FUijNwafrwxSATMJ8psgDDO5cYK51PEOWeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIwEGvXJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727555796; x=1759091796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UwHG3HqVOfImzYmMh1JIgFdKgk5LEdjVPTFFdkKkbCo=;
  b=hIwEGvXJLa/FtWnD18I0UVSLfNMgN/Zgeu3sW26wlcSUgzEpkcynwMZq
   Ff6z0KDpO47Pi91VK31zyAtxFxoqSmHc3I8W8ty5VhlpvmSR/WcGa7ZRZ
   wrog9M50hTeAfQhOFw07dfBehQLot+mJ6NA9LTopMLGqMMT3b4JfGKfV7
   GfNq2ZqaDzGHQMAw2hjI7g855MbwjBThlPapm4wGQuA17PW4YG0OqomlS
   68z6R496ESiX5Oa1qCWB8psWt1Qx3veOzMSvNsvRKUA6AdEtwkC+Pi+2H
   G0NvYBtAkqR5mvctVTg5Gd8XJz/j7Lp3box1q367QAaTtfl8axGs4TlT2
   A==;
X-CSE-ConnectionGUID: 8pLxW9UnQsekRZ9RnSmSAg==
X-CSE-MsgGUID: QyB1AkOZRHKy6/M+z0IRXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26841306"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26841306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 13:36:36 -0700
X-CSE-ConnectionGUID: LdeSy/NhTzq7MHNadFAVXw==
X-CSE-MsgGUID: 10+AgxwNRUeWz84pomsVuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77654173"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2024 13:36:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sueB3-000Nar-2q;
	Sat, 28 Sep 2024 20:36:29 +0000
Date: Sun, 29 Sep 2024 04:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rampraka@quicinc.com,
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Subject: Re: [PATCH] qcom: ice: Remove ice probe
Message-ID: <202409290409.BkBQ6BVX-lkp@intel.com>
References: <20240928050456.27577-1-quic_spuppala@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928050456.27577-1-quic_spuppala@quicinc.com>

Hi Seshu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11]
[also build test WARNING on next-20240927]
[cannot apply to linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seshu-Madhavi-Puppala/qcom-ice-Remove-ice-probe/20240928-130818
base:   v6.11
patch link:    https://lore.kernel.org/r/20240928050456.27577-1-quic_spuppala%40quicinc.com
patch subject: [PATCH] qcom: ice: Remove ice probe
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240929/202409290409.BkBQ6BVX-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290409.BkBQ6BVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290409.BkBQ6BVX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/ice.c: In function 'of_qcom_ice_get':
>> drivers/soc/qcom/ice.c:309:24: warning: returning 'long int' from a function with return type 'struct qcom_ice *' makes pointer from integer without a cast [-Wint-conversion]
     309 |                 return PTR_ERR(base);
         |                        ^~~~~~~~~~~~~


vim +309 drivers/soc/qcom/ice.c

   250	
   251	/**
   252	 * of_qcom_ice_get() - get an ICE instance from a DT node
   253	 * @dev: device pointer for the consumer device
   254	 *
   255	 * This function will provide an ICE instance either by creating one for the
   256	 * consumer device if its DT node provides the 'ice' reg range and the 'ice'
   257	 * clock (for legacy DT style). On the other hand, if consumer provides a
   258	 * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
   259	 * be created and so this function will return that instead.
   260	 *
   261	 * Return: ICE pointer on success, NULL if there is no ICE data provided by the
   262	 * consumer or ERR_PTR() on error.
   263	 */
   264	struct qcom_ice *of_qcom_ice_get(struct device *dev)
   265	{
   266		struct platform_device *pdev = to_platform_device(dev);
   267		struct qcom_ice *ice;
   268		struct device_node *node;
   269		struct resource *res;
   270		void __iomem *base;
   271	
   272		if (!dev || !dev->of_node)
   273			return ERR_PTR(-ENODEV);
   274	
   275		/*
   276		 * In order to support legacy style devicetree bindings, we need
   277		 * to create the ICE instance using the consumer device and the reg
   278		 * range called 'ice' it provides.
   279		 */
   280		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice");
   281		if (res) {
   282			base = devm_ioremap_resource(&pdev->dev, res);
   283			if (IS_ERR(base))
   284				return ERR_CAST(base);
   285	
   286			/* create ICE instance using consumer dev */
   287			return qcom_ice_create(&pdev->dev, base);
   288		}
   289	
   290		/*
   291		 * If the consumer node does not provider an 'ice' reg range
   292		 * (legacy DT binding), then it must at least provide a phandle
   293		 * to the ICE devicetree node, otherwise ICE is not supported.
   294		 */
   295		node = of_parse_phandle(dev->of_node, "qcom,ice", 0);
   296		if (!node)
   297			return NULL;
   298	
   299		pdev = of_find_device_by_node(node);
   300		if (!pdev) {
   301			dev_err(dev, "Cannot find device node %s\n", node->name);
   302			ice = ERR_PTR(-EPROBE_DEFER);
   303			goto out;
   304		}
   305	
   306		base = devm_platform_ioremap_resource(pdev, 0);
   307		if (IS_ERR(base)) {
   308			dev_warn(&pdev->dev, "ICE registers not found\n");
 > 309			return PTR_ERR(base);
   310		}
   311	
   312		ice = qcom_ice_create(&pdev->dev, base);
   313		if (!ice) {
   314			dev_err(dev, "Cannot get ice instance from %s\n",
   315				dev_name(&pdev->dev));
   316			platform_device_put(pdev);
   317			ice = ERR_PTR(-EPROBE_DEFER);
   318			goto out;
   319		}
   320	
   321		ice->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
   322		if (!ice->link) {
   323			dev_err(&pdev->dev,
   324				"Failed to create device link to consumer %s\n",
   325				dev_name(dev));
   326			platform_device_put(pdev);
   327			ice = ERR_PTR(-EINVAL);
   328		}
   329	
   330	out:
   331		of_node_put(node);
   332	
   333		return ice;
   334	}
   335	EXPORT_SYMBOL_GPL(of_qcom_ice_get);
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

