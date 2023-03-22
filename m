Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CDF6C448F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 09:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjCVIDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 04:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjCVIDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 04:03:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715E6193D4;
        Wed, 22 Mar 2023 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679472195; x=1711008195;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QoQSBiHSuFz+gIFFZ9OZq2W/b3tXA3lJOkmYcr9k9K0=;
  b=JAFBPy2C1yZKB8VO+ra2bkmTpb3xH05dsLABeTx+BE/LbLVpFWLlqOrm
   yUH/b65w3WiX0tRGjWvlKk8HHdRHhpvlzjE+9WFQVU0i6ox78pwsJreiU
   5HoH0FKwL/Ifa6ZP1OPEha7vF93xeMEt3J+D1gWY35t4eUrhBbPPMzrZu
   1gOFkbOLNdbSLpYyYd1wx/L8f32tlusYHQKJr6aHZiDQdF+RW4aMXfi4j
   uWhCvCW4KRe+Vw0o/d5+Z6Bhgq7WkGo2e/8r+b69V4kMXOn/9M33/dmoY
   v8doYX+gx8CYJIvkEIjGzPUnEseeTSQlUgEIr2Peui2nuxd3Q4G7MQuwO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322992917"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="322992917"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="712130594"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="712130594"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.146.128]) ([10.249.146.128])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:03:11 -0700
Message-ID: <f4e01050-ecaa-75e3-92f4-e2b71702cc52@linux.intel.com>
Date:   Wed, 22 Mar 2023 09:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        stanislaw.gruszka@linux.intel.com
Cc:     dafna@fastmail.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1679325074-5494-8-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 20.03.2023 16:11, Jeffrey Hugo wrote:
> Now that we have all the components of a minimum QAIC which can boot and
> run an AIC100 device, add the infrastructure that allows the QAIC driver
> to be built.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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
> index 07aa77a..26caf43 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-y	+= habanalabs/
>  obj-y	+= ivpu/
> +obj-$(CONFIG_DRM_ACCEL_QAIC)  += qaic/

Use two tabs instead of two spaces here to align with the current version of this file on drm-misc-next.

Regards,
Jacek
