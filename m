Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7594D3348B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 21:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCJUNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 15:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhCJUN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 15:13:26 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AAAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 12:13:03 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id p24so3773226ota.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 12:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ParB71IxhiRrfBGpAi87T+sw94LRbdpcOA901A69TgA=;
        b=l9TN+s8G4fphqlAMXmxn0VTICbyOlt5MCFF/fUR/8oug0GoivqZ4PHhuFHh5SbZtyX
         0MN1f3BqjFJ9KZB0opLj49yl27RHF3KQAG9oX8nUsh2QbgHxIcMtkPbD2ki38nki9qbI
         ehc+6w1G3/oSnkOORqaQCC+f0XmGfuToDdeHPgM6/jWUURIHuOnl5ZA82W6/1eEhMfYG
         QMJyTjJ250M+Bqq/tB03enMaqc4eGMUzHPEPFgRhDYvYhwRnAdOsGqbEMkFCYbI+Hm0X
         TGkaIZ8L8rdMsJMJXYvQJ4qTVBEblp1XRzlaaVCDVGvPtuMM19ecJWAiDkml71Z9q44k
         2CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ParB71IxhiRrfBGpAi87T+sw94LRbdpcOA901A69TgA=;
        b=gmvDvM6SH2DyOd7p617L024zzhiXxhpoECaFPzNlKT6my1XGvs7jV3TJ7+gVZV0XlN
         I5W9yo4Lj+R4DhmXKSxP6jiDUxGW7IwZHaUdNoxrTeWQbvY1HWjKvAh/L3VIw+PfWmhs
         65NPuqhp/0BYS4prBvWkvWiJGjeDEjAFau83Sn2vBKBQVw2vNGtTE6Xd20R737Alz7qu
         ca7hfjKgu8ee/GIu9819VTeS5JZG5CH/aNYmBSidCtXBtTAQbkZTsFV688G9SbMi6cHD
         Nh2SxqkfTtTRTo6jFnyACKshJL1sPw0YRT0r0c5UXsDfMXQwYGtEf7blwlxaFx5qybsH
         CxQA==
X-Gm-Message-State: AOAM532tP8asSpe25S/+7zLwBprNtrIUQLlHr+AMw6FteLMYsVAaiJfo
        MS25uUF1JO65kASYJJ+R/l8M4w==
X-Google-Smtp-Source: ABdhPJxG71p4NqMut9jm2BctnUtl0uE1+wVO4QiKMsPrTKbFBAfQ1ej1T/mHQqfW4Ul/TSOVfc/7Bg==
X-Received: by 2002:a05:6830:1da8:: with SMTP id z8mr3844420oti.11.1615407182801;
        Wed, 10 Mar 2021 12:13:02 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j19sm98919oie.6.2021.03.10.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 12:13:02 -0800 (PST)
Date:   Wed, 10 Mar 2021 14:13:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Samuel Holland <samuel@sholland.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND 0/2] Common protected-clocks implementation
Message-ID: <YEkoTEJqzpRacByw@builder.lan>
References: <20200903040015.5627-1-samuel@sholland.org>
 <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Mar 02:03 CST 2021, Rasmus Villemoes wrote:

> On 03/09/2020 06.00, Samuel Holland wrote:
> > Stephen, Maxime,
> > 
> > You previously asked me to implement the protected-clocks property in a
> > driver-independent way:
> > 
> > https://www.spinics.net/lists/arm-kernel/msg753832.html
> > 
> > I provided an implementation 6 months ago, which I am resending now:
> > 
> > https://patchwork.kernel.org/patch/11398629/
> > 
> > Do you have any comments on it?
> 
> I'm also interested [1] in getting something like this supported in a
> generic fashion - i.e., being able to mark a clock as
> protected/critical/whatnot by just adding an appropriate property in the
> clock provider's DT node, but without modifying the driver to opt-in to
> handling it.
> 
> Now, as to this implementation, the commit 48d7f160b1 which added the
> common protected-clocks binding says
> 
>   For example, on some Qualcomm firmwares reading or writing certain clk
>   registers causes the entire system to reboot,
> 
> so I'm not sure handling protected-clocks by translating it to
> CLK_CRITICAL and thus calling prepare/enable on it is the right thing to
> do - clks that behave like above are truly "hands off, kernel", so the
> current driver-specific implementation of simply not registering those
> clocks seems to be the right thing to do - or at least the clk framework
> would need to be taught to not actually call any methods on such
> protected clocks.
> 

I can confirm that this is the case. Marking the clocks as critical does
not prevent the kernel from touching these registers so the boards where
this is used doesn't boot with the two patches applied.

> For my use case, either "hands off kernel" or "make sure this clock is
> enabled" would work since the bootloader anyway enables the clock.
> 

Our use case is that depending on firmware these platform might handle
some specific clocks in firmware or in the kernel, and in the prior case
security permissions are set up such that these registers are off limit
for the kernel.

Regards,
Bjorn

> Rasmus
> 
> [1]
> https://lore.kernel.org/lkml/20210226141411.2517368-1-linux@rasmusvillemoes.dk/
> 
