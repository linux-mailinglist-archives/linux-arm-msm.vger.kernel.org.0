Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4B218D473
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 17:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgCTQbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 12:31:05 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35825 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbgCTQbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 12:31:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so5051678lfp.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2020 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWa0IWkYd6tdWbqMa29lygSoK/RlkQZ5CmiZBdveSls=;
        b=FhYh2/TXtz7rtHB2/sgGBWoGU1DMlUy49ZjxAZUAtHGGaPfpIzwGoPOkWPk1jW8vGQ
         jawEHWpkM54XOu4a2QFgn66KU6hYd7Ex8uSdTNm7ZvYxd4vjdywS3TGM21jCtTAyFMkb
         7klwMPsfqIdIcAknorjDXjW9m8eXggf0ojSRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWa0IWkYd6tdWbqMa29lygSoK/RlkQZ5CmiZBdveSls=;
        b=enCi65qGUDxMPiCQQrayIl6rO//76rJL8k8JPJJnjLbEBat1VJdH3FAo1sKnipIoCv
         MjYqb5TiuPTmMnkJM07Jg/tldpEqYMpmrr0TXT+W1HqOmdBqCxN9ZcpyCeuCxPBfXnjt
         gI9kU5wro2D1+VUGGU5I1QAKQUuMjnHdRPxDEL9nct0fuqbKAPaxVDFQx2FJG9xsII5t
         3/uJE48X8jt2YZ6rMnSkuzSIuEGROQVAhA6QOyLtCwjgK7bFFXujw6yMyV7b6dbCJVwR
         py+240B5bYfOhfAbe3B/t4ipAF0oDhMRdoZBv+QATStyTeJYMIqpU3Ipxn/3kZYeH2gc
         hXZQ==
X-Gm-Message-State: ANhLgQ1QbPvNw5z1EImfA5G1kfgzB66vaKdYwBwpziylj3dkYnPsfBI+
        FMcw9bE38ysYH2/J0+Y0IllyimI5r5Q=
X-Google-Smtp-Source: ADFU+vvUP5+nO4AAMMoAgzPR3shijRFcs0l2aBeD6AJTh9fsd+0LNYalIJXaaxOglU2Vmd7p6W5qfg==
X-Received: by 2002:ac2:5203:: with SMTP id a3mr5895288lfl.152.1584721862197;
        Fri, 20 Mar 2020 09:31:02 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id k23sm3626343ljk.40.2020.03.20.09.31.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 09:31:01 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id u12so7118807ljo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2020 09:31:00 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr6037445lji.278.1584721860043;
 Fri, 20 Mar 2020 09:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com> <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <20200317182910.GR144492@google.com> <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
 <20200319194332.GA60149@google.com> <a7227a1f-00a1-0818-80f3-904fe264f864@codeaurora.org>
In-Reply-To: <a7227a1f-00a1-0818-80f3-904fe264f864@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 20 Mar 2020 09:30:23 -0700
X-Gmail-Original-Message-ID: <CAE=gft6AGkcdUAkoyevZgmtBgaiEkoQzzJcg7sYjbpy5Kh2fyA@mail.gmail.com>
Message-ID: <CAE=gft6AGkcdUAkoyevZgmtBgaiEkoQzzJcg7sYjbpy5Kh2fyA@mail.gmail.com>
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 20, 2020 at 3:22 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Evan, Matthias,
>
> On 3/20/2020 1:13 AM, Matthias Kaehlcke wrote:
> > On Wed, Mar 18, 2020 at 02:24:35PM +0530, Akash Asthana wrote:
> >> Hi Matthias,
> >>
> >> On 3/17/2020 11:59 PM, Matthias Kaehlcke wrote:
> >>> Hi Akash,
> >>>
> >>> On Tue, Mar 17, 2020 at 04:27:47PM +0530, Akash Asthana wrote:
> >>>> Hi Matthias,
> >>>>
> >>>> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
> >>>>> Hi Akash,
> >>>>>
> >>>>> On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
> >>>>>> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
> >>>>>> to reset at boot time.
> >>>>> The v1 patch isn't relevant in the commit message, please just describe the
> >>>>> problem. Also the crash only occurs when earlycon is used.
> >>>> ok
> >>>>>> As QUP core clock is shared among all the SE drivers present on particular
> >>>>>> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
> >>>>>> is put to 0 from other SE drivers before real console comes up.
> >>>>>>
> >>>>>> As earlycon can't vote for it's QUP core need, to fix this add ICC
> >>>>>> support to common/QUP wrapper driver and put vote for QUP core from
> >>>>>> probe on behalf of earlycon and remove vote during sys suspend.
> >>>>> Only removing the vote on suspend isn't ideal, the system might never get
> >>>>> suspended. That said I don't have a really good alternative suggestion.
> >>>>>
> >>>>> One thing you could possibly do is to launch a delayed work, check
> >>>>> console_device() every second or so and remove the vote when it returns
> >>>>> non-NULL. Not claiming this would be a great solution ...
> >>>>>
> >>>>> The cleanest solution might be a notifier when the early console is
> >>>>> unregistered, it seems somewhat over-engineered though ... Then again
> >>>>> other (future) uart drivers with interconnect support might run into
> >>>>> the same problem.
> >>>> We are hitting this problem because QUP core clocks are shared among all the
> >>>> SE driver present in particular QUP wrapper, if other HW controllers has
> >>>> similar architecture we will hit this issue.
> >>>>
> >>>> How about if we expose an API from common driver(geni-se) for putting QUP
> >>>> core BW vote to 0.
> >>>>
> >>>> We call this from console probe just after uart_add_one_port call (console
> >>>> resources are enabled as part of this call) to put core quota to 0 on behalf
> >>>> of earlyconsole?
> >>>   From my notes from earlier debugging I have doubts this would work:
> >>>
> >>>     There is a short window where the early console and the 'real' console coexist:
> >>>
> >>>     [    3.858122] printk: console [ttyMSM0] enabled
> >>>     [    3.875692] printk: bootconsole [qcom_geni0] disabled
> >>>
> >>>     The reset probably occurs when the early console tries to write, but the ICC
> >>>     is effectively disabled because ttyMSM0 and the other geni ports are runtime
> >>>     suspended.
> >> Code flow from console driver probe(qcom_geni_serial.c)
> >>
> >> uart_add_one_port--->uart_configure_port--->{ 1) uart_change_pm(enable
> >> console resources)  2)register_console(boot to real console switch happens
> >> here)}
> >>
> >> Console resources are not disabled from anywhere before the switch happens
> >> completely. I meant to say until we saw below logs.
> >>
> >> [    3.875692] printk: bootconsole [qcom_geni0] disabled
> >>
> >> I think the board reset issue cannot occur during the window where early
> >> console and 'real' console coexist.
> > Thanks for the clarification! Indeed my notes were only a hypothesis, I
> > don't see evidence that there is an actual downvote shortly after console
> > registration.
> >
> >> I have validated proposed solution by me, it is working fine.
> >>
> >> Currently voting is done for every QUP and not only to which earlycon is
> >> connect, with the above approach we can't remove vote from other QUPs.
> >>
> >> However we can limit voting only to earlycon QUP by removing interconnect
> >> from DT node of other QUPs.
> >>
> >> I am not sure how clean is this solution.
> > I'm more inclined towards a solution along the lines of what Evan
> > proposed, i.e. delaying the votes (either in geni or ICC) until we
> > are ready.
>
> Based on discussion I think the delayed solution is most suited if
> implemented in ICC core because other ICC client might face the similar
> problem.
>
> However for geni case I am more inclined towards below proposed solution.
>
> -----------------------------------------------------------------------------------------------------
>
> How about if we expose an API from common driver(geni-se) for putting QUP
> core BW vote to 0.
>
> We call this from console probe just after uart_add_one_port call (console
> resources are enabled as part of this call) to put core quota to 0 on behalf
> of earlyconsole?

This seems ok to me. Earlycon sets up a vote, and then real probe
tears it down. As long as in the shuffle of all of these things into
SE library helpers you still have a way of differentiating the
earlycon vote from the real vote. In other words, don't reuse this
early icc_path for the real UART vote. You should probably also
destroy the path once you've voted zero on it.
-Evan
