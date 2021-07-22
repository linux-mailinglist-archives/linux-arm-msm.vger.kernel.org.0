Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC23D3D2D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhGVTjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhGVTjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:39:35 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBFEC061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:20:09 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id o2-20020a0568200402b0290258a7ff4058so1601409oou.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kq9pPpUXWfyOB70y0U/HqDgr6rOmQo21nOBEKCcoDWo=;
        b=nk/s1qG0A/QiwX2ta+8tK85Sr6aMlB8FbNQ8SjuW96XHGaJ48vXa5yzgPwYsNbRA7T
         D/FZ7xAAw87wm4bJ29D15Sk9vOjhmYxsbv/YMrqQQsdT7brH/bLx0hUA5JSbe4ADqXQV
         nMQx1ErPAQ/glDIqsERTASMEyJMWEg0YV41z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kq9pPpUXWfyOB70y0U/HqDgr6rOmQo21nOBEKCcoDWo=;
        b=t5c3GflWed+279aNk7kL29vo8qlB1mq4inyfrtfD1VKncpAXQLAcE9VJr1W07YZB2s
         +IBLCZnR5+2OsjOuCmSfD1qKHX/eE+SqcXqxCWWhe0lLfdVoMJtEeMRAPCXuSae2ix1d
         vC+z8ZktCEwhyZ/r//AITcSyPtmGUKnh9MWINTDvM7ylRvZz9aqrpd77ljxki0wRdd40
         qHwa5zpt1HmKIitBBtG+0G4EPmgSR/ngTaMtXILmP6RhSIeCz66adb+6BcdhQIbjXXNH
         jZfvu/rUZBYKkRP1DHh3fg6h9ykuXA/+j+CUXaIPZ/8IvegaEda90KkHlWFWu8KoUrMR
         M1Dw==
X-Gm-Message-State: AOAM530TeIf5qIFzdGPGFMX/p2OEWJXMmzF2ZYbZdDlDAPD1g3e3kDPY
        NPf7EvyU2Ib9L9YEH/Ha3Ilmpf0IRBIfO6n3mw4jNg==
X-Google-Smtp-Source: ABdhPJws+s2WINOYmzqYr3vkrc2lrXmlRLDg4DQkooApeFXgDsOVANfXb7i2aeHXcsjJA4Y+mBakkGUzNHisCZtQiJs=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr762853oom.92.1626985209357;
 Thu, 22 Jul 2021 13:20:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:20:09 +0000
MIME-Version: 1.0
In-Reply-To: <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org> <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:20:08 +0000
Message-ID: <CAE-0n53H=eA-zaVNVfn=Thg=NjrJMeMSjXsA6oG8GwT-CiDXRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: add support for dsi test pattern generator
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2021-07-21 19:50:32)
> During board bringups its useful to have a DSI test pattern
> generator to isolate a DPU vs a DSI issue and focus on the relevant
> hardware block.
>
> To facilitate this, add an API which triggers the DSI controller
> test pattern. The expected output is a rectangular checkered pattern.
>
> This has been validated on a single DSI video mode panel by calling it
> right after drm_panel_enable() which is also the ideal location to use
> this as the DSI host and the panel have been initialized by then.
>
> Further validation on dual DSI and command mode panel is pending.
> If there are any fix ups needed for those, it shall be applied on top
> of this change.
>
> Changes in v2:
>  - generate the new dsi.xml.h and update the bitfield names
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
