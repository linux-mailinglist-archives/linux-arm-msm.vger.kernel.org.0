Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C8B6A6CC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 14:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjCANDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 08:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCANDJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 08:03:09 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA133443;
        Wed,  1 Mar 2023 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677675771; x=1709211771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ibb5NrT9JF/mTXZ0NZ2s+gf5x63V233hZ/bAMrJa6bY=;
  b=nIR/Pz3SupkPkcmqHjfnjHdkZQHnNwJZzUFSYshjKF+NOgknBtCUtVjQ
   u6lBTtSXbaQ5ZSnkEtV0vGsX7BIQ/AoyNOlFe/h+7iX563hhM8CCKoaQr
   fzVX6QD6G8bjXP2HQF+33JA726J4g+nFNjWHcfKAE+Rcx24lNtHYUmgh0
   4TVFWwC6GgmVHq5hjIgigw/zaVbt0QscXeOy6PoU0ZBhwsVGnI56uGiQ9
   Tt0N9CFjxKM0u6WDViE1uHLqGoZsu/RWDUcCOQ4ObF7Bcmfz6V5f9bj08
   6k/58Dd/aH39F7geM+t/1vt8NJ1rwwyumRXK+/16xROrp1fp79SJl7q2E
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396968260"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="396968260"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:02:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="920231151"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="920231151"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 05:02:47 -0800
Date:   Wed, 1 Mar 2023 14:02:45 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
        quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 7/8] accel/qaic: Add qaic driver to the build system
Message-ID: <20230301130245.GA3815307@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-8-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-8-git-send-email-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 06, 2023 at 08:41:44AM -0700, Jeffrey Hugo wrote:
> Now that we have all the components of a minimum QAIC which can boot and
> run an AIC100 device, add the infrastructure that allows the QAIC driver
> to be built.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
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
> index 8348639..56d0d01 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -25,3 +25,4 @@ menuconfig DRM_ACCEL
>  
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
> +source "drivers/accel/qaic/Kconfig"
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 07aa77a..3cb6f14 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-y	+= habanalabs/
>  obj-y	+= ivpu/
> +obj-y	+= qaic/

All should be changed to obj-$(CONFIG_DRM_ACCEL_DRIVER)
to avoid inspecting sub-directories. I'll send patch for this.
Then you can adjust accordingly for qaic.

Regards
Stanislaw

