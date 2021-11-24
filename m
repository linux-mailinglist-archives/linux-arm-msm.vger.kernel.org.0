Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312BD45BCEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 13:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243524AbhKXMdx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 07:33:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:51310 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244210AbhKXMcA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 07:32:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="259153842"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="259153842"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 04:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="457022149"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2021 04:28:46 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mprOH-0004kx-FD; Wed, 24 Nov 2021 12:28:45 +0000
Date:   Wed, 24 Nov 2021 20:28:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Add a few gmu buffers to coredump
Message-ID: <202111242018.nGEDpNj7-lkp@intel.com>
References: <20211124024436.v2.6.Ibfca354efaf274142593a6dbfbedb3de31918ff6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124024436.v2.6.Ibfca354efaf274142593a6dbfbedb3de31918ff6@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc2 next-20211124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-P-Oommen/drm-msm-Increase-gpu-boost-interval/20211124-052303
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-buildonly-randconfig-r003-20211124 (https://download.01.org/0day-ci/archive/20211124/202111242018.nGEDpNj7-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/9bb31a2940567b37d0eead980d4bef5f4cef7d24
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-P-Oommen/drm-msm-Increase-gpu-boost-interval/20211124-052303
        git checkout 9bb31a2940567b37d0eead980d4bef5f4cef7d24
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:1244:6: warning: no previous prototype for function 'a6xx_gmu_show' [-Wmissing-prototypes]
   void a6xx_gmu_show(struct a6xx_gmu_state *gmu_state, struct drm_printer *p)
        ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:1244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void a6xx_gmu_show(struct a6xx_gmu_state *gmu_state, struct drm_printer *p)
   ^
   static 
   1 warning generated.


vim +/a6xx_gmu_show +1244 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

  1243	
> 1244	void a6xx_gmu_show(struct a6xx_gmu_state *gmu_state, struct drm_printer *p)
  1245	{
  1246		int i;
  1247	
  1248		drm_puts(p, "gmu-log:\n");
  1249		if (gmu_state->log_bo) {
  1250			struct msm_gpu_state_bo *log_bo = gmu_state->log_bo;
  1251	
  1252			drm_printf(p, "    iova: 0x%016llx\n", log_bo->iova);
  1253			drm_printf(p, "    size: %zu\n", log_bo->size);
  1254			adreno_show_object(p, &log_bo->data, log_bo->size,
  1255					&log_bo->encoded);
  1256		}
  1257	
  1258		drm_puts(p, "gmu-hfi:\n");
  1259		if (gmu_state->hfi_bo) {
  1260			struct msm_gpu_state_bo *hfi_bo = gmu_state->hfi_bo;
  1261	
  1262			drm_printf(p, "    iova: 0x%016llx\n", hfi_bo->iova);
  1263			drm_printf(p, "    size: %zu\n", hfi_bo->size);
  1264			adreno_show_object(p, &hfi_bo->data, hfi_bo->size,
  1265					&hfi_bo->encoded);
  1266		}
  1267	
  1268		drm_puts(p, "gmu-debug:\n");
  1269		if (gmu_state->debug_bo) {
  1270			struct msm_gpu_state_bo *debug_bo = gmu_state->debug_bo;
  1271	
  1272			drm_printf(p, "    iova: 0x%016llx\n", debug_bo->iova);
  1273			drm_printf(p, "    size: %zu\n", debug_bo->size);
  1274			adreno_show_object(p, &debug_bo->data, debug_bo->size,
  1275					&debug_bo->encoded);
  1276		}
  1277	
  1278		drm_puts(p, "registers-gmu:\n");
  1279		for (i = 0; i < gmu_state->nr_registers; i++) {
  1280			struct a6xx_gpu_state_obj *obj = &gmu_state->registers[i];
  1281			const struct a6xx_registers *regs = obj->handle;
  1282	
  1283			if (!obj->handle)
  1284				continue;
  1285	
  1286			a6xx_show_registers(regs->registers, obj->data, regs->count, p);
  1287		}
  1288	}
  1289	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
