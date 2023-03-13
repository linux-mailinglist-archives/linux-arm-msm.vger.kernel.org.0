Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFC46B78D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjCMNZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 09:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjCMNZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 09:25:49 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F064EE050;
        Mon, 13 Mar 2023 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678713947; x=1710249947;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oYZ+iST7+zAfuIyj/tzJql4s9pGYPh5106T+4mW7tT0=;
  b=ia7jzcnRrL/p9ykCeW3KbxPIGfWWyt0WpjHzf46ndFZNyEj2eOIERsAH
   DeqZGvRRstYjq30Ka+5dvtoRl+jnWsMWBjbmrmON96ybIyJIiqybNCw5Q
   2cLGaE0EMfj8KCGGAxlWILpZuz+n61c16lBw3xX6dk7QPHbaOrvADgT5s
   HwBMAQjsrzy5LINHs0ZYjrRRg4fyA6X69QrS3Jqfr9eOQAxgisq2qbS4Y
   Cgao1v5oq12AuPZ3GDiSedLKTZxnE7WBhki7IWGY3lTjMohAUCGhd4J0o
   7grPRR0GTuTPYM/Y9bCZ3oF6/4/LAAHqKylTxKwG1+zr5toUBXJkoHC6l
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="320993985"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="320993985"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 06:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802442762"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="802442762"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.136.90]) ([10.249.136.90])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 06:25:44 -0700
Message-ID: <8bb21b27-003d-ca0f-57cc-5379d9d2b799@linux.intel.com>
Date:   Mon, 13 Mar 2023 14:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
        ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-8-git-send-email-quic_jhugo@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1678138443-2760-8-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 06.03.2023 22:34, Jeffrey Hugo wrote:
> Now that we have all the components of a minimum QAIC which can boot and
> run an AIC100 device, add the infrastructure that allows the QAIC driver
> to be built.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/Kconfig       |  1 +
>  drivers/accel/Makefile      |  1 +
>  drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
>  drivers/accel/qaic/Makefile | 13 +++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 drivers/accel/qaic/Kconfig
>  create mode 100644 drivers/accel/qaic/Makefile
> 
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index c437206..64065fb 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
>  
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
> +source "drivers/accel/qaic/Kconfig"
>  
>  endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index f22fd44..ab3df93 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
> +obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> new file mode 100644
> index 0000000..a9f8662
> --- /dev/null
> +++ b/drivers/accel/qaic/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Qualcomm Cloud AI accelerators driver
> +#
> +
> +config DRM_ACCEL_QAIC
> +	tristate "Qualcomm Cloud AI accelerators"
> +	depends on DRM_ACCEL
> +	depends on PCI && HAS_IOMEM
> +	depends on MHI_BUS
> +	depends on MMU
> +	select CRC32
> +	help
> +	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
> +	  designed to accelerate Deep Learning inference workloads.
> +
> +	  The driver manages the PCIe devices and provides an IOCTL interface
> +	  for users to submit workloads to the devices.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qaic.
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> new file mode 100644
> index 0000000..d5f4952
> --- /dev/null
> +++ b/drivers/accel/qaic/Makefile
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for Qualcomm Cloud AI accelerators driver
> +#
> +
> +obj-$(CONFIG_DRM_ACCEL_QAIC)	:= qaic.o
> +
> +qaic-y := \
> +	mhi_controller.o \
> +	mhi_qaic_ctrl.o \
> +	qaic_control.o \
> +	qaic_data.o \
> +	qaic_drv.o
