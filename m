Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643873D6858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 23:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhGZUTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 16:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbhGZUTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 16:19:52 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE19C061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:00:18 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso2510587ooi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8KXP5owN8flF/sx0WAhinix7DviMfrTpDVl4MvdT/qU=;
        b=HbROtzQclhAZaw6tKB6J5+ue2Sm3504YhCrv7xxAah586ueHzw9siRliaIBchTdxIl
         17nZyrmj7S/rk1NjOqqxK/6MZyZ0mIoIzqcPClRFJuacF3X/OaG7PPH9zUHZz5t1i2FB
         WSSSGOTkuVGh1YovB3A5NAKN8kfzzbScuvxmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8KXP5owN8flF/sx0WAhinix7DviMfrTpDVl4MvdT/qU=;
        b=O3Uw5TWAWqI8T3o6CKoabafuOUiyKAZ+76oHyLXLodn1W6gla1YqGR7FzNMsW+JIz0
         AnuyxbINSo/P0gFmngrV9X15GmT2/6e4J7ZK1JrFgdCDodH3SxgY1tv/aa/MX/TeEvyS
         BQ0IeJOTHx8lR+9OSHKiZ2aYH3itdWry9rJjiTYEF5xdAfke22VxoAPRqsKVgTjymLwZ
         gEb6nm6grxMjsosD2eIstZqt4U/bFIrmvi2OW3bSepke67G1eTWfycSvoH8udp8SptsY
         tRxxhEPYrWZBqy89+QhdbpEQ9w/Hpdi/oV7GPhlHvZeuHoVRBDdgZPBTP31dqNu2GiXC
         4PuQ==
X-Gm-Message-State: AOAM531dTgxLutrc2tswJI+nK9b1Z+TuwnsJ4g9ECl6tcBwCdWCYYuaC
        uDxVxPztKtLQrg7/7bAQ0fH2s5mD3NvimS70oI5Icw==
X-Google-Smtp-Source: ABdhPJzd2FudvCDeOTS0IgcQEAWpsYFnWx0o1aDDH36H6oJiWE8V5Z+7WofQB8S8Lf86XrpE3v2FqYhsKsBUGAcIIJo=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr11661227oom.92.1627333217883;
 Mon, 26 Jul 2021 14:00:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:00:17 -0400
MIME-Version: 1.0
In-Reply-To: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 17:00:17 -0400
Message-ID: <CAE-0n53+YChS9sNVg-SB8ZKVqSMbTJfm28KPvFsZk48cC2WqWw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-26 10:36:26)
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
>
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
