Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8218319CAF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389287AbgDBUTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:19:52 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46369 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389264AbgDBUTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:19:52 -0400
Received: by mail-ua1-f65.google.com with SMTP id y17so1815605uap.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWnBxNBu0tvIKCGTwWpIq7wFm6hg3vnqf4EkEdpDgPA=;
        b=MVes92VnDQd6LBjIaPZLnyNoP61o6SSwgxqnbyqCf5k/hP8S+V5GmO4tsLi4u9rJ3T
         YLQhEOa86bUYjdRNZN96cKOcM2yfS1caMIBh4aZ1bWk2jZ1N8/vkoQnXx/26WqQKlARu
         7TbxcRPh2Ez/VfAugMD5GpPWWsuC15CczRefE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWnBxNBu0tvIKCGTwWpIq7wFm6hg3vnqf4EkEdpDgPA=;
        b=WfXNchj4pzYktZHCbaOUZimwTtu3wqEGMZchSSaV9k/IDoPpBlOhcJaf5nNEjNfmHW
         /fGO9VV7D1XHeL27QjtHa8ouENmG7e/YXtFDj4fxR9TXhBUzJkWZhQZs2mXvdv9VHGCw
         iVHpzjwVvF7chnjt2rXnCI+fuQIWzhkKMOanuRg0TZ1V+xmAg1dUFeg2s/q+Hx7KqaQT
         SuZZvMNCqp8csNSTXSRT5xjLwr/F/1pgg+yE2YpvNsI8oHsmg/v2sMPIcbmELEFg5JV0
         Gw45sUbIl6OznRszxABGXTt3/s1hKECteJspMlGv+BmcH6Y1YHehcjrkS5qe3NPmMe/q
         ciwQ==
X-Gm-Message-State: AGi0PuarDQQhsYYa+dp8oCqIc+hIuYKNqobmawjpD+ZdHtgYkSRco0RM
        mYQjG1lJcyr59HHPhP2G2XwRSw/Ajns=
X-Google-Smtp-Source: APiQypLEIQjbK80Aa/07zC/TLxIM3h4Cj1hFOGJKKW/OTpJMqV/4dD/hZ59aDvpsrag60jdnGy+F3g==
X-Received: by 2002:ab0:164a:: with SMTP id l10mr4293076uae.79.1585858790240;
        Thu, 02 Apr 2020 13:19:50 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id b194sm4730vka.37.2020.04.02.13.19.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:19:49 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id f9so1838077uaq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:19:49 -0700 (PDT)
X-Received: by 2002:ab0:2389:: with SMTP id b9mr2719796uan.120.1585858789341;
 Thu, 02 Apr 2020 13:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.7.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid> <339a7a7b-af4e-d6a9-4b48-2a603ea10172@codeaurora.org>
In-Reply-To: <339a7a7b-af4e-d6a9-4b48-2a603ea10172@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:19:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VMt+jQPX8hXBJkNGafEr_+r2p1hbFkG3LHeX9JjPCvrg@mail.gmail.com>
Message-ID: <CAD=FV=VMt+jQPX8hXBJkNGafEr_+r2p1hbFkG3LHeX9JjPCvrg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 07/10] drivers: qcom: rpmh-rsc: Warning if
 tcs_write() used for non-active
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

On Wed, Apr 1, 2020 at 5:40 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> > tcs_write() is documented to only be useful for writing
> > RPMH_ACTIVE_ONLY_STATE.  Let's be loud if someone messes up.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2: None
> >
> >   drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index 93f5d1fb71ca..ba489d18c20e 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -573,6 +573,12 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> >       unsigned long flags;
> >       int ret;
> >
> > +     /*
> > +      * It only makes sense to grab a whole TCS for ourselves if we're
> > +      * triggering right away, which we only do for ACTIVE_ONLY.
> > +      */
> > +     WARN_ON(msg->state != RPMH_ACTIVE_ONLY_STATE);
> > +
>
> Unnecessary check, we will never hit this warning. Lets not add such check.

That's fine.  I can drop it, especially now that comments explain that
this is only for ACTIVE_ONLY.  Personally I like having extra
assertion failures like this that indicate a serious internal logic
error in the code, but I won't push strongly for it.


> Saying that you can modify this change to drop below check  from
> rpmh_rsc_write_ctrl_data() as that never hit.
>
>          /* Data sent to this API will not be sent immediately */
>          if (msg->state == RPMH_ACTIVE_ONLY_STATE)
>                  return -EINVAL;
>
> we always call rpmh_rsc_write_ctrl_data() for RPMH_SLEEP_STATE and
> RPMH_WAKE_ONLY_STATE.

Sure.  My preference would have been to change it to a WARN_ON() too
(because it signifies an internal error within the RPMH driver, not an
external error that a client of RPMH could trigger), but I can just
drop it entirely.


-Doug
