Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F90A5A9317
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbiIAJ2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiIAJ2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:28:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2F912D530
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:28:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4ACFDB82552
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE133C433C1;
        Thu,  1 Sep 2022 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662024496;
        bh=wynK0xNq0B3tZ8gKv1xPpPUeKbsBAfa8JCKeDEjpJfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dIdnwHePmemwHTYRcGwoYfYdci6JxyuBojsb0+cKMmqyUTOgDYE1UEBP2UggJcRAg
         HikFvinjDmmHutB9O0uQrVmPVzsVfRXnmXyFxWqaZ9fkJNma6xYvh6SSGKYajh5D3q
         o+LCpmGHnX9GJji38y512r6JXuiAi9DCBKpK0e6NLb5MlAE2iN74tadvsQ1KDa+hGj
         Dn6vfZlGldfCspto3TT9AjhlU/ePFLL5WbUZh9n8uahl8jtXVP9mX3egMZxcXKS+Z/
         jK6zzTW3TInl037dEgft45wc2upyMmULz0wLBcSTjhAbvb3IyYu9pPmZdVRKjvDdJO
         y3fAuF8t8bzYA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oTgUh-0006ct-RV; Thu, 01 Sep 2022 11:28:16 +0200
Date:   Thu, 1 Sep 2022 11:28:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Message-ID: <YxB7L9A7VHj7ioXc@hovoldconsulting.com>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
 <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
 <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6868bf1-445b-e350-5032-09595666449b@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 12:21:36PM +0300, Dmitry Baryshkov wrote:
> On 01/09/2022 12:20, Johan Hovold wrote:
> > On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> >> Johan Hovold has reported that returning a probe deferral from the
> >> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> >> properly. This (compile-tested only) series tries to fix the issue by
> >> moving devm_request_irq() to the probe callback.
> > 
> > Please try to reproduce the issue yourself before posting untested RFCs.
> > We're all short on time.
> 
> I do not have a working DP setup. Thus it's either this, or nothing.

Ok, you could have mentioned that as the above sounds a bit lazy.

I don't have time to work on this right now as I mentioned elsewhere.
Avoiding probe deferral by fiddling with the config serves as a fragile
workaround until then.

Johan
