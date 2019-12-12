Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB6B11D87B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 22:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbfLLVWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 16:22:55 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:43560 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731049AbfLLVWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 16:22:55 -0500
Received: by mail-io1-f68.google.com with SMTP id s2so147704iog.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 13:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rmJb/JSmwLP599MA6+95ChQfw+WGEE+74ZZ6eN1os3M=;
        b=bM7p1YBoVme4Z7buLu8zoz5ghlclJvqlRjXqPKOx0Df4yKB0aCJle4s2SoFuf/3+Sj
         8ytbwFqRzQ+NRXKB4Yg0bn1vbK3fwEppKagnBuiy+N+NMF/WZint3qELtXP1OkHSPOTN
         3yTUUVbtCw961MVV0qjMF05UNyZUBF9DP6L5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rmJb/JSmwLP599MA6+95ChQfw+WGEE+74ZZ6eN1os3M=;
        b=QZJFh8UrzS+nDIM525WoMtVNgoQUJ7/9EV0yn697ohrUtwtD+73/Y8mt6PTZabcvQR
         9O36wHS5VIbDDJsy2LiSY0pVaOvkSx7CoZRF/wYVSfuII10b8I3Cg/CwhuMN4Fz+/BSm
         kTK5YwrwUrDzQtwH3xhY/YkjbQmMGbmv2q2Ty0PO83Px2zQOjB1kHcI1h6iyVnqcn6bq
         o3oSC3IVoHElOYGG5TDRnCD6olE5MrDkzB+YjFRKFxcgFViliHQfb0oJyOoc01kGu2I5
         zJBECFvwzBUlUMaJiu3RGJJf1dCAq7jEGTGxvtKWl2Rkct5wiobpgk4l31XgbGx/Ip1I
         8PFA==
X-Gm-Message-State: APjAAAU93v7HN3KyeyHFjcj8Jyc38RS67u1GzJ6P4n4zlkAUlZNBE3ko
        2J3Y8EmfgsA2VWnj2rcNgQKX7YX6hUo=
X-Google-Smtp-Source: APXvYqx/kl9984HMJFwCgykPIn8A1JIW+1d0UKvpOGObaMpnouU6+pnaJ2iX8pgdl0ZwVK5LtReFwg==
X-Received: by 2002:a5e:9907:: with SMTP id t7mr4919332ioj.72.1576185773990;
        Thu, 12 Dec 2019 13:22:53 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id q1sm1561853iog.8.2019.12.12.13.22.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 13:22:53 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id a22so189594ios.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 13:22:53 -0800 (PST)
X-Received: by 2002:a05:6638:6a6:: with SMTP id d6mr9964231jad.132.1576185772710;
 Thu, 12 Dec 2019 13:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
 <1574940787-1004-2-git-send-email-sanm@codeaurora.org> <CAD=FV=Uy6ryrbpzFg1sesJkWrgh05tLgvtozx0afJPF_u4-ESA@mail.gmail.com>
 <0101016ef9fb5396-c1cefc2e-82fa-4828-94c0-c739cd4cd16f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef9fb5396-c1cefc2e-82fa-4828-94c0-c739cd4cd16f-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 Dec 2019 13:22:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VkV1mnLwxg4cuzLXwXFLt1-NEhi=qc=4sd6sptLcKdRg@mail.gmail.com>
Message-ID: <CAD=FV=VkV1mnLwxg4cuzLXwXFLt1-NEhi=qc=4sd6sptLcKdRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: dwc3: Add support for SC7180 SOC
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 4:00 AM Sandeep Maheswaram (Temp)
<sanm@codeaurora.org> wrote:
>
> Hi,
>
> On 12/12/2019 1:13 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Nov 28, 2019 at 3:35 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
> >> Add compatible for SC7180 SOC in USB DWC3 driver
> >>
> >> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> >> ---
> >>   drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> index 261af9e..1df2372 100644
> >> --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> @@ -1,5 +1,5 @@
> >>   // SPDX-License-Identifier: GPL-2.0
> >> -/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
> >> +/* Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> >>    *
> >>    * Inspired by dwc3-of-simple.c
> >>    */
> >> @@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
> >>          { .compatible = "qcom,dwc3" },
> >>          { .compatible = "qcom,msm8996-dwc3" },
> >>          { .compatible = "qcom,msm8998-dwc3" },
> >> +       { .compatible = "qcom,sc7180-dwc3" },
> >>          { .compatible = "qcom,sdm845-dwc3" },
> > It is, of course, up to Felipe.  ...but in my opinion this is the
> > wrong change and instead we should be deleting the SoC-specific
> > strings (msm8996, msm8998, sdm845) from this file because they don't
> > buy us anything.  To explain how it works:
> >
> > 1. Device tree should have both the "SoC-specific" and generic
> > "qcom,dwc3" strings.  Only the "qcom,dwc3" will actually be used but
> > the SoC-specific string is there so if we find a case later where we
> > need to handle a SoC-specific quirk then it'll already be there.
> >
> > 2. Bindings should have both the "SoC-specific" and generic
> > "qcom,dwc3" strings.  The binding is describing what's in the device
> > tree.
> >
> > 3. Until we have a SoC-specific quirk to handle, we _don't_ need to
> > add the SoC-specific string to the driver itself.
> >
> >
> > -Doug
> >
> Can i remove this patch { .compatible = "qcom,sc7180-dwc3" }, in the
> next version of this series ?

Yeah, drop patch #1 from your series.  I've helped you out and posted:

https://lore.kernel.org/r/20191212132122.1.I85a23bdcff04dbce48cc46ddb8f1ffe7a51015eb@changeid

-Doug
