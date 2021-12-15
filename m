Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443D74761BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhLOTbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhLOTbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:31:09 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B139C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:31:09 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id o4so33115104oia.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2ZodyLNR3AXODJSiSUnQA1XAEq2LWEq3gAH7UHv0FmE=;
        b=JOgQ1hKYSjobD9XN44Skgc0yrw4uB4WDyWKYpR+cfnVbcLB7xxQ1Vk0Njkm7gPnZfg
         1ZOqm6PSfkaWZ+r40masd5HF3+8zJqSCJm9gmQ5rcyfNHfwLSLwQobmlHxd16hUrnBS/
         rVk/WNHjDBB/2KVFdfBp83ZFCn+w00TFFqnu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2ZodyLNR3AXODJSiSUnQA1XAEq2LWEq3gAH7UHv0FmE=;
        b=wuulOBsfEzUbZyxbVwqYzxq7Zm7pJt+F69OXLMz/t9p6kSl13Qmv7IAM02qWXdjipB
         w/VgitzMZSuuxk3xO9ZSZqswlPEixvVgfzWnxqrdughDJkN28ny8r2tMqHDEDeULwI5h
         HEsqoy0EVpAIxrIIzEJELjPjX8OUkLKcXm/z5DynzvrPb16WrX6EsCRJ1K9N6TfBPE8o
         7Lu5RLfiJ7V1rfcRNF7/k43+umepNprj/rPQoFmgf9rYH0h5zNsMCHfGrlxj5HihdeDE
         etCzo/mk3l4yjIO9AZOf5Uqf8I5tpBp0TDCPYv+LgHHIelCVmrjAw9LYbRahc9jfpKru
         R0Qw==
X-Gm-Message-State: AOAM532ehDYr+ur6J4Bcn+2cFtHfnL61pYx5K5EYE5QGtl00PwSIo9mQ
        R81tU4KXhxNiZPz1kWqQo+KeeR4lg5VP7oF6keJ0AFKf8Ec=
X-Google-Smtp-Source: ABdhPJyXZNnE5c8O7dbxT7JNkZV6Q00UZJ68loclZIwbBnVr9byLL22dVIE/Z3sucZEOUL4pwTLMeSwvlikFYoroAuE=
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr1309975oiw.64.1639596668771;
 Wed, 15 Dec 2021 11:31:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:31:08 -0800
MIME-Version: 1.0
In-Reply-To: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 11:31:08 -0800
Message-ID: <CAE-0n51fs0q-6eStuTrxfCUbHrA=7YsiO1GR254j3_SV=V8meQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add dpu_crtc_atomic_print_state
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-15 08:09:11)
> Implement CRTC's atomic_print_state() callback, printing DPU-specific
> CRTC state (LM, CTL and DSPP ids).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 59b1bcfbe8c0..df128a680697 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -924,6 +924,20 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>         return &cstate->base;
>  }
>
> +static void dpu_crtc_atomic_print_state(struct drm_printer *p,
> +                                       const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);

const? Then we know at a glance that this isn't changing the state.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
