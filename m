Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8782E5B6B03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 11:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbiIMJoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 05:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiIMJox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 05:44:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F204CE0BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 02:44:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88971B80E2C
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 09:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10818C433D7;
        Tue, 13 Sep 2022 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663062289;
        bh=skvVraM7srPfIkoWZ6q9hkoJ56QIEuw02+nE/Cr6Icc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IJcLpDVPQYoTsaLIa2Bw02A71s4zAIU/2K2mPrNcwIjbrggvd8Zys1RxGdqFH7dZ6
         t+ETJjw2MBtdK2c9lb5a01S3gSmJdrqBKw1eaDu8UdRIowiwXLTfm1z6dJpszAPN1w
         tKVSP4KvPHz/atuJWecf4SCFsP8IbVI/zP5pOavv5GTgcJUYxpospxrIjDz8Xe/zP7
         zk/hMtqoQKCTIDd/HbrnM0IqXozOmGDqLyC5/sXjmnosoiYLAxtSBdX3TUuPHNzYsj
         c1yMu6eOXUNUkoJoi1bZNmrPhQPTsX+VeYAAJ9CwWTDy8YvSqaQoYr/r7FgGV4cl66
         2D18c3wQTDKPg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY2TI-0002f3-2i; Tue, 13 Sep 2022 11:44:48 +0200
Date:   Tue, 13 Sep 2022 11:44:48 +0200
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
Message-ID: <YyBREIfwOQy687zH@hovoldconsulting.com>
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

For reference, here's an analysis of the underlying problem and a series
of fixes that addresses this:

	https://lore.kernel.org/all/20220913085320.8577-1-johan+linaro@kernel.org/

Note that moving the irq request to probe also fixes the immediate
issue, but that can now be done as a follow-on cleanup (optimisation)
instead.

> Dmitry Baryshkov (3):
>   drm/msm/dp: fold disable_irq into devm_request_irq
>   drm/msm/dp: switch to using platform_get_irq()
>   drm/msm/dp: move dp_request_irq() call to dp_display_probe()
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Johan
