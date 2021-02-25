Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA0325550
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 19:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhBYSQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 13:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbhBYSQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 13:16:30 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22659C061786
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:15:49 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id f17so6571040qkl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h3fwbXygeyIRtetl3DiiCp4YUNibdxC6uA+4PbTm8ew=;
        b=iFa/j1SpISBk8SXub5LbKDZPN1y0LW0+uOxFmZ6XWwz/fGZFn//8rKYRpWk2HOdpw9
         CUGvDRRDG+IRLZNpCBqP2Lzn4dv3Mgzx+3EvFFodEb9qD8B64OOpQ2taYkxeSueXJ2BE
         aBHZkEiP6O471okysrdPd1mwM/fmzy2oGdons=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h3fwbXygeyIRtetl3DiiCp4YUNibdxC6uA+4PbTm8ew=;
        b=YUJrxat6nBv16VoQCiNvW2/pDMvZWBxKJoe1oB76xFrdAX9kboYwGBdUg7Cel4TyLr
         spzoTtD1+sGW/mHOc6Qu6JfJg9UnVcAGuIIa/RaD0TBXH7ZYYerJ5stUqYKZH6ubswHK
         U3Lqob8bRbFBYq2+S5PHcDnCf2Fz2Npo0r8WkDUIKwU/5yWs7s4Y5u+lFRH4v4cMkQRl
         4+6U9+uoBTeyYzkoX9owqBc35/WXpxjYq/oCDzK/WGOM7yRX3ivzOLVUOTkwjFb7Busg
         hsE8bQ7xMYki1yJEgCjoMp4x32aJm6y6bTPFQhUjhbqxPJ0hohSOex3vbtQAvYn+35+p
         44VA==
X-Gm-Message-State: AOAM532kwup6v6bzzBTwl2DGTO6rR+3m8lKCGrHea3dQIhMRvRRZOkgw
        c5q2u8jrAfaY591gjx6YKQpY8vO6ELMvzw==
X-Google-Smtp-Source: ABdhPJzAem4a6NQDY2bCZB1Ci1XBWUeX/kRExtBqyqtsYCtCPyyvqHZq8GfftwpaR503IpC1k1yYqg==
X-Received: by 2002:a37:82c4:: with SMTP id e187mr3962737qkd.181.1614276947835;
        Thu, 25 Feb 2021 10:15:47 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id d27sm4517738qkk.34.2021.02.25.10.15.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 10:15:47 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id x19so6360966ybe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:15:45 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr5897553ybf.345.1614276945234;
 Thu, 25 Feb 2021 10:15:45 -0800 (PST)
MIME-Version: 1.0
References: <1603831083-2025-1-git-send-email-sanm@codeaurora.org> <1603831083-2025-5-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1603831083-2025-5-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Feb 2021 10:15:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFtWkfP30bPZB9SO5KLX_OLVNw0Fv3efZMHEzRg7PtVQ@mail.gmail.com>
Message-ID: <CAD=FV=VFtWkfP30bPZB9SO5KLX_OLVNw0Fv3efZMHEzRg7PtVQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sc7180: Use pdc interrupts for
 USB instead of GIC interrupts
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 27, 2020 at 1:38 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Using pdc interrupts for USB instead of GIC interrupts to
> support wake up in case of XO shutdown.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index a02776c..a2c56528 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2687,10 +2687,10 @@
>                                           <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>                         assigned-clock-rates = <19200000>, <150000000>;
>
> -                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 8 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&pdc 9 IRQ_TYPE_LEVEL_HIGH>;

Is there any reason that this patch can't land?  I'm not sure what the
current status of everything is, but it should be fine to go through
the PDC anyway, right?

-Doug
