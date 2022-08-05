Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5023558A8E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 11:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiHEJgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 05:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiHEJgQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 05:36:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A396F29C91
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 02:36:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq11so2656006lfb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tLxPkoMovnTjvaiV/iJ/9xu7RPBak6OouLYkRbQhJTY=;
        b=ei1io9w2pYFYVfXJxsJIvfwnc9KlWG8ySrrOu9GGZT7Hj5WwkTN5CjCghh8GJrdrMa
         nIEHRZAk1lKOmpAfQFZ0YycCd5zPBKZn9L5FXKS+RjJIJ6Fuw7Ja70Hb9ncKsgFjNfAP
         AvG+frpVOv4MbB+i1eAXtdzWuWT0ghpXCgglikDrPIHGPfjFCl3q7Tz2D8jCgUyRcDEX
         P9KJIufNAmG/2PuetPaeGPhsf2WyAzYxr9QMJg9WY46wOk1N/rDMhyAqORvHAVTDSFdx
         PcKhaSj5PNkpuszlWLO4dc+Ed5l7G7oPN78zCbBQvl/NuC7BefaJ9mQGRulu5/4fUgYs
         RPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tLxPkoMovnTjvaiV/iJ/9xu7RPBak6OouLYkRbQhJTY=;
        b=EHQTvgUz/6u8gye25rOYS79Le4To6lVRjeuP1yTq5Dx8lzq3iI0r7JY/SOmujRi0zC
         dmWzE3rCCbuBnf/3nnlj2YAPjhtkBE9qZSqXx8I57ysjAgx0otEziIiBeJ8Nzu3dymEW
         veHqXZzRvqRaQVORHtmzA4zXhRXj5gFfiFbYZFEBlKfDFF4vatBvVtUXhiGlBULlIkST
         r5t9GH8nq+W/X1aq6LD6QvhUsXnsEHU6IXnWH9jQ5JQU7xtcO4kdD1qV9Geen064WVYn
         Qm+sDZbpMcbuOkI+CiVbRG82BsmjbasNQGsUcqSEnMCaOKi5cDMuRKoFbfRX8coOgM7O
         v49A==
X-Gm-Message-State: ACgBeo0ocO/ydaNSsV2kZ52N8eDMaD1micxNEAtGXDFdq7pCmr0txbSJ
        9HBI55UHBqDV/gJ0MuKNuc7ZsMc7rpjWHg==
X-Google-Smtp-Source: AA6agR4SS5kQEaAe9pPmds9idl/Ql+nXNdCDdYMRjHkFQi6huZKjhqIcfeHoJkLVQV/4Y9pFDj7gHQ==
X-Received: by 2002:a05:6512:3f11:b0:48a:3043:e7 with SMTP id y17-20020a0565123f1100b0048a304300e7mr2051198lfa.524.1659692174012;
        Fri, 05 Aug 2022 02:36:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp40-20020a05651215a800b0048a9603399fsm405109lfb.267.2022.08.05.02.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:36:13 -0700 (PDT)
Message-ID: <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
Date:   Fri, 5 Aug 2022 12:36:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-GB
To:     Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     bjorn.andersson@linaro.org
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/08/2022 23:37, Mark Pearson wrote:
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
> 
>    amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> (2022-07-25 14:16:04 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
> 
> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
> 
>    qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)

Mark, it's so great to see firmware packages for Lenovo laptops being 
submitted!

> 
> ----------------------------------------------------------------
> Mark Pearson (1):
>        qcom: Add firmware for Lenovo ThinkPad X13s
> 
>   WHENCE                             |   8 ++++++++
>   qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>   qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>   qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>   qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>   qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>   qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>   qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>   qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>   9 files changed, 109 insertions(+)
>   create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>   create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>   create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>   create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>   create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn

I think it's the time to settle onto firmware paths for the 
Qualcomm-based devices. At some point it was proposed to use 
qcom/<SoC>/device/*mbn.

So, in your case it could be qcom/sc8280xp/Lenovo_21BX/

Bjorn, WDYT?


P.S. Can we hope to get firmware for older laptops to be published too? 
It would be really great if it would be possible to provide full support 
for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.

-- 
With best wishes
Dmitry
