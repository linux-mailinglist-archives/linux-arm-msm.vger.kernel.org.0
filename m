Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE23358F62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 23:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhDHVl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 17:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbhDHVl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 17:41:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6966BC061761
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 14:41:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n8so6447193lfh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lovVRYDMCrmQr35MOmEQNArT8X6dRKP4z/7vuxFftj8=;
        b=Zl5gQV8vF/H2Up0OGisn1jZyzmSAQmBLAyCjJr58ywKU6drNqMtx+3vFyntbkafr+J
         sgHHVjhHlavHKCObbH3PxF6AD24N1bfVNLKsHtW2H+ZZL07kKug3XKtLjuUH/eOc+h8U
         UD/MQe5/uXeasF1f6QPIYPhQ12wdQvvZLK6RZ9Ciwgz9Vs4r4++AU3BjvLBaUyhE0+F9
         hNIGevuyRZtuq9H4ei+LL2Fa8zIiT3agwDB5NYVtX8xOg09gPydQH8iexb21QAr/Y6Wv
         Ty6ueBC3Da/WiHdkvaC6Njdf0Ujbl4LqeBxHaycG/INaUdxKqKr9HXiLt03+JXb51s74
         72EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lovVRYDMCrmQr35MOmEQNArT8X6dRKP4z/7vuxFftj8=;
        b=WtWCczxOx9RA6gVSjIvHHjO88kwzyDrRa5sCebNyRdiBRWJcKRckyYjU0zu2tCWQbp
         1zsRPfeRvWwIRWp8B65raUiugL5r2PTUlwJHlSqXKItU+z8rNL2L/d/BIfc/qp5MhOl7
         Af98JrL5xEeVzFwEMFqGGRNreZ+fRTcViy0a+r7rl4kueLvrzy9hkJ0DNFb7JzgQz8SK
         CUNdDFTvtaurbPEt1Rt15CzCTKVBq/o81hTLVOtyTQJKyuIOsBVT3FjStnloi9t0eg00
         GhlQn4IDvVMu9rB2WYqIcwFACui7P3445yD93Dl6aBEQJIDEiG9Djaow01AdPYFfP+5m
         AilQ==
X-Gm-Message-State: AOAM531235MkuLg9zVrCcU5H5eQWCKFoHXUxo4KGdpvfOUcRfFjdG+o4
        KuH1/NibSSakU4GkPRJzDELW2YAAlq7m2/KqhLUIDw==
X-Google-Smtp-Source: ABdhPJxcGrzxNuMjWggN3LPX6qCyslPcVVy5TwyjrTf/E9/lbetDAeYjzYqp6RtE5WF3xgPZlLpT9B3d3HVmYJ4HGpk=
X-Received: by 2002:a19:ef19:: with SMTP id n25mr792331lfh.157.1617918068947;
 Thu, 08 Apr 2021 14:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210405200259.23525-1-petr.vorel@gmail.com> <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik> <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
In-Reply-To: <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 23:40:58 +0200
Message-ID: <CACRpkdb249pKC7VvM6HxRKgwF36_9Qp8G9sD6Troa22fYznuXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 8, 2021 at 10:05 PM Konrad Dybcio <konradybcio@gmail.com> wrote:

> On Qualcomm boards GPIOs that are used for "secure" (duh) peripherals,
> like a fingerprint scanner, are not allowed to be controlled from Linux (the "non-secure world").
> Trying to do so causes an immediate reboot due to "attempting to violate the security".

OK I see. Yeah HW security is pretty neat, making it cause a reboot
seems like maybe not the best choice, but hey we know for sure what
is wrong when it happens so it gives a good feeling of having everything
fully inder control. Which is nice, despite the annoyance.

> The GPIOs seem to all be iterated over on boot, except for the ones specified in
> "gpio-reserved-ranges".
(...)
> So, why did it work before!?

We do things like read all direction registers to check if GPIO lines are set up
as input or output. If that causes reset then, well.

> As a result, if such "secure" GPIOs are not declared in the DT, the board essentially dies on TLMM (pinctrl) probe
> (which happens veeeery early - so that all other peripherals can set the pins as they see fit)
> and that's very unpleasant to debug. Without this patch, Petr's device will simply not boot.

In a way specifying it is a very correct thing to do.

When they were registered with the GPIO subsystem before they were,
well registered with the GPIO subsystem which means they are supposedly
available for general-purpose input-output. Which they were not.
They seem highly special-purpose to me. So
reserving them is the right thing to do.

Yours,
Linus Walleij
