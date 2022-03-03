Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0229F4CC7E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbiCCVWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbiCCVWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:22:42 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774B313687A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:21:56 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 12so6012512oix.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=u8F7qO2DIewFITLJ93GigBGQGuhxjcSS8uNlVM/WrZs=;
        b=FUNxvrjnrB/d5xJL+6gNtstATnjL7b0e2NggjjbefEJ2uWZiCg+QS3pnOOPOMhkuAt
         u4ZbCA6xXBRekcwZnyDYzBM+OFvnC4Mcwpokhm99mZvSb1/tUVuZ/DOU5o+Uu5nz7wte
         Hwq+wW6v8LTK8i0F3URgjHOH+2T3Fh47ZKLX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=u8F7qO2DIewFITLJ93GigBGQGuhxjcSS8uNlVM/WrZs=;
        b=Fykb2YhqeRkMhpoMAAn+VtpsVqQn9lbYDtE37Oz92oQ2CSI3MjSibF2ueYBQMxppYx
         cwszue1Yr+yKqAeDJjzlDm3a1ikygwECkHQ58BraRk3cC0XPAePIVtyS/x6Dk+ikrUyc
         b8jG8ckFoUAicSx9hKCYyo43oTQ0nLM9ltuUZtjT05kbpqIwymNuQUoqGem9X6WCSBpN
         dGjZTHShyEc+lubQLndQxuShxXKpaC0nZ1fAOSTOwZPYfkXuf8Z0v5zieYDGU+xXvUHA
         vFVTUW2dDHFZE8O74+rJGHKFBzW8PHt/fSfM7+IrNX9pCvJfm2NxABHBWOOSzz3HucI7
         UhiQ==
X-Gm-Message-State: AOAM530HvjxgUzdrgbA9O2BtclQVd2U2I8o08dLRjYwwiZ9NZae6yb9l
        MXLxDi6VgjNQ9huSMMBWmf4i7KpJJdPPjiY/vI04lQ==
X-Google-Smtp-Source: ABdhPJwQh/TsFdMQ8Nq+spfvb0hS7u3P5GakHbvhwCHrbUQ5jdokEhzF89sm7Ev5fs56EJT352zNf0RJeA6y30qu2AY=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr649700oiz.32.1646342515877; Thu, 03 Mar
 2022 13:21:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:21:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-6-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org> <20220217043148.480898-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:21:55 -0800
Message-ID: <CAE-0n50CABTnqjTw_SdHOrLK3C8-YtQAeicYU844cJAMHWa4iQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm/dpu: remove struct dpu_encoder_irq
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 20:31:47)
> Remove additional indirection: specify IRQ callbacks and IRQ indices
> directly rather than through the pointer in the irq structure. For each
> IRQ we have a constant IRQ callback. This change simplifies code review
> as the reader no longer needs to remember which function is called.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
