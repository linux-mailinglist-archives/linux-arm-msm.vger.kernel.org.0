Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0AFB7250D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 01:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239960AbjFFX3r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 19:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234447AbjFFX3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 19:29:46 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030CF1706
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 16:29:45 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-75d4df773b4so299339485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 16:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686094183; x=1688686183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MsMMRNLOOIcaszNuAp1qcl0j4LaOAq2DZVdH1za2FE=;
        b=J1YllwY2sL+go7atSfRAhPE9tG7iZ/NSL7z//gQsGsw/zDDXmQcvDmS/HdMh9D2yhm
         qhZ4dxtPr3QvJj91/OnsQse8Xef6hq5puAV5EnqhG6VKgQWN7hVeSdCS+un81Qe0hcj2
         o2DYth093ymixhK3kTj5rCROVjz6HPhk3eK6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686094183; x=1688686183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MsMMRNLOOIcaszNuAp1qcl0j4LaOAq2DZVdH1za2FE=;
        b=iaCYHA6taHMHRMWEEpBooKfKUKzJSoHMKfqxwvsT14CAU7USl5YjP6rpJryizvDhHE
         hqK3RqlS/MQd68TpKI5l9Eukcmb+SvmFLUBhBvDKsTGYh8h9Oa5PNMhkzNV1oeG9yPoI
         QstGigeoUVsNzWrh/sfhi3oUAiJz47DpDuHdTZFjaAbEKZNiGIRZu4oet6TXLcaVE+7i
         R1p0/+NB1dNGfjWcB1S+HNQQtqn4FcW1csgfS/MXNeYyh3tUzYb+F/IqyhYUpxUDNiaH
         3icGfOduorasceQVleldK7exWlTDqyLKifsCff4ZYdJ/zQaA4ToarDJRLmC6ATue087K
         ao8g==
X-Gm-Message-State: AC+VfDy4Xv6AqxAYfxgOwpU5Q+GKd1ILy1td8OpwoRpYEaBDqIxZ7jFO
        JkjUvkWlJd/I0r42m2jqPOWkFbTYTfkgL9JiRMY=
X-Google-Smtp-Source: ACHHUZ53PsqfEbv5gGHAsANzyoMuK0H3dxKT0N0gp7IxED3prs+9trHIy5waWJkCsGo79T6fJ+f62A==
X-Received: by 2002:ad4:5ba5:0:b0:628:2db0:ebb8 with SMTP id 5-20020ad45ba5000000b006282db0ebb8mr1140863qvq.54.1686094183462;
        Tue, 06 Jun 2023 16:29:43 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id y15-20020a0ce04f000000b006238d903f9bsm5765173qvk.42.2023.06.06.16.29.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 16:29:42 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f9a81da5d7so92761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 16:29:42 -0700 (PDT)
X-Received: by 2002:ac8:7f81:0:b0:3f7:ffc8:2f6f with SMTP id
 z1-20020ac87f81000000b003f7ffc82f6fmr93895qtj.28.1686094182143; Tue, 06 Jun
 2023 16:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
In-Reply-To: <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Jun 2023 16:29:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
Message-ID: <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 2, 2023 at 6:13=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org>=
 wrote:
>
> On Fri, 2 Jun 2023 at 18:07, Mark Brown <broonie@kernel.org> wrote:
> >
> > > > If you reorder the nodes in the device tree, I think it'll change t=
he
> > > > probe order. Does that affect anything? I'm wondering if there's so=
me
> > > > sort of delayed reaction from a previous regulator.
> >
> > > Hi, Bumping lvs1 and lvs2 regulators up to the top of the list in the
> > > DTS https://bugs.linaro.org/show_bug.cgi?id=3D5975#c4 does seem to wo=
rk.
> > > I can't reproduce the crash in 125 reboots so far, while I'm still
> > > testing with only qcom-rpmh-regulator kernel module. I'll do some mor=
e
> > > testing with full system running and send this re-ordering fix I can'=
t
> > > reproduce the crash further.
> >
> > So whatever the issue is here it's a timing/race condition - this seems
> > like a workaround which works just now but it's not getting to whatever
> > the actual issue is and that could come back.
>
> Hi, I'm happy to debug this issue further or test run any
> patches/ideas if that helps.

I guess it's a better workaround than reverting the async patch. ...at
least it has a chance of having a real effect. That being said, it's
still a bit of a hack.

Ideally you'd be able to somehow get information about RPMH's state
when things fail. Maybe this might be possible with ramdumps or maybe
with JTAG. Unfortunately, I'm not super familiar with either of them.
I assume you aren't either or you would have already tried them...

From a black box perspective, I guess the things I could think of
would be to keep poking around with things that you control. Best
ideas I have:

1. Use "bisect" style techniques to figure out how much you really
need to move the "lvs" regulators. Try moving it halfway up the list.
If that works, move it closer to the bottom. If that doesn't work,
move it closer to the top. Eventually you'd find out which regulator
it's important to be before.

2. Try adding some delays to some of the regulators with
"regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
Without a scope, it'll be tricky to figure out exactly which
regulators might need delays, but you could at least confirm if the
"overkill" approach of having all the regulators have some delay
helps... I guess you could also try putting a big delay for "ldo26".
If that works, you could try moving it up (again using a bisect style
approach) to see where the delay matters?


Currently, I guess my mental model of what might be going wrong is
that regulators are all turning on / adjusting really quickly. Maybe
they aren't switching into "high power mode" quickly enough, maybe
they are busy ramping up or down, or maybe there's simply some other
issue, but I suppose that something happening could be causing the
voltage to droop down (or be too high) and then that's making RPMH
upset. Changing the order could be helping avoid this droop, but the
more proper fix would be to actually account for it with regulator
constraints.

My mental model still doesn't really explain what async probe has to
do with anything, at least if you're loading _just_ rpmh-regulator all
on its own. Assuming you're loading rpmh-regulator all on its own then
async probe should do almost nothing. Unless I'm mistaken, async probe
won't cause all the RPMH regulators to initialize in parallel. They
still initialize synchronously in the rpmh-regulator probe routine.
Async probe would _just_ allow some other driver to run its probe at
the same time. ...but if no other drivers being loaded at the same
time then I'm perplexed about how it could make any difference.


-Doug
