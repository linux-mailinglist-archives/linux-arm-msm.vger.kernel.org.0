Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C39A19CAF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbgDBUT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:19:27 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39313 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgDBUT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:19:27 -0400
Received: by mail-vs1-f65.google.com with SMTP id u9so3432384vsp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X/ztm4+HWR/JB+WHs+0Jt1MI0w7+TguyN/LcxGnJK9g=;
        b=FJV4vDtGhvbjegBl5UJH+glQ384Lw3LJ8hD6s2us9nP1vbzkGnFWUPCSKjqnvPD+26
         9aJnpv17ng67MB7svZsi0Yvr95LfvaU4CbWoDRSQhmC59aVaP2w8lqdxVMBUjV/vqVM3
         IqhMFbmIENGxYapPnEW0fj7MP96NqjurZAqRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/ztm4+HWR/JB+WHs+0Jt1MI0w7+TguyN/LcxGnJK9g=;
        b=q9vJj9r3bQ6VGnofHKYSpItFFR/Do4KgAi8L2dhU57C3SJwinsVsbrX/2DHuCJ9NZJ
         Dok8b7FPFvRXpRV232Qld6HdJJ8ZcDa+sKRecmhAPYFe3z+wUhwFlxpS3qZgnQnGgXX1
         S07rLtTYwKIQ9Qf7oEhl7aCpCKewlIQBsxYkVA6XEUjXKx0WEVT5aA7NYGa0cNCY63Ig
         MWm+addoRIc3D+vlKnkz6t0ki+QgPw/ZUB5DGiRoxBDg1z21BOjNGckSfp0+O4pvGMnZ
         LPkowkTogtJBlXBX3ezaL4sIqDO8Z6jnojjtddFaFa5rQG2osbV0kY2WQu7r98P1DQKQ
         MaiQ==
X-Gm-Message-State: AGi0PuZ86o7Eoy9wXIHRoNYB9uaWdekJF6bLaxYwb88osfc5e0/mZSJc
        yKMS7VQJykhlljcL3ukx+LJQDK5IGEo=
X-Google-Smtp-Source: APiQypJcR1n2V0qs8gCoRpeMm8Ok1wxm5/QwfHQwmM3RnvC8bmC75tZDXBue+GRQIhCTkGJN1yJu6A==
X-Received: by 2002:a67:647:: with SMTP id 68mr4006561vsg.23.1585858764801;
        Thu, 02 Apr 2020 13:19:24 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id w1sm1754228vkm.45.2020.04.02.13.19.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:19:24 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id a63so3411333vsa.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:19:23 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr4187937vsr.169.1585858763476;
 Thu, 02 Apr 2020 13:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.6.Icf2213131ea652087f100129359052c83601f8b0@changeid> <7a6edff1-3916-e802-0441-25b31989619f@codeaurora.org>
In-Reply-To: <7a6edff1-3916-e802-0441-25b31989619f@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:19:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVArTaPqaWJJ9ONF5p+fg6c-ZiWUtdpqy4U96Ee-Pn9A@mail.gmail.com>
Message-ID: <CAD=FV=VVArTaPqaWJJ9ONF5p+fg6c-ZiWUtdpqy4U96Ee-Pn9A@mail.gmail.com>
Subject: Re: [RFT PATCH v2 06/10] drivers: qcom: rpmh-rsc: Comment
 tcs_is_free() + warn if state mismatch
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 1, 2020 at 4:39 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> > tcs_is_free() had two checks in it: does the software think that the
> > TCS is free and does the hardware think that the TCS is free.  Let's
> > comment this and also add a warning in the case that software and
> > hardware disagree, at least for ACTIVE_ONLY TCS.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Comment tcs_is_free() new for v2; replaces old patch 6.
> >
> >   drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++--
> >   1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 9d2669cbd994..93f5d1fb71ca 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -181,8 +181,27 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
> >    */
> >   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
> >   {
> > -     return !test_bit(tcs_id, drv->tcs_in_use) &&
> > -            read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
> > +     /* If software thinks it's in use then it's definitely in use */
> > +     if (test_bit(tcs_id, drv->tcs_in_use))
> > +             return false;
> > +
> > +     /* If hardware agrees it's free then it's definitely free */
> > +     if (read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id) != 0)
> > +             return true;
> > +
> > +     /*
> > +      * If we're here then software and hardware disagree about whether
> > +      * the TCS is free.  Software thinks it is free and hardware thinks
> > +      * it is not.
> > +      *
> > +      * Maybe this should be a warning in all cases, but it's almost
> > +      * certainly a warning for the ACTIVE_TCS where nobody else should
> > +      * be doing anything else behind our backs.  For now we'll just
> > +      * warn there and then still return that we're in use.
> > +      */
> > +     WARN(drv->tcs[tcs_id].type == ACTIVE_TCS,
> > +          "Driver thought TCS was free but HW reported busy\n");
> This warning can come for borrowed WAKE_TCS as well.
> > +     return false;
> >   }
>
> We have a patch on downstream variant to optimize this by only checking
> tcs_in_use flag (SW check) and HW check is removed.
>
>   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   {
> -       return !test_bit(tcs_id, drv->tcs_in_use) &&
> -              read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
> +       return !test_bit(tcs_id, drv->tcs_in_use);
>   }
>
> With this we are good and don't require to put above warning as well.
>
> if you want me to upload, i can post it and then you can drop this
> change from your series.
>
> Or if you want to modify it as above and keep in this series i am ok.

Probably easiest for me to replace this patch in the series with one
that removes the read from RSC_DRV_STATUS.  Then it will all be
clearer.
