Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0A67D22CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 13:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjJVLHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Oct 2023 07:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjJVLHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Oct 2023 07:07:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4E0DE
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697972820; x=1729508820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Ns3EHM0GGbKNIFnrn8QPMuDPeGzAj+D05NON+PgWlk=;
  b=f4/usM5DU1S8AFenn7rIEF1TXE6myIRGtkGPcTXK4kpkUsEKO4MnJyq3
   xUme358dvhlFVEEo50bgA9e1lK9F7MAgKgz0uCWpHe9anoPryNUl8Mn84
   yMPCQ8BGp4yGo+3iLisFBlOLf4IqgL0jlmp1PhC6MLTJwoinmRvOeBhsX
   bUFYs6gkr45e/8jRsiaAYpp9rd01X02sgPHHWCe5uCnbRSWvM9tqj9E+J
   vNG1dUkxMw6p4EY748zgFu4/hv5mc1E8InJN8veHV0Lu3WjjjAMxX5VCn
   xsuv/Le+nqomnoc2zSHcBpUQGSTsQ/q8G2CxBLXpvwDb4AFnMehyKMT+C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385576639"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="385576639"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="761478247"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="761478247"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:06:58 -0700
Date:   Sun, 22 Oct 2023 13:06:56 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_ajitpals@quicinc.com, quic_carlv@quicinc.com,
        quic_pkanojiy@quicinc.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] accel/qaic: Add support for periodic timesync
Message-ID: <20231022110656.GB704032@linux.intel.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
 <20231016170114.5446-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016170114.5446-2-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 16, 2023 at 11:01:13AM -0600, Jeffrey Hugo wrote:
> From: Ajit Pal Singh <quic_ajitpals@quicinc.com>
> 
> Device and Host have a time synchronization mechanism that happens once
> during boot when device is in SBL mode. After that, in mission-mode there
> is no timesync. In an experiment after continuous operation, device time
> drifted w.r.t. host by approximately 3 seconds per day. This drift leads
> to mismatch in timestamp of device and Host logs. To correct this
> implement periodic timesync in driver. This timesync is carried out via
> QAIC_TIMESYNC_PERIODIC MHI channel.
> 
> Signed-off-by: Ajit Pal Singh <quic_ajitpals@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> @@ -586,8 +587,16 @@ static int __init qaic_init(void)
>  		goto free_pci;
>  	}
>  
> +	ret = qaic_timesync_init();
> +	if (ret) {
> +		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
> +		goto free_mhi;
I would print at error level here. Or if timesync is optional do not error exit. 

> +#ifdef readq
> +static u64 read_qtimer(const volatile void __iomem *addr)
> +{
> +	return readq(addr);
> +}
> +#else
> +static u64 read_qtimer(const volatile void __iomem *addr)
> +{
> +	u64 low, high;
> +
> +	low = readl(addr);
> +	high = readl(addr + sizeof(u32));
> +	return low | (high << 32);
> +}
If that's only for compile on 32-bit PowerPC, I think would be better
to limit supported architectures on Kconfig. 

Regards
Stanislaw
