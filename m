Return-Path: <linux-arm-msm+bounces-26013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1692A92F603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 09:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2E91F22C90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 07:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8083E13D8B1;
	Fri, 12 Jul 2024 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSreOB76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAAEAC7;
	Fri, 12 Jul 2024 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720768403; cv=none; b=VhogKle9z6wa2IWbjPEFzZ7VScAFnIyzf7ioCLzTVFK94N0Lf/UR6/x40eAum+TAAe0fOsvsAMlEPIA/O7spiyXUEuWnraXXzGh/iQP+bbDC2dDE1EPXlurWN7plUIXS3srm2tFUXB/9rIn3bsaThgXGrx48NKIui4qcgdGETS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720768403; c=relaxed/simple;
	bh=lguFy7ie7xiFALB8XkV6YA3LPO9i1zDJTC2XMbmzKpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=si8r8HiRLN5OZBHJ9pfhhgMgeNZlL2IVDH5421+mQi3UFmV4L76X+MH0cKFIqw4uL28LHae/io3xjdVFLGN1kQJO+8Gxqk83zIHhTzrvPpdJciK2jFohJ/cZh5sPFiNNge9Iq+gVZg7CYqCDh6O2i6xcLYyyLe/gpcBJN6hHpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSreOB76; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720768401; x=1752304401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lguFy7ie7xiFALB8XkV6YA3LPO9i1zDJTC2XMbmzKpc=;
  b=NSreOB76LhVnw6lkPvuFPzPIpuCXzneQcIwvxc2K47zB0OkQxuCEAKEx
   vgCqCEepHJ87/CAib+rV8BLR9BDfy09dogkYBGdpRuy3mLCHlKRpcpwQB
   mOJqc0a3mWvFPGIYpp3Vg2PgYNsAS+Y8k5pygtR+fuCFt4cpuzSNg3VN/
   b7t3CukMxoC8NMxRQL26jeWvceF+nhEl9H9ES68EaVYe4u+HS62ao5nh8
   NFZCS+9KCzl15rMuu1TpEjyU4kLjHSZSZDOCfS4tnSXbCUFbZGk7gdGVG
   +ixen9Tyz0d2KOtcoZ9dHr0EJ9kIkq21n3U/zKR/yb7M9gfyplVKw7/aa
   w==;
X-CSE-ConnectionGUID: aW9WT7H3SMG6yKqVdY3flg==
X-CSE-MsgGUID: 0gwk6g6SQgeShswcUWtOFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21955160"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="21955160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 00:13:20 -0700
X-CSE-ConnectionGUID: dqx0W5X5QRS0YfbGRC0+RA==
X-CSE-MsgGUID: k+OJOAsMRZ+/QmrE/5evOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="49589918"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2024 00:13:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSASs-000aTy-2V;
	Fri, 12 Jul 2024 07:13:10 +0000
Date: Fri, 12 Jul 2024 15:12:17 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, Tao Zhang <quic_taozha@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] coresight: Add source filtering for multi-port
 output
Message-ID: <202407121435.uBdrJO8u-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407121435.uBdrJO8u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121435.uBdrJO8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121435.uBdrJO8u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/hwtracing/coresight/coresight-platform.c:6:
   drivers/hwtracing/coresight/coresight-platform.c: In function 'of_coresight_parse_endpoint':
>> drivers/hwtracing/coresight/coresight-platform.c:261:35: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     261 |                                   "Filter source %s is not a source device\n");
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/hwtracing/coresight/coresight-platform.c:260:33: note: in expansion of macro 'dev_warn'
     260 |                                 dev_warn(&conn.filter_src_dev->dev,
         |                                 ^~~~~~~~
   drivers/hwtracing/coresight/coresight-platform.c:261:51: note: format string is defined here
     261 |                                   "Filter source %s is not a source device\n");
         |                                                  ~^
         |                                                   |
         |                                                   char *


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

