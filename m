Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B29719F06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjFAOFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbjFAOFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:05:10 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85563193
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:05:08 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-33c1fb9f2ecso3234075ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685628307; x=1688220307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dsV+9FUDgJiLxPFpFg1lrA1XSYDEZwnREIDCXU8yhI=;
        b=MSlPFu5amji7FqBs4ibKqxtMelhpRado6iMrPtCxsvQnsdF3Kb7S+2A2EuA5qGUzfr
         XfT4FMpnoae7NBdg/zCJIcZlstfnfg2oOEW+2o7Z6oIvp4DyMewplRdviB0/vk6wh5SN
         hMwoff8VokKbjaKkUq0y4d7xGYxU193CJZWO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628307; x=1688220307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dsV+9FUDgJiLxPFpFg1lrA1XSYDEZwnREIDCXU8yhI=;
        b=ZH8JzHBWG/tuO2/jZx0n/hcTzJ7XO7cUZ2qp+d5XopkfAnLdbpOokl6wdQIvl3RNxI
         hb3aEByJKPaQqXEOc6H/wEErR4olWPryAf+JQQEEOKQ0XiQTPWEkI/Gd4VWeYPOdppRM
         WYt9Qak0GJOVFUEs1f5MC1gO6xgT+UzZ9pTYTHJ3qudtQiB0qaCUqyxjnMmhlk3usM/U
         Q34FkUjR8gsvYOfl2GlCwPV/5kyqGxsI13j/6wjHQlz8zhJrl5G5pJH83P6EmOutHqxb
         4LmL8kELIjT2u/1LpriYmBll2HpOxNtLtmE2QoQsrOljJvkR0liMsRILJ3IX4Jlqthnr
         bjaw==
X-Gm-Message-State: AC+VfDx7J9TueUvBoYoXeJdQAID6LSfohajw72dcze+w5MpwAQsupdff
        s4/xO3NqzEUCR9/NDuVXvKc22CpWG0v3KO5PQY4=
X-Google-Smtp-Source: ACHHUZ7qqe5GhzfmyZjvmqupmw4kCK3gdSGq5Yzjry9IPmeKRXGH4rr0E6X/kf9L7qPOjHjgCiBmJQ==
X-Received: by 2002:a92:c0c7:0:b0:338:e5a9:e43f with SMTP id t7-20020a92c0c7000000b00338e5a9e43fmr5716078ilf.17.1685628306789;
        Thu, 01 Jun 2023 07:05:06 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id q14-20020a027b0e000000b004163438fd4esm2214304jac.92.2023.06.01.07.05.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:05:06 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b398f2ab8so144145ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:05:05 -0700 (PDT)
X-Received: by 2002:a92:cda3:0:b0:331:d42:d06e with SMTP id
 g3-20020a92cda3000000b003310d42d06emr163181ild.17.1685628305352; Thu, 01 Jun
 2023 07:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com> <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
In-Reply-To: <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Jun 2023 07:04:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
Message-ID: <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 31, 2023 at 11:11=E2=80=AFPM Amit Pundir <amit.pundir@linaro.or=
g> wrote:
>
> On Wed, 17 May 2023 at 02:54, Doug Anderson <dianders@chromium.org> wrote=
:
> >
> > Hi,
> >
> > On Tue, May 16, 2023 at 11:12=E2=80=AFAM Amit Pundir <amit.pundir@linar=
o.org> wrote:
> > >
> > > On Mon, 15 May 2023 at 20:33, Doug Anderson <dianders@chromium.org> w=
rote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, May 15, 2023 at 7:42=E2=80=AFAM Amit Pundir <amit.pundir@li=
naro.org> wrote:
> > > > >
> > > > > On Sun, 14 May 2023 at 18:11, Caleb Connolly <caleb.connolly@lina=
ro.org> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 13/05/2023 18:08, Amit Pundir wrote:
> > > > > > > On Fri, 24 Mar 2023 at 19:05, Douglas Anderson <dianders@chro=
mium.org> wrote:
> > > > > > >>
> > > > > > >> This reverts commit 58973046c1bf ("regulator: qcom-rpmh: Use
> > > > > > >> PROBE_FORCE_SYNCHRONOUS"). Further digging into the problems=
 that
> > > > > > >> prompted the us to switch to synchronous probe showed that t=
he root
> > > > > > >> cause was a missing "rootwait" in the kernel command line
> > > > > > >> arguments. Let's reinstate asynchronous probe.
> > > > > > >
> > > > > > > Hi, the asynchronous probe is broken on Dragonboard 845c (SDM=
845)
> > > > > > > running AOSP (Android Open Source Project) with v6.4-rc1
> > > > > > > https://bugs.linaro.org/show_bug.cgi?id=3D5975.
> > > > > > > Can we please go back to synchronous probe.
> > > > > > >
> > > > > > > AOSP do not make use of rootwait, IIRC, but it is added by th=
e
> > > > > > > bootloader anyway. And the device fails to boot AOSP regardle=
ss of
> > > > > > > "rootwait" bootarg being present or not.
> > > > > >
> > > > > > Could you try applying this diff to enable some log spam and le=
t me know
> > > > > > what you get? I'm keen to try and figure this one out. My mail =
client
> > > > > > might crunch this a bit so I have pasted it here too
> > > > > > https://p.calebs.dev/ab74b7@raw
> > > > >
> > > > > These prints add just enough delay for the UFS probe to succeed t=
hat I
> > > > > can't reproduce the failure anymore.
> > > >
> > > > I'd prefer doing at least a little debugging before jumping to a
> > > > revert. From looking at your dmesg [1], it looks as if the async pr=
obe
> > > > is allowing RPMH to probe at the same time as "qcom-vadc-common".
> > > > That's something that talks on the SPMI bus and is (potentially)
> > > > talking to the same PMICs that RPMH-regulator is, right? I'm by no
> > > > means an expert on how Qualcomm's PMICs work, but it seems plausibl=
e
> > > > that the "qcom-vadc-common" is somehow causing problems and screwin=
g
> > > > up RPMH. Does that seem plausible to you?
> > > >
> > > > If so, one interesting way to track it down would be to move around
> > > > delays. Put ~500ms sleep at the _end_ of vadc_probe(). Presumably t=
hat
> > > > _won't_ fix the problem. Now put a ~500ms sleep at the beginning of
> > > > vadc_probe(). Maybe that will fix the problem? If so, you can move =
the
> > > > delay around to narrow down the conflict. My wild guess would be th=
at
> > > > vadc_reset() could be throwing things for a loop?
> > > >
> > > > If the above doesn't work, maybe we could add more tracing / printo=
uts
> > > > to see what is probing at the same time as RPMH?
> > >
> > > Tried out a few changes today but none of them worked or were
> > > effective enough to debug this crash further, other than setting
> > > fw_devlink=3Dpermissive.
> > >
> > > Adding more tracing / prints (BOOTTIME_TRACING and
> > > FUNCTION_GRAPH_TRACER) didn't work and didn't help in reproducing the
> > > crash either. They added just enough delay to boot the device
> > > successfully everytime.
> > >
> > > I tried to reason with the kernel modules which gets loaded before an=
d
> > > after the qcom-rpmh-regulator (QCOM_REBOOT_MODE, QCOM_PON, IIO/VADC,
> > > SPMI_PMIC* etc) as suggested, but I run into the same crash even if I
> > > disable those driver modules. So I don't think that the other driver
> > > modules which gets loaded at around the same time as
> > > qcom-rpmh-regulator by default have any impact on this failure.
> >
> > Ugh, Heisenbugs are no fun to debug. :( It sorta sounds as if pretty
> > much anything you can do to change the timing fixes you. That does
> > make reverting the async probe of the regulator less appealing. If, as
> > you said, it's not just some other driver loading at the same time
> > that's interfering then the revert "fixes" you in the same way that a
> > "msleep" would fix you. That doesn't seem like enough of a
> > justification for the revert to me.
> >
> > It still feels to me like _something_ is happening at the same time as
> > the RPMH regulator driver is loading, though, I'm just not sure how to
> > suggest debugging it. I guess other thoughts:
> >
> > * When RPMH complains, is it always with the same regulator (lvs1), or
> > sometimes different ones? Any clue there?
>
> It is always either lvs1 or lvs2.

If you reorder the nodes in the device tree, I think it'll change the
probe order. Does that affect anything? I'm wondering if there's some
sort of delayed reaction from a previous regulator.


> > * How much can you control module loading order? If rpmh-regulator
> > module loads first, does it "fix" things? If it does, maybe you could
> > bisect to find the place where problems start cropping up. Does that
> > give any clues?
>
> Loading qcom-rpmh-regulator first does make it difficult to reproduce
> the crash. I tried a few combinations to narrow down the issue further
> and in one case, I managed to reproduce the crash (1 in 20+ reboots)
> while loading the qcom-rpmh-regulator (and the dependent cmd-db,
> qcom_rpmh) module alone
> https://bugs.linaro.org/attachment.cgi?id=3D1140.
>
> Regards,
> Amit Pundir

OK, now that's even weirder. If loading the module alone reproduces
the problem, I can't imagine why this would be different without
"async" probe. In other words, If it reproduces 5% of the time when
loading the module alone with async probe, I'd expect it to reproduce
5% of the time when loading the module alone _without_ async probe
too.

Note: make sure you're careful to collect more than one reproduction
before asserting odds. If it reproduced once in 20 reboots, it might
be 5%, it might be 20%, or it might be .01%. Ideally you could script
this and let it run for a few hours to get a good reproduction rate?

-Doug
