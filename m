Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6484558B682
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Aug 2022 17:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiHFPcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Aug 2022 11:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbiHFPcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Aug 2022 11:32:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED68E60ED;
        Sat,  6 Aug 2022 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659799924; x=1691335924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vu6Y2qO+FKc1QzYLh0uE+Z7hKMHTWrM2Cu3ji9kmzag=;
  b=lZTEGDWobUMLTrszQnVLxpsd8gvmy4c9fqUAQEijBmNhopr1zbqZwLa4
   +GnQ4Xgh/sFKlGJle9zCQdzHkwl/4eJa+0aFVqAPCw3r2kKZgM/B/J0Il
   PHZJDFeZ2rybct2CS9oUQ+eyLdLZxdC82xgLV5Qnlp808TQqiZVhw1gQ9
   9hXjQu9f1JGOqIUbiLdeHncMzxN0CobpMyPqaXbdO+nHxfWaqoMduQRT8
   5FToH0Dj3AatrnE+2p9vSrVRz3upn/uSSncH8D2aova5h1NhEnrowY+3L
   5HQbYokExRuetqP4maa60mFt8xTrcPymCbRINmXG3Fay6ECyGlcvbUZaq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="270148834"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="270148834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 08:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="603901993"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Aug 2022 08:32:00 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oKLmR-000KU3-1p;
        Sat, 06 Aug 2022 15:31:59 +0000
Date:   Sat, 6 Aug 2022 23:31:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/11] docs: gunyah: Introduce Gunyah Hypervisor
Message-ID: <202208062327.dI3HuYk5-lkp@intel.com>
References: <20220801211240.597859-2-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801211240.597859-2-quic_eberman@quicinc.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Elliot,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on v5.19]
[cannot apply to linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/Drivers-for-gunyah-hypervisor/20220802-051534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/virt/gunyah/index.rst:71: WARNING: Unexpected indentation.
>> Documentation/virt/gunyah/index.rst:72: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +71 Documentation/virt/gunyah/index.rst

    66	
    67	::
    68	  +-------+   +--------+   +--------+
    69	  |  RM   |   |  VM_A  |   |  VM_B  |
    70	  +-.-.-.-+   +---.----+   +---.----+
  > 71	    | |           |            |
  > 72	  +-.-.-----------.------------.----+
    73	  | | \==========/             |    |
    74	  |  \========================/     |
    75	  |            Gunyah               |
    76	  +---------------------------------+
    77	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
