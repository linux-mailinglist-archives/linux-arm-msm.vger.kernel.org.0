Return-Path: <linux-arm-msm+bounces-26012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B192F5AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 08:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C4901F22E5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 06:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7078013D538;
	Fri, 12 Jul 2024 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsSiJECI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12012DDBA;
	Fri, 12 Jul 2024 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767019; cv=none; b=bxDMz6B5u9qzUG8rozK7t8zRmcEC2RSHTQkmovrFFoTYNNrUObG9YIC3ziqdndAeQAAt6GO58knDmUq27HxPnHUH2t9BvKzMQ0EUBdul23NQ0a1U9nkCWNrINS418RJ3zf27Z42AdetGPuutmzSuGC4boJhFTIyDlbsEgDAlDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767019; c=relaxed/simple;
	bh=eLi3fYikhmZmAiWojiYM4xhueLbPTdJEVJAlqd18vvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKLjEzU6qptcCmb6fbOKkVtsxNCxpuvYZIqI6oasp90wczAVDqMT8bNRmhSuK03R5mpg9t0rADOM4DUhSoEXoMIFYkr6DlbzQiBvxUGzjdOTQkMnfjIIccPguR1RpwNhbtAUHTMtNLGM1Qu+8gkNuUX8dGkzM6oXKfjYz7gffjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsSiJECI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720767018; x=1752303018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLi3fYikhmZmAiWojiYM4xhueLbPTdJEVJAlqd18vvM=;
  b=jsSiJECIG9G6RiXle6UjcUB28iPH/DD/56hdg8SOgbi2mFJYHSYh4uZA
   47cDT6NB2aj+FO7MZIvFaLLteabD+tZXIJ2/fEJtXGZ2U7GOd9pTEHe6F
   85C0Ntf9HXoF0AWU2OtinN53m+BdPc0gJ5waayWUA7YoEAZSr5QppSU4h
   DHP19IUXiqA+MGPhNu7apxGeUphGVnRuf9gL6XI6ZcxC1bGDK31vx8HZ3
   3vpRzLzmd9pbrRFYlTv2Vfu1FXh4+pUarguRos+NLGxh0akzlsSK0lz2K
   CdMR+XDiP+hUK178UHKHbhOhps7vHQZnB+vxi6tIHm4DwB9/U/IXk6n5m
   Q==;
X-CSE-ConnectionGUID: J3icUbloQvir6/p1aoVPnQ==
X-CSE-MsgGUID: e7bEg5rvRFar6pK4Uv2esw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21101407"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="21101407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 23:50:17 -0700
X-CSE-ConnectionGUID: LvxdULpuRNimbwC0rZ2gzA==
X-CSE-MsgGUID: b+ApyV3URIKQWbGRuPOesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="54009317"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2024 23:50:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSA6c-000aSv-0i;
	Fri, 12 Jul 2024 06:50:10 +0000
Date: Fri, 12 Jul 2024 14:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] coresight: Add source filtering for multi-port
 output
Message-ID: <202407121454.IxYqSYDp-lkp@intel.com>
References: <20240711081750.21792-3-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711081750.21792-3-quic_taozha@quicinc.com>

Hi Tao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc7 next-20240711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Zhang/dt-bindings-arm-qcom-coresight-static-replicator-Add-property-for-source-filtering/20240711-162200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240711081750.21792-3-quic_taozha%40quicinc.com
patch subject: [PATCH v2 2/3] coresight: Add source filtering for multi-port output
config: arm-randconfig-004-20240712 (https://download.01.org/0day-ci/archive/20240712/202407121454.IxYqSYDp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121454.IxYqSYDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121454.IxYqSYDp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-platform.c:261:23: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
                                     "Filter source %s is not a source device\n");
                                                    ~^
   include/linux/dev_printk.h:156:62: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
   #define dev_fmt(fmt) fmt
                        ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ^~~
   1 warning generated.


vim +261 drivers/hwtracing/coresight/coresight-platform.c

   185	
   186	/*
   187	 * of_coresight_parse_endpoint : Parse the given output endpoint @ep
   188	 * and fill the connection information in @pdata->out_conns
   189	 *
   190	 * Parses the local port, remote device name and the remote port.
   191	 *
   192	 * Returns :
   193	 *	 0	- If the parsing completed without any fatal errors.
   194	 *	-Errno	- Fatal error, abort the scanning.
   195	 */
   196	static int of_coresight_parse_endpoint(struct device *dev,
   197					       struct device_node *ep,
   198					       struct coresight_platform_data *pdata)
   199	{
   200		int ret = 0;
   201		struct of_endpoint endpoint, rendpoint;
   202		struct device_node *rparent = NULL;
   203		struct device_node *rep = NULL;
   204		struct device *rdev = NULL;
   205		struct fwnode_handle *rdev_fwnode;
   206		struct coresight_connection conn = {};
   207		struct coresight_connection *new_conn;
   208	
   209		do {
   210			/* Parse the local port details */
   211			if (of_graph_parse_endpoint(ep, &endpoint))
   212				break;
   213			/*
   214			 * Get a handle on the remote endpoint and the device it is
   215			 * attached to.
   216			 */
   217			rep = of_graph_get_remote_endpoint(ep);
   218			if (!rep)
   219				break;
   220			rparent = of_coresight_get_port_parent(rep);
   221			if (!rparent)
   222				break;
   223			if (of_graph_parse_endpoint(rep, &rendpoint))
   224				break;
   225	
   226			rdev_fwnode = of_fwnode_handle(rparent);
   227			/* If the remote device is not available, defer probing */
   228			rdev = coresight_find_device_by_fwnode(rdev_fwnode);
   229			if (!rdev) {
   230				ret = -EPROBE_DEFER;
   231				break;
   232			}
   233	
   234			conn.src_port = endpoint.port;
   235			/*
   236			 * Hold the refcount to the target device. This could be
   237			 * released via:
   238			 * 1) coresight_release_platform_data() if the probe fails or
   239			 *    this device is unregistered.
   240			 * 2) While removing the target device via
   241			 *    coresight_remove_match()
   242			 */
   243			conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
   244			conn.dest_port = rendpoint.port;
   245	
   246			/*
   247			 * Get the firmware node of the filter source through the
   248			 * reference. This could be used to filter the source in
   249			 * building path.
   250			 */
   251			conn.filter_src_fwnode =
   252				fwnode_find_reference(&ep->fwnode, "filter-src", 0);
   253			if (IS_ERR(conn.filter_src_fwnode))
   254				conn.filter_src_fwnode = NULL;
   255			else {
   256				conn.filter_src_dev =
   257				 coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
   258				if (conn.filter_src_dev && (conn.filter_src_dev->type
   259				    != CORESIGHT_DEV_TYPE_SOURCE))
   260					dev_warn(&conn.filter_src_dev->dev,
 > 261					  "Filter source %s is not a source device\n");
   262			}
   263	
   264			new_conn = coresight_add_out_conn(dev, pdata, &conn);
   265			if (IS_ERR_VALUE(new_conn)) {
   266				fwnode_handle_put(conn.dest_fwnode);
   267				return PTR_ERR(new_conn);
   268			}
   269			/* Connection record updated */
   270		} while (0);
   271	
   272		of_node_put(rparent);
   273		of_node_put(rep);
   274		put_device(rdev);
   275	
   276		return ret;
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

