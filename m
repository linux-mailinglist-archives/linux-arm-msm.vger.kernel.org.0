Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EE42697A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgINVXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgINVXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:23:19 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69955C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:23:19 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e2so722667vsr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S1iEr7G6wXs1gVmA5M2ldmVwlSdVZgRm+7L2KYQ7HRw=;
        b=alnS3OCcQ7S+2yaltkJEro5kLzD+B4We6wykhISZjxbRtVRPt+9/3eIPB2RDHXb040
         K9CaGXcxD/SI1gMz374lRVAsDEgiu3D+VY9c9l4xH6Jn6FfxCNKbosw/SqkSVOwToYQ9
         nPgKbRkLeoHpMCMP23KEscI0rwdTbtg9xjUjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S1iEr7G6wXs1gVmA5M2ldmVwlSdVZgRm+7L2KYQ7HRw=;
        b=A+gGRVvab/o6dFyjyH+JTGJaXeB8IuETnJPQ/iLHI0mrjKx0MkKVrskuWEJs7dSu14
         bM0MXIalrXQCt9yWoQNSLSPczuYDPHhJUNFNFj1WR7BAZHV0whIyj1W5aLVvsYDK2BHt
         fZ/90iZ2WVpVMzMy17/aBiHvDkDo8biV80uEDEtq+WSOsrBLQxaRJMN/sIXC8MuThyNK
         DjPttYlf4/+kMatS/L0d4zZlZucYHejnEprbgu7NR/LfHcZkEuHahL0zRm6/sE/9jptD
         NGWuUshpRw+ydAuqsVpYStF7uchT2MJ8yfK1G9F2/k5jHzeYzJcMEnllLF4WwUuGjQ+b
         AYbw==
X-Gm-Message-State: AOAM530EzPx/9t0J6M2s8Fj47tkv2B88mgu5NXml2w0GAclL7xCen6Py
        FHrYiWSpH3Pr0zcy+uyCalG19FWb7V+OGQ==
X-Google-Smtp-Source: ABdhPJxJ0Jm4LT1tXuMk9vjGuU7+yMzmTqEVAjvMZuCs2yCnw9nXfeWViyZK1G8K4TZfscnilRMXrg==
X-Received: by 2002:a67:308c:: with SMTP id w134mr8480235vsw.8.1600118598451;
        Mon, 14 Sep 2020 14:23:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id u23sm1940074vsp.31.2020.09.14.14.23.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 14:23:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id e41so335290uad.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 14:23:16 -0700 (PDT)
X-Received: by 2002:ab0:29d7:: with SMTP id i23mr8338345uaq.121.1600118596353;
 Mon, 14 Sep 2020 14:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org> <1600091917-7464-4-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1600091917-7464-4-git-send-email-skakit@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Sep 2020 14:23:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLLPjntF9oxF2_=Jd3UssRbbaRm=H5SKO--JFUe+_11w@mail.gmail.com>
Message-ID: <CAD=FV=VLLPjntF9oxF2_=Jd3UssRbbaRm=H5SKO--JFUe+_11w@mail.gmail.com>
Subject: Re: [PATCH V6 3/4] arm64: dts: qcom: sc7180-trogdor: Add wakeup
 support for BT UART
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 14, 2020 at 6:59 AM satya priya <skakit@codeaurora.org> wrote:
>
> Add the necessary pinctrl, interrupt property and a suitable sleep config
> to support Bluetooth wakeup feature.
>
> GPIO mode is configured in sleep state to drive the RTS/RFR line low.
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V5:
>  - Newly added in V5. This patch adds wakeup support for trogdor board files.
>
> Changes in V6:
>  - As per Doug's comment deleted interrupts property and sorted the qup sleep
>    state before trackpad.
>  - As per Bjorn's comment canged the commit text, rationale for RTS, TX, RX.
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 54 ++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
