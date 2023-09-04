Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC8A79147B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235537AbjIDJMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 05:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjIDJMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 05:12:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA0A18C
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693818725; x=1725354725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRXNq9EH5e0PduqdEKQkaQOgqb4pxzgS4wdXvH0K0B0=;
  b=L5y5BAHr04zld2SznGfYAAs9q6cKaAbwwrjwXXdhNlZc1uaZY1xzPzXv
   rKAmVAm+D9DdJ1Kr2VCx4ZxijHYM+IkaJF74qDseflQYc+Oo4N+SRyVFI
   YeHA8sSBZIY80LCl9q9QvVg3BnhIZ7vl+jO4flH2jmzojcVUvr6QXdUs7
   o5E3P3Ycmrvt5TNk9mXsSqnF9zHwvdqU5ZWtiOMTTqO7dqMZufHuepzR3
   d7aI94Og9b+pPUr3J73bcrZOSVe0D2zanKfzZGjdnvMm2SDEzYJi9PzJK
   A3StXXHpoHWY7j9SqWU+m3Ebyz95UUy1NMlqBmjgyw3wl03bYjHY8/Hac
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442953343"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="442953343"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690521395"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690521395"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 02:12:02 -0700
Date:   Mon, 4 Sep 2023 11:12:00 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
        ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Register for PCI driver at the beginning of
 module init
Message-ID: <20230904091200.GB184247@linux.intel.com>
References: <20230901161037.6124-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901161037.6124-1-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 01, 2023 at 10:10:37AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> As qaic drivers base device is connected to host via PCI framework, it
> makes sense to register in PCI framework at the beginning of module
> init.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
