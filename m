Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B79E43DB86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhJ1GxO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhJ1GxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:53:14 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED29CC061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:50:47 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id x8so2689980oix.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RhB5TtItmbKy/D/LyqNoXIL+0hH8TR+DOInrUpggIMw=;
        b=gCVzF7w18KZYdh7OMaO8PnY+A1/tzIc70keDhzT3QKja1NDvBUN1P6F9I8yz38DUiZ
         qT4RFWvnqz9Njflew2bWmL6h2w7sDR5hPlZLM7ZMPzmJYinb/1e2wWEhnFMU6Yk9a1oN
         4DIEYJ3EgJoCZrGMXe+sQsWJzQ3PJVYoLX9K7FG9jGOMXZn5uQxCtuy9mvKpmKwyVgyc
         a4H536GezG14ZcVSlyEPVbgsngQuYbCpr6gCEnVOdRu/s0IxbrBBMUEE09Dm8gLI1GNh
         b2ZvRXjPIjsdCAGf2EwC70gFq5qMl3VrJuJaiqNrX+u0KLf3WFF0hPf28xfPNpMfqP5Y
         khCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhB5TtItmbKy/D/LyqNoXIL+0hH8TR+DOInrUpggIMw=;
        b=mkwSzoq3UeS+s9oGX2Q//iN1Wwx95b/KlcjZ6c4n0gdHLscJv8O30px60uCQ5c7grS
         b8IxfI/c+72+GQXf38G3LUJTe9840KF8LU+05h1iVODUa+N+TwWbxF8PiPN5hPHHCLX7
         Py+UYjf5DZ28r4FWOd2dvMJG9QNJ08tziEHEvzZTd+ItJ/WXuMDeewRhikBecknDLduK
         bIWpgWM9Muqxasm2y9ShF2glp0zpg+ktffUHq0bwNtLTdif2l1o163DIJnz/bMuzZl0W
         Vsvbj3MMnBNN9hJkO2EfcW8HQnmouEkEAgwYxwCVBA/oY/PNnQ6VXc0sEo2Y8dRaQysK
         aKlg==
X-Gm-Message-State: AOAM533pxU28W27IOuXVwu3XV2blnhZ34IHu+OInzOqaN7U10VuulnYi
        cMhabucKpNODMb0tuZWsDIKbZR1lDXo5QeADw1C3bA==
X-Google-Smtp-Source: ABdhPJyeymmM+qgZAtXFNqaIPYKMlBDkkAiHEZ/38LNAPz1A6GJEOJD2WkjwOCYb1KilZ0J/+InDe6JfIs+oII9GWC8=
X-Received: by 2002:aca:58d6:: with SMTP id m205mr7195482oib.126.1635403847232;
 Wed, 27 Oct 2021 23:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211018102421.19848-1-stephan@gerhold.net> <YXZFGFH5lxDKeenw@matsya>
 <YXZL655lHukjar/x@gerhold.net>
In-Reply-To: <YXZL655lHukjar/x@gerhold.net>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 28 Oct 2021 12:20:35 +0530
Message-ID: <CAH=2NtzfTqkwZum3owipC0kHvX2BMRssqRFmFAXPFkXK_SmN1w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Add "powered remotely"
 mode for BAM-DMUX
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan and Vinod,

On Mon, 25 Oct 2021 at 11:47, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Mon, Oct 25, 2021 at 11:18:08AM +0530, Vinod Koul wrote:
> > On 18-10-21, 12:24, Stephan Gerhold wrote:
> > > The BAM Data Multiplexer (BAM-DMUX) provides access to the network data
> > > channels of modems integrated into many older Qualcomm SoCs, e.g.
> > > Qualcomm MSM8916 or MSM8974.
> > >
> > > Shortly said, BAM-DMUX is built using a simple protocol layer on top of
> > > a DMA engine (Qualcomm BAM DMA). For BAM-DMUX, the BAM DMA engine runs in
> > > a special mode where the modem/remote side is responsible for powering
> > > on the BAM when needed but we are responsible to initialize it.
> > > The BAM is powered off when unneeded by coordinating power control
> > > via bidirectional interrupts from the BAM-DMUX driver.
> > >
> > > This series adds one possible solution for handling the "powered remotely"
> > > mode in the bam_dma driver.
> >
> > This looks good me me. Bhupesh/Stephan what was the conclusion on the
> > the discussion you folks had?
> >
>
> Basically I said I would wait if you still want to take this for 5.16. :)
> There is a conflict with the DT schema conversion in Bhupesh's series,
> but it's trivial to solve no matter which of the patches is applied first.
>
> Since Bhupesh still needs to send v5 as far as I can tell (and has a
> much larger series overall), I think it's fine to apply this one first.
>
> Bhupesh, you can just copy-paste this below qcom,controlled-remotely
> in your DT schema if Vinod applies this patch first:
>
>   qcom,powered-remotely:
>     $ref: /schemas/types.yaml#/definitions/flag
>     description:
>       Indicates that the bam is powered up by a remote processor
>       but must be initialized by the local processor.

Sure, I can respin my v5 with 'qcom,powered-remotely' property added,
if this series gets applied first. Can I add you S-o-B to the same?

Thanks,
Bhupesh
