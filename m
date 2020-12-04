Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BEE2CEAD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 10:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgLDJZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 04:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgLDJZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 04:25:33 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847E9C061A53
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 01:24:53 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id z21so6715978lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 01:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QfA2Deg/Hoczex9GFJ2Tve/iNGFtxx0X+vAgQ/KFFmU=;
        b=sxbK6ICnhtU2iZIIm+T8C1Te3ugLfCMvzllg3hITnc97hX0ozFqvsMw2hTfvuqrIJb
         Edv1v7nUodKmq7N37lBQN76EE9BW5pyN9FQwsyZ0e9ROMoKLgmpv8lznQhrB8fci8c6q
         Ixdn2ZfQU3yuSZzPAkaXD9uU1dhOZ4kcRUFHGtoyY05qk+ogwt5TCqEhDEJNMM87Ai2p
         DwlGKOlGIPT5NjBTaqMqWMzgoep/7oqCvO4edCRwySaIip0MEU9V/fRtGKhnql0PzOs+
         RGGGd3rKLV9mS5u0IVF8sQAr5LUn8Ie9a55F44FmW66QceFzV1SZfagOsT/VLUzmBtQt
         OZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QfA2Deg/Hoczex9GFJ2Tve/iNGFtxx0X+vAgQ/KFFmU=;
        b=qDqmB0i8f+HPyvxooBCh0rhADKNHBmlVIiJ1lTJBc26Ex4izYc2wfakdV1n4ydnXdx
         +gmlOjQV4x68nGUQsUyAQpTT8PV44V579L4lCCN2KGcFwuUnKiA4mqv95I7jSWVs3f+H
         6oaVMIcubjsIhUMOzpeJhlgTNP3bTbSD8x/1tVRzr6bmJJNqIjloUYFJxovhLdpdqmMj
         g75U7g/FXDyJBKx0TGC/JtZ9ZevfWsxKCskjEDXAXgADrURcpjIJInTHlm3liPsEXSnG
         OtDflwpt4JNGpOYlWxQaKG26Qmw2Y7UT4wT+98DDYs2fMy5xWuIis0/RpzZP1WS/PFFQ
         z5kw==
X-Gm-Message-State: AOAM531EnMBKC93Rmptwv2njGzaGbITAPBW5uIUOFbdiNubPKU6vHbp3
        U823Y7w59o4VKmbPaz47q4mbPSldHgSqr3FFWjYsOQ==
X-Google-Smtp-Source: ABdhPJwld5FPJyOQr+2N2zHsMoJkzskFljGisFmdIuFc8iFudOBUnCzHohy+kvKJ8IppYePCa9/K6MvPyM8eZ2hBb1g=
X-Received: by 2002:a19:8686:: with SMTP id i128mr2935037lfd.333.1607073891967;
 Fri, 04 Dec 2020 01:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203070900.2651127-1-vkoul@kernel.org> <20201203070900.2651127-2-vkoul@kernel.org>
In-Reply-To: <20201203070900.2651127-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 10:24:41 +0100
Message-ID: <CACRpkdaX2=F_AgWniXGJXO2hE2itg=ENMBOROaY+Lrk7CxdNUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM8350 pinctrl driver
To:     Vinod Koul <vkoul@kernel.org>, John Stultz <john.stultz@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jeevan Shriram <jshriram@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 3, 2020 at 8:09 AM Vinod Koul <vkoul@kernel.org> wrote:

> From: Raghavendra Rao Ananta <rananta@codeaurora.org>
>
> This adds pincontrol driver for tlmm block found in SM8350 SoC
>
> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [vkoul: rebase and tidy up for upstream]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
(...)

> +config PINCTRL_SM8350
> +       tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
> +       depends on GPIOLIB && OF
> +       select PINCTRL_MSM

This needs to be
depends on PINCTRL_MSM
due to the recent changes to allow modularization.

Yours,
Linus Walleij
