Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5CC23F2CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 20:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGSfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 14:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGSfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 14:35:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB55C061756;
        Fri,  7 Aug 2020 11:35:11 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f12so2517072wru.13;
        Fri, 07 Aug 2020 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7v8tLZPCG6zEGppTbnr/mOQh18VtmETDIdiYaSnWP4=;
        b=GMJYlwU4paaFWGfBg5xc4htfZR0j3RuMsCImhjl4L0pS49fbajy9/llOEcQPxIxo18
         n8/esKaUsGlne0LZD6w7qqCfWlu03X/IHF1k96AixDQWmOr/jQbLD5UrJynNahS2DIX9
         tlj4B3h3SWY1DYgts730/6n14UBICFltHEZtiDrQjxH2A2e7kknkTnifSy7J/v3mnQx3
         nI8DtzTkgg1unTBk4BxO03qkbh5jwkaFinosFuMU5OTPjl0js8pCDowp/qlzUKcz+G0q
         +0VvuE6uhB1fIxEd99TfFEoXkarY3kYDE+DX8gZZdi/tmugVHd/V2dwX3rViqBMyHLM/
         /sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7v8tLZPCG6zEGppTbnr/mOQh18VtmETDIdiYaSnWP4=;
        b=SAgPJKFD4hGe/Xk+sto+gpfmDC3z3yffp0gez8FuKq1yHSnE4vMSkNt/8k3jmbOy6w
         yH9+95IOCr1TdvO4jzRZvRjLbnEYDjutWOB6GNIgOQgGpt3BXD6oGoFCaXrntLbMhZz+
         guIhKwS7XaNOBE3Xr2nnYFb+LhfHu0CchrCXiASQfam44+J2aro/gtupDXzMrV5csWU1
         tAU/sjnqKJHzVlqxHv03lpZ6c07icPbYdlGbEf8O8MKNpcRzORcU/Fzf8pznpJ6Gotq1
         GI15N3vF6yVzycRhQ6F/okDd1GAcqKH9ZC6o2zaYbhIE3GxWBha9F5n7bkjQZrQZKSvo
         5fDQ==
X-Gm-Message-State: AOAM531KUDLK+DysJJvCcU0VLynEZEu3OYNrpt8YXG0PU4QwAnBUj5Jl
        sndeZA5MQf0/ixnrWgNS7LRvR1+DNvmXUcgw5D10hKF7
X-Google-Smtp-Source: ABdhPJxiSl+Xf4ZOjRL9fxYlXlSSB7aIXCHCh2kclUFefC9ORTjb2cvzLFJYlbiCHFrVGJM4zmJKVF4OaMQY4g0/yVM=
X-Received: by 2002:adf:ec04:: with SMTP id x4mr12529322wrn.28.1596825310354;
 Fri, 07 Aug 2020 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Aug 2020 11:35:54 -0700
Message-ID: <CAF6AEGv3drZA64mRLxqwJ5nW597=GRV80GM6k7vLO306nytDkg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove unused downstream bus scaling apis
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 3, 2020 at 11:45 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> MSM bus scaling has moved on to use interconnect framework
> and downstream bus scaling apis are not present anymore.
> Remove them as they are nop anyways in the current code,
> no functional change.
>

thanks, nice cleanup.. I'm pulling into msm-next-staging

BR,
-R

> Sai Prakash Ranjan (2):
>   drm/msm/mdp4: Remove unused downstream bus scaling apis
>   drm/msm/mdp5: Remove unused downstream bus scaling apis
>
>  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 51 --------------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      | 13 ----
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 47 -------------
>  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 24 -------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 68 -------------------
>  5 files changed, 203 deletions(-)
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
