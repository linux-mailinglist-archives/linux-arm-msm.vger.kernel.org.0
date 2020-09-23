Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE68275A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 16:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIWOar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 10:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgIWOar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 10:30:47 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB2AC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 07:30:47 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so28032310ejb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zh3lTPFBlYorxfQj/4ydXKiZawsF/DpRpc03CfslAQY=;
        b=Qx/pUD7p8UH46LTco6ufJ3LOAa9yqfGzJv07wy5doHOEEKa4ll4hHzndwuwOwDYtGy
         yV5H9beGcV0tFvOcDI0GFlShAgZMqqfDWWMy46ALiJLFLSOtMy3yr10MUXmPy1OknkMV
         JDTd/NIW0Q5Gb3iTY0+UAS79pkLk5znk9sSywrkkyB4uyuo4b9iZabmJqOcuo/P5aOpD
         kpp9jT2pbO00h7khLkjj1hdIb15cQqJNvIHdfkeBzbsDZ4loZauFptenAS/HzvJCSLqC
         6xij1BjgK3+WUj/tuzMuuFDplpWejiYiuljIVXez2eN5HvVeRXDsrlnhWiJ1DSaGpEI9
         rPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zh3lTPFBlYorxfQj/4ydXKiZawsF/DpRpc03CfslAQY=;
        b=UgIxiLkatyXKXA/zKyGjVSeNAv0T7QrXdtxv6C5aFDLiS/UlE56ZULp8vKKdv7LKrv
         TnN5kcZWwHMmIQ0jtcbLlxwUy7nEZs5XwE4Dp/VkWS4LI1jU3Vj8aZg6f8kwYe4MRPjh
         ZFAwUABeFK7vYUIsuqpqde8W4xVPZiAcadGp1TZHujvL6LPrQuaLlG6M89E+wkqOvrUm
         t0uaeMECQcKhr2qyjl9+EW3qt7zRBnWi3QrOQOWtRvgTlPayYgawLSVPtB5ciO7+oMtE
         3PKP7J/X6fgEEJeq43Dns2j3uqgKmxGGl2igEfm4OfN1uODnGw4f3Y3DjmYbRo7T8AoK
         7Hvg==
X-Gm-Message-State: AOAM533QkmyTTuevHlZTacx/1jqsNF+f5UqEM6wKECJfvkflLZy98/tD
        X08eXBSwRjDR1MPgfulx11AR19dwsLErIS8hM8ARGg==
X-Google-Smtp-Source: ABdhPJz8EEbNuS5M/JqUlWe+NgSviaw8/kCT7N9UEa0zfQUo5t7XWEE2CO595CEaiFdOBlBhumBOBm3zvYXOTkjgN4o=
X-Received: by 2002:a17:906:364b:: with SMTP id r11mr10303334ejb.48.1600871446185;
 Wed, 23 Sep 2020 07:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org> <797a690f-247c-7ff1-6468-8d56b0b81116@codeaurora.org>
In-Reply-To: <797a690f-247c-7ff1-6468-8d56b0b81116@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 23 Sep 2020 16:35:59 +0200
Message-ID: <CAMZdPi-iaCWm21GzTLpoXZuCxawAPgLo_X91zSQ2VFTfV_4rvA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Wed, 23 Sep 2020 at 16:04, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 9/23/2020 7:40 AM, Loic Poulain wrote:
> > This is a generic MHI-over-PCI controller driver for MHI only devices
> > such as QCOM modems. For now it supports registering of Qualcomm SDX55
> > based PCIe modules. The MHI channels have been extracted from mhi
> > downstream driver.
> >
> > This driver is easily extendable to support other MHI PCI devices like
> > different modem hw or OEM superset.
> >
>
> Maybe I'm being a bit dense, but what does this "driver" even do?
>
> Ok, it'll bind to SDX55 and "power up" the MHI.  I don't see any
> communication with the device, so I'm not really seeing the value here.
>   Feels like this should be patch 1 of a series, but patches 2 - X are
> "missing".

Well, yes and no. On MHI controller side point-of-view, the driver is
quite complete, since its only goal is to implement the MHI transport
layer and to register the available channels. The PCI driver is really
no expected to do more (contrary to ath11k), everything else will be
implemented by MHI device drivers at upper level. I agree most of them
are not yet implemented (only qrtr-mhi for IPCR channel), but I'm
currently working on this.

Regards,
Loic
