Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E936F32F749
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 01:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCFA27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 19:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhCFA2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 19:28:52 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F1AC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 16:28:52 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id z190so3848459qka.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 16:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+vEvRXtpwub3MnTBsG9Vue5EQuUlOiedd4Nh9FOPy4=;
        b=lwV33IQNdLvYQs2JYQ3UyaYYgJJeQ6lmKMRa1FANwYR8pZGgAnGFS6bXwWr+zC+/gv
         KknByyVP0hQU4qdSLX5tW1mFYSESDMizgYQ0PKfsx0KxILEM74qUDM7ZIowxFTINPvhf
         thGRuclkqwRuRgo+/Ur0qOz9V73bpJlEDdx+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+vEvRXtpwub3MnTBsG9Vue5EQuUlOiedd4Nh9FOPy4=;
        b=o9/il7AIuvlhkYflwZsGEnRF5idvVXUZU0bFJeeVjcxqvU8/Y4LZBgkwX/FdkWGzSq
         kQ7fuLbD3amlafn+c3c4+s4itywbJihqbHdiiEYvFRWujLnYc8ALUk9L8hBBD5ZLU546
         5cnjbzuNXX0kLIh54YlwsrGkDPvcojisrHychN1aEa5xKPjAEjxXZ9W2mosW26bxNyOq
         jEXliVWHaEG8Gzeb2rNxQkePdrHs8sayFsrnXuOLUSepnBU3y/MzbwYQWdNxIaYMCPZz
         c6vN0EeywRHma3BNBT2hk02cETYNo/LR6NxMJCue7oftepd9T6QOPXwlov7nuD2gu7UY
         o7Sg==
X-Gm-Message-State: AOAM530tN/yhfKZVfJ2jO1dxtZXkxIdEFsnsV9c33xlNPR9tttjVuXXe
        PJk9Uw3wf8XelEwFTB2Sr2szmMddS60aFQ==
X-Google-Smtp-Source: ABdhPJzOZEi+YwQi97Po2+9NtJSAUqkf5jsOfpp3zwF6sRzl+sCLSZcU6sV9xx5NgqvhGzqe+qI/sQ==
X-Received: by 2002:a37:afc7:: with SMTP id y190mr11940792qke.62.1614990531323;
        Fri, 05 Mar 2021 16:28:51 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id s133sm2995129qke.1.2021.03.05.16.28.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 16:28:50 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id u75so3763468ybi.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 16:28:50 -0800 (PST)
X-Received: by 2002:a25:4e83:: with SMTP id c125mr15856404ybb.343.1614990530048;
 Fri, 05 Mar 2021 16:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid>
 <6537aec4-7f6e-ede9-12ea-e84bab738d7b@linaro.org> <CAD=FV=XnS82=62zSyOkn++kt0BD40Qp5EmZ0SWoW25Gs7nXi8g@mail.gmail.com>
 <5c53bb42-cce6-12f8-b624-768535c5a094@linaro.org>
In-Reply-To: <5c53bb42-cce6-12f8-b624-768535c5a094@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Mar 2021 16:28:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQnc+_mNw3QYmwy2YJjGiarQpUOxkj1h4WOyHoGjU3Lg@mail.gmail.com>
Message-ID: <CAD=FV=WQnc+_mNw3QYmwy2YJjGiarQpUOxkj1h4WOyHoGjU3Lg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: core: Allow nvmem_cell_read_u16/32/64 to read
 smaller cells
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 5, 2021 at 8:07 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> > If you think it's confusing to change the behavior of the existing
> > functions, would you be opposed to me adding a new function like
> > nvmem_cell_read_le_u32_or_smaller() (or provide me a better name) that
> > would be flexible like this?
>
> This should be perfectly okay!
> may be something like:
>
> int nvmem_read_variable_cell(struct device *dev, const char *cell_id,
> void *buf, size_t sz_min, size_t sz_max);
>
> It should return number of bytes it read and fail if cell size is less
> then sz_min!

The above API isn't really what I want, though.  Specifically I want
the API to acknowledge that it's a number that is being read.  The
client just wants a number and any conversion / zero-padding /
whatever needs to be abstracted out.  The client also doesn't really
care how big the cell actually was as long as the data fits, so I
wouldn't want to return it.

OK, I've come up with a new proposal, so maybe we can continue the
conversation there.  The API for my new function actually matches
exactly with the old cpr_read_efuse() which makes me feel like it's
the right way to go...

https://lore.kernel.org/r/20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid

-Doug
