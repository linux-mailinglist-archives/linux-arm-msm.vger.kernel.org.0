Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628A6358E03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 22:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhDHUFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 16:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHUFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 16:05:31 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7543FC061760;
        Thu,  8 Apr 2021 13:05:19 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so3555371wmk.4;
        Thu, 08 Apr 2021 13:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tX16rYfnc+gH4Tt0HpCPrhcqr2Z+F5SWlJqMaI9bYv4=;
        b=KdvlR16PUlG7CDNXDX8iz3+AH3FuFNm5TuZsPPn/OQsiFVat03p+jLLcFP0zLrBVdT
         Goo0sKMTXxwq7iID+sl+k0upsYqVPaYqi+o0rpL88AYiRxWY+hp0pSlPiovokukkrM+0
         v3+yy8xrCGhAHT415KK5Bhs4v1Rqbw8a9oUkzR+mlpvsga4r2G+AGPT9jn7q9sVj7w7r
         cCAegaMPr1H33rI57orHmj2dtZ/hvzAka51I2iq3DZLHKA/KET9adScHtfl42CTLlq76
         h4iZC61bghITH1oigrTMWc8fQDW1xO3fB0kqFRkI3ka2KlQWo3UUmgjE1qXO8hLeZAG5
         zesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tX16rYfnc+gH4Tt0HpCPrhcqr2Z+F5SWlJqMaI9bYv4=;
        b=VbvGfNsz53WNgCgFb/9DYgRWnFlMiWI4SL9QaHjTSqH2fKrZ92UL3qjDu5u2pKE+59
         S5jJhk/csRK7j0UjX0tW0Vn/C20TAt4IAOlzVpft1pPgtLH0CGZcNzTdrz5O+kX05uT3
         pyQ5tj3JN6dDVuySuQ4yqbY3oOpBT83J1BMpDJf14OLS3umrS7VmS7WpyLQJO4RBJw84
         XjViOmAwx+GrilPKRQqACHFueUiLkl82FwrZuc4tjprirt5CX2zA9qwce2N+kgzzJj6H
         cCRTGxex955LBSFdg9XP+OfalPG3qVTRCtXss4KJqVKjRiqNQ7GzCgbtIV5wDRH1PsYR
         rfng==
X-Gm-Message-State: AOAM531qcFXshrFcgIPe5tWfVsneQbRFai8vMlP0Ueh65xPt3EbkUW6C
        E/8TGRQqpyqt3uGsylBmf80frRLq+ZL1mg==
X-Google-Smtp-Source: ABdhPJyV2ZTS1pmrbKMsk/v+cY3LiErgpSvRS4s1j8TtHC8CT7uz4wkWeq3jZnfkDExxXFGK/G9Idw==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr10659600wma.163.1617912318165;
        Thu, 08 Apr 2021 13:05:18 -0700 (PDT)
Received: from [192.168.1.101] (abac128.neoplus.adsl.tpnet.pl. [83.6.166.128])
        by smtp.gmail.com with ESMTPSA id h14sm592618wrq.45.2021.04.08.13.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 13:05:17 -0700 (PDT)
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
To:     Petr Vorel <petr.vorel@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
From:   Konrad Dybcio <konradybcio@gmail.com>
Message-ID: <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
Date:   Thu, 8 Apr 2021 22:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG9TWEJlpDmNeeit@pevik>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

to clear up some confusion:


On Qualcomm boards GPIOs that are used for "secure" (duh) peripherals,
like a fingerprint scanner, are not allowed to be controlled from Linux (the "non-secure world").
Trying to do so causes an immediate reboot due to "attempting to violate the security".


The GPIOs seem to all be iterated over on boot, except for the ones specified in "gpio-reserved-ranges".
As a result, if such "secure" GPIOs are not declared in the DT, the board essentially dies on TLMM (pinctrl) probe
(which happens veeeery early - so that all other peripherals can set the pins as they see fit)
and that's very unpleasant to debug. Without this patch, Petr's device will simply not boot.


So, why did it work before!?


Well, either the GPIOs weren't iterated over, or the TLMM (pinctrl) driver wasn't in place back then.


As for the initrd crash.. perhaps you have an Android initrd which dies as soon as it doesn't detect SELINUX and a couple of other options.. You might want to try postmarketOS's one, or any other Linux distro's armv7/aarch64 initrd. To replace it, simply use abootimg like so:


abootimg -u boot.img -r ramdisk.img



If it says something something "too small", add


-c "bootsize=30000000"


to make the boot.img exactly 30 million bytes (or change it as you see fit).


Konrad
