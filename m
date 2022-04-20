Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358ED50810E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 08:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbiDTG0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 02:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243582AbiDTG0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 02:26:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C383A5DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 23:23:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE28AB81D2F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 06:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C7EC385A1;
        Wed, 20 Apr 2022 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650435826;
        bh=+OMMeE98fYLMWkYc9X5yU7S4E4XIWSYmxfbAd4UxU4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EjRsB66A3W4Lr7hK3n+BS3RieKC0ou8JxJvv3bS1Qzmoa9kmdKda8xNVRncb4BE9T
         GGmIE5alkr+0L/ltDdh9N4CibVLYLgT7YYe9oxHSCARgsQ699fMq1h624mWpeNkTBA
         k8OOgNzNbCzHWffxGskqVQgKqWiRi9kNmk4AZNoxRsjwI+yrCeE4C6L2M1bJpwACw/
         KKX03A7CoRjz+Tx6KTBWu3lKZWL2+nEt+OyTk3YciIhUk6/nPVSlAnmCJjJlPdUMQz
         Ua1XkvlThFuQoa6tSgnUguhBzMmKAFaXJfyx9+HY1Qto13G9zGV6fxM764mHoiZH8C
         74dwiwPJpiq9w==
Date:   Wed, 20 Apr 2022 11:53:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: fixup DSC support for the cases when there
 is no pannel attached
Message-ID: <Yl+m7vWtJIqHvCT0@matsya>
References: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-04-22, 00:37, Dmitry Baryshkov wrote:
> Unable to handle kernel paging request at virtual address fffffffffffffe2b

...

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Note: I'm going to squash this fix into the respective patch from the
> DSC series

Thanks this looks good to me:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
