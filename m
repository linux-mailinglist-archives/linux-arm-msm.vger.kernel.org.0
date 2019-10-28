Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687CFE737C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 15:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390021AbfJ1ORq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 10:17:46 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40913 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbfJ1ORq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 10:17:46 -0400
Received: by mail-il1-f194.google.com with SMTP id d83so8308625ilk.7;
        Mon, 28 Oct 2019 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyrpC3p6vL18b1O3dLqA/KgcilibjGWnZgSsfyy6puw=;
        b=i7knxtPbtmf3aegRshvbyPqat9NZGgNvYw9ZueFZpr89A9061oAXpfFiQMQcx/eMI8
         wFnFrpqTvWp/BVUd9YtJkOFPM1QRobOFKIm6jpxHH+FqbGRkWdZnecyVJoCtDT7aj/B4
         2L5wqaS4cG5DtyhyE/oSfY+n+y6Gxbw46l66/hc/qbXyjW4FgkGhDvJ+tb3w5Scy6RHs
         p5dOEzHl/aaT8SNc/0o4hHInX60YvP7lm5SMaXIsc3FP9ogz42MAsm1vPKGv4yEni8zn
         D67ZqKK5imsvCpSAgdnv5xOUb9TBnmXjYzH6V+d2Uemuoc/nzkMZb3zjFGfH8tQZH+QU
         tCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyrpC3p6vL18b1O3dLqA/KgcilibjGWnZgSsfyy6puw=;
        b=VujhB107jXp/9pRiW316rfRGOU4hrQpofk8vgC1TfSlATts8ZV5AreUCLgnV3EK6UC
         i7YfAxoiPcQwebkb/JwzBHbwcWkXmG98xT2c4zxgM8YyuwUYcFgoW1YuwZMjFrhyXV3y
         NAlT3611rxzd80yLMKcDxRYg8xcziGtSovFt8Vh+AqG32vcExYRfdk5HPzUNYI5tyt2/
         wnY7Ke6BdDb7zSEcoEXqrcLSAbDdZo+DeWCFg7KwdptIdD88rO3f6OY0tVoyMoDsNhV1
         pfGM7OFoE3690d++iYmie9K3ZkqzlDuhJr9mYZ6giQv0YScemT8dCnDYYP52hpJnUF+R
         zruQ==
X-Gm-Message-State: APjAAAVDn5Q9g+x3EjfIxnbq219GkxvNkBdnjDTt1weAE7jstbgG0M2w
        HGchNQa317L1zoO/TuwtMoNOJf2ky7CChS2f0B8=
X-Google-Smtp-Source: APXvYqzHYbHOSKaCMZZO31hIKXhuEOFg1chEObrthPUI9TcC7sp9A2sOKkiHceAldWYi+nqT25hPdcnbdX4dT+oFbbo=
X-Received: by 2002:a92:17c8:: with SMTP id 69mr21100233ilx.42.1572272264815;
 Mon, 28 Oct 2019 07:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com>
 <20191002011640.36624-1-jeffrey.l.hugo@gmail.com> <20191017215023.2BFEC20872@mail.kernel.org>
 <CAOCk7NqgWkt6BwY75eGS2dbJ7GGk3DqH5NC0VLHUq4fc6WuYog@mail.gmail.com>
 <CAOCk7Np_Wn9JZ8JQCiDg1w+xcTVW9fhvtCA-k5ysc2juHZuvUw@mail.gmail.com> <20191027213659.23423205F4@mail.kernel.org>
In-Reply-To: <20191027213659.23423205F4@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 28 Oct 2019 08:17:33 -0600
Message-ID: <CAOCk7Npk1zdL2Y3nMxYCXeUj5deJKyoJSSbYCw1V+9ZNvxspdw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add MSM8998 GPU Clock Controller
 (GPUCC) driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 27, 2019 at 3:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-10-18 14:11:09)
> > On Thu, Oct 17, 2019 at 5:16 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > >
> > > On Thu, Oct 17, 2019 at 3:50 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Jeffrey Hugo (2019-10-01 18:16:40)
> > > > > +static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
> > > > > +       F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > > +       { }
> > > >
> > > > I guess this one doesn't do PLL ping pong? Instead we just reprogram the
> > > > PLL all the time? Can we have rcg2 clk ops that set the rate on the
> > > > parent to be exactly twice as much as the incoming frequency? I thought
> > > > we already had this support in the code. Indeed, it is part of
> > > > _freq_tbl_determine_rate() in clk-rcg.c, but not yet implemented in the
> > > > same function name in clk-rcg2.c! Can you implement it? That way we
> > > > don't need this long frequency table, just this weird one where it looks
> > > > like:
> > > >
> > > >         { .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 }
> > > >         { }
> > > >
> > > > And then some more logic in the rcg2 ops to allow this possibility for a
> > > > frequency table when CLK_SET_RATE_PARENT is set.
> > >
> > > Does not do PLL ping pong.  I'll look at extending the rcg2 ops like
> > > you describe.
> >
> > Am I missing something?  From what I can tell, what you describe is
> > not implemented.
> >
> > The only in-tree example of a freq_tbl with only a src and a pre_div
> > defined for rcg ops is for the tv_src clk in mmcc-msm8960 [1]
> > However, that uses a variant of rcg ops, clk_rcg_bypass_ops, not clk_rcg_ops.
> >
> > clk_rcg_bypass_ops has its own determine_rate implementation which
> > does not utilize _freq_tbl_determine_rate(), and can only do a 1:1
> > input rate to output ratio (we want a 1:2).
> >
> > _freq_tbl_determine_rate() in either rcg_ops or rcg2_ops won't work,
> > because they both use qcom_find_freq() which doesn't work when your
> > table doesn't specify any frequencies (f->freq is 0).
>
> Yes. You have to have some sort of frequency table to tell us what the
> source and predivider to use.
>
> > qcom_find_freq() won't iterate through the table, therefore f in
> > qcom_find_freq() won't be pointing at the end of the table (the null
> > entry), so when qcom_find_freq decrements f in the return, it actually
> > goes off the beginning of the array in an array out of bounds
> > violation.
>
> Ouch!
>
> >
> > Please advise how you would like to proceed.
>
> Please have a frequency table like
>
>  { .src = SOME_PLL, .div = 4 }
>
>
> >
> > I can still extend rcg2_ops to do what you want, but it won't be based
> > on what rcg_ops is doing.
>
> Why isn't rcg_ops doing it? The idea is to copy whatever is happening
> with this snippet in the _freq_tbl_determine_rate() in rcg.c to rcg2.c

That more or less exists in both cases, although rcg2_ops may need a
bit of additional work.  The problem is that in both cases, before
this snippet, we've already called qcom_find_freq(), and in both cases
(rcg_ops and rcg2_ops), f will be an invalid entry and we won't have
the proper pre_div value.

>
>         clk_flags = clk_hw_get_flags(hw);
>         p = clk_hw_get_parent_by_index(hw, index);
>         if (clk_flags & CLK_SET_RATE_PARENT) {
>                 rate = rate * f->pre_div;
>
> We have checked for CLK_SET_RATE_PARENT from the beginning. Maybe it was
> always broken! If the frequency table pointer can return us the pre div
> and source then we can do math to ask the parent PLL for something.
>
> >
> > I can spin a rcg2_ops variant to do what you want, with a custom
> > determine_rate, but it doesn't seem like I'll really be saving any
> > lines of code.  Whatever I eliminate by minimizing the gfx3d
> > freq_table I will surely be putting into clk-rcg2.c
> >
> > Or, I can just drop this idea and keep the freq_tbl as it is.  Seems
> > like just a one off scenario.
>
> Please make rcg2 clk ops "do the right thing" when the flag
> CLK_SET_RATE_PARENT is set and the frequency table is just a
> source/divider sort of thing. That way we don't have to have different
> clk ops or even put anything in the frequency table besides the source
> PLL we want to use and the predivider we want to configure.
>

Got it.  Will do.
