Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1D91E6DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436658AbgE1Vhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 17:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436623AbgE1Vhv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 17:37:51 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545D1C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 14:37:51 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id t23so158690vkt.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
        b=hQE6rkU9ZVc2K3wj2lHCfZ6PCW6mEVrt6pyiaSDGWcBIMcQg9CeU1m6QiV/RMjl/FO
         QW+xgDshAs1RIO/5kskBlpD5CGQInHMf4OK055PDNSV+BHB9yk9TxBI+8Xml915AGrxN
         CRVyAjb8Q9DR9q6ppylctJsVaX7mnSK1Ql2rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6EBXP08UfA+20wnVaOt/Z0KcauZvdNBVCxlQRkCKiaE=;
        b=qYzQV4TSOsBL6boZg0GCfv0LNS/LLoB/XtTqg4is9sZlNhitPEf7FSKc2mktsq48Cw
         ujaX7O4ZXSPpQQ24YLVPHn4jLGHYpV+k7W3PzCuSIZWQ3Fs3u+pUTgTDxMYdMgp8RpYY
         ookWO42d9KFkUJ4/B8ZErPBYuZ/+x+DM4xePeovm1K8hUQ+nWNuVHAp4zXUOvGxxGMy/
         8Sz8ZlHewqrtgZXlMT+TTr4XqX4UNXwM+0V1I474DV1gmKmI9/tloOMa8mVLQq6cvU7q
         d/RImfq8Dby/Zhof+RNRq+J5/Hgr+k6+or88enNw3ORdzuQ/pdnf2Yo/NvWJ1P1QFaw0
         g3aA==
X-Gm-Message-State: AOAM530+P1YSs5pYGwknCBPgRFGh4SW0fmG+GljbHhqA1b0CeYAL1sKb
        BQ9ncNW4ZAivF8HKFywZZAGcAGsDPMg=
X-Google-Smtp-Source: ABdhPJwH1FOezp78IdVfE/Xb5s8HTdtGYPF7gl7ZcCRjxPHXZ/sQhEYu0HmbepChAP206OOxcLOvxw==
X-Received: by 2002:a1f:23d0:: with SMTP id j199mr3732489vkj.85.1590701869938;
        Thu, 28 May 2020 14:37:49 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id m135sm624016vke.51.2020.05.28.14.37.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 14:37:48 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id g34so71443uah.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 14:37:48 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr3531314uaf.22.1590701867624;
 Thu, 28 May 2020 14:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090443.12529-1-harigovi@codeaurora.org> <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
In-Reply-To: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 May 2020 14:37:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Message-ID: <CAD=FV=VLNuG7ZGN_yRe9zN3fahBKhevjkJDBTh7G4kozKvnDnQ@mail.gmail.com>
Subject: Re: [v1] drm/bridge: ensure bridge suspend happens during PM sleep
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 12, 2020 at 1:26 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The subject is not specific enough. I'd expect it to be something like:
>
> drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
>
> Quoting Harigovindan P (2020-04-22 02:04:43)
> > ti-sn65dsi86 bridge is enumerated as a runtime device.
> >
> > Adding sleep ops to force runtime_suspend when PM suspend is
> > requested on the device.
> >
> > This change needs to be taken along with the series:
> > https://patchwork.kernel.org/patch/11494309/
>
> Why? It doesn't seem like it should be required to go along with a qcom
> specific driver patch.
>
> >
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> > ---
>
> Besides the subject:
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Are you planning to re-post with the changes Stephen requested?  Maybe
CC Sam too who was nice enough to help land some of my recent changes
to this driver.

-Doug
