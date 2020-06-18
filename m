Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6193E1FF6F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 17:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgFRPcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 11:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgFRPcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 11:32:42 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583FDC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:32:42 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id r5so1211714vso.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9oZMKeC4utgl0CIoXcDw/AVYW+JLy1inJu/qLK1E0rs=;
        b=d/s0QMsjBiHwZlUjTpvheqikuQN0gf96atNeo2FcX6n8t5wgQJT5vqUidxqWydjds+
         wkLtTkz9/J83+L+KflKRQzGRezRXQ2ia0Cv5dglMC8elv6LQs/A1svNdxwDEz4Gcm59H
         gbvjQU+d19X2IVDeGYliNv3X+nsf5IGlghYn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9oZMKeC4utgl0CIoXcDw/AVYW+JLy1inJu/qLK1E0rs=;
        b=X2wTi4UehTT8K2xyICVJ8eJRzsts3XuoLkCeeQGWSnVmhMWAu9FGTuS0gi0bgQ+gRL
         bRDnaVBCmzAEZws5E9P0/GucgezeOqaTi3qFhBWkv/0v/JxgwWxNHFryG5Oob8djscQJ
         RCL0zrrMeJBXBZULvsf8X676UNrxp2QJQst44NSmhRN4OHZNNa8+V+8tQJxllmTwRtEN
         R/9Sl3P+qRZ6xZAK4dnaU03zAHXE/NBpUs5lFLxmTsS7YDn/rmxZWSiVrhRtt3LwCawQ
         IBWHGuNm1pSGjRqgUZZzoce3FTJAIpOEZIzEL8j3qIWk0BZwnpeyFtxWgZJPO3u8Tpoa
         mE9Q==
X-Gm-Message-State: AOAM533UF3tKmPEHHj46g8IZFJLSohxHkJYzq0ivaOb7ahAt+pUpyPjb
        0oUSrIAu6Zs1dRYf1kkXkcEXiRoYfKo=
X-Google-Smtp-Source: ABdhPJwYI0zY27eVyP/aPMWv1dckBMpUA460x5vyJhGc56LPWZhgo54Y96AKQT7SIUrtNvjompQUQA==
X-Received: by 2002:a67:dc89:: with SMTP id g9mr3777342vsk.206.1592494361199;
        Thu, 18 Jun 2020 08:32:41 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id k48sm302947uae.11.2020.06.18.08.32.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:32:33 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id k13so3745735vsm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 08:32:33 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr3844642vsd.198.1592494352448;
 Thu, 18 Jun 2020 08:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
 <254998b9-c45e-bd6b-bc9a-b5934c0fea8e@linaro.org> <CAD=FV=Vec5FVrDVkmUQTfa6bP+1d3yOtj_FsgVAFdHLLbZ8VDA@mail.gmail.com>
 <db6cc914-0520-5286-f852-473fc63bd6c7@linaro.org> <CAD=FV=UZAtJY42jwSZy+Z+O3AdZqDxnjY1zzOswqQRDY91uPpA@mail.gmail.com>
 <0b0b52db-da8c-e958-d72e-797e319bbe9c@linaro.org>
In-Reply-To: <0b0b52db-da8c-e958-d72e-797e319bbe9c@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 08:32:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UShR-a8kEvpNEx5gGkUr=DhX-=kzcBQ1SegQTQMoCyKw@mail.gmail.com>
Message-ID: <CAD=FV=UShR-a8kEvpNEx5gGkUr=DhX-=kzcBQ1SegQTQMoCyKw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for
 blowing fuses
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 7:01 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 18/06/2020 14:48, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jun 18, 2020 at 3:10 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> +Adding SBoyd.
> >>
> >> On 17/06/2020 18:22, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Wed, Jun 17, 2020 at 8:19 AM Srinivas Kandagatla
> >>> <srinivas.kandagatla@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 17/06/2020 15:51, Douglas Anderson wrote:
> >>>>> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >>>>>
> >>>>> On some systems it's possible to actually blow the fuses in the qfprom
> >>>>> from the kernel.  Add properties to support that.
> >>>>>
> >>>>> NOTE: Whether this is possible depends on the BIOS settings and
> >>>>> whether the kernel has permissions here, so not all boards will be
> >>>>> able to blow fuses in the kernel.
> >>>>>
> >>>>> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>>
> >>>>> Changes in v3:
> >>>>> - Add an extra reg range (at 0x6000 offset for SoCs checked)
> >>>>> - Define two options for reg: 1 item or 4 items.
> >>>>> - No reg-names.
> >>>>> - Add "clocks" and "clock-names" to list of properties.
> >>>>> - Clock is now "sec", not "secclk".
> >>>>> - Add "vcc-supply" to list of properties.
> >>>>> - Fixed up example.
> >>>>>
> >>>>>     .../bindings/nvmem/qcom,qfprom.yaml           | 45 ++++++++++++++++++-
> >>>>>     1 file changed, 43 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >>>>> index 5efa5e7c4d81..b195212c6193 100644
> >>>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >>>>> @@ -17,8 +17,27 @@ properties:
> >>>>>         const: qcom,qfprom
> >>>>>
> >>>>>       reg:
> >>>>> -    items:
> >>>>> -      - description: The corrected region.
> >>>>> +    # If the QFPROM is read-only OS image then only the corrected region
> >>>>> +    # needs to be provided.  If the QFPROM is writable then all 4 regions
> >>>>> +    # must be provided.
> >>>>> +    oneOf:
> >>>>> +      - items:
> >>>>> +          - description: The corrected region.
> >>>>> +      - items:
> >>>>> +          - description: The corrected region.
> >>>>> +          - description: The raw region.
> >>>>> +          - description: The config region.
> >>>>> +          - description: The security control region.
> >>>>> +
> >>>>> +  # Clock must be provided if QFPROM is writable from the OS image.
> >>>>> +  clocks:
> >>>>> +    maxItems: 1
> >>>>
> >>>>
> >>>>> +  clock-names:
> >>>>> +    const: sec
> >>>>
> >>>> Do we need clock-names for just one clock here?
> >>>
> >>> I think technically you can get by without, but convention is that
> >>> clock-names are always provided for clocks.  It's talked about in the
> >>> same link I sent that talked about reg-names:
> >>>
> >>> https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/
> >>>
> >>
> >> TBH, This is total confusion!!!
> >>
> >> when to use "*-names" Device tree bindings is totally depended on Linux
> >> Subsystem interfaces!
> >>
> >> And what is the starting point to draw this line?
> >
> > Definitely confusing and mostly because the dts stuff grew organically
> > for a while there.  It does feel like Rob is pretty clear on the
> > current state of things and the policy in the link I provided, though.
> >
> >
> >>> Specifically, Rob said:
> >>>
> >>>> That probably is because the clock binding has had clock-names from
> >>>> the start (it may have been the first one). That was probably partly
> >>>> due to the clock API also was mainly by name already if we want to
> >>>> admit Linux influence on bindings
> >>>
> >>> Basically the standard way for getting clocks in Linux is
> >>> clk_get(name).  With just one clock you can call clk_get(NULL) and I
> >>> believe that works, but when you add the 2nd clock then you have to
> >>> switch APIs to one of the less-commonly-used variants.
> >>
> >> In previous NON-DT life clk_get api name argument comes from the clk
> >> names that clk provider registered the clocks with.
> >>
> >> If I remember this correctly, the name that is refereed here for
> >> clk_get() is old clkdev api based on clk_lookups and is not the same as
> >> clk-names that we have in Device tree. Atleast in this case!
> >>
> >> clk-names has two objectives in DT:
> >> 1> To find the index of the clock in the clocks DT property.
> >>
> >> 2> If actual clk name is specified then if "1" fails then name could
> >> potentially fallback to use old clkdev based clk_lookups.
> >>
> >> In this specific case we have "sec" as clock-names which is totally used
> >> for indexing into clocks property and it can not be used for (2) as
> >> there is no clk named "sec" registered by any of the clk providers.
> >>
> >> So this does not justify the reasoning why "clock-names" should be used
> >> while "reg-names" should not be used!. Both of them are going to be
> >> finally used for indexing into there respective properties.
> >
> > Right, you just have to accept the fact that logic doesn't come into
> > play here.  For clocks, always use "clk-names" but also always use a
> > consistent order (which is now more enforced by the schema checker).
> > For "reg" almost never use "reg-names".
> >
>
> On the other note:
>
> clock-names are not mandatory according to
> Documentation/devicetree/bindings/clock/clock-bindings.txt
>
> For this particular case where clock-names = "sec" is totally used for
> indexing and nothing else!

So I guess in the one-clock case it's more optional and if you feel
strongly I'll get rid of clk-names here.  ...but if we ever need
another clock we probably will want to add it back and (I could be
corrected) I believe it's convention to specify clk-names even with
one clock.

I won't say it's impossible to get by without clock-names when you
have more than one clock, but (almost) nobody does it.  It's hard to
quickly come up with a good way to search for this, but skimming
through:

git grep -C5 'clocks.*,' -- arch/arm64/boot/dts

...you don't find too many examples of no clock-names and you find
_lots_ of examples where clock-names are specified.  One example that
_does_ have multiple clocks and doesn't specify clock-names is
"simple-framebuffer".  Looking at the Linux driver you can see they
have to use the special "of_clk_get()" variant to handle it.


-Doug
