Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CAC6A5894
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 12:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjB1Lwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 06:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjB1Lwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 06:52:45 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4EC2C67A;
        Tue, 28 Feb 2023 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677585164; x=1709121164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ggyx2CAu7EyosRp281wE2F+gng0S6AmQ8+oXpM+KpQ4=;
  b=YeLWYsZ4z/YaWHrxYD+vojGJ9b4jEbXHPdxpc+FStpj1DjVBeXtBqut1
   Aj/C5ejVUhPCxdgw/2X3ssi8Gt6YAjKzN2dozOGtBSYUWQ1uk3PWKJE/W
   mXIchaoLl3tVuN+bZIDHQi2ccyj/hvJMFCycqa69GBTl7l1gZIs3mLCeP
   0tbAA+WFmD/P2zVSfAAlrG4q94RS/gZCK/xDYrx0cJARq2DbMg9PEgoQ+
   5dpvfE3BNTA66+GAhRQqxkkEqhgqeoSH6tNPvRvjjfldUGWBDyrNr2FGg
   W/5NZ8anMfsotzXr9N/vCLt85lWlilmXJoH7j5oJxNZTLlod38lccX8d4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336405103"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="336405103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 03:52:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="674099409"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="674099409"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 03:52:41 -0800
Date:   Tue, 28 Feb 2023 12:52:39 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
        quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
        quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/8] accel/qaic: Add MHI controller
Message-ID: <20230228115239.GH3547587@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-4-git-send-email-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 06, 2023 at 08:41:40AM -0700, Jeffrey Hugo wrote:
> +	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
[snip]
> +	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);

I recommend usage of devm_kzalloc(), devm_kmalloc() for those
to simplify error and exit paths.

Regards
Stanislaw
