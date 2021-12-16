Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2608D477035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 12:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhLPL2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 06:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbhLPL2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 06:28:06 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DFAC06173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:28:05 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so597999wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9MegHUhcBTG+eztOBRftaSA/MzudLaj89/TKCSS1B9c=;
        b=LDSgdtuv079BYr4m97st85S2CDdTKAPh0Q7W/Pe0Vzy2fmqi61iicZ+SrgvFDLUN+W
         kFFRGr4hwY+oJTPYiNQIgl30tpgW/iMN2A15zcr808UqiZlSr3kh2rwJzSuaeRIONIuy
         5PZ6tPC+jf2xRPKw0u5dFpnH0tsnf5QjVPJ1qJqwymB+69y9fjAoMvFpwjIlqguMEeCb
         fKtUKF1p3NES5ApgxJjnaWSyavDkI6VrphdGp3SdujaFJ4EdjhAy8KYnxVuN1hARPCQH
         x7vq8zPEnmnUJadrjYc9dKQENgEYud7yUUZGnlBYROT/Usij69laWJGY69KDqIuI8VTi
         3+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9MegHUhcBTG+eztOBRftaSA/MzudLaj89/TKCSS1B9c=;
        b=Q9YqLajE6e0lgn/+SkFmbuhoIel8ej0C5TBxy02nrc53H9DiUwdIjrGGEwA72KqTh8
         hn9MJJLlyaFSeQzGefvGAaP9liP3ONl8U4KXdnwDhs/lKd+UlRh704lz+ewLLLEhRMwL
         Rbn+7FuZ3lYyIGgUZ1wtU+grwWtIGStUwZWfNumjldhFNIArgQ7LdWmff4DrWBGx4cU3
         h+6sbf7sAu/Z0x4DLVSBJA3hA0rAr0t2ic2X7OPPV3YMe8UlPDpGnUPwAu22/smF7cvf
         EH3gO5VZBe54+7JpZ1EJHXl2NtTtz9xa6GTkDfp6+4Eur13HTixNlXJU5qz8dRSkJPs6
         UYJg==
X-Gm-Message-State: AOAM530NrzOo2SIqD3MhsRC+HFyv2ETg6VWZ7c8k3Gs6ws6b/8ZsOOj2
        dDk7L/TGsv/pGK1KKyLzXmNewJNWfQ+xwg==
X-Google-Smtp-Source: ABdhPJzyjKu6xTjCISNf3yiv/4hIw9yUvfqWCFpHJjKOIH4G4E8gKGga2X37QpL6sB/04NMPNzlXBQ==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id n10mr4449553wmq.54.1639654083937;
        Thu, 16 Dec 2021 03:28:03 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id 8sm5131009wrb.49.2021.12.16.03.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 03:28:03 -0800 (PST)
Subject: Re: [PATCH v2 5/8] dt-bindings: misc: add property to support
 non-secure DSP
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
 <20211209120626.26373-6-srinivas.kandagatla@linaro.org>
 <YbcnEp5+4y5qXC60@gerhold.net>
 <ac2e9f8f-ea52-5676-baaa-9439e8b35d8f@linaro.org>
 <YbdIas4QE1z7alAc@gerhold.net>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ad1a4750-b404-c2a1-e400-e39d5ebdd95a@linaro.org>
Date:   Thu, 16 Dec 2021 11:28:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbdIas4QE1z7alAc@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/12/2021 13:19, Stephan Gerhold wrote:
> On Mon, Dec 13, 2021 at 12:35:40PM +0000, Srinivas Kandagatla wrote:
>> On 13/12/2021 10:57, Stephan Gerhold wrote:
>>> On Thu, Dec 09, 2021 at 12:06:23PM +0000, Srinivas Kandagatla wrote:
>>>> From: Jeya R <jeyr@codeaurora.org>
>>>>
>>>> Add property to set DSP domain as non-secure.
>>>>
>>>> ADSP/MDSP/SDSP are by default secured, where as CDSP can be either be
>>>> secured/unsecured.
>>>
>>> Wouldn't it be easier to avoid the negation and add a "qcom,secure-domain"
>>> property instead? Given PATCH 8/8 ("arm64: dts: qcom: add non-secure
>>> domain property to fastrpc nodes") it looks like you are intentionally
>>> breaking DT compatibility here, but this patch does not justify why this
>>> is necessary.
>>
>> By default all ADSP/MDSP/SDSP are secured, so this property is only required
>> for something that is not default. Only case that is configurable is the
>> CDSP case where in by adding this flag we should be able to load an unsigned
>> process to dsp using unsecured node.
>>
>> Having said that, TBH When we first added the fastrpc patchset we did not
>> take care of this security feature properly :-)
>>
>>  From security point of view, its better to keep the default as secured
>> rather than unsecured in DT too.
>>
>> With this DTS patch older dts should continue to work.
>>
> 
> Is this a "default" on newer platforms only? Why do the existing
> platforms not use the "secure" setup then? Or is this perhaps firmware
> version/configuration specific?

So I did bit of digging at old msm kernels spoke to Qualcomm on this. 
This feature was added in Dec 2018 and after. So ADSP/MDSP/SDSP are by 
secured by default for SoCs SDM845 and after.

However when we upstreamed the first fastrpc driver (end of 2018 early 
2019) we did not take this new feature into consideration and we now 
ended up with most recent SoCs accessing the only available non secured 
device node.


This new property serves three purposes

1. supporting the older SoCs (msm8916 msm8996) that did not have this 
secure node,

2. Allow CDSP configuration of secured/unsecured.

3. keep the new SoCs working (sdm845, sm8150, sm8250, sm8350) with 
existing upstream driver. (This is purely for not breaking existing 
applications).

We could do the right thing here by making only msm8916 non-secured and 
let all the new SoCs like sdm845 and later be by default secured on 
ADSP/MDSP/SDSP and only configure CDSP.

> 
> Basically I'm confused because you say that the "default" is the secured
> setup, but DT patch (8/8) suggests that non-secure is the default on
> pretty much all currently supported platforms (msm8916, sdm845, sm8150,
> sm8250, sm8350). :)

I agree there is a bit of confusion, I hope my reply clears this.

--srini

> 
> Thanks,
> Stephan
> 
