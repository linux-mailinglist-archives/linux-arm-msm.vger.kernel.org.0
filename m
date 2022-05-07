Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFDF51E6E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 14:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiEGMYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 08:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbiEGMYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 08:24:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C351A3AC
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651926044; x=1683462044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IbK33cLn7gV/fzxHo+v5rptEYR9zbVVIEqG1OSEDSYc=;
  b=a2ieWEGCXj4JGwKmNNw2mNHJNWpv+/LKkBqb+MEQaDJQTwSF1dUopDyQ
   iM0G+2VD09tJjjQ/cndpf5IiQNlyDZSkPTJS43K51R/CmZ53AEGJbQ42R
   qft/xd8uFnQlHkPIuxmcVi4PE/Si04+sdwvRrHcsx2dwXgSZrqm4BeoWL
   lcuQ55skxUhn4PbOVOpHptOmLt87yu/6UhPrh30yfhtrZWqd87K7iAp3b
   AqpRf3lMfbZQmw7Uz55QYrbGtFtdyo5aZMD2RamD8hKrZTF0vl8mnKoWC
   uqCQjYFMzAUrD1cm37HZk71SJiIdXMFMnmScjRbESYlCIAsKVp6mJlEPE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="329253664"
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="329253664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2022 05:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; 
   d="scan'208";a="665899145"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 May 2022 05:20:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnJQP-000EYJ-15;
        Sat, 07 May 2022 12:20:41 +0000
Date:   Sat, 7 May 2022 20:20:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Message-ID: <202205072052.67OjKtjD-lkp@intel.com>
References: <20220507010046.1667809-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507010046.1667809-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220506]
[also build test WARNING on v5.18-rc5]
[cannot apply to drm/drm-next v5.18-rc5 v5.18-rc4 v5.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-mdp4-convert-to-drm_crtc_handle_vblank/20220507-090522
base:    38a288f5941ef03752887ad86f2d85442358c99a
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220507/202205072052.67OjKtjD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/08ab9442139f4b4c9e33ce35986014219fd1d5d0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-mdp4-convert-to-drm_crtc_handle_vblank/20220507-090522
        git checkout 08ab9442139f4b4c9e33ce35986014219fd1d5d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_drv.c:428:22: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                   priv->event_thread[i].crtc = crtc;
                                      ^
   drivers/gpu/drm/msm/msm_drv.c:353:12: note: initialize the variable 'i' to silence this warning
           int ret, i;
                     ^
                      = 0
   1 warning generated.


vim +/i +428 drivers/gpu/drm/msm/msm_drv.c

   346	
   347	static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
   348	{
   349		struct msm_drm_private *priv = dev_get_drvdata(dev);
   350		struct drm_device *ddev;
   351		struct msm_kms *kms;
   352		struct drm_crtc *crtc;
   353		int ret, i;
   354	
   355		if (drm_firmware_drivers_only())
   356			return -ENODEV;
   357	
   358		ddev = drm_dev_alloc(drv, dev);
   359		if (IS_ERR(ddev)) {
   360			DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
   361			return PTR_ERR(ddev);
   362		}
   363		ddev->dev_private = priv;
   364		priv->dev = ddev;
   365	
   366		priv->wq = alloc_ordered_workqueue("msm", 0);
   367		priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
   368	
   369		INIT_LIST_HEAD(&priv->objects);
   370		mutex_init(&priv->obj_lock);
   371	
   372		INIT_LIST_HEAD(&priv->inactive_willneed);
   373		INIT_LIST_HEAD(&priv->inactive_dontneed);
   374		INIT_LIST_HEAD(&priv->inactive_unpinned);
   375		mutex_init(&priv->mm_lock);
   376	
   377		/* Teach lockdep about lock ordering wrt. shrinker: */
   378		fs_reclaim_acquire(GFP_KERNEL);
   379		might_lock(&priv->mm_lock);
   380		fs_reclaim_release(GFP_KERNEL);
   381	
   382		drm_mode_config_init(ddev);
   383	
   384		ret = msm_init_vram(ddev);
   385		if (ret)
   386			return ret;
   387	
   388		/* Bind all our sub-components: */
   389		ret = component_bind_all(dev, ddev);
   390		if (ret)
   391			return ret;
   392	
   393		dma_set_max_seg_size(dev, UINT_MAX);
   394	
   395		msm_gem_shrinker_init(ddev);
   396	
   397		if (priv->kms_init) {
   398			ret = priv->kms_init(ddev);
   399			if (ret) {
   400				DRM_DEV_ERROR(dev, "failed to load kms\n");
   401				priv->kms = NULL;
   402				goto err_msm_uninit;
   403			}
   404			kms = priv->kms;
   405		} else {
   406			/* valid only for the dummy headless case, where of_node=NULL */
   407			WARN_ON(dev->of_node);
   408			kms = NULL;
   409		}
   410	
   411		/* Enable normalization of plane zpos */
   412		ddev->mode_config.normalize_zpos = true;
   413	
   414		if (kms) {
   415			kms->dev = ddev;
   416			ret = kms->funcs->hw_init(kms);
   417			if (ret) {
   418				DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
   419				goto err_msm_uninit;
   420			}
   421		}
   422	
   423		ddev->mode_config.funcs = &mode_config_funcs;
   424		ddev->mode_config.helper_private = &mode_config_helper_funcs;
   425	
   426		drm_for_each_crtc(crtc, ddev) {
   427			/* initialize event thread */
 > 428			priv->event_thread[i].crtc = crtc;
   429			priv->event_thread[i].dev = ddev;
   430			priv->event_thread[i].worker = kthread_create_worker(0,
   431				"crtc_event:%d", priv->event_thread[i].crtc->base.id);
   432			if (IS_ERR(priv->event_thread[i].worker)) {
   433				ret = PTR_ERR(priv->event_thread[i].worker);
   434				DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
   435				ret = PTR_ERR(priv->event_thread[i].worker);
   436				goto err_msm_uninit;
   437			}
   438	
   439			sched_set_fifo(priv->event_thread[i].worker->task);
   440		}
   441	
   442		ret = drm_vblank_init(ddev, priv->num_crtcs);
   443		if (ret < 0) {
   444			DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
   445			goto err_msm_uninit;
   446		}
   447	
   448		if (kms) {
   449			pm_runtime_get_sync(dev);
   450			ret = msm_irq_install(ddev, kms->irq);
   451			pm_runtime_put_sync(dev);
   452			if (ret < 0) {
   453				DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
   454				goto err_msm_uninit;
   455			}
   456		}
   457	
   458		ret = drm_dev_register(ddev, 0);
   459		if (ret)
   460			goto err_msm_uninit;
   461	
   462		if (kms) {
   463			ret = msm_disp_snapshot_init(ddev);
   464			if (ret)
   465				DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
   466		}
   467		drm_mode_config_reset(ddev);
   468	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
