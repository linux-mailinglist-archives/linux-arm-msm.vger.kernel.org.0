Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F0E1B7C7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgDXRN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgDXRN5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:13:57 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95807C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:13:57 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id y10so10224897uao.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fxS652cqlL44u1UH5KSxRWk/OvdukEdGbh2h9p3RK4=;
        b=Ig9+whEUMwHChz8p/X08upiaW9GKdVy6o5IC9vys1ebQ/L87dAQbtvFgG8WqUVPKoC
         +TPIvpMlHiE2/tqQyDR1aXhoyIMG8byeN7QImjq4W2o7pSgUrzJV9xFVDOIWtnfrpw93
         eiJpM8tLNPAvkSF9uJtyfzcDbLvX4Jh7ZrPpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fxS652cqlL44u1UH5KSxRWk/OvdukEdGbh2h9p3RK4=;
        b=KkWl/1RaOBP3Xl5+et4OY2kO/zN+9lTCP5rmxo/rdZKhjQ7Y9pccETkYmcAIlkojfX
         rfatfTWc6yhn32++CGLvuAGoyhTH+dbjfO06968PggFrv3rG+uMNDnkru66RPfYhL+D6
         E7i26fgL/XPv0s6o0fEJMFMlJgP2ImK274s7kiLPm8MVsfhPcIzMIH07y8+byN1UL9+5
         cTeqvn23JLIuY817V8j5k64exQJjuZ3jqEP3K8qxQo2c0wduIr47kKtRZ+oL6VJDNhkR
         gmROdcjpyJ+BFD19Hud6lfWyA89tZdoWkpPfTr91WApwc9672WdNrmwToWVMiVo6KfVa
         X9nw==
X-Gm-Message-State: AGi0Pubh5mvV/Ye48tfb1Rp5NAlYrskrbYdswEii7yxzPC9hj+CmF8l8
        SFkKPb1qJNX25KZFiTmBZkNkjVy9C+o=
X-Google-Smtp-Source: APiQypItv48XOqi10FT5ktEnBynojDQIFcorpNAC3617HoHwHTgZ6vGAP4RNbhgqC/lQjdYI4aX5Aw==
X-Received: by 2002:a67:f60b:: with SMTP id k11mr8829988vso.17.1587748436321;
        Fri, 24 Apr 2020 10:13:56 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id t26sm1603799uap.12.2020.04.24.10.13.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:13:55 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id z16so10203254uae.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:13:55 -0700 (PDT)
X-Received: by 2002:a67:bc4:: with SMTP id 187mr8858641vsl.205.1587748434683;
 Fri, 24 Apr 2020 10:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-3-swboyd@chromium.org>
 <CAD=FV=U6YiD=ORDuuRsYVRJriv+jJie3=HoF7MokWbj5Wx0rew@mail.gmail.com>
In-Reply-To: <CAD=FV=U6YiD=ORDuuRsYVRJriv+jJie3=HoF7MokWbj5Wx0rew@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:13:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7KfjEpdQdkXdnGK86cEkpO_SxcDgFiXqAr8oj25P_zw@mail.gmail.com>
Message-ID: <CAD=FV=V7KfjEpdQdkXdnGK86cEkpO_SxcDgFiXqAr8oj25P_zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: qcom: rpmh-rsc: Loop over less bits in irq handler
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 24, 2020 at 10:11 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > readl returns a u32, and BITS_PER_LONG is different on 32-bit vs. 64-bit
> > architectures. Let's make the type we stash the readl into a u32 and
> > then loop over the bits set in that type instead of potentially looping
> > over more bits than we will ever need to.
> >
> > Cc: Maulik Shah <mkshah@codeaurora.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/soc/qcom/rpmh-rsc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Oh, I suppose one nit is s/less/fewer/ in the subject.  "bits" are
discrete / countable, not continuous / uncountable.

-Doug
