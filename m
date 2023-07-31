Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8356769262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 11:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjGaJyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 05:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjGaJyB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 05:54:01 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA44E5B;
        Mon, 31 Jul 2023 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690797176; x=1722333176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PAoEQuTB+M6/Mb3C/VaAtLqfjQYPblPsfV7KVnusHG0=;
  b=R8RetCIdGQB6sPY6dv5VcUWTUGc/TEgck4SZddvjytxyuSJJdJr1EG1L
   Mnh9M5X08f2vl4WFmt6KuOV/8s9nnllMckIACQiZv3A4JAh92TuUdYhTc
   /Ge0IkGy7Jecmua0PsTG2W/98+4chQkhLlSyJKn2C3isi51bWasg8vXa7
   7PAzKlnmtaXx/DNVO75eJ6Zcbk7/wFg4q76mRWbqzrArdFuPqziVQvxis
   Npz0tNtUI3iNBUfChrN/I0S93r8vVFVMu0yLS3Ymfi6H3YZ623URzCNPy
   LApH6U1+JnOeaRUwUCbWIbdzM4Z9qlN2giXbwN55zTmJRdlwqEQaZqSDs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348573362"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="348573362"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 02:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="902059850"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="902059850"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jul 2023 02:52:32 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qQPZn-00053G-25;
        Mon, 31 Jul 2023 09:52:31 +0000
Date:   Mon, 31 Jul 2023 17:51:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] usb: typec: nb7vpq904m: switch to
 DRM_SIMPLE_BRIDGE
Message-ID: <202307311724.2bAqJu6o-lkp@intel.com>
References: <20230731071930.3928150-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731071930.3928150-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc4 next-20230731]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230731-152746
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230731071930.3928150-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v2 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
config: xtensa-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311724.2bAqJu6o-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311724.2bAqJu6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311724.2bAqJu6o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_simple_bridge.c: In function 'drm_simple_bridge_probe':
>> drivers/gpu/drm/display/drm_simple_bridge.c:105:21: error: 'struct drm_bridge' has no member named 'of_node'
     105 |         data->bridge.of_node = data->dev->of_node;
         |                     ^


vim +105 drivers/gpu/drm/display/drm_simple_bridge.c

1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   88  
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   89  static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   90  				   const struct auxiliary_device_id *id)
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   91  {
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   92  	struct drm_simple_bridge_data *data;
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   93  
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   94  	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   95  	if (!data)
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   96  		return -ENOMEM;
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   97  
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   98  	data->dev = &auxdev->dev;
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31   99  	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  100  	if (IS_ERR(data->next_bridge))
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  101  		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  102  				     "failed to acquire drm_bridge\n");
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  103  
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  104  	data->bridge.funcs = &drm_simple_bridge_funcs;
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31 @105  	data->bridge.of_node = data->dev->of_node;
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  106  
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  107  	return devm_drm_bridge_add(data->dev, &data->bridge);
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  108  }
1b4ddd588d7e97 Dmitry Baryshkov 2023-07-31  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
