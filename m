Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B704159A529
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 20:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354703AbiHSRe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 13:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354518AbiHSReh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 13:34:37 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95781537DD;
        Fri, 19 Aug 2022 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660927999; x=1692463999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iOcJREqHTGsAdb5AEkq4hDue4vu5yHBzF6n06gYH86E=;
  b=oG0MLBPWGCnJiSZs2l0sKFvmqVtlzhc/BfYiXj1BmACNKDJneZGJmUOw
   +vMskoogoOXtaUKyIt0uDaG89TDDZY+cxaKIX7Tw9HxJuL9q+5VsoMXIo
   CjBdkH+cFQqIsRnTAuDCaOKZ2CN8Lj6qwur4X8vBxzugibobYv7O2UfzZ
   2G0z4qaXRb6ryZstuPdOZ3wlwX8CyyMEC/dCEIjU+ggt7j3/qt555eUtN
   2+3DYtQ9o4s5CIr6i4yqbrhJ6nzbtFbkgU8JxgCQ3KKUHNdAdQYlFshxC
   TKtzJorWWJecfD66hNCzJ6W38GlA4KMF0ucD+IAk3r5QJSDLmkAlOyAsF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293053177"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="293053177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 09:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="936280065"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2022 09:50:05 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP5C8-0001e9-1d;
        Fri, 19 Aug 2022 16:50:04 +0000
Date:   Sat, 20 Aug 2022 00:49:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD SUCCESS WITH WARNING
 e68b4a7c00f99b319b84be8849addb8fddf9629b
Message-ID: <62ffbf32.qqqMdIxDQRBJomQ+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: e68b4a7c00f99b319b84be8849addb8fddf9629b  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Warning reports:

https://lore.kernel.org/linux-mm/202208110453.zEneXTnn-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/m68k/include/asm/string.h:64:25: warning: '__builtin_memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]
drivers/usb/dwc3/dwc3-qcom.c:313:25: warning: variable 'hcd' set but not used [-Wunused-but-set-variable]
include/linux/fortify-string.h:44:33: warning: '__builtin_memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- m68k-allmodconfig
|   `-- arch-m68k-include-asm-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size
|-- m68k-allyesconfig
|   `-- arch-m68k-include-asm-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size
|-- mips-allyesconfig
|   `-- include-linux-fortify-string.h:warning:__builtin_memcmp-specified-bound-exceeds-source-size
`-- mips-randconfig-r014-20220819
    `-- drivers-usb-dwc3-dwc3-qcom.c:warning:variable-hcd-set-but-not-used

elapsed time: 728m

configs tested: 58
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
arm                                 defconfig
arc                              allyesconfig
i386                          randconfig-a005
arc                  randconfig-r043-20220819
alpha                            allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
i386                          randconfig-a012
mips                             allyesconfig
arm                              allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a016
sh                               allmodconfig
arm64                            allyesconfig
x86_64                        randconfig-a015
i386                             allyesconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r041-20220819
riscv                randconfig-r042-20220819
hexagon              randconfig-r045-20220819
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
s390                 randconfig-r044-20220819
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
