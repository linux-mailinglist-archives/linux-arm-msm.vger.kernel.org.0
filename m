Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585C261A05D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 19:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiKDS5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 14:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiKDS5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 14:57:39 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E5C51C34
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667588257; x=1699124257;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HfJ4nv8wN6briqCaEwDbiyyy2GoyauuVwacO9HR6vKQ=;
  b=ilGH6svSXLCF5Y+2CdV/c9mdg4u+qDB68I65Ws2mtKYKU1JhFn5WdnBo
   CojwRt7IKa4wqoQsA15sYDkOSe8ICms7mZH0+R0NRAFV1+eCOLgDA5dZL
   HN9UEAEP/NqsK8i7UUgWPvHtILUBEuLib9Y8o+FdJrWFaXsAymnzpoF81
   +vGnxRQIFOCb5RjvxQmiTuVDs/xhW8g21h3h3E/gTumPkckpOLcEQDboI
   P0ZBvUOyxx57U0vtWsUCJClbqo0CIEL+vwkiQgN0OqbcHDnw/8Mef8xy6
   yWi/yRX5h5BAgji4Kjkwy42fa8LdLZlCw/HWL8apjdFtyXbg/kI2fxI/W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="396344407"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="396344407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 11:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="777818230"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="777818230"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2022 11:57:36 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1or1sl-000HFA-0j;
        Fri, 04 Nov 2022 18:57:35 +0000
Date:   Sat, 05 Nov 2022 02:56:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 0cdb3579f1ee4c1e55acf8dfb0697b660067b1f8
Message-ID: <63656065.kcx4EopdcPjzWJhq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 0cdb3579f1ee4c1e55acf8dfb0697b660067b1f8  Add linux-next specific files for 20221104

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211041320.coq8EELJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211041654.zCUPre9o-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4878: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5044:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/msm/hdmi/hdmi.c:244:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
drivers/gpu/drm/msm/hdmi/hdmi.c:251:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- arc-randconfig-r036-20221104
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- arc-randconfig-r043-20221104
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- ia64-buildonly-randconfig-r006-20221104
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- m68k-allmodconfig
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- m68k-allyesconfig
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   `-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:static-is-not-at-beginning-of-declaration
|-- riscv-randconfig-r042-20221104
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
clang_recent_errors
`-- x86_64-randconfig-a016
    `-- vmlinux.o:warning:objtool:handle_bug:call-to-kmsan_unpoison_entry_regs()-leaves-.noinstr.text-section

elapsed time: 773m

configs tested: 58
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
riscv                randconfig-r042-20221104
x86_64                              defconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20221104
x86_64                        randconfig-a011
arc                                 defconfig
s390                 randconfig-r044-20221104
s390                             allmodconfig
x86_64                        randconfig-a015
powerpc                           allnoconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a002
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                             allyesconfig
sh                               allmodconfig
arc                              allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a006
powerpc                          allmodconfig
alpha                            allyesconfig
arm                                 defconfig
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                           allyesconfig
i386                          randconfig-a012
i386                          randconfig-a005
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221104
hexagon              randconfig-r045-20221104
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
