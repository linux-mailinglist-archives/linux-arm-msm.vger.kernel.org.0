Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45CA35931C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 05:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhDIDiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 23:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbhDIDiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 23:38:11 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF82C061763
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 20:37:29 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 25so2962050oiy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 20:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kpO9+Srd4oIvzWVPdKNdhhDxU1fj2TEEXiSYekg3+O4=;
        b=AajZh8YY55sqks6QlcXguHQ/+brpwyvUTeoJebt7DSnbLvFJLMf2d1WDS6sHYmKrMW
         /JpVTniCTchZEv6K33jNa5DHdhmFsKozdeGkprinsXo7r5heNHiDeHEDES0htkv+2dBr
         iD7HIujRElbo6/rKB4EwOJ0XwxNS2lJnG0RSgNPWNbiKBA7vbhrWMlJ5hilCDHdAeMvZ
         fMz7qlJ+0podVxWdTe/sM4/YHNudBoh94zszKUFnH15H1Hf34eZ6ftgXFabYjvrMyV0r
         yYv0fpUUmqiN9yOJmajTr/HRsTiH1g+xjSxZ2fWWZno9Kbn+0tkh/dk2RygfB+z4A5Qb
         3YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kpO9+Srd4oIvzWVPdKNdhhDxU1fj2TEEXiSYekg3+O4=;
        b=W9q3WPqpMR3Z8qx3F3kFMN4rIZs3V2b+MWdON83VyRtLi8Be5oYslhgmHVUWDLhpx3
         V/DQPxZEqGGvxgv2vpSDjvf/aq17BTdizQnNM6gKZSqOa1ZLJZMCbTzWwIldEalKqWZ4
         7FQ5DncN+9XYwluNm2TozGY5ERHqnIT7bXfbpLwL7devobpEiWgYdTvy6CnRd+3R78rs
         lcgyqaGyLh5aVm6WwG9MQQs12uOD3bva1szSWf6X3T2OgFgDBb38krUzV9M196Mf+Uu7
         tU8NtV8Pqcceqyw2qV/q8B1LunK8jfue8fSYmiVBdpj7AsZD0uzx2SgVea1THhjnv00F
         L51g==
X-Gm-Message-State: AOAM531qoaMNe09eDiwGdzvgzcjnWaNWiRP002fJ0b9cdR0K0HIqoZJn
        Adt0im30N3nEC1p5gG9vpfbJ/A==
X-Google-Smtp-Source: ABdhPJxyg5jFsWAKl52joGC4rhFbwO523ZKf7Sk0WGwP6QuzZcGFDCCy9TNVl2ntIn6hUArIIl/ToQ==
X-Received: by 2002:aca:2b07:: with SMTP id i7mr8785439oik.66.1617939449149;
        Thu, 08 Apr 2021 20:37:29 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y10sm333546oto.18.2021.04.08.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:37:28 -0700 (PDT)
Date:   Thu, 8 Apr 2021 22:37:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <20210409033726.GT904837@yoga>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
 <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
 <YG/HwrzRcm7bwgFe@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG/HwrzRcm7bwgFe@pevik>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Apr 22:19 CDT 2021, Petr Vorel wrote:

> Hi Konrad,
> > Hi,
> 
> > to clear up some confusion:
> 
> 
> > On Qualcomm boards GPIOs that are used for "secure" (duh) peripherals,
> > like a fingerprint scanner, are not allowed to be controlled from Linux (the "non-secure world").
> > Trying to do so causes an immediate reboot due to "attempting to violate the security".
> Thanks for an explanation.
> 
> > The GPIOs seem to all be iterated over on boot, except for the ones specified in "gpio-reserved-ranges".
> > As a result, if such "secure" GPIOs are not declared in the DT, the board essentially dies on TLMM (pinctrl) probe
> > (which happens veeeery early - so that all other peripherals can set the pins as they see fit)
> > and that's very unpleasant to debug. Without this patch, Petr's device will simply not boot.
> Exactly.
> 
> > So, why did it work before!?
> 
> 
> > Well, either the GPIOs weren't iterated over, or the TLMM (pinctrl) driver wasn't in place back then.
> I suppose GPIOs not being iterated over is the case for first fix (i.e. fixing
> 3edfb7bd76bd "gpiolib: Show correct direction from the beginning").
> 

We had a long discussion about this in the past, and this resulted in
gpio-reserved-ranges and flagging off GPIOs that shouldn't be touched.

It seems we introduced the angler dts prior to said changes in the
gpiolib, so it's probably right to say that it's a regression. However,
the introduction of this was done 3 years ago and we're happy with it on
all other devices.

There's no harm in introducing this property prior to the introduction
of the related gpiolib patches, so if you really care about it being backported
I would suggest you say:

Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")

But I presume based on the awesome work you guys are putting into the
8994 platform people shouldn't run "old" kernels anyways, so I think it
would be fine with us just ignoring the Fixes as well...

Regards,
Bjorn
