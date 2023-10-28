Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD997DA48B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 03:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjJ1BNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 21:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJ1BNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 21:13:43 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDE5116
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 18:13:41 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c7262d5eso20898127b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 18:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698455620; x=1699060420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
        b=qz8NMLI2SSeIlIYArowM39SMCqGFe4TgUz9HoR8hVKl8WLrZdQdJBvgSIIAuHq/j7l
         hZQ5KzttDnqbgH9mL29AWBDZ1VufT/n2899A6whtQ1eXZ0mdF7zU9OaLV/vZcAHZ9hJi
         hEAxi6h62iSSQaVRUsnemAlempaxlRO2Jm2rWd0bquE64YpoUzYykhTbnA6GoEdmGayI
         Vq6Kyv6/ltL+8NKEMC/q03OMG6dKcEUfR1tKua2FrE2ypl7woIkNxACytRGgdJ3a5L8m
         2Cibz+8jFPrjsCL2hf9nxtf/v0bjIUWDpJLJtjLMzaRPkhFlvNTBA3jbkKshS1zI8W7Q
         slcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698455620; x=1699060420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBxa2oEFblafYIXbl9L7nTpS4RG8wS20L+GJE4I0Ckc=;
        b=HC3cmFN6h47HSPHNJKG83L+XH/iRdxQk9gxE9vQObzxCQUWSXQq0ARcQ3E9WLMfrU/
         pu1Bj0BbkF/Fbi3oG0sW+y3tPAdH2c905MxcMEH4jVILMribqEa6UFVNGrLv5eOcVbnf
         yXy2zlqKjFHKMeheasHfI0QBri1l0QBjgpotnwAbdwosEutAhHbrDpFsOiChrtcuyZVj
         h6EdzKB80KkqbSSYp/XZd1hH+mNcqf9Xeaa9BzNZ+saPfBZkaNOUneGHwcL8q5dUxK13
         /IcDbIbRWlrhVKHYFx2X5iNfheoFU/ugt2LpRWWNSWRpg+CKmm70iB4nJV0LFrT6Q/bK
         wo/A==
X-Gm-Message-State: AOJu0Yxb/HYR7bM3bnEQaTlxUgYhZQoVktlJ4Ntp7f+e8ODDNhR+NjPs
        NQkSCKNSmA+YPxpIBUBbwzUSXka8u6FdZByr+VQqNziG2V5YIdJRmDs=
X-Google-Smtp-Source: AGHT+IEy0Nnb+1iIU4oI3Q8xCZLvRP2lIn7t5+74WBEv7quxXECJcmd8oYpwPOO1jVQx7DtAIz3Thav+x0gjcAzTf2g=
X-Received: by 2002:a05:690c:fc2:b0:5a7:ab2f:ec43 with SMTP id
 dg2-20020a05690c0fc200b005a7ab2fec43mr4524761ywb.25.1698455620529; Fri, 27
 Oct 2023 18:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com> <20231027165859.395638-4-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-4-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 28 Oct 2023 04:13:29 +0300
Message-ID: <CAA8EJpoNZ93LJUZ=4FSD7YGR801-M++YLjNo9_opSW=VddJ9LQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/gem: Don't queue job to sched in error cases
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We shouldn't be running the job in error cases.  This also avoids having
> to think too hard about where the objs get unpinned (and if necessary,
> the resv takes over tracking that the obj is busy).. ie. error cases it
> always happens synchronously, and normal cases it happens from scheduler
> job_run() callback.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 +++
>  1 file changed, 3 insertions(+)

-- 
With best wishes
Dmitry
