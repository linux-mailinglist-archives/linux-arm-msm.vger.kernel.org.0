Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8007419F8E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 17:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgDFPeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 11:34:14 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35347 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgDFPeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 11:34:14 -0400
Received: by mail-vs1-f67.google.com with SMTP id u11so99513vsg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cMvg7h/oulOhGRqUiRCctY34trH980/U/Kq5XqfKrw=;
        b=E0DvGB4hrP97mss+BsJg46f1cmsxu437DfT1QJitEIvdJiVPNsiOco+dY5/jRQAV/D
         IJNRoFnMdOoGbnrlvm3TqWUo79zzcAE49wFNBdiONcfRXyfP6ckrH/oUSV6HAiQNbJYy
         cXLsNIH66kgWP2PmQG/RhlOhDCsS1MW4gKPx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cMvg7h/oulOhGRqUiRCctY34trH980/U/Kq5XqfKrw=;
        b=kiHVvCfQk937YB84LJ24EaEDKy8Ry/sDC3ER6bP78GNoYWmOhGrPpCCl/5Sgquoyeq
         GxPU9kyaZsVJr772H9SIJwncSFMBRug+1rxZhPrxmqjrR0ZTurvSJEsRZ8GEfVoPg0gK
         sBZDM9+EsPBmnyMQKRGR+BrJe8gkN83axdqQOQWl3LIMVoFeuvGbAH5+A78aOEnQ5w/F
         T6KILKftXeqPC0eHBPj3/jE/oSGMpPe8KFxVkC48mBQDO55NM14YsYkHiXtcgGZ9EOPF
         jvAb+xjsX4j/3SFDUise04mI4ZCQF0GzKB8oyJaUS67eGTu2hG187pdat+1alF9TRPlz
         tOHQ==
X-Gm-Message-State: AGi0PuaOFN9VLe5JZZNNEWUcDAR2/VARlrzPa7Ltu6hNQ5yqxjJlUECx
        MotoR8zLxcPIEF9VGaSNjczUCp2dF/s=
X-Google-Smtp-Source: APiQypIX1F4NTgDR/Nv7Uln3Jmr5RTlofK+sDuBCVGGCR0V/NRRsIlBtO/QgyC8Rs9YlJroPzpRCyQ==
X-Received: by 2002:a67:f4d5:: with SMTP id s21mr210800vsn.8.1586187252754;
        Mon, 06 Apr 2020 08:34:12 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id z4sm3511237uam.6.2020.04.06.08.34.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 08:34:11 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id r47so65072uad.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2020 08:34:10 -0700 (PDT)
X-Received: by 2002:ab0:1d10:: with SMTP id j16mr26743uak.91.1586187250041;
 Mon, 06 Apr 2020 08:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org>
 <1585660782-23416-7-git-send-email-mkshah@codeaurora.org> <CAD=FV=UqaTR7=i=5BApvnptZXpqVJiF1AE+Q+6H9Y4QdYfjfUQ@mail.gmail.com>
 <855bb87e-6c5c-8fee-e237-f48f9d95e2ac@codeaurora.org>
In-Reply-To: <855bb87e-6c5c-8fee-e237-f48f9d95e2ac@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Apr 2020 08:33:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wi1bbc-Q2PYq3+tohYcx+hguFJ8A8FyuQCzgUYjEJOHw@mail.gmail.com>
Message-ID: <CAD=FV=Wi1bbc-Q2PYq3+tohYcx+hguFJ8A8FyuQCzgUYjEJOHw@mail.gmail.com>
Subject: Re: [PATCH v15 6/7] soc: qcom: rpmh-rsc: Clear active mode
 configuration for wake TCS
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Apr 5, 2020 at 10:08 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 4/3/2020 1:44 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Mar 31, 2020 at 6:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >> @@ -243,6 +279,14 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> >>                  }
> >>
> >>                  trace_rpmh_tx_done(drv, i, req, err);
> >> +
> >> +               /*
> >> +                * If wake tcs was re-purposed for sending active
> >> +                * votes, clear AMC trigger & enable modes and
> >> +                * disable interrupt for this TCS
> >> +                */
> >> +               if (!drv->tcs[ACTIVE_TCS].num_tcs)
> >> +                       __tcs_set_trigger(drv, i, false);
> > Still seems weird that we have to do the untrigger in the IRQ routine
> > here and also weird that we _don't_ do it in the IRQ routine for
> > non-borrowed TCSes.  I guess it's not the end of the world, though.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks Doug for the review.
>
> IRQ is only needed to be enabled for TCSes used as ACTIVE_TCS.
>
> When we have dedicated ACTIVE_TCS, we leave IRQ always enabled from
> probe (one time configuration), since the TCS won't be used for anything
> other than to send ACTIVE transaction.
>
> When we don't have dedicated ACTIVE_TCS, we enable it when borrowed TCS
> is used for ACTIVE transaction and then once its done using it, we
> disable it again to leave it in its original configuration.

Sure, I get the concept.  ...but:

* It seems like it would be ideal to not call __tcs_set_trigger() from
the IRQ handler.  It uses write_tcs_reg_sync() which has a wait loop
in it.  That's not something you normally want in an IRQ handler.

* It seems like it would be a common case for the WAKE_TCS to be
borrowed several times in-between actually using it as a WAKE_TCS.

To make both of the above things better, it seems like you could just
leave the WAKE_TCS configured for active-mode transfers and just
switch all that stuff off when you actually need it as a WAKE_TCS.  To
some extent we could conceptually re-envision this and think of this
as being the ACTIVE_TCS that is occasionally borrowed to make up for
not having a WAKE_TCS.


In any case, I think the patch you have right now is good enough and
it feels like it's overdue to land this series.  I'd suggest against
spinning at this point.  Maybe we can try to improve this in a future
patch after your series lands.

-Doug
