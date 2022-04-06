Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8FF4F5B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 12:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243735AbiDFKU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 06:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378004AbiDFKSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 06:18:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC10223BF9
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 21:01:09 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id q189so1207001oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 21:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WGUazAz+54LKBDcmDz/G18fzJNOk0DJxlOhHCUXankQ=;
        b=hfUYXYOTYj6R1wH7vLfFU1M78Xe+pSbNhFcloVsqgMLI7XFRyw+zsprecqCimVMnGH
         +svkrY3vzWiM7LGZC8KNfRKElz2Ta1vlGMevx8Z31we8M0Ju8aO06Rjv0M6R/k5JSc96
         GcWyG+SrXJ9ikL+KNKJZ5ZUKpgammAd+qqRZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WGUazAz+54LKBDcmDz/G18fzJNOk0DJxlOhHCUXankQ=;
        b=R+oKcytJSpfNsEKtLeOJtOz3nhBK82/JW43FXhvAzUErcoMeFq+pQHDpLbevQMHAss
         yX3PkGcPy+hLMg9okN7mSYGyYQ3TWzEyufFtZBHv/SStCQ2ODWGF1RLgmlsLe5iAi0f+
         cA309FXPumRzIVyy2My4vU5tZHJYsH78UzXglHDBy+AEkzT5Kg/RKKXpNx/Datwbze/m
         E6IvUe/1M4gBN4W937w+9P6VX+N4zqyM87dvvlbop169Pmx/nIx/uFi1P0WzK61NOuwA
         K9tOfo47N5x4iOPJbfH2xmmgatCr8jMQanuKa3g6Hqeh7jl07RrcmPuqKJf6nAkgsMd2
         kEeA==
X-Gm-Message-State: AOAM533FX1LTfphigwnBXHXTvEroG4yxydbiNP9MCNpgxnkpwceDyv0g
        dz8TxsMt0VDba2/hkjVZkSp7doFlLPj0LnRm2GCQSw==
X-Google-Smtp-Source: ABdhPJxWPA9p5d7NmUiUlh/dFDZl8efg+pQvD/HgLU5K/+3BeTFisXtsgjxxnhu+VH+3biB4raAHw2pEX8Qj/I6wP9A=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2652702oie.193.1649217669012; Tue, 05
 Apr 2022 21:01:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:01:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-2-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org> <20220405235059.359738-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 21:01:08 -0700
Message-ID: <CAE-0n53X5H6NoWgzo57dbqgh=QhRt5q3=2uiQGfw2HOcGmA5kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: remove manual destruction of DRM objects
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-05 16:50:57)
> Remove manual removal of DRM modesetting objects, it is done anyway by
> the drm_mode_config_cleanup() called from msm_drm_uninit(). Other
> MSM display drivers (MDP4, MDP5) do not manually destroy objects and
> trust generic code to do it's work.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
