Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4423E6B3B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 11:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCJKCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 05:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbjCJKCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 05:02:13 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B67710A116;
        Fri, 10 Mar 2023 02:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678442531; x=1709978531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNZeg10wDYhubvlfaKeve+e3pRgrtsCyFEgY2kNdb2c=;
  b=QaejrkmAQ9P27hqw8d6h05O2c3LphI+dysDLp971T/GQ5LRYKD9/KcZ1
   yeddmH1XiVIDXqHeCGXQZBOrR8xVjv2m5dt43/Qd//OYn6WnOhWq/JLv1
   EAEfiQ52iX+3gENcQ3ha9TZ7I8/pJ4ngiBr4ijWrQqNoIfgVIVeFrm/LJ
   1VJUxIU8p2OsBOMSMrB0a1VnTjBHNciwvpqrDQ3H/POg5kDbQmYmB73bX
   YrGXnsUFHk5taV0ZR8Grf6UN9GXxSOXDCQQslH66ruC4TgKVucxWDRGFY
   6/0Dnkyy9EwAoEHcWi+x6N2ugsdwPRuT/jTCOoUvhnmSOdmcdTMJcA5Mu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335391653"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="335391653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820990796"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="820990796"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:02:06 -0800
Date:   Fri, 10 Mar 2023 11:02:05 +0100
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     dafna@fastmail.com, ogabbay@kernel.org, airlied@gmail.com,
        daniel@ffwll.ch, jacek.lawrynowicz@linux.intel.com,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com, quic_ajitpals@quicinc.com,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/8] QAIC accel driver
Message-ID: <20230310100205.GA511880@linux.intel.com>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, Mar 06, 2023 at 02:33:55PM -0700, Jeffrey Hugo wrote:
> This series introduces a driver under the accel subsystem (QAIC -
> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
> a PCIe adapter card that hosts a dedicated machine learning inference
> accelerator.

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> for the whole series.
