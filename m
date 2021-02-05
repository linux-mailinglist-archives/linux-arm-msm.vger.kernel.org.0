Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F831015C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 01:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhBEAJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 19:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhBEAJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 19:09:12 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61B1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 16:08:31 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u25so7339426lfc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I+jSUgmWOJnLeXQw33e+b1oKg9UHLASZ/apADnmcxsE=;
        b=dEAA7USKSxnp4CLpYsobJOcbv5roY/4wGvOPwEbYhZliMFu59qinuJMvOJsm95I8/9
         +ASqb+oe185tuRSU5onMgsz3ue1ULNfMYsTuar+jvru3DpgWFrhfm/lmIVtd8d40P1Oo
         VRWIc+LGxSygifAhCQYKAbkXldWhrPXO46cRAaQ1kl5QHXbgE26TcgfMluJliiWHhdnq
         XiAJJD94AoS2Y1a4xVCqxAhJDZTCHXEfjmgA/3UgbGxQr3ojAoMyyiMd9mlI3VNMs1Ae
         Ipuu3muAyeS00KnsrJuXhyG/x14ERXKZwwJ4xNHU9ZB9G5Xp3gpbLjyLQdE4RIdWg9L7
         zExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I+jSUgmWOJnLeXQw33e+b1oKg9UHLASZ/apADnmcxsE=;
        b=kAojPbJ9tMiFuRUmhtJS1AMqplCSjKOGQTNEI3u8JjUh6h+Niev8ncgwl95/JHvWvf
         Vb7Qv1AdUcpknujOQhJVhNASVFMZjGLkx5YSeYuiEruZBbaN3skpX81blzV3x1HIi7s/
         omZLKz075wme5gCCSryXrlwTgc2OJfaJK/xGUtVSOcbCwXeD6lt0Rt8IyQVAoL3tyEOQ
         /ljoZ4TP9N3rggJHK20WayR5M+iYB2DEyEbMCdg7ZURnlrldINfNp4O30/sIWObVsRtK
         u7H0KnI23bj4rGx7AMLO/MFrcafIMf+t6yo+Wt8sFy2Dk+zpfWKRrKkTwQo2fh2giDES
         SVng==
X-Gm-Message-State: AOAM533vfxpKpCmE/UJZD6IMRnxhqKrZb0qXLCchOj9NSQ0yeClEcrVy
        ZcHyC3AfKcPNC0rs3CV9C+b/zcYfqzOmDtg9
X-Google-Smtp-Source: ABdhPJwUF/YkJgOovgx1G70rTn2sww0Ep7Ut5ao3oGTESreuobCjBbEMVa8YHzZNc6AvQX/2MLCbGg==
X-Received: by 2002:a19:e93:: with SMTP id 141mr966795lfo.11.1612483709986;
        Thu, 04 Feb 2021 16:08:29 -0800 (PST)
Received: from [192.168.1.211] ([188.162.64.67])
        by smtp.gmail.com with ESMTPSA id o19sm775110lfu.182.2021.02.04.16.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 16:08:29 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
To:     Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan>
 <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e97e0ec7-cacc-335f-8785-1b983752f0eb@linaro.org>
Date:   Fri, 5 Feb 2021 03:08:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2021 02:31, Doug Anderson wrote:
> Hi,
> 
> On Thu, Feb 4, 2021 at 3:07 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>>
>> On Thu 04 Feb 14:49 CST 2021, Dmitry Baryshkov wrote:
>>
>>> GENI SPI controller shows several issues if it manages the CS on its own
>>> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
>>> use GPIO for CS")) for the details. Provide pinctrl entries for SPI
>>> controllers using the same CS pin but in GPIO mode.
> 
> I'm curious: were you seeing real problems or are you just trying to
> optimize things more?  The only known problem (other than performance)
> that I'm aware of is that if you get really high interrupt latency
> then setting the chip select can appear to "fail" (we timeout waiting
> for the interrupt saying that the chip select command was done).  The
> SPI framework doesn't expect setting the chip select to be something
> that can fail so error handling isn't the most amazing in this case,
> though at least it shouldn't crash after the most recent fixes I sent
> to the SPI driver.

I have been observing strange behaviour from the SPI CAN interface. This 
change allowed me to narrow down the issue (with the GPI support for 
SPI) we had in our tree.

[skipped the explanation.

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 380 +++++++++++++++++++++++++++
>>>   1 file changed, 380 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index 3cea28058a91..03015174ec06 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -3046,6 +3046,25 @@ config {
>>>                                };
>>>                        };
>>>
>>> +                     qup_spi0_cs_gpio: qup-spi0-cs-gpio {
>>
>> There might be others who need the same states, but I would prefer if we
>> move this to the device's dts.
> 
> This is opposite to what Stephen requested, though it was in a review
> on our gerrit and not on lists [1].  :-P
> 
> It definitely feels like a 6 of one half dozen of the other.  Unless
> you're dead set on moving them to the board dts my bias would be
> towards keeping consistent with what was done on sc7180.  If you
> really want this moved to the board file we should do it for sc7180
> too.
> 
> 
>>> +                             mux {
>>
>> Rather than splitting the properties in {mux, cs, config} I think it
>> makes more sense to split them in {spi, cs} or something like that.

That was my original idea, with qup-spi-nocs config being in sm8250.dtsi 
and spi0_cs (defining only CS) belonging to the board dts.

> 
> In general pinconf doesn't belong in the SoC dts file.  If there's no
> reason to change it seems like this should match what sc7180 did.
> 
> 
> [1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2406557/1/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi


-- 
With best wishes
Dmitry
