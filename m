Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945321A921B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 06:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393176AbgDOE6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 00:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393172AbgDOE6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 00:58:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1135C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 21:58:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id c23so968132pgj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 21:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=R5xbiSaj5Oy8Nnf2GgKJ4RfScFxtsge56lV6SHB/Y3M=;
        b=Q2sqLZJiLyjBBVROU/jscisw1EzVvQg8WBDR4qLWL72E0zJ3iX9fS/ITToP8f9KkYB
         mmFa9RKmzjdEr/SKNlOzoQkifzdpF1LcY8IeSja1ZY9giLjwloc6vR+tnAogzlc3zOi/
         PkkeVN7PzU6KiqZwmWEOwSFXm1gnqPhPpB7SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=R5xbiSaj5Oy8Nnf2GgKJ4RfScFxtsge56lV6SHB/Y3M=;
        b=gwRIr6LId2OJzFMvEXYa0N6N1aI/AcT01lBoqygeyIcglf8ZG+6azpNNYq7T25gQku
         x1rovqdrX57s8kqDtJbiMTnYy03DwiMbi6mHV/O2fd6u56qzFvidIJR1XT8Ru5ne/MYU
         WvjsgQHWWcuxLXNgULqdZUCVVm/3aw5OTfpnXvrJHfpLI3bhuX8nSM4Q0TTrpXfqQLTZ
         buBkZfa1Yff2BHEi3zaCZKPzNkAkU/sSCwyLHety1utIBzgsCwDcHdth7B9EtMb4I8FQ
         ZV6mW/fj7LBYE2fi77uSwFkJAtnM0f93G3bcaqiABpwyRJtgpoBbT6SDPfMxyXN+o6SI
         zV8w==
X-Gm-Message-State: AGi0PubACxV2J+K7L0yfTMCyon3jeBt2M2dVQtrtdl8j7UHwZDPBNj5x
        Ab5ap9heyPeyl3+VnJh4HufJgg==
X-Google-Smtp-Source: APiQypKQOOZTdpdrxorZia/8YjPs8v7toOXT6LnIG2Xi/GGtNGiEILQJhuxpvhsDjjAu08AHdVi+ng==
X-Received: by 2002:aa7:8101:: with SMTP id b1mr26659253pfi.322.1586926691162;
        Tue, 14 Apr 2020 21:58:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w66sm9174048pfw.50.2020.04.14.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 21:58:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=W9swvzfCX5H=qhqdsnCAFTCWwzibcu72JJ9VKi9cR+1Q@mail.gmail.com>
References: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid> <20200414131010.v2.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid> <158689621032.105027.15399009553185990099@swboyd.mtv.corp.google.com> <CAD=FV=W9swvzfCX5H=qhqdsnCAFTCWwzibcu72JJ9VKi9cR+1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Joe Perches <joe@perches.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 21:58:09 -0700
Message-ID: <158692668955.105027.2532988655671853557@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-04-14 13:39:15)
> Hi,
>=20
> On Tue, Apr 14, 2020 at 1:30 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2020-04-14 13:10:16)
> > > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > > index f988e9cc2c30..02fc114ffb4f 100644
> > > --- a/drivers/soc/qcom/rpmh-rsc.c
> > > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > > @@ -174,12 +175,13 @@ static void write_tcs_reg(const struct rsc_drv =
*drv, int reg, int tcs_id,
> > >  static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, i=
nt tcs_id,
> > >                                u32 data)
> > >  {
> > > +       u32 new_data;
> > > +
> > >         writel(data, tcs_reg_addr(drv, reg, tcs_id));
> > > -       for (;;) {
> > > -               if (data =3D=3D readl(tcs_reg_addr(drv, reg, tcs_id)))
> > > -                       break;
> > > -               udelay(1);
> > > -       }
> > > +       if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id),=
 new_data,
> > > +                                     new_data =3D=3D data, 1, USEC_P=
ER_SEC))
> > > +               pr_err("%s: error writing %#x to %d:%d\n", drv->name,
> >
> > Shouldn't the register be hex? That seems to be how the registers are
> > represented. But I guess tcs_id is decimal and can't be translated to be
> > meaningful enough to indicate which TCS it is like the sleep or wake
> > one.
>=20
> Good point.  Should I quickly spin a v3 just so this is all ready to
> go, or wait to see if there is any additional feedback?
>=20

That's my only complaint, so if maintainers fix it then you can have my
RB tag.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
