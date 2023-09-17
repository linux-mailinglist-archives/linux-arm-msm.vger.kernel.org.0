Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514AF7A34BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 10:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbjIQI5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Sep 2023 04:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235852AbjIQI4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Sep 2023 04:56:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F88FAC
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Sep 2023 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694941010; x=1726477010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FZmYgdLnKk9UUknM7aBnIojq8H4iqGyH5Fc7MtHhsk=;
  b=Icm4zZsGZpmBSkHDgAgJiFISoZ5j1pSNi2ylE3hrXjInQZeNwqqoJcV5
   75/GMoysdms29HYeNIu1zFgt1m9BnlTeuFsHZYXCoLN5z8/tKUlXG99FK
   6VpWPMIanE91iXCRQhbsvyz1rnIa9qCBCLsNqj1M7sYCBqEl9HyyNoOBm
   NCbEK4SuRk9funshlIwQo75LM2qnsrJ08k5QK3DrCp+2PiHrCQh9cQTVp
   K3GCQRMFEiSEPXDeYQrvGhVWmYIHROzLdbw9NKiXzpmu9X7hdD/YQHawB
   rFfZQ87tN3/tTGVzzMtRCwQbRPim/dLVMvUakj2VbEamp2cjE5ol1V1W6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="376809574"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="376809574"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="748688793"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="748688793"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:56:48 -0700
Date:   Sun, 17 Sep 2023 10:56:46 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/7] accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
Message-ID: <20230917085646.GB441281@linux.intel.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
 <20230901172247.11410-8-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901172247.11410-8-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 11:22:47AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Once a BO is attached with slicing configuration that BO can only be used
> for that particular setting. With this new feature user can detach slicing
> configuration off an already sliced BO and attach new slicing configuration
> using QAIC_ATTACH_SLICE_BO.
> 
> This will support BO recycling.
> 
> detach_slice_bo() detaches slicing configuration from a BO. This new
> helper function can also be used in release_dbc() as we are doing the
> exact same thing.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> [jhugo: add documentation for new ioctl]
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
<snip>

> +	/* Check if BO is committed to H/W for DMA */
> +	spin_lock_irqsave(&dbc->xfer_lock, flags);
> +	if (bo->queued) {
> +		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
> +		ret = -EBUSY;
> +		goto unlock_ch_srcu;
> +	}
> +	spin_unlock_irqrestore(&dbc->xfer_lock, flags);

This looks like race condition. If some other thread will take the xfer_lock
and set bo->queued (HERE just after _unlock())  we will not return -EBUSY.
Something seems to be missing here or xfer_lock is not needed to protect
bo->queued.

Regards
Stanislaw
