Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8049018224D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbgCKTaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:30:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42699 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731156AbgCKTaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:30:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id t3so1544603plz.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7jvPo26ezcO1RKTjjuzQtvWXceMFdaSOSRWJmiZNJw4=;
        b=Yv+XHTZxeivkpKYFS+alaKj25StyZXhjpaEvIM20FT59Armo/Y11KS5kf7Ukm6FRxE
         aNyrNRNgqWww+6nZUc0tPxUU5cxB1zKrxUPf5oeucmBQZLPVpkQP5ItzpynvF6HamvWd
         3IDQFCc+4AsEfxBLEkY+G0+3c2S66TckVU5wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7jvPo26ezcO1RKTjjuzQtvWXceMFdaSOSRWJmiZNJw4=;
        b=Ac4w/x4kf7LPwJu2vvsItAb9vcbaoE8XLyiROBdE4JCpjWrlZ40crmZM17M8GJ3K6d
         bfc9KeU7qS1pdTy8hgEf5diYlHVr166gBYBX33SetILFwECo3NIu5WD3+1jHRgpJn/pD
         HrD+5I2apkvG3Kq8tN4fxyCZhTrjSbVK6DOcTghQ8xRNo3GMT8UPIkJvmOEfZ5WsLale
         XIJYh0RG/ZZXrDrcPEgho6vSXyv7uBietrjcLTWT9iTElkXaVpYbjIT4EmniMM+nQmYj
         qVmKJfqF3vwcZACHhrlHM9jQb/4A+549j+KHAVNS7fgru0HCe5B+LmIvQ3lXnSsWXQ/J
         Ar1Q==
X-Gm-Message-State: ANhLgQ3Qae0df154UHPuvWhsD4VznBlzcGXjraqjY5+MA+uGs3t8J1cS
        8P/pDNS51I0r6CH+745idS354w==
X-Google-Smtp-Source: ADFU+vsl1B2jsBIA61MIvGcLVS9m5leSfAcQAJBDDh7csgRmedNFz+G7+q5Rbch9iWzDlV7BA8gUmw==
X-Received: by 2002:a17:902:d70e:: with SMTP id w14mr4256073ply.181.1583955003895;
        Wed, 11 Mar 2020 12:30:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h3sm51941969pfo.102.2020.03.11.12.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:30:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200311161726.GA144492@google.com>
References: <20200306235951.214678-1-dianders@chromium.org> <20200306155707.RFT.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid> <85758e97-8c0c-5c4e-24ad-d3e8b2b01d3c@codeaurora.org> <CAD=FV=X649r8qrNRZSezUBEuJbt0oZg6VBweAGjEhxOPp0zf2w@mail.gmail.com> <20200311161726.GA144492@google.com>
Subject: Re: [RFT PATCH 1/9] drivers: qcom: rpmh-rsc: Clean code reading/writing regs/cmds
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Date:   Wed, 11 Mar 2020 12:30:02 -0700
Message-ID: <158395500244.149997.1358582842144222001@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2020-03-11 09:17:26)
> Hi,
>=20
> On Wed, Mar 11, 2020 at 08:03:27AM -0700, Doug Anderson wrote:
> > Hi,
> >=20
> > On Wed, Mar 11, 2020 at 1:47 AM Maulik Shah <mkshah@codeaurora.org> wro=
te:
> > >
> > > Hi,
> > >
> > > On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> > > > This patch makes two changes, both of which should be no-ops:
> > > >
> > > > 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg(=
) /
> > > >    write_tcs_cmd().
> > >
> > > i agree that there are two different write function doing same thing =
except last addition (RSC_DRV_CMD_OFFSET * cmd_id)
> > >
> > > can you please rename write_tcs_cmd() to write_tcs_reg(), add above o=
peration in it, and then remove existing write_tcs_reg().
> > > this way we have only one read and one write function.
> > >
> > > so at the end we will two function as,
> > >
> > > static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int=
 cmd_id)
> > > {
> > >         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET=
 * tcs_id +
> > >                              RSC_DRV_CMD_OFFSET * cmd_id);
> > > }
> > >
> > > static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, i=
nt cmd_id,
> > >                           u32 data)
> > > {
> > >         writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET=
 * tcs_id +
> > >                        RSC_DRV_CMD_OFFSET * cmd_id);
> > > }
> >=20
> > I can if you insist and this is still better than the existing
> > (inconsistent) code.
> >=20
> > ...but I still feel that having two functions adds value here.
> >=20
> >=20
> > Anyone else who is CCed want to weigh in and tie break?
>=20
> I agree with Doug, having two functions makes the code that calls them
> clearer. It makes it evident when a command is read/written and doesn't r=
equire
> a useless extra parameter when accessing a non-command register.

Me too! In fact, I asked for this when this driver was introduced and I
was half-ignored[1]. Making sure we never have to pass 0 to one of these
functions should be a goal.

From two years ago:
>
> Is m the type of TCS (sleep, active, wake) and n is just an offset?
> Maybe you can replace m with 'tcs_type' and n with 'index' or 'i' or
> 'offset'. And then don't use this function to write the random TCS
> registers that don't have to do with the TCS command slots? I see
> various places where there are things like:
>=20
> > +               write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, m, 0, 0);
> > +       write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0, cmd_complet=
e);
> > +       write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, m, 0, cmd_enable);
>=20
> And 'n' is 0, meaning you rely on that 0 killing that last part of the
> equation (RSC_DRV_CMD_OFFSET * n). But if we had a write_tcs_reg(drv,
> reg, m, data) and a write_tcs_cmd(drv, reg, m, n, data) then it would be
> clearer.
>=20
> Even better, add a void *base to a 'struct tcs' and then pass that
> struct to the tcs_read/write APIs and then have that pull out a
> tcs->base + reg or tcs->base + reg + RSC_DRV_CMD_OFFSET * index.
>=20

[1] https://lore.kernel.org/linux-arm-msm/152364140661.51482.26149034761140=
7195@swboyd.mtv.corp.google.com/
