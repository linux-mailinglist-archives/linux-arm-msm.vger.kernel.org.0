Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B973B2F6F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 01:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731205AbhAOAKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 19:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbhAOAKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 19:10:32 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A5CC061575;
        Thu, 14 Jan 2021 16:09:52 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id w18so14958232iot.0;
        Thu, 14 Jan 2021 16:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s5ahcu3v2MVuo3zeW5uMRThAdBUDPKXNvYYU61ViJ9I=;
        b=VKBPrIpYnYXWPv2Gi/XJn25zjX8+K8yazAvNQnEkXwlGFYOyh6/KQSRP0AI2MGyLti
         aPfHueYC2xldLbkHLQSMhnf4Qdl8buhcjOvkyFDXC/9SJ/BxVjJuM/WAhlrjmnAJ+HnF
         tkIfXxW77kjRqKHitJukz0NhjUFukfMC6yImosyDrP7EGfTMo7lzjNC3FiTWzPDkgq63
         CZLsK1v6uSsxQFrkCFJNpdGgi24I83Gf1c1XcBuWqgbIfUhC5GR9g0cBRRdVTNwVokHK
         fJKi3u1hVaAr7n3XZXd5jU51YC19YMm3rFLtMPArp+Swo1Jufxqf3SdCMBxegpHTNTcl
         SkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s5ahcu3v2MVuo3zeW5uMRThAdBUDPKXNvYYU61ViJ9I=;
        b=W+nFBpZKBjfe0RuiLYNJP1iE/nF+YM0lnD6IMLfiwBUUDiMb+hvzqJlBXeznOLzoHA
         7xEGp/IrI4QsW5kuAJXQ+1Yg5fNdAQvwydcczPpA0Lfqd/psOZOowIlR1QUpYHvj3wZ3
         WzfShiokgRgZBMw3bPN3qA6a4pgtcFGQBFpEX0nYD0kAc9EqY/gMXP49UNIDfokbom/h
         Tb+iSKnGvR9OrGD1mafQQSynSZWBcNBLLWnJ74lDrRShrPUGa0AGXAihUZGHSo+sTVj5
         u11CmAhsbsbPWmjUn/3Jr32PA1nU3ZkAXCfw1T9PJQQxU4QOKIvlq1Eg4UDFDbLmFSPq
         +Z8w==
X-Gm-Message-State: AOAM5313XUTSdE2d0zN2bYIWUDx5aslluwFEDYFZTGQY5KP7j8YXxo/+
        7dUKEDYRofcnHcCQRbUpMWCsjWasa+DWKrAtFDk=
X-Google-Smtp-Source: ABdhPJzJv2544H8hyL4xbmLEwbu03dvdhy7FZ5hh2Q0NWYCYKcpC+vBm12AIw7aDElnq7AmtXJ6U36Y6ToWNJC6lt5E=
X-Received: by 2002:a92:1f09:: with SMTP id i9mr8738065ile.288.1610669392008;
 Thu, 14 Jan 2021 16:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
 <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoVts21FjhhLtZp-0Xdw6-BnrKio_-tuZBRsgapsUdwfw@mail.gmail.com> <25d40e7d-fbd6-697f-7d4d-a7233aeb652c@somainline.org>
In-Reply-To: <25d40e7d-fbd6-697f-7d4d-a7233aeb652c@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Jan 2021 17:09:41 -0700
Message-ID: <CAOCk7NoGPSsimtM03jPAGx9deXWmOFYR=nNBsfO6o-YZ6z8OBg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
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

On Thu, Jan 14, 2021 at 4:05 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 14/01/21 23:37, Jeffrey Hugo ha scritto:
> > On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> >>
> >> The GPU IOMMU depends on this clock and the hypervisor will crash
> >> the SoC if this clock gets disabled because the secure contexts
> >> that have been set on this IOMMU by the bootloader will become
> >> unaccessible (or they get reset).
> >> Mark this clock as critical to avoid this issue when the Adreno
> >> GPU is enabled.
> >>
> >
> > You should go review the last attempt to do this -
> > https://lkml.org/lkml/2019/12/17/881
> >
>
> Thanks for the tip, but unfortunately this isn't possible on the
> gpu_cfg_ahb_clk, as it is also needed for the Adreno IOMMU, which has
> secure contexts that are set up from one of the bootloader stages and if
> you reset/"mess up" one of them (by - in this case - un-clocking the
> MMU), then the hypervisor will kick in and generate a fault, rebooting
> the SoC.
>
> Of course, this scenario is for the case in which you want to boot the
> device without any gpucc nor any runtime pm user of that.. and the
> aforementioned issue makes that solution not really usable.
>
> Again, unfortunately.

Intresting, that's not true on all devices, but presumably you have
devices where it is.  Fun.
