Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3802B7914BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 11:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347221AbjIDJ3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 05:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjIDJ3E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 05:29:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D56CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693819740; x=1725355740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hSEf9AtIpa1+Qo/iru9dpm+rlzezvLKZKvW79Pi0lXc=;
  b=fXYG1QNNWFMuTpppbGpzOpyKnGccEMAP+8gp5D8Lb+2M/GZdhhytoasS
   nAln2Paqb/Ueya557QxxUF94Vb8VUq795P8VtOegP0NE7qyr4hNgdbEcv
   iaNKjmo/oNoLbMs4RR5uFhj3Kw706U+T6njPmvBGJa3QfXihV0wCrydjV
   1oQZ+SipNja93PCkSwqP8LX/ef7CIT+Kgp9shyksGuqwfR1FIgHaL9Xgn
   W+oaygtmbH09hjhGtrboDcBG+2pmkuXHVriAwOZ8kad8ehrtPEFAjngPS
   j/FWmRv7Enndg8lZeABZ9alCsu3xC5R65ZZdJX1oaOMZh1W8cXiifcDez
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356055681"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="356055681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="855548971"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="855548971"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:28:58 -0700
Date:   Mon, 4 Sep 2023 11:28:55 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Use devm_drm_dev_alloc() instead of
 drm_dev_alloc()
Message-ID: <20230904092855.GC184247@linux.intel.com>
References: <20230901161236.8371-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901161236.8371-1-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 10:12:36AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Since drm_dev_alloc() is deprecated it is recommended to use
> devm_drm_dev_alloc() instead. Update the driver to start using
> devm_drm_dev_alloc().
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> +	/*
> +	 * drm_dev_unregister() sets the driver data to NULL and
> +	 * drm_dev_register() does not update the driver data. During a SOC
> +	 * reset drm dev is unregistered and registered again leaving the
> +	 * driver data to NULL.
> +	 */
> +	dev_set_drvdata(to_accel_kdev(qddev), drm->accel);

Yeah, explicitly nullified in drm_minor_unregister() with ' /* safety belt */
comment. I think in long term goal would be device reset not require
unregister/register.

> +	drm_dev_get(drm);
> +	drm_dev_unregister(drm);

That looks odd. I guess there is use-after-free problem if you just do
drm_dev_unregister(). Additional drm_dev_get() does not seems to be right
solution, but I'm not 100% sure, so ... 

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw

