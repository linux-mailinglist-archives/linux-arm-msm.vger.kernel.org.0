Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6A9C3F39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 20:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfJASBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 14:01:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35925 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfJASBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 14:01:23 -0400
Received: by mail-io1-f65.google.com with SMTP id b136so50314150iof.3;
        Tue, 01 Oct 2019 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e3ZpzW2TyFiOL+UNzjwCdjiPvcI1e9f1za2Ko3AAr0s=;
        b=rEjkaQmYsYDQCb6ctDX5gQepVnjXhbo4zSgtC17Bwz2P4Q/3UWeESJs9t+DbKzJRkE
         h2icO+Bym55hSufk12IbuzwRuxR4xcF824kYTgNkdTUMu7rukY0cRYSmcS5ev/sjJKCu
         JI1zgWFNKorMTLZ/lV97yJnIzK6nOEUVzkF5vKeCHEsiOPbEodIM5IFTDcKIa7xYbP9Z
         L0NRlgr6Pnm/4sQrFdn0EUSZRxmN51s6WWAqmyfAdrz+pCxscd6ct7HHWopSfH+rfTz6
         Wj+yPETwqLPP9IqU2DERuq2e/QvlWjFsEOdq/lRm2uFEwZS8ryDRF2Qimn7qTQD8JFsg
         liRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3ZpzW2TyFiOL+UNzjwCdjiPvcI1e9f1za2Ko3AAr0s=;
        b=XB5rUR6ZmnbwPKw5kZrD9MtockLkRn42LryiPtRZinpnxAiWGRoAn3Y/1c538NTWmv
         YSTRpK4otr3qHvpNdGoS7xbDql+iVR8+C0cXoLQoolK5NgeIQkaJTUXBP/sMZwxJ1k0O
         kmk3wK9WezdqXIfTGlZg86t9VLTVBoD9DzgLVzSvHieFc3p3F3JJcz2BFeuyJRzq41r5
         ClTz+C7oRTzJQ4tOgCX57gIvEr7bsloZuwQmg3++1QdDppN2+tawJU2DVqi7s9iONkth
         sL0TxiSGG9B+jjKTHHphqO14uIAlQmHJUmBoBhZGtnLm64AULNkT7n2SHuttF+dAWjWB
         +7tA==
X-Gm-Message-State: APjAAAXByuKfniOBwnDO6XZQ7OtKdI5IS947VntNwmQNEBKPzGQV6d+O
        cUp0n+CpHLQb0HYYgBUeocgIQeY4lyqKoAh1aRw=
X-Google-Smtp-Source: APXvYqxotoq/8hGS9XgSO6JelXixa5l0w10bNwBRyvjvkP91TkYP1WblQo3zRuYvlhJRnSm4XrDvkt4p1Lkv3X5Q30g=
X-Received: by 2002:a6b:90c4:: with SMTP id s187mr6632690iod.178.1569952882448;
 Tue, 01 Oct 2019 11:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org> <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
In-Reply-To: <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 1 Oct 2019 12:01:11 -0600
Message-ID: <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 1, 2019 at 11:52 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2019-10-01 10:14, Jeffrey Hugo wrote:
> > On Tue, Oct 1, 2019 at 11:04 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> On 2019-10-01 09:13, Jeffrey Hugo wrote:
> >> > Sai,
> >> >
> >> > This patch breaks boot on the 835 laptops.  However, I haven't seen
> >> > the same issue on the MTP.  I wonder, is coresight expected to work
> >> > with production fused devices?  I wonder if thats the difference
> >> > between the laptop and MTP that is causing the issue.
> >> >
> >> > Let me know what I can do to help debug.
> >> >
> >>
> >> I did test on MSM8998 MTP and didn't face any issue. I am guessing
> >> this
> >> is the same issue which you reported regarding cpuidle? Coresight ETM
> >
> > Yes, its the same issue.  Right now, I need both patches reverted to
> > boot.
> >
> >> and cpuidle do not work well together since ETMs share the same power
> >> domain as CPU and they might get turned off when CPU enters idle
> >> states.
> >> Can you try with cpuidle.off=1 cmdline or just remove idle states from
> >> DT to confirm? If this is the issue, then we can try the below patch
> >> from Andrew Murray for ETM save and restore:
> >>
> >> https://patchwork.kernel.org/patch/11097893/
> >
> > Is there still value in testing this if the idle states are removed,
> > yet the coresight nodes still cause issues?
> >
> > Funny enough, I'm using the arm64 defconfig which doesn't seem to
> > select CONFIG_CORESIGHT, so I'm not even sure what would be binding to
> > the DT devices...
> >
>
> Haan then likely it's the firmware issue.
> We should probably disable coresight in soc dtsi and enable only for
> MTP. For now you can add a status=disabled for all coresight nodes in
> msm8998.dtsi and I will send the patch doing the same in a day or
> two(sorry I am travelling currently).

This sounds sane to me (and is what I did while bisecting the issue).
When you do create the patch, feel free to add the following tags as
you see fit.

Reported-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
