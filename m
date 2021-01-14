Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B122F6E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730844AbhANWo6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730835AbhANWo5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:44:57 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403F5C061575;
        Thu, 14 Jan 2021 14:44:17 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id n4so14482767iow.12;
        Thu, 14 Jan 2021 14:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkhyc2t9glEsHQiUVXVw+wftpHcvqftfhtLebN1B4GM=;
        b=aDpVHRhIa0UQiPZpRGsIZu6jTc74AQlrsVgPq/p7fzooPuQnPybSmezFI0Uo4uptc8
         OIOExYULGmcuo30er7nPC4z0fFmqWyMc4q3inwmqv5PQtZ1gOjWDE7ZosukzXSSkqlnh
         4zkh58YyElVvTt4Liz26Ex39c3YHlE46COyjYYvPZglJCAVo4HwlgdMz1dfbnUzQxD9P
         8I1641COoEaAYF193YHaFmT82roJZU+0vfXxapT1bTorPgDa/gfxVB3vQtWzmaHmLFIF
         PRwgS8Ml6WXo4Mgsg0WJpahVgTsiFGRyPDFWDjsuq/4wFtWJYSOLBn0vcqtPj0MSzuos
         cOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkhyc2t9glEsHQiUVXVw+wftpHcvqftfhtLebN1B4GM=;
        b=sTpgTdBj7Is3wc7meUON8FBKTkKgUFQvIbfcAGnTFGeOb4YsO/IvvRSXSZNTOxcYbz
         S38bprwFyzn0JLIkwkixDF+30g8aN38GPxv8xETBd9jG062M/FNjVhdhMPRFKCMTZ+i2
         QvNpUBZKtlVtylq0bBzaNztGAzkS1i0kUSkCYgeck6XSkcLRxJYkAerZLuo5nw28TazR
         hKWfIFh9jWEkixUD021Mo26+0wtPZigFcFPjfn4QrvaApcSEb3Di5sjXGuoyO9uADO6K
         sH+tRWrqr40WbbfffwaewR2djSrEacdf/rs3oSOy5HAP+S5m+qQgrrlfXTfQft1i4IEb
         v4jQ==
X-Gm-Message-State: AOAM531RVLB7ZdZ2/MIgn4CVjtRwjt6KdmowSChzDcbRHQexnyFVQALa
        WbkN1UtHLAE0lwEFyqrwplNID5KY5B+Uov0oqTk=
X-Google-Smtp-Source: ABdhPJyjNshFtC2R8KjGh5aliFkbeTYnXidFEFmbprWnRP4gnd85hPFaXEittR8O/zDFoO3Fm5KYtO/Z6yydbR/wUd8=
X-Received: by 2002:a5d:83c8:: with SMTP id u8mr6727380ior.160.1610664256671;
 Thu, 14 Jan 2021 14:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com>
 <9942f98c-c186-5cd0-d6ac-a18a4e20583e@somainline.org> <CAOCk7Nod9a+5EUUWGpso+EBb2dJVLMvjrOoMpqeTcm+L6mxvtQ@mail.gmail.com>
 <b5f6095d-ed74-26a9-a485-df0dc1203f8e@somainline.org>
In-Reply-To: <b5f6095d-ed74-26a9-a485-df0dc1203f8e@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Jan 2021 15:44:05 -0700
Message-ID: <CAOCk7NqJ7=Rpwzx9ZQ9p=YHrxYeE69YphRq3BbzFwK_TyiVGFA@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 14, 2021 at 3:40 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 14/01/21 23:33, Jeffrey Hugo ha scritto:
> > On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> >>
> >> Il 14/01/21 23:12, Jeffrey Hugo ha scritto:
> >>> On Sat, Jan 9, 2021 at 6:47 AM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@somainline.org> wrote:
> >>>>
> >>>> This clock enables the GPLL0 output to the multimedia subsystem
> >>>> clock controller.
> >>>>
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >>>
> >>> Any reason why you are not also adding the div_clk?
> >>>
> >>
> >> Yes, just one: I haven't tested it... and my devices worked without.
> >> Perhaps we can add it whenever we find out if something really needs it?
> >
> > I'm mildly surprised you need to turn on the gate to the PLL0 out, but
> > not the div_out.  The div_out/div_clk is also fed into every RCG that
> > exists in the MMCC.
> >
> > Per the frequency plan the following RCGs require it -
> >
> > cci
> > cpp
> > fd_core
> > camss_gp[0-1]
> > jpeg0
> > mclk[0-3]
> > csi[0-2]phytimer
> > dp_gtc
> > maxi
> > axi
> > ahb
> >
> > Also, I'm very interested in all things 8998, and would generally
> > appreciate being added to the to: list.
> >
>
> To be honest, I was surprised as well because.. yes, I know that these
> RCGs seem to need it, but then their clock tables don't contain any
> reference to the gpll0 divider, hence it's never getting used - and that
> works great, for now.
>
> I am aware of the fact that the clocks that you've mentioned are using
> the divider to reduce jitter, but I haven't done any camera test on my
> devices yet: that's definitely in my plans and I really can't wait to do
> that (as I successfully did for SDM630/660), but... we have more than
> 100 patches in our trees.
> We need to get upstream in the same working order as what we have here,
> so that we don't diverge that much and our work is kept in a
> maintainable state (avoiding to lose pieces around).
>
> I'm sure that I'll send a commit adding the gpll0 divider branch as soon
> as I will start the camera work: I feel it, it's going to give me issues
> without, in that field.
>
> By the way, noted. I'll make sure to add you in the to/cc for all of the
> next series regarding 8998 that I'll send.
>
> Meanwhile, you may want to check out all the recent patches that I've
> sent, as like 90% are MSM8998-centric... :))

I noticed, and I'm excited to see additional work since I've had a
lack of spare time, although I think you've monopolized my backlog  :)
