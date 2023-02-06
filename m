Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C58768C4EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 18:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjBFReP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 12:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjBFReO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 12:34:14 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627BA13D7A;
        Mon,  6 Feb 2023 09:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675704852; x=1707240852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E6FtT1y0csBMH/T1ALlQnJ2NG23R3sXvASuze+beOxk=;
  b=ghOa+fsj74GWxDO+TunyD3eX7C1+LJBI2olXdXRpk3+Irjbw/4ZM59cy
   XREfYYjJ6L104lTGjAMvrZF3jMpqm2AbNATPBTZVIAZLR1JaEPfta1c6x
   Hd8vUlcBQdFimgmo7W1yLhRgb3l04PZyIqN43QrCyTEdZCiBAMLJfywoD
   HMhH2Oo7jH5eun8mFhT+nimaC6wdOiAkBKUXISMyMup3smrpKIHSeJj+V
   cfdSiMOk0esYj8bD8QEGgfnyh5UefLrrI1COL4L/jbAVfN0/4E8ZBX2jR
   PpR/jRQzCpWTN0BFIQMs9CFEsF0B+M8oGJj58MgpXc9TK27dVjKZD2Bn/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="393863230"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393863230"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 09:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644114477"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="644114477"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 09:34:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pP5NX-0002hc-0q;
        Mon, 06 Feb 2023 17:34:07 +0000
Date:   Tue, 07 Feb 2023 01:33:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-trace-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 129af770823407ee115a56c69a04b440fd2fbe61
Message-ID: <63e139e1.J5AHO6vmxaALh7xv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 129af770823407ee115a56c69a04b440fd2fbe61  Add linux-next specific files for 20230206

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301230743.Xnut0Zvc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301300743.bp7Dpazv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301301801.y5O08tQx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302011836.kA3BxqdY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302061911.C7xvHX9v-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302062223.7F7gv80M-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302062224.ByzeTXh1-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/riscv/uabi.rst:24: WARNING: Enumerated list ends without a blank line; unexpected unindent.
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
FAILED: load BTF from vmlinux: No data available
arch/arm64/kvm/arm.c:2207: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
drivers/clk/qcom/gcc-sa8775p.c:313:32: warning: unused variable 'gcc_parent_map_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:318:37: warning: unused variable 'gcc_parent_data_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:333:32: warning: unused variable 'gcc_parent_map_12' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:338:37: warning: unused variable 'gcc_parent_data_12' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: mod_info_packet.h: No such file or directory
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6: warning: no previous prototype for 'hubbub31_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:948:6: warning: no previous prototype for 'hubbub32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:158:6: warning: no previous prototype for 'hubp32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1295:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:279:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
libbpf: failed to find '.BTF' ELF section in vmlinux

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/thermal/qcom/tsens-v0_1.c:106:40: sparse: sparse: symbol 'tsens_9607_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:26:40: sparse: sparse: symbol 'tsens_8916_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:42:40: sparse: sparse: symbol 'tsens_8939_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:62:40: sparse: sparse: symbol 'tsens_8974_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:84:40: sparse: sparse: symbol 'tsens_8974_backup_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:24:40: sparse: sparse: symbol 'tsens_qcs404_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:45:40: sparse: sparse: symbol 'tsens_8976_nvmem' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r022-20230205
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.h:fatal-error:mod_info_packet.h:No-such-file-or-directory
|-- alpha-randconfig-s042-20230204
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.h:fatal-error:mod_info_packet.h:No-such-file-or-directory
|-- arm64-allyesconfig
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-buildonly-randconfig-r006-20230205
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|-- arm64-randconfig-c023-20230205
|   `-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|-- arm64-randconfig-r011-20230206
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|-- arm64-randconfig-s041-20230206
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.h:fatal-error:mod_info_packet.h:No-such-file-or-directory
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8916_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8939_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_backup_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_9607_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v1.c:sparse:sparse:symbol-tsens_8976_nvmem-was-not-declared.-Should-it-be-static
|   `-- drivers-thermal-qcom-tsens-v1.c:sparse:sparse:symbol-tsens_qcs404_nvmem-was-not-declared.-Should-it-be-static
|-- i386-randconfig-m021
|   `-- kernel-trace-trace_events_synth.c-trace_event_raw_event_synth()-warn:inconsistent-indenting
|-- i386-randconfig-s001
|   `-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|-- i386-randconfig-s002
|   `-- drivers-gpu-drm-i915-gem-i915_gem_ttm.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-assigned-usertype-ret-got-int
|-- ia64-allmodconfig
clang_recent_errors
`-- riscv-randconfig-r003-20230204
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_10
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_12
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_10
    `-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_12

elapsed time: 721m

configs tested: 55
configs skipped: 28

gcc tested configs:
powerpc                           allnoconfig
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
x86_64                              defconfig
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
x86_64                               rhel-8.3
x86_64                            allnoconfig
x86_64               randconfig-a012-20230206
x86_64               randconfig-a015-20230206
x86_64                           allyesconfig
x86_64               randconfig-a016-20230206
x86_64               randconfig-a014-20230206
sh                               allmodconfig
mips                             allyesconfig
s390                 randconfig-r044-20230206
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
powerpc                          allmodconfig
mips                  maltasmvp_eva_defconfig
riscv                randconfig-r042-20230206
mips                    maltaup_xpa_defconfig
arm                           sunxi_defconfig
arm                           tegra_defconfig
arc                  randconfig-r043-20230206
sh                 kfr2r09-romimage_defconfig
m68k                           virt_defconfig
arm64                            allyesconfig

clang tested configs:
x86_64               randconfig-a001-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a002-20230206
i386                 randconfig-a002-20230206
x86_64               randconfig-a004-20230206
i386                 randconfig-a004-20230206
x86_64               randconfig-a003-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
hexagon              randconfig-r041-20230205
x86_64               randconfig-a006-20230206
riscv                randconfig-r042-20230205
i386                 randconfig-a005-20230206
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
i386                 randconfig-a006-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
powerpc                      acadia_defconfig
mips                          rm200_defconfig
arm                          sp7021_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
