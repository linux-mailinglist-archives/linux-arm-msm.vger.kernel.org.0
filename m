Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CA066270D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjAINau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjAINas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:30:48 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3DE17889;
        Mon,  9 Jan 2023 05:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673271047; x=1704807047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Hj0mYbVVN5STNln4AyVYIO3TneQGXOfu1lbQnYSSKrs=;
  b=OK5SK/ow3mpYirJz3EsI3+c1BUnId2QVy0IUBVsAXxyt2ltfXOBVfw2r
   4gfJJEyrWkyuYm5TtSW8IZQzo2VctnJISD2J9LR+T9Z+y8PSJUuCMb4V1
   Rw4IxrkjUOqxURsyST+mBwzNayxE5Z68ze4lSL0UgY635OH2FZJWdHjmE
   24FUSF809ovrupONoGooQXGcox0ZknPDZ8ODhDnCNWUDzngp3eTkkYo8l
   VO8IIALM1Zraqn4agcpp5alGZndfgyIn7XvMm/dD7QWCBsNCw2N+IRcra
   gucJI03z+RQEnRIJiXng0V7fB9NxH/AALHpxGY7BZRHdETWt8AoOcVir3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="320571828"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="320571828"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 05:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="658593157"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="658593157"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jan 2023 05:30:44 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pEsEd-0006pe-25;
        Mon, 09 Jan 2023 13:30:43 +0000
Date:   Mon, 09 Jan 2023 21:29:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     speakup@linux-speakup.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 543b9b2fe10b2e12b8d773af65314d322f91e479
Message-ID: <63bc16ce.IBWX7dhtPEB7dLIq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 543b9b2fe10b2e12b8d773af65314d322f91e479  Add linux-next specific files for 20230109

Error/Warning: (recently discovered and may have been fixed)

aarch64-linux-ld: ID map text too big or misaligned
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/accessibility/speakup/main.c:1290:26: sparse: sparse: obsolete array initializer, use C99 syntax
drivers/i2c/busses/i2c-qcom-geni.c:1028:28: sparse: sparse: symbol 'i2c_master_hub' was not declared. Should it be static?
drivers/nvmem/imx-ocotp.c:599:21: sparse: sparse: symbol 'imx_ocotp_layout' was not declared. Should it be static?
drivers/nvmem/layouts/sl28vpd.c:143:21: sparse: sparse: symbol 'sl28vpd_layout' was not declared. Should it be static?
drivers/soc/qcom/ramp_controller.c:235:27: sparse: sparse: symbol 'msm8976_cfg_dfs_sid' was not declared. Should it be static?
drivers/soc/qcom/ramp_controller.c:246:27: sparse: sparse: symbol 'msm8976_cfg_link_sid' was not declared. Should it be static?
drivers/soc/qcom/ramp_controller.c:250:27: sparse: sparse: symbol 'msm8976_cfg_lmh_sid' was not declared. Should it be static?
drivers/soc/qcom/ramp_controller.c:256:27: sparse: sparse: symbol 'msm8976_cfg_ramp_en' was not declared. Should it be static?
drivers/soc/qcom/ramp_controller.c:262:27: sparse: sparse: symbol 'msm8976_cfg_ramp_dis' was not declared. Should it be static?
drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse: sparse: incorrect type in assignment (different base types)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- arm64-randconfig-s041-20230108
|   |-- drivers-accessibility-speakup-main.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|   |-- drivers-i2c-busses-i2c-qcom-geni.c:sparse:sparse:symbol-i2c_master_hub-was-not-declared.-Should-it-be-static
|   `-- drivers-nvmem-imx-ocotp.c:sparse:sparse:symbol-imx_ocotp_layout-was-not-declared.-Should-it-be-static
|-- m68k-randconfig-s033-20230108
|   |-- drivers-nvmem-layouts-sl28vpd.c:sparse:sparse:symbol-sl28vpd_layout-was-not-declared.-Should-it-be-static
|   |-- drivers-soc-qcom-ramp_controller.c:sparse:sparse:symbol-msm8976_cfg_dfs_sid-was-not-declared.-Should-it-be-static
|   |-- drivers-soc-qcom-ramp_controller.c:sparse:sparse:symbol-msm8976_cfg_link_sid-was-not-declared.-Should-it-be-static
|   |-- drivers-soc-qcom-ramp_controller.c:sparse:sparse:symbol-msm8976_cfg_lmh_sid-was-not-declared.-Should-it-be-static
|   |-- drivers-soc-qcom-ramp_controller.c:sparse:sparse:symbol-msm8976_cfg_ramp_dis-was-not-declared.-Should-it-be-static
|   `-- drivers-soc-qcom-ramp_controller.c:sparse:sparse:symbol-msm8976_cfg_ramp_en-was-not-declared.-Should-it-be-static
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
|-- mips-buildonly-randconfig-r004-20230109
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
`-- s390-randconfig-s053-20230108
    |-- drivers-accessibility-speakup-main.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
    |-- drivers-usb-misc-sisusbvga-sisusbvga.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-usertype-address-got-restricted-__le32-usertype
    |-- drivers-usb-misc-sisusbvga-sisusbvga.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-usertype-data-got-restricted-__le32-usertype
    `-- drivers-usb-misc-sisusbvga-sisusbvga.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-header-got-restricted-__le16-usertype

elapsed time: 723m

configs tested: 87
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
i386                                defconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a011-20230109
x86_64               randconfig-a013-20230109
s390                                defconfig
x86_64               randconfig-a012-20230109
i386                          randconfig-a014
x86_64                               rhel-8.3
m68k                             allyesconfig
i386                          randconfig-a012
s390                             allyesconfig
x86_64                           rhel-8.3-bpf
arc                     haps_hs_smp_defconfig
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
i386                             allyesconfig
i386                          randconfig-a016
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                          rhel-8.3-func
sh                         apsh4a3a_defconfig
x86_64               randconfig-a014-20230109
x86_64                           allyesconfig
arc                              allyesconfig
x86_64               randconfig-a016-20230109
powerpc                   motionpro_defconfig
alpha                            allyesconfig
x86_64               randconfig-a015-20230109
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
mips                             allyesconfig
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
powerpc                          allmodconfig
arc                  randconfig-r043-20230109
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
mips                         cobalt_defconfig
arm64                            alldefconfig
powerpc                      makalu_defconfig
mips                  maltasmvp_eva_defconfig
arm                          iop32x_defconfig
powerpc                      mgcoge_defconfig
nios2                               defconfig
arm                           corgi_defconfig
powerpc                     taishan_defconfig
parisc                           allyesconfig

clang tested configs:
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a001-20230109
x86_64                          rhel-8.3-rust
i386                 randconfig-a005-20230109
i386                 randconfig-a006-20230109
hexagon              randconfig-r045-20230109
arm                  randconfig-r046-20230109
x86_64               randconfig-a003-20230109
i386                          randconfig-a013
x86_64               randconfig-a002-20230109
arm                      tct_hammer_defconfig
arm                       mainstone_defconfig
hexagon              randconfig-r041-20230108
powerpc                 mpc832x_mds_defconfig
i386                          randconfig-a011
x86_64               randconfig-a004-20230109
hexagon              randconfig-r041-20230109
x86_64               randconfig-a005-20230109
i386                          randconfig-a015
x86_64               randconfig-a001-20230109
x86_64               randconfig-a006-20230109
hexagon              randconfig-r045-20230108
s390                 randconfig-r044-20230108
riscv                randconfig-r042-20230108
arm                            mmp2_defconfig
powerpc                        fsp2_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
