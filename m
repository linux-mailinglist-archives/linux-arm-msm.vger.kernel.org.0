Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45EF232476
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 20:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgG2SK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 14:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgG2SK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 14:10:59 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E00C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 11:10:58 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 4so6414494vsf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCoModElWAnbMRvPO3YU9XQVQgftZ0hKK53c1cAKSbs=;
        b=QIBt/1ooWx13u1wuOLTIXdWssccajDzsKyxD32hHiHwZrVsqw/Iw9vLsv8+Z8E4gEy
         iEiguY8ka10wGb70eyABHcDiVLisSk0H3fV6NvNFulhN68llC5a9dvZPNtFPxwp3L5Ad
         AC9vJlcYBsOaBTsD4WtfRj2yMEjviNinT33WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCoModElWAnbMRvPO3YU9XQVQgftZ0hKK53c1cAKSbs=;
        b=uBFifJRmZJF5hso7+zfBOrCNeAYXVhOtQFG0OPyyltWpNr5hA6/t82A0by1yrWxWRF
         JECE1dDH11x/7iO71UDR4t2aqa6bUIy3GZQkDuzAhVPMfNrZ8jOw4hq8oiSW2DL6FyTI
         ncRGY5KgpASEUAsxqokVUqJNBBtNcniBQzVD0iA9QBCSYLCfpghb0k86VN5Y5b9zF+XB
         iXgvnIjhQwAHJjPcuaxkE6RWJy3WasOWHrJdkx+JXLM6s5olGNcGTb68QH95GGJdx4iY
         LEwXor3kWOOgR+k7oWd/E3O8Kx2mUe1YsM6VGyjHcX3PS/kNUgOiZ/9ATEaYN1K+/I1s
         AR1w==
X-Gm-Message-State: AOAM530sPUfh3L+6S7kGxlbg44v/dFMgWjTuaorchFSubWBMLbwh1jeL
        w9CHFzxEbSP6TYFBuEs0lsjB7c4/3zQ=
X-Google-Smtp-Source: ABdhPJxmTYGspV49Nrqx+RJdwfk0Zl6r6/h+Z8Nr4LJI3fwSHmtv/pzg3Om1oqm/SlWISNPftkPHmA==
X-Received: by 2002:a05:6102:1c9:: with SMTP id s9mr2300688vsq.13.1596046257654;
        Wed, 29 Jul 2020 11:10:57 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id c62sm368880vkg.30.2020.07.29.11.10.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id c197so3448656vkc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
X-Received: by 2002:a1f:9f17:: with SMTP id i23mr23539610vke.65.1596046256240;
 Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org> <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org> <20200724162825.GH9185@codeaurora.org>
 <159589714088.1360974.13205114501389777927@swboyd.mtv.corp.google.com>
 <20200728165212.GA32586@codeaurora.org> <159596590401.1360974.283437162250734878@swboyd.mtv.corp.google.com>
 <20200728201133.GB32586@codeaurora.org>
In-Reply-To: <20200728201133.GB32586@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jul 2020 11:10:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XB8jqq+WGHL4czvZ96kPMpAB5wkkN9tx4++o=a2i4DXQ@mail.gmail.com>
Message-ID: <CAD=FV=XB8jqq+WGHL4czvZ96kPMpAB5wkkN9tx4++o=a2i4DXQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 28, 2020 at 1:11 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Tue, Jul 28 2020 at 13:51 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2020-07-28 09:52:12)
> >> On Mon, Jul 27 2020 at 18:45 -0600, Stephen Boyd wrote:
> >> >Quoting Lina Iyer (2020-07-24 09:28:25)
> >> >> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
> >> >> >Hi Maulik/Lina,
> >> >> >
> >> >> >On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
> >> >> >>Hi Rajendra,
> >> >> >>
> >> >> >>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> >> >> >>below messages on db845:
> >> >> >>
> >> >> >>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> >> >> >>current OPP for freq 533000097 (-34)
> >> >> >>
> >> >> >>^^^ This one is new.
> >> >> >>
> >> >> >>qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> >> >> >>
> >> >> >>^^^ and this message is annoying, can we make it pr_debug in rpmh?
> >> >> >
> >> >> How annoyingly often do you see this message?
> >> >> Usually, this is an indication of bad system state either on remote
> >> >> processors in the SoC or in Linux itself. On a smooth sailing build you
> >> >> should not see this 'warning'.
> >> >>
> >> >> >Would you be fine with moving this message to a pr_debug? Its currently
> >> >> >a pr_info_ratelimited()
> >> >> I would rather not, moving this out of sight will mask a lot serious
> >> >> issues that otherwise bring attention to the developers.
> >> >>
> >> >
> >> >I removed this warning message in my patch posted to the list[1]. If
> >> >it's a serious problem then I suppose a timeout is more appropriate, on
> >> >the order of several seconds or so and then a pr_warn() and bail out of
> >> >the async call with an error.
> >> >
> >> The warning used to capture issues that happen within a second and it
> >> helps capture system related issues. Timing out after many seconds
> >> overlooks the system issues that generally tend to resolve itself, but
> >> nevertheless need to be investigated.
> >>
> >
> >Is it correct to read "system related issues" as performance problems
> >where the thread is spinning forever trying to send a message and it
> >can't? So the problem is mostly that it's an unbounded amount of time
> >before the message is sent to rpmh and this printk helps identify those
> >situations where that is happening?
> >
> Yes, but mostly a short period of time like when other processors are in
> the middle of a restart or resource states changes have taken unusual
> amounts of time. The system will generally recover from this without
> crashing in this case. User action is investigation of the situation
> leading to these messages.

While I do agree that seeing the "TCS Busy, retrying RPMH message
send" message printed a lot was usually a sign that something was
wrong in the system (possibly someone was spamming RPMh when they
shouldn't be), it still feels like we need to remove it.
Specifically, the prints would also sometimes come up in normal usage
and always sounded a bit scary.  These types of prints always confuse
people and lead to log pollution where it's super hard to figure out
which of the various things in a log are "expected" and which ones are
relevant to whatever issue you're debugging.

Presumably we could either change that from a "info" level to "dbg"
level.  ...or we could find some other thing to check for that's a
better signal of problems.


> >Otherwise as you say above it's a bad system state where the rpmh
> >processor has gotten into a bad state like a crash? Can we recover from
> >that? Or is the only recovery a reboot of the system? Does the rpmh
> >processor reboot the system if it crashes?
> We cannot recover from such a state. The remote processor will reboot if
> it detects a failure at it's end. If the system entered a bad state, it
> is possible that RPMH requests start timing out in Linux and remote
> processor may not detect it. Hence, the timeout in rpmh_write() API. The
> advised course of action is a restart as there is no way to recover from
> this state.
>
> --Lina
>
>
