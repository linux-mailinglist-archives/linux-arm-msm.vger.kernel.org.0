Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377CC3D2CB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhGVSoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhGVSoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:44:08 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8559CC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:24:42 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so6345799otl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KuoKHa70CsW4LrT7bcKs/jVjMpHneRrtGiMYYCoaWt4=;
        b=ODDEI+V9cWtMOLMoDoSf/Eso7AyIQN1IrQyHsmjBNLMM67HXTrSmNTGcMfzlvfF04I
         Xl0GxDCskVr2bMK95Z5NurgL24fO4chAe5Vd74Qwg5YeOWpxXdiu1++dzqNL26zur3JO
         bWJsxhH6u+8e4EaELYsJDemAduUlBjkWkzrl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KuoKHa70CsW4LrT7bcKs/jVjMpHneRrtGiMYYCoaWt4=;
        b=oobM59OCFu7bBOrZlqWnzZikJ/tOG+nGEqUVMaaoBJrZ2VAgrOdytA6JuJLdnRueXM
         JXK4oSESOZxBpTrY8FbYDa6SspOkMXq6duxDv7FPCappcd/xT41BWgcjsbRXeVON2Nwu
         Cris0wYXoyclVUHEgt6gqsymyVv998fGUnfIWYMDO1eLTMolvj3pzrU2QGzgHhVINafP
         v6740Y3PA+UsZHSvGemxfx0Xjhj9fVhYBozCutS8W6T2X2UGBC/h5899aaNoqaaIJfI2
         edWv/yh9wdgGzPqrq2ZlrC6Uo+SM6O4OdXkNEEc7TaI5aBCxbc81B240CDY7aLTZDweG
         Pabw==
X-Gm-Message-State: AOAM530co1n+nq7fa5FWmA5Z7juDb/YjYeBII3RB6Ng8ET1Sw766CJwD
        efUz1np6lNrIIukj9mXjB7K7Hle5pX5FfWpxiwBmmg==
X-Google-Smtp-Source: ABdhPJxhpg6Vf9SRJDcvLibbgnzzwZMBFdPr2+2+u0dMH/k8tpteCCY8x1EBDEKXikNagWxWYufbywGdcpp1es+qvug=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr896344otl.34.1626981881398;
 Thu, 22 Jul 2021 12:24:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:24:40 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-5-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-5-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:24:40 +0000
Message-ID: <CAE-0n53v-5DynK5Y+8akMMBHSqHUD18pn+2AnBBL8uMKXHEDQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/dp: replug event is converted into an
 unplug followed by an plug events
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-13 08:54:04)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Changes in V2:
> -- add fixes statement
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..d089ada 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1146,9 +1146,6 @@ static int hpd_event_thread(void *data)
>                 case EV_IRQ_HPD_INT:
>                         dp_irq_hpd_handle(dp_priv, todo->data);
>                         break;
> -               case EV_HPD_REPLUG_INT:

Please remove the enum as well.

> -                       /* do nothing */
> -                       break;
>                 case EV_USER_NOTIFICATION:
>                         dp_display_send_hpd_notification(dp_priv,
>                                                 todo->data);
