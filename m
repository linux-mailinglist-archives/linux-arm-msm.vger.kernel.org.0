Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F607524093
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 01:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348898AbiEKXNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 19:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiEKXNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 19:13:32 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0171683E7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 16:13:31 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ba17so4268392edb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
        b=gygLmm76slBdVa2keLfFJYY7zR9gVLTrQN7Qeoxr8clFf1VZSLKxHawplwV3c1cvML
         3F2nc0icCJFSso3TejBkbD4mveFcMg9/XBRM8VeOaUhHfU6oraKEtgeiiRmY9Y3d2Ofe
         0e16IW4wgnUJtqxOljWBH6MhiRPRrpKM9eB3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JgHIHZYfktFFhDix9ARk1W3agCJ5RlUjVdUHKQCQqAE=;
        b=nR92SRWDFNho7e1k1kmqU1R1V1j0gGpQcVKmQJOfZbFWh5hLlc8Iv3j7pwRmpCn3Z4
         Iq3pg1AW9Kuxa60GrmtEE1CS0N2cHeHO+8Wew3Dc5V25iFG4Cqma8mMW/aH8w0HjD9wu
         PG+8Db8J14FJUcLHcoasVFvBCQdCsaCi9rQL5fhno5vQ1NbAUrmYknHRfyJurVWk28px
         Y6HHrt5JUs7KikQ1PRI160KqqJnkWqI4zorUFpflv8L2KabeDAL/sXZ5TDYgiqXYshio
         gmqW8P/ggRtdDFjKAuFR0nfR6O+o8RAyTxfdSu3AHoM9k/hXUHG3KukQ4D4ioGxtd7Nz
         1N2g==
X-Gm-Message-State: AOAM5337Q+6wwO5NeEhQIS7Md7RHM5xfJomjUZwJDLBAdKf3065byhEJ
        JJX7E3SaNGhRIIfn8cDXh6rH8Yf8hretZwbM
X-Google-Smtp-Source: ABdhPJz3Tdz8jW9UCxSQVgzu8v1LuFqbBxeKLwURAfQ+jG2rfgQNfr9q2XM97qOOST8NDEBT/uH9qw==
X-Received: by 2002:aa7:de0c:0:b0:425:d510:8f40 with SMTP id h12-20020aa7de0c000000b00425d5108f40mr31865872edv.4.1652310809640;
        Wed, 11 May 2022 16:13:29 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id ky8-20020a170907778800b006f3ef214e5dsm1408640ejc.195.2022.05.11.16.13.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 16:13:28 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id r188-20020a1c44c5000000b003946c466c17so1474116wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 16:13:28 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr7173683wmk.118.1652310807772; Wed, 11
 May 2022 16:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
In-Reply-To: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 May 2022 16:13:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
Message-ID: <CAD=FV=XA6GKjdvc1YNh7v0SHSMCzgBtx453AKPjxbWWkTW5N1Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "FROMGIT: drm/msm/dsi: move DSI host powerup to
 modeset time"
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Matt Turner <msturner@google.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 11, 2022 at 4:07 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This reverts commit c7e4a2a72e696aa6aed2c8b651279f491bb096fe.
>
> The patch causes sc7180 Chromebooks that use the parade-ps8640 bridge
> chip to fail to turn the display back on after it turns off.
>
> Let's revert to get these devices back to a working state. It seems
> like the DSI powerup problem is somewhat common and probably we should
> land something more general like Dave Stevenson's series [1] that
> would give more flexibility.
>
> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
>
> Fixes: c7e4a2a72e69 ("FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 ++++++++-------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)

Well, that's embarrassing. I clearly reverted the wrong copy of this
patch. Sorry. v2 coming right up.
