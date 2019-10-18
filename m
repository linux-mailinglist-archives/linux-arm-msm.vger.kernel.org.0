Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5D3DD0E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 23:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502982AbfJRVLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 17:11:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41487 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394095AbfJRVLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 17:11:21 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so9055005ioj.8;
        Fri, 18 Oct 2019 14:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGIyf3yxo3LRG94gRvIwmnxNQ7kmsQTq6lhNdbNTksU=;
        b=RlF581TMVuSypUhdR9KBRHuSgFE4LuHPdJDRdMq6Lpl6+u/75/26IC5KVYzdactZl+
         6UozJkiZebDcKTHxdW62cxkDcaaMX+GJDxtxVqM7ejHRJ+uecTMRZ0BVCRBjEbDG4uyR
         Nh9CJQ7tOpqkheFJWejr6ei8Doi5MEeOx9zmuK1un8YMsIpMkmfWM2Kt/yCIPZQ6LKzO
         MxahpDv9b7IKldl64YomtJ8QTyjDFJMmcuTyv709n6oTTmDNYLcVLFRv+SUD1HBa4Mpl
         QzKOO6p1+bIKFPfpY2XtQ7U249B5cnmoQDv394Adh17nyfKR1B59uwuhh6tINCLbg/4S
         N46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGIyf3yxo3LRG94gRvIwmnxNQ7kmsQTq6lhNdbNTksU=;
        b=G0o7hZVAREOcRYCqluJMnnSUd99iRUJ3xhczkmxouruCAxiFWPEWuO3DHFkI0qkhrx
         vtHUtjxAjQLSxB0g4LLPnPj+E02vZXxDQmT6zohSNBmO6FpJc5TavphkGxMZTHVB5Opm
         oSuNbsu0iassMUaHBpuctCRO3c0PejxE1LPXsyUoJMHgaAf4YG0z9lTm2/Hwk6Y5kpxI
         CunF8HeK/T/JAqbIjIfitUCY7sRc99Ohc3cAU2NtCO/Uhk3z/6Z2m3xPIxRqtsd6T61s
         zhztMjVYBMASTT6+VxLAZOJ4Q4qbRbU34DHHXKSFVkCNpEJeqQ4pcBRf15mF7CsHZ8yF
         8MtQ==
X-Gm-Message-State: APjAAAVp2OpmryrZ0k5j0tjaexVGehqEtqM5QZHSrCGMXb7196TZod2x
        rM4F4pH55bTCuUym1fNP3xnXwzJtMtPa2wz03+8=
X-Google-Smtp-Source: APXvYqw/RCsXzWZg7GzS3W3NqHBIFj5rays6TK9CdtjOsqfggufHRrdgPtmJdry4m1p91SGVPZtGsLw4U1YT398zTkY=
X-Received: by 2002:a6b:1504:: with SMTP id 4mr10908214iov.166.1571433080425;
 Fri, 18 Oct 2019 14:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com>
 <20191002011640.36624-1-jeffrey.l.hugo@gmail.com> <20191017215023.2BFEC20872@mail.kernel.org>
 <CAOCk7NqgWkt6BwY75eGS2dbJ7GGk3DqH5NC0VLHUq4fc6WuYog@mail.gmail.com>
In-Reply-To: <CAOCk7NqgWkt6BwY75eGS2dbJ7GGk3DqH5NC0VLHUq4fc6WuYog@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 15:11:09 -0600
Message-ID: <CAOCk7Np_Wn9JZ8JQCiDg1w+xcTVW9fhvtCA-k5ysc2juHZuvUw@mail.gmail.com>
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

On Thu, Oct 17, 2019 at 5:16 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Thu, Oct 17, 2019 at 3:50 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Jeffrey Hugo (2019-10-01 18:16:40)
> > > +static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
> > > +       F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > +       { }
> >
> > I guess this one doesn't do PLL ping pong? Instead we just reprogram the
> > PLL all the time? Can we have rcg2 clk ops that set the rate on the
> > parent to be exactly twice as much as the incoming frequency? I thought
> > we already had this support in the code. Indeed, it is part of
> > _freq_tbl_determine_rate() in clk-rcg.c, but not yet implemented in the
> > same function name in clk-rcg2.c! Can you implement it? That way we
> > don't need this long frequency table, just this weird one where it looks
> > like:
> >
> >         { .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 }
> >         { }
> >
> > And then some more logic in the rcg2 ops to allow this possibility for a
> > frequency table when CLK_SET_RATE_PARENT is set.
>
> Does not do PLL ping pong.  I'll look at extending the rcg2 ops like
> you describe.

Am I missing something?  From what I can tell, what you describe is
not implemented.

The only in-tree example of a freq_tbl with only a src and a pre_div
defined for rcg ops is for the tv_src clk in mmcc-msm8960 [1]
However, that uses a variant of rcg ops, clk_rcg_bypass_ops, not clk_rcg_ops.

clk_rcg_bypass_ops has its own determine_rate implementation which
does not utilize _freq_tbl_determine_rate(), and can only do a 1:1
input rate to output ratio (we want a 1:2).

_freq_tbl_determine_rate() in either rcg_ops or rcg2_ops won't work,
because they both use qcom_find_freq() which doesn't work when your
table doesn't specify any frequencies (f->freq is 0).
qcom_find_freq() won't iterate through the table, therefore f in
qcom_find_freq() won't be pointing at the end of the table (the null
entry), so when qcom_find_freq decrements f in the return, it actually
goes off the beginning of the array in an array out of bounds
violation.

Please advise how you would like to proceed.

I can still extend rcg2_ops to do what you want, but it won't be based
on what rcg_ops is doing.

I can spin a rcg2_ops variant to do what you want, with a custom
determine_rate, but it doesn't seem like I'll really be saving any
lines of code.  Whatever I eliminate by minimizing the gfx3d
freq_table I will surely be putting into clk-rcg2.c

Or, I can just drop this idea and keep the freq_tbl as it is.  Seems
like just a one off scenario.

[1] - https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/qcom/mmcc-msm8960.c#L1416
