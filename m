Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205597D2045
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 00:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjJUWah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 18:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJUWag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 18:30:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D860D7A;
        Sat, 21 Oct 2023 15:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697927429; x=1729463429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=djejmMFC3O0wM8gMlGV7yHwjbMvqe1uwT0DwjkNsLLw=;
  b=erxHbWhi5RmdjOh0Jvip+npImeeXMrHWnONK+6wjmjmyB4hJPsAx4uae
   tnOnV661n5OJy6F0ILfjhFvzUCdT7Jff3cB6c5ekRRgSpkU9UuO3CPLHg
   8LYPdbGVT8KiYoUv0iDFTgQRlKN2j3vHlSer9iSVnj/n5yPLKcl64FXp5
   IJ9d8jpnnUFwmGol2ZoCzE4upN6/wemjyk0chqF49VAUTRqEhjL569vpc
   tCtvshD3vr0Lkt0S+DIqJAGCqGAFpjJiESNa9rj7FDX/jC+ILbXjoQ+VF
   sOO+synxVWpjZ1yaiYpHuAnPvo9MRXib1nI6X4UY6h8s345GmnbIa5fQz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8224077"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8224077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 15:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881385640"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881385640"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 15:30:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1quKUC-0005Hy-0o;
        Sat, 21 Oct 2023 22:30:24 +0000
Date:   Sun, 22 Oct 2023 06:29:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Ekansh Gupta <quic_ekangupt@quicinc.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] misc: fastrpc: Add fastrpc multimode invoke
 request support
Message-ID: <202310220610.KdxUvBUu-lkp@intel.com>
References: <1697612560-9726-2-git-send-email-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697612560-9726-2-git-send-email-quic_ekangupt@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next linus/master v6.6-rc6]
[cannot apply to char-misc/char-misc-linus next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-fastrpc-multimode-invoke-request-support/20231018-150423
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/1697612560-9726-2-git-send-email-quic_ekangupt%40quicinc.com
patch subject: [PATCH v5 1/5] misc: fastrpc: Add fastrpc multimode invoke request support
config: i386-randconfig-011-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220610.KdxUvBUu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220610.KdxUvBUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220610.KdxUvBUu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/misc/fastrpc.h:89:33: error: C++ style comments are not allowed in ISO C90
      89 |         __u32 reserved[8];      // keeping reserved bits for new requirements
         |                                 ^
   ./usr/include/misc/fastrpc.h:89:33: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
