Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1164F59BF3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 14:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbiHVMFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 08:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234927AbiHVMFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 08:05:52 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418F23055F;
        Mon, 22 Aug 2022 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661169951; x=1692705951;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=811smr8o+N31DwICHQUYadnBAo8HWEZEZAetsUCixYw=;
  b=JrOi1R93xCxsqlc90K6HT+HRn3QpDOvP9cxi1p9dApflISUcB5sHHvE4
   S1FEu1bB8obgvOJzTUXMTfc53AWB4UCrf/X+Y5dNDoe1c9YtKYaebmSpx
   TipYYak/a5cbgZs2fGDNPzzL2uBt40p8UoEuLN+DyAg9dXiv6+BUXNIUB
   4z0mna/FzUHo90+KAQJeOqP2l465nbynStDDvcWUv9pY9ggJM2r/SwO6v
   EySwpMOhBBjBRtHk6u5lkAIfDiv2UOMOu9oZ/nsaHlouEzh1t02kfU3ZZ
   zsbVrbxmfWXf8nvLb0Gw9cIIVwut7k0jIe+uaG+EjPgLyo9Ox/hAr+Q1Z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="357376894"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="357376894"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 05:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="784828428"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2022 05:05:49 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQ6Bg-0005JP-2R;
        Mon, 22 Aug 2022 12:05:48 +0000
Date:   Mon, 22 Aug 2022 20:04:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD SUCCESS
 72d0e40cc07e06e5b11ddcf74ba68f7e04eacb16
Message-ID: <630370e9.lrkhEwYdtnOT++I7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: 72d0e40cc07e06e5b11ddcf74ba68f7e04eacb16  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Unverified Warning (likely false positive, please contact us if interested):

drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]
include/net/bluetooth/bluetooth.h:347:16: warning: 'memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- ia64-allmodconfig
|   `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used
|-- openrisc-buildonly-randconfig-r006-20220821
|   `-- include-net-bluetooth-bluetooth.h:warning:memcmp-specified-bound-exceeds-source-size
|-- openrisc-randconfig-r021-20220821
|   `-- include-net-bluetooth-bluetooth.h:warning:memcmp-specified-bound-exceeds-source-size
`-- sparc64-buildonly-randconfig-r003-20220822
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used

elapsed time: 723m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a014-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a011-20220822
arm                                 defconfig
i386                 randconfig-a012-20220822
arc                               allnoconfig
x86_64                          rhel-8.3-func
alpha                             allnoconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a015-20220822
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
riscv                             allnoconfig
x86_64                               rhel-8.3
x86_64               randconfig-a012-20220822
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a016-20220822
x86_64               randconfig-a013-20220822
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
arc                  randconfig-r043-20220821
csky                              allnoconfig
x86_64               randconfig-a011-20220822
arm64                            allyesconfig
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
i386                          randconfig-a003
x86_64               randconfig-a016-20220822
x86_64               randconfig-a014-20220822
i386                          randconfig-a005
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
s390                 randconfig-r044-20220822
m68k                             allmodconfig
x86_64               randconfig-a015-20220822
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
ia64                             allmodconfig
i386                                defconfig
i386                             allyesconfig

clang tested configs:
x86_64               randconfig-a002-20220822
x86_64               randconfig-a005-20220822
x86_64               randconfig-a004-20220822
x86_64               randconfig-a003-20220822
hexagon              randconfig-r041-20220822
x86_64               randconfig-a001-20220822
hexagon              randconfig-r045-20220822
x86_64               randconfig-a006-20220822
i386                          randconfig-a002
riscv                randconfig-r042-20220821
i386                          randconfig-a004
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
i386                          randconfig-a006
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
