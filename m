Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4903CA9F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 21:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243220AbhGOTLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 15:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244142AbhGOTKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 15:10:41 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB9DC028BA0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jul 2021 12:00:19 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso7229252oty.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jul 2021 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9GEmaDpQMUFvZjd/2LqfDua2IjDBMZfqrvLpdIshpRE=;
        b=LIW3L+U+KAOFBPJFqfMwPRPpFQZwpGABowsd08a+L3VQ0P/P4WR9//YMhNJlEeQM9T
         m44000IsOL4B5VY7j8OHXsGyN8DgUJAxRhDHN7Gln3Q8HXVtdGz2/HXA8BJUMRgnaOjC
         qycJ2q3183q2w9awG3PEfoxkz+hm5Xei9zoDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9GEmaDpQMUFvZjd/2LqfDua2IjDBMZfqrvLpdIshpRE=;
        b=LKdGRJlQV9PMVOZtCTnoP9NYf+00gbolt4wTd8PFrQfleAd8vyHFJjdVtRTgYkoHaN
         Bbgoy9NBPumo4A3SfN9J5XRA/AswnwJIOifWf69L8T6ZMm9CsoJ/eLd6qWpvA6GDEl8O
         /s/rsuv+xW5SaTDdPhyfJecdPT/IWUf1wvDccrf8+qahjMopy3G5D9hPucpkgL05K6Lc
         ek1EbxGeL+P2Qzu2GVU6txRhBflkTu2R1hhQBa3E9Bk8EWNozb7aYQRrpfcDnT7wWtLQ
         f1XF0x0gg5IfgDRElnIBsfnhS9dlIvdWqDlUMkWE+/hpLZZ2TRbGIFbV927REd3TJ6CI
         7t1g==
X-Gm-Message-State: AOAM532zUoo5EVjDU1FSBRqhuXJ03lTKmfrMzxae+ght+JEZbhCVc/wY
        4Na986ohJd8mg2sWjdTOkFhzSp0tAvDV1FAiQLKLIw==
X-Google-Smtp-Source: ABdhPJxf21q1Ik3LU9OiVWzgN+Ii0qixpl5UQbE9oflle2O6F5lL6xJzhxgcmT9tg8sYDKVmYXEZLaWvr8DSlyGYBeY=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr4963674otl.233.1626375619183;
 Thu, 15 Jul 2021 12:00:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jul 2021 21:00:18 +0200
MIME-Version: 1.0
In-Reply-To: <e6375232222bc357897b62c1752c06d8@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-8-git-send-email-khsieh@codeaurora.org> <CAE-0n51U8faPjxfFcd3uuOk27urR2rCSGhg1Kat1AO6LLixYTw@mail.gmail.com>
 <e6375232222bc357897b62c1752c06d8@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 15 Jul 2021 21:00:18 +0200
Message-ID: <CAE-0n50ysxXkjWjmRhxUywPLEH4jkkDnweM969QX0bkKA2WU=A@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/msm/dp: retrain link when loss of symbol lock detected
To:     khsieh@codeaurora.org
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-07-09 10:16:52)
> On 2021-07-08 00:21, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-07-06 10:20:20)
> >> Main link symbol locked is achieved at end of link training 2. Some
> >> dongle main link symbol may become unlocked again if host did not end
> >> link training soon enough after completion of link training 2. Host
> >> have to re train main link if loss of symbol lock detected before
> >> end link training so that the coming video stream can be transmitted
> >> to sink properly.
> >>
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >
> > I guess this is a fix for the original driver, so it should be tagged
> > with Fixes appropriately.
> Actually, this is fix on patch #6 : drm/msm/dp: do not end dp link
> training until video is ready
> Should i merge patch #6 and #7 together?
> Or can you suggest what should I do?

Yes if it fixes the patch before this one it should be combined.
