Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A9D1B61E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 14:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbfEMMix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 08:38:53 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41617 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfEMMiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 08:38:52 -0400
Received: by mail-qt1-f194.google.com with SMTP id y22so11013801qtn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crSUv5H6P69IxzlT9Dzg2VCf7w3w/bVJXLfp7t6XXVI=;
        b=FYcDKAyQ4xDln7s4L02T2bgbqqE98ZDhKvDJrrQcV+hHKS11OTOCS+/3Fj+WzRhb1V
         D4IM9b3ph290ckg1VoGiFhrPPDHJJH883c5Vm8HJrFaoRWcyCFTG4ZMgEMefBRwRanLM
         K6IdDQxsVbrL4cba8IaKZGCr7VtDhjgkKFRBZunZG81srPXOjfHG2ebqi5ZKRnNU+ZGf
         lk5IUXIKKZd9EHt3fWn6mEqPN6TX6Iko65eQTkwpP0EooQFc1mzoKYRmXqlZh8wlTXsh
         BCdkQATDnytZpbN1f0hZUfq+3WjMjebb3hOhODgV883J1629hMZzCIdMFbMxztjgP81q
         W5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crSUv5H6P69IxzlT9Dzg2VCf7w3w/bVJXLfp7t6XXVI=;
        b=BWPk8Gr/ctMb+VRGYjRBa3pCxTLTz172UgEgiiGKAiW4MDIg/kumLv/Qb3/R699qzh
         dHrhmZWjvwI/nObqt99sjgL+JAEPfsi7UN8YodvkwcXNkDGAgY2/dOZ0CA4EplI/YE+C
         5bJrEj86hZll1FxER2lRRWkm/+7c/GwXoLv+A5L/+OFDPNlRWd0hPnS7Ent2WJczJLco
         P4LW4ogrd69qFfDJ8ishhJYlhSgvrevLFh/D1TUe6Hok20kL0D4+UhMVViqfzziUzwju
         rXCUL3IUC/++aQ1yMXr+gkzLy0hiJPX1+NdYEqCz+Ssn5OVAvgDFo/HTcu5JgPk98woN
         Tm0Q==
X-Gm-Message-State: APjAAAVfXuRA0LRCH19DVGMGGv4x8LwTpdJTM/tfF830IPXQQxS7DyrK
        w7YHu8rowNWsRGHBQcai2L6095a9suB5IbBAHxJmmw==
X-Google-Smtp-Source: APXvYqywQgossQwFmG5Ly/2D/VyGN3ByHJv/hIaF12lmEyl/TqH5uFuJQFFJHHQS0cxHZgxj5Ty+J0YIEsoRGHTmCjk=
X-Received: by 2002:ac8:a81:: with SMTP id d1mr18924863qti.276.1557751131755;
 Mon, 13 May 2019 05:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <0afe77d25490b10250f9eac4b4e92ccac8c42718.1557486950.git.amit.kucheria@linaro.org>
 <3de9c573-5971-15fc-1632-706fc30e90c2@free.fr> <CAP245DU7=h=t1_QoM9nMGE-Amduuh+GPQBnmEEG+NGDdXCiR=g@mail.gmail.com>
 <8292f259-d28b-9b37-d58e-3afb26da0646@free.fr>
In-Reply-To: <8292f259-d28b-9b37-d58e-3afb26da0646@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 13 May 2019 18:08:40 +0530
Message-ID: <CAP245DXpB8tSXRiOZ=w2_RJ4jRUt-S0Rx5xkPE-4cYdfHp_DEQ@mail.gmail.com>
Subject: Re: [PATCHv1 7/8] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 8:41 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 10/05/2019 16:12, Amit Kucheria wrote:
>
> > On Fri, May 10, 2019 at 6:45 PM Marc Gonzalez wrote:
> >>
> >> On 10/05/2019 13:29, Amit Kucheria wrote:
> >>
> >>> Add device bindings for cpuidle states for cpu devices.
> >>>
> >>> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >>> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++++++++++++
> >>>   1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >>> index 3fd0769fe648..208281f318e2 100644
> >>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >>> @@ -78,6 +78,7 @@
> >>>                        compatible = "arm,armv8";
> >>>                        reg = <0x0 0x0>;
> >>>                        enable-method = "psci";
> >>> +                     cpu-idle-states = <&LITTLE_CPU_PD>;
> >>
> >> For some reason, I was expecting the big cores to come first, but according
> >> to /proc/cpuinfo, cores 0-3 are part 0x801, while cores 4-7 are part 0x800.
> >>
> >> According to https://github.com/pytorch/cpuinfo/blob/master/src/arm/uarch.c
> >>
> >> 0x801 = Low-power Kryo 260 / 280 "Silver" -> Cortex-A53
> >> 0x800 = High-performance Kryo 260 (r10p2) / Kryo 280 (r10p1) "Gold" -> Cortex-A73
> >
> > Hmm, did I mess up the order of the big and LITTLE cores?
> > I'll take a look again.
>
> Sorry for being unclear. I was saying I expected the opposite,
> but it appears the order in your patch is correct ;-)

OK :-)

> Little cores have higher latency (+5%) than big cores?

No, that is a result of me naively converting the downstream numbers
into cpuidle parameters for upstream. There is scope for tuning those
numbers with more instrumentation. My hope is that we will attract
more contributions once the basic idle states have landed upstream
i.e. change the story from "cpuidle isn't supported in upstream QC
platforms" to "cpuidle needs some tuning"

Regards,
Amit
