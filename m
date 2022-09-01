Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A785A9301
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiIAJUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbiIAJUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:20:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2089A2FFCD
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:20:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C2795618A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB8BC4347C;
        Thu,  1 Sep 2022 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662024008;
        bh=EWqzcyYFAAZgRuUDRZ4hmWQW7ga969a7SKJ0NU4vaig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LCg8ESXJFXk6FSWXh23YIeMZMMdafEZmH5ceI5fvAJULr8fBzAEo93FBV4jL/QSLo
         zyZT7MvpuAtmdkdgR8I7Hl1a+IEmeBXTAB5SEHhxi7STHwD6PBquNfz5Y5qvhR4Ll/
         XWMFAvutHjbj5P/AupdVhgqnTnALt6bsrB/X8ZL/sqPaQRAzXB69sw2j3AdnRR+4Lf
         6ITCrgerelEltpf1g2D0xpEVVo3jXY2DLklvjEG2zY7FupceQnuYHDIr7j1QJGP6za
         ipDj4rr7/P8VihQbE+s2p4+pM8c2yAUdki4XKb1x8T1ICBnbKdJhKViphsTR//oAO9
         9alvZCVsF3svA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oTgMp-0006Zq-W7; Thu, 01 Sep 2022 11:20:08 +0200
Date:   Thu, 1 Sep 2022 11:20:07 +0200
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
Message-ID: <YxB5R/6u9/ERyUSP@hovoldconsulting.com>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.

Please try to reproduce the issue yourself before posting untested RFCs.
We're all short on time. 

Johan
