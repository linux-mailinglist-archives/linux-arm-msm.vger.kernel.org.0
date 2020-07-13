Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6805521D80A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 16:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgGMOON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 10:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbgGMOON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 10:14:13 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0CFC061755;
        Mon, 13 Jul 2020 07:14:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ga4so17369906ejb.11;
        Mon, 13 Jul 2020 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIZxje+MAG8HbWvvUc6uH3FVOHItPs+CHk8GbtDOk8s=;
        b=h+yIc+JccePabEpzp8I+pesSbr0m/WLujDxYsdjf+9DXMasZsalm91neD19Ivz6u5G
         cdJOx/+AN0f1eZmadGkvokecJppcr3fIl9jirgr4LS66G/c1gM5eahuei+G2+foVs49c
         wLFvLLiEofL9DNPUS9ezarBzYtL9yX8/WwbvmyKseNxcURxm8eVAMo5jfqqWf+dcWELZ
         tC2sbb1nLzOGKadrmUFv2291VTpzkcLwJYQdm5gGbhsqH2rrpikjrZXgCWmI7OgR11gL
         HlAabodB/rBX0KVZKOtpMzIhvXVq/MHCUZcb52SRnXVacSLDA1SSLG7FV8pGh7hYpe9U
         cEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIZxje+MAG8HbWvvUc6uH3FVOHItPs+CHk8GbtDOk8s=;
        b=QWBQKUE+Qu63Gz+UwPNRK37mfHypk0jZeIeK4J9q8J9q/SKGQUPUa1fKtJeYA7O3YT
         7QIqNdRxaZd0wgWcekKZhIkoUqSCt+dtRgjQLh370rFKDcS5ElDGqsZe9/YyDSH5Dl3F
         ssc4zMkzlzCvUTfPqqaFmUpE0Ih9QVQFb6KYMugaiHBmT3IP9A9hiarplXyZbqociHIA
         eWvUthgBhcWGwJfB93RVovlcZpbRwp3w6taNwxp7vQslNq76pn/RR4+oIITWPup3WvFK
         ZxzTSvcNYjAz37p7znhfEWCI7AsqqcaAKo+WltGyKp+H4YJkmf5dTVXmIXFegn60fCwA
         eUFg==
X-Gm-Message-State: AOAM531Vkq1WWyZy8V80ph5BIW371lIHwpRgjR5pKcHrhwbSP/Nuu9cn
        mNT27TDOAOpMP1PHHOvMCg22YNvMTHgo4yl4n9KwmsRv
X-Google-Smtp-Source: ABdhPJzRe9teOUkzh2Dfta6zb49ZDUsatOfn8+cgv5TYh6kQrSWbSloCSg2Xc8sRSHFDK4FawOk5qifcPpSE3vTVWrA=
X-Received: by 2002:a17:906:1187:: with SMTP id n7mr67254807eja.161.1594649650550;
 Mon, 13 Jul 2020 07:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com> <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
In-Reply-To: <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 13 Jul 2020 07:14:42 -0700
Message-ID: <CAF6AEGvhVLY=2d7Qbp2qXmLX-ywtN1jkydhHkVesREF3ffRjYA@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: enumerate second cursor pipe for
 external interface
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 3:18 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-07-10 22:19, Rob Clark wrote:
> > On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > wrote:
> >>
> >> Setup an RGB HW pipe as cursor which can be used on
> >> secondary interface.
> >>
> >> For SC7180 2 HW pipes are enumerated as cursors
> >> 1 - primary interface
> >> 2 - secondary interface
> >>
> >> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 8f2357d..23061fd 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -117,10 +117,10 @@
> >>                 .reg_off = 0x2AC, .bit_off = 0},
> >>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> >>                 .reg_off = 0x2AC, .bit_off = 8},
> >> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> >> -               .reg_off = 0x2B4, .bit_off = 8},
> >>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> >> -               .reg_off = 0x2BC, .bit_off = 8},
> >> +               .reg_off = 0x2B4, .bit_off = 8},
> >> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> >> +               .reg_off = 0x2C4, .bit_off = 8},
> >
> > It looks like you shifted the register offset here from 0x2bc to
> > 0x2c4, was that intentional?
> >
> > BR,
> > -R
> Yes Rob, the offset was wrong which i corrected in this patch.


Thanks for confirming.  In the future, it would have been useful to
mention that in the commit msg.

BR,
-R
