Return-Path: <linux-arm-msm+bounces-4857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78653813E95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 01:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7617B21CCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 00:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B1CEC0;
	Fri, 15 Dec 2023 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTNK8xXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92789EBF;
	Fri, 15 Dec 2023 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702599169; x=1734135169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LoCKoEMTXvBDPQWtkdfBuHckUE9e5g/vm6kupeuuk8w=;
  b=XTNK8xXg87URC3rpnYDLg25Um31kfou09AxblKzC5Zr4kvzbXg48/eIR
   kUFvtZ2htLITakk8acZNiJVmcnBb6sB4xp2Xo1VWq6tWoYJ/1GMglDrIj
   1JmTMDsnDIdd9FGHlVWQsjt15OB0neSNMAzUbN14swDjFJYePwxi4elDM
   TJOb2fscgvAXXviBuzN5tmcSG9WdchZ7Lr5CY5ilftrxOC3DWb6igtG10
   vj9h8iidmIMfTaPaZ1pRdwZDVu8wKMWoiUVsQQVmWBR0Vc1Ni+s+Lx4ml
   X92xU+5d/5FwOjBpdMeedY9214y5HzTB3fLHE8m9dYvHoa+3ciBS4YuXp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8607220"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="8607220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 16:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1105922790"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="1105922790"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Dec 2023 16:12:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDvoo-000MqL-0e;
	Fri, 15 Dec 2023 00:12:42 +0000
Date: Fri, 15 Dec 2023 08:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, thara.gopinath@gmail.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH 02/11] crypto: qce - Add bam dma support for crypto
 register r/w
Message-ID: <202312150743.EugqdZaA-lkp@intel.com>
References: <20231214114239.2635325-3-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214114239.2635325-3-quic_mdalam@quicinc.com>

Hi Md,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on vkoul-dmaengine/next linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/crypto-qce-Add-support-for-crypto-address-read/20231214-194404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231214114239.2635325-3-quic_mdalam%40quicinc.com
patch subject: [PATCH 02/11] crypto: qce - Add bam dma support for crypto register r/w
config: arm-randconfig-004-20231215 (https://download.01.org/0day-ci/archive/20231215/202312150743.EugqdZaA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150743.EugqdZaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150743.EugqdZaA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/crypto/qce/dma.c:11:
>> drivers/crypto/qce/core.h:32:24: error: field has incomplete type 'struct tasklet_struct'
           struct tasklet_struct done_tasklet;
                                 ^
   drivers/crypto/qce/core.h:32:9: note: forward declaration of 'struct tasklet_struct'
           struct tasklet_struct done_tasklet;
                  ^
   drivers/crypto/qce/dma.c:44:17: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                           qce_sgl_cnt, dir)) {
                           ~~~~~~~~~~~~~^~~~
   include/linux/dma-mapping.h:419:58: note: expanded from macro 'dma_map_sg'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                  ~~~~~~~~~~~~~~~~          ^
   drivers/crypto/qce/dma.c:53:52: warning: implicit conversion from enumeration type 'enum dma_transfer_direction' to different enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                   dma_unmap_sg(qce->dev, qce_bam_sgl, qce_sgl_cnt, dir);
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/dma-mapping.h:420:62: note: expanded from macro 'dma_unmap_sg'
   #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
                                    ~~~~~~~~~~~~~~~~~~          ^
   2 warnings and 1 error generated.


vim +32 drivers/crypto/qce/core.h

ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  10  
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  11  /**
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  12   * struct qce_device - crypto engine device structure
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  13   * @queue: crypto request queue
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  14   * @lock: the lock protects queue and req
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  15   * @done_tasklet: done tasklet object
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  16   * @req: current active request
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  17   * @result: result of current transform
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  18   * @base: virtual IO base
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  19   * @dev: pointer to device structure
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  20   * @core: core device clock
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  21   * @iface: interface clock
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  22   * @bus: bus clock
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  23   * @dma: pointer to dma data
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  24   * @burst_size: the crypto burst size
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  25   * @pipe_pair_id: which pipe pair id the device using
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  26   * @async_req_enqueue: invoked by every algorithm to enqueue a request
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  27   * @async_req_done: invoked by every algorithm to finish its request
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  28   */
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  29  struct qce_device {
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  30  	struct crypto_queue queue;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  31  	spinlock_t lock;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25 @32  	struct tasklet_struct done_tasklet;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  33  	struct crypto_async_request *req;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  34  	int result;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  35  	void __iomem *base;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  36  	struct device *dev;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  37  	struct clk *core, *iface, *bus;
694ff00c9bb387 Thara Gopinath    2023-02-22  38  	struct icc_path *mem_path;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  39  	struct qce_dma_data dma;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  40  	int burst_size;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  41  	unsigned int pipe_pair_id;
f666e78afa2c49 Md Sadre Alam     2023-12-14  42  	dma_addr_t base_dma;
74826d774de8a8 Md Sadre Alam     2023-12-14  43  	__le32 *reg_read_buf;
74826d774de8a8 Md Sadre Alam     2023-12-14  44  	dma_addr_t reg_buf_phys;
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  45  	int (*async_req_enqueue)(struct qce_device *qce,
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  46  				 struct crypto_async_request *req);
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  47  	void (*async_req_done)(struct qce_device *qce, int ret);
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  48  };
ec8f5d8f6f76b9 Stanimir Varbanov 2014-06-25  49  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

