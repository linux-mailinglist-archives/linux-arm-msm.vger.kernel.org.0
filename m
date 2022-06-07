Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25162541EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 00:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380771AbiFGWcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 18:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381461AbiFGWbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 18:31:53 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B4B27B9BC
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 12:25:19 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id r3so14990330ilt.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GHa5FCqzV19M22dvdDB5nj0vPBoaKhTTuna0XNuZ2Rk=;
        b=eg6DgTgVJo1M+W86BpnkOWtlRo/rNqjcAEdbVCRXT9vcVgmZX/7pbvgL/tYC9/pQ+W
         aQYzfGrsGY91l8Ct1o/ZCKPMXKb3CbZOOm0DGMP1IvVWC2UKVhQ+PRdpnuc449HMDQYd
         qMuav6bQzXxNN6zI7A7yGONIzJeN8AD8n0k/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHa5FCqzV19M22dvdDB5nj0vPBoaKhTTuna0XNuZ2Rk=;
        b=3YVN4KYz8hLTlQFg837ZvFkH9xegrXU+oS5g6yZnf2eaycFUUyrRQvoSrM0uNl6YJ1
         6VVTqyLZD7OHSDF2qHWdoPjcMzeqSFG2uOBvoQYePqUsSJ//LD17jQO15YOuAYi1QFHG
         9vNuG5oHZNHMTeeVZs7eVdle6s4psvxmDje82f4uV42FIqMrKSYL9u1/cojvaE4TdhOF
         O8Z92lSZ+RjwExeayhkgmWlgAKop+WcI3z2zKiwCfjsYDmAYnUaUAJvaeYlUuYed6Nti
         NEqFP+y/lV/F8s/d2afxndavd6E01b6LOKB1OhVHwxfcqTGj8r9CnKsC0B1091dGfY8T
         Jiww==
X-Gm-Message-State: AOAM5303RvHd3HQdz+JvhMHVMHQL9yj1JZ9/JoAGz/BWp0X2N8PFybbX
        38glaEGW6nVzhM6QU0PEtbLqc/JBW4vFDhEBgVs=
X-Google-Smtp-Source: ABdhPJz7UfuADL5F9jhvrmd0EyN6exmFLx2+1BS4gaj44knPmlVB0AAAYolnlMWx5fmIlnnR9bSKyg==
X-Received: by 2002:a05:6e02:1bc1:b0:2d1:8e35:dcba with SMTP id x1-20020a056e021bc100b002d18e35dcbamr17216961ilv.58.1654629918256;
        Tue, 07 Jun 2022 12:25:18 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id i7-20020a02a0c7000000b0032e5417e910sm6983903jah.12.2022.06.07.12.25.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 12:25:16 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id v7so14993228ilo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 12:25:16 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ce:b0:2d3:f970:fc8b with SMTP id
 s14-20020a056e0218ce00b002d3f970fc8bmr13522274ilu.285.1654629915884; Tue, 07
 Jun 2022 12:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <1654021066-13341-1-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=UF3x5RHrQH-m1X-4kQSsKiufLnkew=VuJz7W9EAi3GHQ@mail.gmail.com>
 <5d950007-7a92-a41b-e569-79e806adb06a@quicinc.com> <CAD=FV=Xm1LJEoU5dKa5pMgqsHuAXuFVpdHvc1REULhAKTPbGnQ@mail.gmail.com>
 <ad393ad2-a247-3c61-5033-185d39b5596d@quicinc.com> <CAD=FV=XD+LozhkJZp0C7RUO01T-XuqBA-SJ0EQeyvGk0CxC3JQ@mail.gmail.com>
 <e677fd02-011f-4f4e-fa73-17dc96aea7d0@quicinc.com> <CAD=FV=UzjnEjMTLTRVXTrz6aoiBymJtnJ1o8dzPN9hn0Be3tng@mail.gmail.com>
 <da18c508-f32e-fece-6392-e6a95f7c7968@quicinc.com>
In-Reply-To: <da18c508-f32e-fece-6392-e6a95f7c7968@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Jun 2022 12:25:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wytm9EYu=4ndN+En2AFEgPK9NjrUMbFPA_h6TwyxGCYA@mail.gmail.com>
Message-ID: <CAD=FV=Wytm9EYu=4ndN+En2AFEgPK9NjrUMbFPA_h6TwyxGCYA@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: minor fixes to get_clk_div_rate()
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 7, 2022 at 10:40 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Hi,
>
> On 6/7/2022 1:29 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jun 6, 2022 at 11:19 AM Vijaya Krishna Nivarthi
> > <quic_vnivarth@quicinc.com> wrote:
> >> Hi,
> >>
> >>
> >> On 6/4/2022 12:10 AM, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Fri, Jun 3, 2022 at 10:43 AM Vijaya Krishna Nivarthi
> >>> <quic_vnivarth@quicinc.com> wrote:
> >>>> Ah, or I guess what you're saying is that the table historically
> >>>> contained "rounded" rates but that clk_round_rate() isn't returning
> >>>> nice round rates. OK, but if we truly want to support an inexact
> >>>> match, you'd want to pick the rate that reduces the error, not just
> >>>> pick the first one. In other words, something like this (untested):
> >>>>
> >>>> freq = clk_round_rate(clk, mult);
> >>>> diff = abs(((long)mult - freq) / div);
> >>>> if (diff < best_diff) {
> >>>>      best_diff = diff;
> >>>>      ser_clk = freq;
> >>>>      best_div = div;
> >>>> }
> >>>> I am not sure if its required that freq is a multiple of best_div now
> >>>> that we don't have a multiple of desired_clk anyway.
> >>> How about just this (untested):
> >>>
> >>> freq = clk_round_rate(clk, mult);
> >>> candidate_div = max(1, DIV_ROUND_CLOSEST(freq, desired_clk));
> >>> candidate_freq = freq / candidate_div;
> >>> diff = abs((long)desired_clk - candidate_freq);
> >>> if (diff < best_diff) {
> >>>     best_diff = diff;
> >>>     ser_clk = freq;
> >>>     best_div = candidate_div;
> >>> }
> >> I am afraid this still doesn't guarantee that ser_clk is a multiple of
> >> best_div
> > OK. ...I guess my question would be: does it matter for some reason?
> > "ser_clk" is just a local variable in this function. Who cares if it's
> > not a multiple of best_div? This is why we're keeping track of
> > "best_div" in the first place, so that later in the function instead
> > of:
> >
> > *clk_div = ser_clk / desired_clk;
> > if (!(*clk_div))
> >    *clk_div = 1;
> >
> > You just do:
> >
> > *clk_div = best_div;
>
> My only concern continues to be...
>
> Given ser_clk is the final frequency that this function is going to
> return and best_div is going to be the clk_divider, is it ok if the
> divider cant divide the frequency exactly?
>
> In other words, Can this function output combinations like (402,4)
> (501,5) ?
>
> If ok, then we can go ahead with this patch or even previous perhaps.

I don't see why not. You're basically just getting a resulting clock
that's not an integral "Hz", right?

So if "baud" is 9600 and sampling_rate is 16 then desired_clk is (9600
* 16) = 153600

Let's imagine that we do all the math and we finally decide that our
best bet is with the rate 922000 and a divider of 6. That means that
the actual clock we'll make is 153666.67 when we _wanted_ 153600.
There's no reason it needs to be integral, though, and 153666.67 would
still be better than making 160000.


> >> I tested it with a function simulates clk_round_rate.
> >>
> >> static unsigned long clk_round_rate_test(struct clk *clk, unsigned long
> >> in_freq)
> >> {
> >>       unsigned long root_freq[6] = {105, 204, 303, 402, 501, 602};
> >>       int i;
> >>
> >>       for (i = 0; i < 6; i++) {
> >>           if (root_freq[i] >= in_freq)
> >>               return root_freq[i];
> >>       }
> >>       return root_freq[6];
> >> }
> >>
> >>       {
> >>           unsigned long ser_clk;
> >>           unsigned long desired_clk;
> >>           unsigned long freq;
> >>           int div_round_closest;
> >>           unsigned long div;
> >>           unsigned long mult;
> >>           unsigned long candidate_div, candidate_freq;
> >>
> >>           unsigned long diff, best_diff, best_div;
> >>           unsigned long one;
> >>
> >>           desired_clk = 100;
> >>           one = 1;
> >>           best_diff = ULONG_MAX;
> >>           pr_err("\ndesired_clk-%d\n", desired_clk);
> >>           for (div = 1; div <= 10; div++) {
> >>               mult = div * desired_clk;
> >>
> >>               freq = clk_round_rate_test(clk, mult);
> >>               div_round_closest = DIV_ROUND_CLOSEST(freq, desired_clk);
> >>               candidate_div = max(one, (unsigned long)div_round_closest);
> >>               candidate_freq = freq / candidate_div;
> >>               diff = abs((long)desired_clk - candidate_freq);
> >>               pr_err("div-%d, mult-%d, freq-%d, div_round_closest-%d,
> >> candidate_div-%d, candidate_freq-%d, diff-%d\n",
> >>                   div, mult, freq, div_round_closest, candidate_div,
> >> candidate_freq, diff);
> >>               if (diff < best_diff) {
> >>                   pr_err("This is best so far\n");
> >>                   best_diff = diff;
> >>                   ser_clk = freq;
> >>                   best_div = candidate_div;
> >>               }
> >>           }
> >>           pr_err("\nbest_diff-%d, ser_clk-%d, best_div-%d\n",
> >>               best_diff, ser_clk, best_div);
> >>       }
> >>
> >> And here is the output
> >>
> >> [   17.835167] desired_clk-100
> >> [   17.839567] div-1, mult-100, freq-105, div_round_closest-1,
> >> candidate_div-1, candidate_freq-105, diff-5
> >> [   17.849220] This is best so far
> >> [   17.852458] div-2, mult-200, freq-204, div_round_closest-2,
> >> candidate_div-2, candidate_freq-102, diff-2
> >> [   17.862104] This is best so far
> >> [   17.865345] div-3, mult-300, freq-303, div_round_closest-3,
> >> candidate_div-3, candidate_freq-101, diff-1
> >> [   17.874995] This is best so far
> >> [   17.878237] div-4, mult-400, freq-402, div_round_closest-4,
> >> candidate_div-4, candidate_freq-100, diff-0
> >> [   17.887882] This is best so far
> >> [   17.891118] div-5, mult-500, freq-501, div_round_closest-5,
> >> candidate_div-5, candidate_freq-100, diff-0
> >> [   17.900770] div-6, mult-600, freq-602, div_round_closest-6,
> >> candidate_div-6, candidate_freq-100, diff-0
> >> [   17.910415] div-7, mult-700, freq-602, div_round_closest-6,
> >> candidate_div-6, candidate_freq-100, diff-0
> >> [   17.920057] div-8, mult-800, freq-602, div_round_closest-6,
> >> candidate_div-6, candidate_freq-100, diff-0
> >> [   17.929703] div-9, mult-900, freq-602, div_round_closest-6,
> >> candidate_div-6, candidate_freq-100, diff-0
> >> [   17.939353] div-10, mult-1000, freq-602, div_round_closest-6,
> >> candidate_div-6, candidate_freq-100, diff-0
> >> [   17.949181]
> >> [   17.949181] best_diff-0, ser_clk-402, best_div-4
> > That doesn't look like a terrible result. I guess nominally 602 is a
> > better approximation, but if we're accepting that we're not going to
> > have an exact rate anyway then maybe being off by that tiny amount
> > doesn't matter and we'd do better with the slow clock (maybe saves
> > power?)
> Actually power saving was the anticipation behind returning first
> frequency in original patch, when we cant find exact frequency.

Right, except that if you just pick the first clock you find it would
be _wildly_ off. I guess if you really want to do this the right way,
you need to set a maximum tolerance and pick the first rate you find
that meets that tolerance. Random web search for "uart baud rate
tolerance" makes me believe that +/- 5% deviation is OK, but to be
safe you probably want something lower. Maybe 2%? So if the desired
clock is within 2% of a clock you can make, can you just pick that
one?


> >> Please note that we go past cases when we have an divider that can
> >> exactly divide the frequency(105/1, 204/2, 303/3) and end up with one
> >> that doesn't.
> > Ah, good point. Luckily that's a 1-line fix, right?
>
> Apologies, I could not figure out how.

Ah, sorry. Not quite 1 line, but this (untested)


freq = clk_round_rate(clk, mult);

if (freq % desired_clk == 0) {
 ser_clk = freq;
 best_div = freq / desired_clk;
 break;
}

candidate_div = max(1, DIV_ROUND_CLOSEST(freq, desired_clk));
candidate_freq = freq / candidate_div;
diff = abs((long)desired_clk - candidate_freq);
if (diff < best_diff) {
  best_diff = diff;
  ser_clk = freq;
  best_div = candidate_div;
}
