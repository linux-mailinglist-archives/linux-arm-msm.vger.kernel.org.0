Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACEE3D7D37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhG0SNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhG0SNm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:13:42 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32478C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:13:41 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso14364708ota.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
        b=nKrFC4siEB5TMlf0Ki68ELxlcROLoP+EW8hSS9g1RRRSwJ8DskybY3HuBugBkwUgRk
         YuzHq7j3MrquDzlTixYwmfIdwrBY8dp20RExmfsKuFSCLvx2OJtCCS1CGh0fsxvL3EY6
         VnGlZXTO0PO0yEalK8LNcbCms/i7021GjZMj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
        b=k3ZMVjXIuP+hHZJjJ6C4NnxStkal1S10KDHfKRQHE5+T94WbbpTDcoaVvAsOAEtywq
         Cdo8dxWnbODloyhtFbKSRkZ2cdDMSDVJocCb9BJl6ICRTcXBRnz27mbxfWIq61m8TZ31
         mff+WNOsvgNsHaalUvkP3ArKPeG2wjlvKX8q9aSyK5e3vRwbCvMWVgGfzVjwyWCuRWAY
         +oAoTiAqUNiecAF+JMJgR0zYPhcqyCYwjTss7aLw6144hFygv7iAa5LScDad1ow/Py+c
         NPxFMEB/wXd7Xmx/EV8HX+O6KWfVp0AbhPDZ0PUJyK0hdPJDKye+VYumvW6SY7JzN3bR
         rcXw==
X-Gm-Message-State: AOAM531GoHblu/VbV//E/ojd8YZSDmXJwmL5yasQ9q5UWEGDDFMYqe8y
        cEClkx/9weXlvvB9yJr0fYCvLXcIb38JCIQB8u1tEw==
X-Google-Smtp-Source: ABdhPJy8UQyIpcBk4ZgmdXAlqDPodoBsHwvzpjrdu+G7df2CikTzmvsUFtRH5Qv9r+9c0uahcJGB/Z2SNB2pM8LZqfc=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr16069312otl.34.1627409620250;
 Tue, 27 Jul 2021 11:13:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jul 2021 14:13:39 -0400
MIME-Version: 1.0
In-Reply-To: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
References: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 27 Jul 2021 14:13:39 -0400
Message-ID: <CAE-0n50FtzCHyZay3__8Y+Cj6kZaTtx_wdRom1jDwx1E01xRgw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-26 17:38:18)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v2:
>  - Got rid of redundant log messages.
>  - Added %#x instead of 0x%x wherever required.
>  - Got rid of __func__ calls in debug messages.
>  - Added newline wherever missing.
>
> Changes in v3:
>  - Got rid of redundant log messages.
>  - Unstuck colon from printf specifier in various places.
>
> Changes in v4:
>  - Changed goto statement and used if else-if
>
> Changes in v5:
>  - Changed if else if statement,
>    to not overwrite the ret variable multiple times.
> Changes in v6:
>  - Changed a wrong log message.
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

It may also be good to add some logging into the dp_pm_resume() and
dp_pm_suspend() functions so that we can figure out what's going on with
all these problems due to disconnecting the cable during suspend.
