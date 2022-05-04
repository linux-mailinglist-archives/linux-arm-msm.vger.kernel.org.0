Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50E651A032
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237497AbiEDNI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239632AbiEDNI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:08:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D6D3DA6C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:04:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9CFB618B6
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 13:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437A0C385A4;
        Wed,  4 May 2022 13:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651669491;
        bh=zHWcpt3bK0TDTAN2FqBM6HMQFW9CX5zg/jNylvcfIaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FsdkLXYTzrKjJsxb6Vs5S1KirEgfixOt3aUhgUTJPttgvk84wO6C8pol8JoyxCmXA
         Y4ahHI4GNvXe5SMR4RN7uJfkn1x4Fm4hD1kAw929vpPljMTXc2f9BiDe+0s6Hfjhq3
         o0rskrEMhOW5teED8d8vadEBcyEOInauvQl8Rpr1urZDA8mAmnFaA4esTxE8kkdeyl
         GtshsPlmWckS2evRqHw++8QKMJ2fUOcZaH+q+jtsH4Rw/xsjfbT9rgmkQNgihse2oi
         bxTdeVeN47eOFPhlJmoACu3Yk0PvYh6MXipHWBrm603kOb8COM/rcrd0JGcueKW18G
         ahHYo63ZDXITQ==
Date:   Wed, 4 May 2022 18:34:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] drm: move dsc data pointer from drm_panel to
 mipi_dsi_device
Message-ID: <YnJ57lXGyc8zcj0m@matsya>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-22, 18:12, Dmitry Baryshkov wrote:
> To properly support DSC the sink driver (panel) has to pass DSC pps data
> to the source (DSI host). The commit 0f40ba48de3b ("drm/msm/dsi: Pass
> DSC params to drm_panel") added a pointer to the DSC data to the struct
> drm_panel. However this is not the ideal solution.
> 
> First, this leaves DSC-supporting DSI sink bridges (like ANX7625 which
> support DSC decoding on the MIPI DSI inputs).
> 
> Second, this does not play well with the panel_bridge. Drivers depending
> solely on the bridge chains will still have to lookup panel and fetch
> data from it.
> 
> Last, but not least, the DSC data is not relevant for the wide variety
> of panels including DPI and LVDS panels.
> 
> To solve all these problems, move struct drm_dsc_config pointer from
> struct drm_panel to struct mipi_host_device. This way MIPI DSI host
> driver receives DSC data during attach callback without additional
> lookups.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

I tested this on my pixel3 and had to change how panel driver handles
this, with that it worked just fine

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
