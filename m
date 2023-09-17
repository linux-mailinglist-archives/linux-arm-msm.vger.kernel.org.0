Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889067A34A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 10:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjIQIsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Sep 2023 04:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235089AbjIQIsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Sep 2023 04:48:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCC6185
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Sep 2023 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694940513; x=1726476513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Boe7Gc2DP0E8eOe/KIMoMoyqtMVHIVrqsWDAKZBOPE=;
  b=TJiTyt3EjpUJ9Flfu4nhH5S9sHHihpIP1k2SjEfIO2L+vP8LSpcXxkW/
   gs6cChQ71SxQk5QO7FaUW7IE4qBcd9s5Whv/2d6B87IUX7BhNxx6QajE1
   uJGIvd+CH3/7INDdsCBSK0IDeTQmBEcOz2ppv624s4drS96MnoYnB8r1N
   VSaMnQeokMQN87btIKeratIQjDkUyyF7tD83huF0Xhw2aEyRY1vn2g0ax
   nPHi7hIaRBhqtoCx+Riw9dparLvat4t4KSTSS8pnRCB0LOaJu/1M8J9+3
   k2p8jZ3Agm/6FlPmjWfOGctwvNcj8G9J/hZUBDUeDWP8AkwyyVOfmhmgI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="364528902"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="364528902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="738808548"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="738808548"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:48:31 -0700
Date:   Sun, 17 Sep 2023 10:48:29 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/7] accel/qaic: Create a function to initialize BO
Message-ID: <20230917084829.GA441281@linux.intel.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
 <20230901172247.11410-7-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901172247.11410-7-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 11:22:46AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> This makes sure that we have a single place to initialize and
> re-initialize BO.
> 
> Use this new API to cleanup release_dbc()
> 
> We will need this for next patch to detach slicing to a BO.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 6e44e00937af..2acb9dbac88b 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -635,6 +635,18 @@ static const struct drm_gem_object_funcs qaic_gem_funcs = {
>  	.vm_ops = &drm_vm_ops,
>  };
>  
> +static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
> +{
> +	if (reinit) {
> +		bo->sliced = false;
> +		reinit_completion(&bo->xfer_done);
> +	} else {
> +		init_completion(&bo->xfer_done);
> +	}
> +	complete_all(&bo->xfer_done);
Why do you need complete_all() here ? 

Regards
Stanislaw
