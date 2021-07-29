Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569FD3DAB8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 21:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhG2TCT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 15:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhG2TCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 15:02:18 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4E5C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 12:02:15 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w6so9748413oiv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Su69e0VwCDTVXaZGqAhM3F7LtZETVHlakvlYKvoZayM=;
        b=SebcM8G3BBQpdbYfLQP0sdWaVQX0nFTrotqhmuGnCKbjKWaSNqupvYNVRfuM7GhE5z
         LbpWNsB4ztjfjw6ymIQKoHysAEYtFeGSFdsbJ5mQSqQzMdhlctZh2XtEA5M99LcG/f3b
         lMmA1rH5F2+pMRgkFSwb5QYY8Dh708WIynYSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Su69e0VwCDTVXaZGqAhM3F7LtZETVHlakvlYKvoZayM=;
        b=S62+aKX+HjUMlci1aHc4LieBIX/Okn3uwZ7hJ0xwdq9a3uSXKhAmDf4Vykx3fc5hf4
         leTEVrpiO9jtVpocPd5AAQv46KKq8jlMJclMKp3Q3c7OWPSAFg4J1HXSCrIpTysiIjat
         /dd9nFToW7znWRZIdN7mLz2e7Uc+6ZVoruBz3cn/rXfadHzzm6C95lxPwGR6hwdzDQJX
         8cxlStgIdCgZ3DLMnt4G3fr4eR/q0bn+7Okwk7C6QpeRrICP4ou+8RB9of7/RkAWEAmi
         QrQYk3NGtp2Lwy57k+d8nH2QUzwHb0esEdugh3ENEmAUQh921Sv3l0fgW+REaPZvIRkY
         LZIA==
X-Gm-Message-State: AOAM533JVlI5eCIymqDYbvjtWi0jmTojUZNfgpS5ypQY/4VNNf7JJEDS
        J2ubXSgRYRrOgyq037snqtbu4Z1ITDqFQxHoW6jgRQ==
X-Google-Smtp-Source: ABdhPJz7dbzotSQmyoBhO3gVd5uNSdiIKcidtDyg1R8EG+Y9ws7CEIXpDqoO0HYTgqDy8Fs8af2iAnOgsNNuQTnmwHI=
X-Received: by 2002:a54:468d:: with SMTP id k13mr11054293oic.125.1627585334851;
 Thu, 29 Jul 2021 12:02:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:02:14 -0700
MIME-Version: 1.0
In-Reply-To: <308d8f1e-9f23-9d78-42cc-a42ce3463027@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
 <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org> <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
 <308d8f1e-9f23-9d78-42cc-a42ce3463027@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 29 Jul 2021 12:02:14 -0700
Message-ID: <CAE-0n5211NZx43Q0UwHJATYYV7zXPH3WWx66808rEmOgSBDQyg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-07-29 11:57:23)
> On 7/29/2021 10:46 PM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2021-07-28 00:17:45)
> >> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> >>> Quoting Akhil P Oommen (2021-07-24 10:29:00)
> >>>> Add the necessary dt nodes for gpu support in sc7280.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >>>> ---
> >>>> This patch has dependency on the GPUCC bindings patch here:
> >>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> >>>
> >>> To avoid the dependency the plain numbers can be used.
> >>
> >> But, won't that reduce readability and make things prone to error?
> >
> > The numbers are not supposed to change so maybe it reduces readability
> > but I don't see how it is prone to error.
>
> I cross check GPU's clock list whenever there is a system level issue
> like NoC errors. So it is convenient to have the clock names here, at
> least for me. But, I will budge if it is not easy to manage the dependency.

To clarify my statement, the defines can be used eventually once the
header file is part of the same tree. A duplicate patch between clk and
qcom trees is fine or pulling in the clk branch works too.

>
> >
> >> If
> >> the other patch doesn't get picked up soon, we should try this option.
> >> We like to get this patch merged in v5.15.
> >
> > The clk binding is already picked up but Bjorn would need to merge it
> > into the qcom tree to use it. I don't know what the plan is there.
> >
>
> Bjorn, could you please advise here?
>
> -Akhil.
