Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05116A98EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 14:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCCN5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 08:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjCCN5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 08:57:40 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A82B61515;
        Fri,  3 Mar 2023 05:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677851859; x=1709387859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nSpXovstq9ryCqVJkFnv7h1Lwdq9lEritgt5M4+pxzw=;
  b=GyDH7+IkJugawr9OleqJ93+pm4I65iDN4XJG+BoPIdaE0fND6FB50G7e
   R7uUgytWbpd6IU3cNSJx/T/PPAkIignoZUKHzDKlCXGkO+7R9gknfi0Me
   Yh18qlO1cquzjEpaXsp9hCyRy5VSr+EB+xHbwOJ3CD/EJ58cRIN2QLY9V
   BYC+7ElfaaPfsjsXl54pWmqrUOabMf5Psq6fWkYIp9M4ENygaQ+TgiQYt
   x2MzTHaoBtjZgdue9wb4+5UsLRjTj+ci5xUz6x9yb00ppMLwWZ2AiBYOr
   jN+H6LMiLRFnQELx7bXUW/X/ElqX1hxKAcTtmiCfI6WegR5lCnimuNlQk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397634445"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="397634445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 05:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="744247173"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="744247173"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 05:57:36 -0800
Date:   Fri, 3 Mar 2023 14:57:35 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com, jacek.lawrynowicz@linux.intel.com
Subject: Re: [PATCH v2 3/8] accel/qaic: Add MHI controller
Message-ID: <20230303135735.GG3963532@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
 <20230228115239.GH3547587@linux.intel.com>
 <0f2959e3-8d9e-b603-1317-0d348263f90c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f2959e3-8d9e-b603-1317-0d348263f90c@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 01, 2023 at 09:09:57AM -0700, Jeffrey Hugo wrote:
> On 2/28/2023 4:52 AM, Stanislaw Gruszka wrote:
> > On Mon, Feb 06, 2023 at 08:41:40AM -0700, Jeffrey Hugo wrote:
> > > +	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
> > [snip]
> > > +	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);
> > 
> > I recommend usage of devm_kzalloc(), devm_kmalloc() for those
> > to simplify error and exit paths.
> 
> When this was written, I didn't want to pass the struct device to the
> mhi_controller just for the purpose of using devm_*.  Today, I'm thinking
> that is not the end of the world, and devm has advantages. Will change.

If already available &pci_dev->dev can not be used in devm_ due to
different life times of pci_dev->dev and mhi_cntl, I don't think change
would be justifiable and kmalloc/kzalloc should stay.

Regards
Stanislaw

