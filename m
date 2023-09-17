Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92CC7A34C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 10:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbjIQI7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Sep 2023 04:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjIQI6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Sep 2023 04:58:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCD1AC
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Sep 2023 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694941122; x=1726477122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZiSRUpOl31OpNQus71BPULMDreAmUWYkGF1yNo0RTo=;
  b=Iea5RsCnCMfsbXo1P+O5eQOkOg/AkMINzf+ROV6ti7MX4ubEqFvYWjG2
   XqpH9s8tl75dKtkvg8mOSGl2PHRv1/X73dmO9J3J3ugHFUBNk1bnqdFj/
   Cqx0CWeLmtH3rHdHAkDf7xOPtKblICe0reCI1QeOVUc5WraFDovqijm+Y
   c0dByPUopQtWddKhbbeuxabD+8LNQxegzO5n4v2CyiLudM5RCnfVB5RIL
   lexBXgUOzSItY3LzzX/8OVfZJ5dqC1yCNZUvyHeH0Gy1MXCSwMQWEXjB5
   PCWFQcOYnDBSIxNfbLuni6A8nKPqrsco8P7SUw/E93jysK/CqufKwOjYS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="364529541"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="364529541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815677282"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="815677282"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 01:58:40 -0700
Date:   Sun, 17 Sep 2023 10:58:38 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/7] accel/qaic: Extend uAPI to support undoing
 ATTACH_SLICE_BO
Message-ID: <20230917085838.GC441281@linux.intel.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901172247.11410-1-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 11:22:40AM -0600, Jeffrey Hugo wrote:
> A BO for a QAIC device has two states -
> 1. Allocated
> 2. Sliced
> 
> A BO can be allocated at any time, and is initialized in the allocated state.
> A BO can transition to the sliced state via ATTACH_SLICE_BO.  This prepares the
> BO for use with an active workload.  Currently a BO in the sliced state can
> only be used with a single workload, and will only transition back to the
> allocated state once the workload is deactivated.
> 
> Userspace would like the ability to trigger a BO transition from the sliced
> state to the allocated state. This would support the usecase of a userspace
> client that has two active workloads, where the output of the first workload
> becomes the input of the second workload. Currently, the client would need
> two BOs, once for each workload, and copy from one BO to the other.
> 
> To support this usecase, we create the detach slice concept which is the
> inverse operation of ATTACH_SLICE_BO.  We extend the uAPI with a new
> DETACH_SLICE_BO ioctl that allows userspace to perform this operation.
> 
> Since ATTACH_SLICE_BO and DETACH_SLICE_BO are related operations, they share
> a decent amount of code. This series starts with restructuring the common code
> for use in both ioctls before finally adding the DETACH_SLICE_BO.
> 
> Pranjal Ramajor Asha Kanojiya (7):
>   accel/qaic: Remove ->size field from struct qaic_bo
>   accel/qaic: Update BO metadata in a central location
>   accel/qaic: Declare BO 'sliced' after all the operations are complete
>   accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
>   accel/qaic: Clean up BO during flushing of transfer list
>   accel/qaic: Create a function to initialize BO
>   accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
> 
>  Documentation/accel/qaic/qaic.rst |  10 ++
>  drivers/accel/qaic/qaic.h         |   6 +-
>  drivers/accel/qaic/qaic_data.c    | 187 +++++++++++++++++++++++-------
>  drivers/accel/qaic/qaic_drv.c     |   1 +
>  include/uapi/drm/qaic_accel.h     |  24 +++-
>  5 files changed, 175 insertions(+), 53 deletions(-)


Do not see any serious issues with the set.

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> for the whole series.

