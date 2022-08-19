Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AADF59A30C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 20:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354533AbiHSRZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 13:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354565AbiHSRYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 13:24:51 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CC83ECFF;
        Fri, 19 Aug 2022 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660927412; x=1692463412;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vJ4mT+GSo6ERAE1lxJMfjzM4MAvhWOC+o59SFQDfCMM=;
  b=NSF2hkbPSgLWExegQMpPcFCzVOIbQwr66YrA+xzXboCWtbugw6Ul7+TA
   EZCKXVCtkw/uSAJ6V1GPxQoP2wZvWM1t1VuLnRYW5YuL6wCUHPm1ZlsIc
   PDH1kBGjKFYF7PTzsFYqCSnd7xn1/lW122JMR79BKXwutmGAvWBB8scG7
   Qf5yxcQjZvS+xWpMk0g5SXs0Mre6X3bSZOIzFH4Pi4pVhD1MfcRWjCE0D
   sdFCkpAeLhTZ/6tN4NRQ8CcNEtd0khyPhsFXZMrTirv8jBScxHlZzXHqJ
   YEhrE1XKSsO8/mGpwd9rlJzyaHGR2eyr2mUoTDs3JvM22GZYteQxTn1vd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="294327318"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="294327318"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 09:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="641311133"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Aug 2022 09:43:05 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP55M-0001dr-1G;
        Fri, 19 Aug 2022 16:43:04 +0000
Date:   Sat, 20 Aug 2022 00:42:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     sound-open-firmware@alsa-project.org,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 8755ae45a9e8ae883fa7f4eb0162830c55aacf14
Message-ID: <62ffbd7c.64C1TF454zi41jGk%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8755ae45a9e8ae883fa7f4eb0162830c55aacf14  Add linux-next specific files for 20220819

Error/Warning reports:

https://lore.kernel.org/linux-doc/202208192207.a0rAM0nj-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/translations/zh_CN/process/5.Posting.rst:197: WARNING: undefined label: cn_email_clients (if the link has no caption the label must precede a section header)
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5: warning: no previous prototype for 'fill_dc_scaling_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6: warning: no previous prototype for 'handle_cursor_update' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6: warning: no previous prototype for 'modifier_has_dcc' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5: warning: no previous prototype for 'amdgpu_dm_plane_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10: warning: no previous prototype for 'modifier_gfx9_swizzle_mode' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5: warning: no previous prototype for 'fill_plane_buffer_attributes' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for 'amd_get_format_info' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6: warning: no previous prototype for 'fill_blending_from_plane_state' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5: warning: no previous prototype for 'dm_plane_helper_check_state' [-Wmissing-prototypes]
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:905:28: warning: variable 'top' set but not used [-Wunused-but-set-variable]
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'
sound/soc/sof/compress.c:330:13: warning: variable 'dai_posn' set but not used [-Wunused-but-set-variable]
sound/soc/sof/intel/hda-codec.c:216:17: error: too few arguments to function 'hda_codec_device_init'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|-- alpha-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
|-- alpha-randconfig-r002-20220819
|   `-- sound-soc-sof-intel-hda-codec.c:error:too-few-arguments-to-function-hda_codec_device_init
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_dc_scaling_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_plane_buffer_attributes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-handle_cursor_update
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_gfx9_swizzle_mode
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-modifier_has_dcc
|   |-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|   `-- sound-soc-sof-compress.c:warning:variable-dai_posn-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-disp-dpu1-dpu_kms.c:warning:variable-top-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amd_get_format_info
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-amdgpu_dm_plane_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-dm_plane_helper_check_state
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_plane.c:warning:no-previous-prototype-for-fill_blending_from_plane_state

elapsed time: 723m

configs tested: 66
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220819
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
powerpc                           allnoconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                          randconfig-a016
openrisc                            defconfig
powerpc                      tqm8xx_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
sh                          lboxre2_defconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                           viper_defconfig
ia64                             allmodconfig
mips                    maltaup_xpa_defconfig
sh                         ap325rxa_defconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig

clang tested configs:
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
x86_64                        randconfig-a016
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a014
i386                          randconfig-a002
arm                           spitz_defconfig
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
mips                      maltaaprp_defconfig
powerpc                   lite5200b_defconfig
mips                      malta_kvm_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
