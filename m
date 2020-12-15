Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4ED2DB05B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 16:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgLOPo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 10:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730307AbgLOPnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 10:43:31 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80738C06179C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 07:42:51 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id u7so11195431vsg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CmsUX0s95ydXWZbyak8VMyE/dxsCO/YhYqW3BW3PGXY=;
        b=EM+cWPNF7BpAlMNl5IqVB6YXP5Yt2mjNaCDGRnga6SX3e3b9pObq7FB/BmYN5yX48y
         tCaYvUNte4AHGzcz7iLohWil9pKhgPiaALLYCjOYDLQ4slVmuwOuc/W2KyOyuZap0UPY
         qKQ7htVixW9yVzOa6KqE/L420vQ4oBg9fmCM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CmsUX0s95ydXWZbyak8VMyE/dxsCO/YhYqW3BW3PGXY=;
        b=Ej3jvtPEaaklhQkKFFzP32XB5rw/Hhq2dx48/2PvFsF5O5TUonRKBROp55X1QeJAG7
         AlEIcT1kEBcaiJPBVnC6GZn5FS1rAFxeYbsZESbeisZSqMi9zti7wilxCrayb0gBPkEj
         QHwJkclpqyjeOcLsRTUZl1/CxgnC5emFnGsCok4KvZPL1WM1hIrFMhHPVlO6/JfP7k0c
         O97kJx9xMlg1+xSiX1gZu4S2j3ew6HwdzrocrdZ360zl5EHr463hhpDBoYIqJSEvQxEY
         +IsD+MxdRk+lFN4nPvXtowNgwr6OQlnVOp4LOXKI9Iy11slaDaVC0VXyIaF1PhcwiQHE
         16tA==
X-Gm-Message-State: AOAM532vQwOhu2tFkeD2m4JtXyTL43k8TWgacU4ZbTXVZj1lBJUJDh57
        zfySYZcnYOkdS6xCDmXg3/uYTm0fgtn1Mw==
X-Google-Smtp-Source: ABdhPJzd4G1YICcSvkAbrmmooNZ5ldMt38DCRR+CM9xkBsRDgxfx34KfKCszNumgQQp6E/7Wq+v5TQ==
X-Received: by 2002:a67:f14f:: with SMTP id t15mr28078878vsm.0.1608046970532;
        Tue, 15 Dec 2020 07:42:50 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id q23sm2659640vsm.27.2020.12.15.07.42.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 07:42:49 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id e15so9699152vsa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 07:42:49 -0800 (PST)
X-Received: by 2002:a67:bd01:: with SMTP id y1mr21909045vsq.49.1608046969145;
 Tue, 15 Dec 2020 07:42:49 -0800 (PST)
MIME-Version: 1.0
References: <1608025150-10779-1-git-send-email-manafm@codeaurora.org>
In-Reply-To: <1608025150-10779-1-git-send-email-manafm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Dec 2020 07:42:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0cVz6XgFnctGHcu1sNABAJsnBy8PPYjOSO5wKQGR7RQ@mail.gmail.com>
Message-ID: <CAD=FV=U0cVz6XgFnctGHcu1sNABAJsnBy8PPYjOSO5wKQGR7RQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Enable passive polling for cpu
 thermal zones
To:     Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 15, 2020 at 1:39 AM Manaf Meethalavalappu Pallikunhi
<manafm@codeaurora.org> wrote:
>
> Enable passive polling delay for cpu thermal zone for sc7180. It
> enables periodic thermal zone re-evaluation on post first trip
> temperature violation.
>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 98050b3..79d0747 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -4355,7 +4355,7 @@
>
>         thermal-zones {
>                 cpu0-thermal {
> -                       polling-delay-passive = <0>;
> +                       polling-delay-passive = <50>;

Matthias already landed a similar patch, see:

https://lore.kernel.org/r/20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid

I guess the question is whether 50 is better or 250 is better.  Is
this just a finger in the wind estimate or do you have data showing
that 50 is better than 250?

-Doug
