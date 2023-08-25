Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26F1789189
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 00:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjHYWPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 18:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjHYWPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 18:15:32 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E039E2702
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:15:27 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b974031aeaso21451541fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693001726; x=1693606526;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oqL3CaI52R4xwwACyvqkfUn3lyVF+eURVewn5XEQWs=;
        b=EfzFzZAn/a8rKKyeZQTU8Gzpt/Zepp9lOBzn5ImT2VFozn3W9o21PB1iwKvXL8jQuV
         rLUHqq9RobaJuFy5nuBTwIlDNY6Sq/SeDyc7z5eU1AdqbJB61hsX5GylLWHqLpbyKDG1
         Lh7YFCC3SFX2fcZcEt+nuLS7T/99ZD7ybm/IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001726; x=1693606526;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oqL3CaI52R4xwwACyvqkfUn3lyVF+eURVewn5XEQWs=;
        b=LwBz6KGRfV1J0NvqoCIazO6IqjX+eutp4i6mX/Zu4xu7HIk+tBg7j1LAFgep8W5Whq
         lPaKQcavuyaYGQptVnFnaQ6F1em3K4OVjkL72J5aBOYZkiogyTGQYXImVe3t/u+Xd8oh
         +4vhPiC7sTCl+yfMVy/9JMwP/iDw1myMjOSZzCCSTU0s6Fkc5xGUWYMDLih2Ksqmt0Lv
         LfOuyxA3hFj+Qdeuf56q7llYqFLGAlDF6WRSkP8xrCrKv4L3w4XOo7J+SKciyP8QZOVf
         wD1s9VBHo8cswUbNOfqCzlQgfltBWI+SrTim8VvEqMsIyJoGI1tpRkt7+h6vE+G+RiYS
         vv8g==
X-Gm-Message-State: AOJu0YwI20iVCt1J4M/VRxdlu2ohfVJGLUCsz6StE11GaRaEoly8PWDe
        SKIPiL2TMiCYHXosW2oHgjg3rwyMcdVuzixMMsq8tQ==
X-Google-Smtp-Source: AGHT+IFbWLLnN9fk5RSN+FQtgJAAnKq83w5gE4BkHbudmXPtFvVL1JNBDUODmjB8soko9tV8gAZ6IX/A5gGSsCSlfLI=
X-Received: by 2002:a05:6512:200d:b0:4ff:86c7:f17e with SMTP id
 a13-20020a056512200d00b004ff86c7f17emr12242200lfb.50.1693001726185; Fri, 25
 Aug 2023 15:15:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 17:15:25 -0500
MIME-Version: 1.0
In-Reply-To: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
References: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Aug 2023 17:15:25 -0500
Message-ID: <CAE-0n53K538miRUbiW2OKwSeZ9juEPAcw42NDcD+T6M58hjnAA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: do not reinitialize phy unless retry
 during link training
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        marijn.suijten@somainline.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2023-08-08 15:19:50)
> DP PHY re-initialization done using dp_ctrl_reinitialize_mainlink() will
> cause PLL unlocked initially and then PLL gets locked at the end of
> initialization. PLL_UNLOCKED interrupt will fire during this time if the
> interrupt mask is enabled.
> However currently DP driver link training implementation incorrectly
> re-initializes PHY unconditionally during link training as the PHY was
> already configured in dp_ctrl_enable_mainlink_clocks().
>
> Fix this by re-initializing the PHY only if the previous link training
> failed.
>
> [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/30
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
