Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B41D412F05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 09:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhIUHGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 03:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhIUHGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 03:06:35 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19CAC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 00:05:07 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n71so6303836iod.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 00:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SsmL0WKAVxLfgLjksTlJVpFN2L2RjVwfzK4075Lqx0s=;
        b=mi7fqk4xiOvToJcuULnXbnWiI2KzK8En+qASDWqZv4B9alZD447JcHs4k3jPaQKXfF
         2SVWmOoyPtRy3Xxj+roWaW+D5GLfDNqh0RmZEprVUtaHGDUYdHD2/96leSue802RNtEP
         pBIR81JNg3Gu1eVuWvH+D82ujl7v+ZtY46H7/4u0x/QYTsu5EdjAf+mVJ1nnrNolhVXP
         r65SzuiwmFnilHSQfxmQ31qfb+atSN3EPuItgY35XkgL49P8VGDHOqlziSDH6yGzuz+Y
         v3wn4dDtCka97QAnD/vQm43fPbU/QTdyMVfQXn+NE8FHd8cdKVRtoRBYuFjK6BvWxJN9
         4m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SsmL0WKAVxLfgLjksTlJVpFN2L2RjVwfzK4075Lqx0s=;
        b=J/mPP6QvIPdL1MqSalWoNTnikeONO7AUeb4OtzB3xFbDZMzEQk6M5YywUyUEY8kijv
         pkwA7WVkzIQMy+Ttr2Lys7pARi+58yM9amkNAY3p/XqbrHSv9ky5xpKaNXSRQLObBlYA
         S0O0XrjzLaoIsFNqAVhVVibsr5cAHP/QGVvalPHBW1fqqF3DFOGZQl/15u9vwFaiWSi8
         mN2kFvBohhxK+EaHs12EZWxPdZem3lN8A4x+HDtBwhM4QHVHqD/wzGpObERyjO7SqlTb
         aNBhVkslN8gMPt7jNzkMvuKGav/YR9oJfJwKobbYM6iqNx6Fv84CwLNJEhZ16HesLS6A
         dk4Q==
X-Gm-Message-State: AOAM532xV9G2fm+BNM6pAgLoiwirAnIpTqQHYezZDpz+WsMcSOrn+I9m
        DwuMmmnOW6yts18Zqkf172lsYIXvhs4wCzvQGUQ+jw==
X-Google-Smtp-Source: ABdhPJxj8RfHKE7SNV5ffPZA+/zaVUdv408sN5kyTOpoZr62NsmvJKJWNeKpjf4Ah1oGq7gD8pnz4dAVJAEjGwPJ+6s=
X-Received: by 2002:a5e:d513:: with SMTP id e19mr21113122iom.82.1632207907221;
 Tue, 21 Sep 2021 00:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd3k2snB4-=M57pVrMVom=a9_2a0DTFk-+Hzpubwk-Pr9Q@mail.gmail.com>
 <64a2a428-8bb1-0078-2403-1ca8e28cf4b1@codeaurora.org>
In-Reply-To: <64a2a428-8bb1-0078-2403-1ca8e28cf4b1@codeaurora.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 21 Sep 2021 12:34:31 +0530
Message-ID: <CAMi1Hd2MCxJgbHz9oGWe4L+MXNM3p+Xntpcg6t3TvZxwjJTy0Q@mail.gmail.com>
Subject: Re: dwc3-qcom: tx-fifo-resize regression on Poco F1 (sdm845) with v5.15-rc1
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On Tue, 21 Sept 2021 at 02:44, Wesley Cheng <wcheng@codeaurora.org> wrote:
>
> Hi Amit,
>
> On 9/20/2021 1:45 PM, Amit Pundir wrote:
> > Hi Wesley, All,
> >
> > I see a reboot loop on Xiaomi Pocophone F1 (sdm845) with TX FIFO
> > resize patches which landed in v5.15-rc1. Upstream commit cefdd52fa045
> > "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default" to
> > be specific, which switched on this feature by default.
> >
> > At times the phone crashes into the fastboot mode after the reboot
> > loop, but mostly end up booting to UI after a while. This is what it
> > looks like https://people.linaro.org/~amit.pundir/beryllium-userdebug/PXL_20210920_162749483.mp4.
> >
>
> I believe Android will attempt a number of bootup sequences and if it
> fails, it falls back to fastboot mode.  Are there any available logs you
> might be able to collect to see where the issue is?

It is a stock phone with no UART access, so I can't get early crash
logs unless I'm booted up to adb shell. I can try getting some info
using pstore-ramoops but warm reset support for sdm845 was not
upstreamed when I tried using that the last time.

>
> > PocoF1 does support TX fifo resizing as I can see that in the
> > downstream dts. So maybe it is the tx-fifo-max-num which need to be
> > adjusted for the device? I couldn't find the tx-fifo-max-num
> > equivalent in the downstream tree though
> > https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/dipper-q-oss/
> >
>
> I assume that you've already confirmed reverting that change resolves
> the constant reboots?

Yes reverting that change resolves the reboot loop issue. Speaking of
which, since no other platform seem to be running into this issue and
"tx-fifo-max-num" property is apparently not at fault either, is it
reasonable to skip adding "tx-fifo-resize" property for PocoF1 using
of_machine_is_compatible("xiaomi,beryllium") as a workaround?

>
> > Curious if you had any ideas what might be going wrong? For now I'll
> > keep digging around tx-fifo-max-num, but I figured I'd ask just in
> > case it's obvious to you.
> >
>
> The tx-fifo-max-num parameter should still be set to 6 for SDM845, which
> would be the same for more recent targets as well.

Ack.

Regards,
Amit Pundir

>
> Thanks
> Wesley Cheng
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
