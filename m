Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4BBA1406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 10:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfH2Isk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 04:48:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35135 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfH2Isj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 04:48:39 -0400
Received: by mail-qt1-f195.google.com with SMTP id u34so2818391qte.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zMYasvwvJSOlUawu9XgM9g2TZzoppz6gZllm9KotKE=;
        b=SHZ9YgeyfCMnhqlOYfjPzfUSq1BNrP1DU/i9TUQBQF5OxqXyYXFbD3KXCwEOnPeA9c
         71IF+x2HqEnqDJjtx3sQ8JNZRIoc4n0DkM6tPqcjTXAclxoj2axWpdPIm/GILFF5sqvV
         I1Rtjsp1Aau4Ox+y/Z3P8ANJk7ugFKmHEbk+DWR25g0QLrrX7MhO99/okNsqLhcX7sZe
         Zv3aMcHI9NL6UYsDsPPhRH637K0OTyfvpMkDLPysG4poicXhoDUeLGQgZYLpuiBCFhQ0
         JSQefxcGPF33JB1eO3tomQetKOKEC4cwOdg7Xx6IrIidmf4qk5MZqWfG2ws4KkNrECVC
         dqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zMYasvwvJSOlUawu9XgM9g2TZzoppz6gZllm9KotKE=;
        b=aasFbbC6tnulhuf3zipH2ZqZWg2kMnAYMqgiU4jFDUqqDGbr6iTI9qlQdNP4mD2NQ3
         VGVN1kTpOrkSg4ipr+va9ZYJPHNU/LQzA5uYGq+oUFz83yTBRfMRCGx0A/ulHKhq89kI
         mZAfbyGuYBcAmvQQOVBnbx2LcEJtTcztDmxa0jB6Nr2vQzuxBsRT1B0MtKrO/7+WZHeL
         X0kAIo2+Y6tyDZHvZyhpcG1CQzY/phE9eIem27EM10Pc0niLD0C2z99ayIE2ND2KOj3T
         6335BPjhOEpUUKR7ufM3Uw8fHGZYYvU9HQ8Ke51gzwOSdRpC0ANVyO9dr/QaCkuIW/98
         mpOQ==
X-Gm-Message-State: APjAAAVrcmx574Wa2d+SApd5o5SH6eAsypa6oE3QSr0spSJmptfsRuxR
        7/rBObublWxc4tDVe9cAI6nY2+F+L+gSRPRxGQ2J2w==
X-Google-Smtp-Source: APXvYqzjzN2EG+az7+HCU8fERqdhPqrzGKY2WH86fhF6ux/sDMROPXd1/G1j4VoryLHc4mDvNkJkhfATh7/XtrFc9S0=
X-Received: by 2002:aed:3287:: with SMTP id z7mr3594931qtd.264.1567068518675;
 Thu, 29 Aug 2019 01:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
 <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com>
In-Reply-To: <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 29 Aug 2019 14:18:27 +0530
Message-ID: <CAP245DWWKsZBHnvSqC40XOH48kGd-hykd+fr-UZfWTmvuG2KaA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support
 in tsens driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brian Masney <masneyb@onstation.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 28, 2019 at 6:03 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-08-27 05:14:03)
> > Define two new required properties to define interrupts and
> > interrupt-names for tsens.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > index 673cc1831ee9d..686bede72f846 100644
> > --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > @@ -22,6 +22,8 @@ Required properties:
> >
> >  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
> >  - #qcom,sensors: Number of sensors in tsens block
> > +- interrupts: Interrupts generated from Always-On subsystem (AOSS)
>
> Is it always one? interrupt-names makes it sound like it.
>
> > +- interrupt-names: Must be one of the following: "uplow", "critical"

Will fix to "one or more of the following"

> >  - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how to specify
> >  nvmem cells
> >
