Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9530343F299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhJ1WW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhJ1WW2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:22:28 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5A1C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:20:00 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id n63so10457040oif.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XlHbKWd6pbbGkZIStSTxFaG7vAcQNI1eMo098oPb11U=;
        b=RhaDuJkxg7XSpHf1uMr3Oikq4bAIm4AIWrTxFhp8J7btCs5Nftz/ce0uJkrqfybZrc
         bNQo6d4RbqLbn4oijl8a1LKrezIg6TCLyulzp5pwHGocfyCOsHOuL2cH3DLL4oQzk6+x
         KMcxqk/gkb95/yfIhVcLt7ii70Z/DCTgQVYUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XlHbKWd6pbbGkZIStSTxFaG7vAcQNI1eMo098oPb11U=;
        b=j9HZT6H3ynh4Mu2Cf9YrRGqfFekmQODcYEfnQbWa8Ep7ukBPaCvphgx0lHTiyM3c9s
         wIOnKcH67762SvK+W5px1pnJt6dPi5KaDXV451vkqBTWD8Xxg/Y4ZTMHeacy25QwxsnP
         vxXAlvk1YA7Qgpq8TSsGdk3UuU4YA3s5zGDXzCWF/+XAeGDXiHGOpfDADyvaDLVfefTI
         u6G1BCZc5yKpjqOjP5a1ZQ4DCo5Mr6UEdQMppoJCBZGgLZQu1ejBO9eg4MIE0CgIrWo0
         YgRRyM9HR1dnQE08HbzyMLR2VzMnhI1xZ2QbC9Kr7o6aOScOv+KcVZJxDphe4KBxDp+P
         SFGA==
X-Gm-Message-State: AOAM533gMzP2dKFvrrtk0MqvYsdyYd+qiTNMicu/79COqxS4145hzq/G
        Jvk6EgAJt50iKibeIemzLM4hKxN1v6jtFdyL+Q0R2Q==
X-Google-Smtp-Source: ABdhPJwfvxRCDnP08dCwT4fknbFntzz7glH0jJBWYvi4icewMHAZCYjPyRlLWbnJ8EuU6GfjGvnkRIw06lYY/iyvDZU=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr11059063oib.32.1635459599626;
 Thu, 28 Oct 2021 15:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:19:59 -0700
MIME-Version: 1.0
In-Reply-To: <1635429901-5734-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1635429901-5734-1-git-send-email-quic_kalyant@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:19:59 -0700
Message-ID: <CAE-0n51QgYprv+BPKWHSVgUFDhHzb0t=DRBG_g9yvXeMWyaVqg@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: set default group ID for CTL.
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        y@qualcomm.com
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kalyan Thota (2021-10-28 07:05:01)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4ade44b..57b9be1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -179,13 +179,16 @@ enum {
>
>  /**
>   * CTL sub-blocks
> - * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
> + * @DPU_CTL_SPLIT_DISPLAY,     CTL supports video mode split display
> + * @DPU_CTL_FETCH_ACTIVE,      Active CTL for fetch HW (SSPPs).
> + * @DPU_CTL_VM_CFG,            CTL supports multiple VMs.

Are those commas supposed to be colons? Also the application of the
period/full-stop is not consistent. Please pick one. I see the double
star so it looks like kernel-doc, but probably doesn't parse properly.

>   * @DPU_CTL_MAX
>   */
>  enum {
>         DPU_CTL_SPLIT_DISPLAY = 0x1,
>         DPU_CTL_ACTIVE_CFG,
>         DPU_CTL_FETCH_ACTIVE,
> +       DPU_CTL_VM_CFG,
>         DPU_CTL_MAX
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 64740ddb..455b06a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -498,6 +498,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         u32 intf_active = 0;
>         u32 mode_sel = 0;
>

Can we get a comment here about what's happening?

> +       if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))

Does it need to be atomic? Sort of doubt it, so probably __test_bit()
would work just as well.

> +               mode_sel = 0xf0000000;

How about a define for 0xf0000000? Preferably a name that matches the
register description for this bit pattern.

> +
>         if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>                 mode_sel |= BIT(17);
>
