Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F506765EF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 00:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjG0WJK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 18:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjG0WJJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 18:09:09 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEAB2727
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 15:09:08 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-c4cb4919bb9so1412984276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 15:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690495747; x=1691100547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h0wVom04GMDKcuNzd42eSW5osukOzn074rAOX4nx/mE=;
        b=EbmuNAaDXyGwbqCD/muQimOyfxSBpvYN2K/FI3F/GVaLDlGWZ/WWenFJOc49qWfLXc
         lX91OHbiBodLskrvE2qqx1NxiZRh9RWmJrRtWp00NgMiaHSkSS2NBg9b3NMnWsRAJv6v
         URClsMUaG4yp/jB18PvhV6cQ/lPe5IpPlAFSnCjx94dTqbYXjHH2hvUwudMiJx5LR3F+
         XiGJpRXmOn4+wbFdJJlCoKJX+k2HeUIg21EzInhCCYkLQQc5r9tN9IGmXUYq50DYjMiM
         6Zbmmg/HIgNcci3XV0lGjvcVFbWaTDw1fuZJLJpjOwhAVbkOfg5Ksp+kOzJITxz1HATM
         2I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690495747; x=1691100547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0wVom04GMDKcuNzd42eSW5osukOzn074rAOX4nx/mE=;
        b=YNCqFbF1lvtv+y1nXGcU3T0bxRrJV0yfW6Tny5krwfXAxd/sUBJgCE80A7RuAJiT48
         ZpcAWMmWPsn8MuMt+NmrG6iv/ojE4/oxf2dI2WpIblDoqXp50gJqCtlUZj7epWUw1CXB
         8giKl2jLHhmRXmO5aUGn1R4oDcslbZtiqVL8OLRuIcEvhqbHo1sCc/nXFoPYn0NflVXN
         nkfg/v29D1sE5wy62aYRF/fcmEtOTedbrfqJRlYK9noaM7TjaffbS68SHQZo/YJcNIQG
         RzNvbOn7CHQB6nAe7jITGZJGFlyFoaCj4jKtwfWk9frLs2e4lRFg+/qv+0lXq2IXsA+J
         R3lg==
X-Gm-Message-State: ABy/qLamCDHFTlwg5u0anBL+ASmpxaQ/dXD0eVkYWmlXNchYEl5njdzi
        Eu7OPtMUku167GwjFnnGbrZIHf37ALqzX/759nj+Cg==
X-Google-Smtp-Source: APBJJlFAi5tghS8JIzpHOdP9kRkZXKZ+m78Uiw0vg8yIxL/6rMQxbJPtoScEb5cP0QoPnCFHOhj9pdrGaDCxg6YHpK0=
X-Received: by 2002:a25:ad9c:0:b0:d12:1094:2036 with SMTP id
 z28-20020a25ad9c000000b00d1210942036mr650769ybi.43.1690495747368; Thu, 27 Jul
 2023 15:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com> <20230727212208.102501-6-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-6-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Jul 2023 01:08:56 +0300
Message-ID: <CAA8EJprc-6i7LWMk+ptXfRRfiv4_WoGc=cwWwuFdS5d+ZAnH-A@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] drm/msm/adreno: Use quirk to identify
 cached-coherent support
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
