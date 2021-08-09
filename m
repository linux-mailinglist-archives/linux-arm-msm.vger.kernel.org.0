Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57E23E4765
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 16:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234852AbhHIOVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 10:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbhHIOVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 10:21:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E211C061798;
        Mon,  9 Aug 2021 07:20:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gs8so29184736ejc.13;
        Mon, 09 Aug 2021 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2cUuPYheF7MpNqTwmGksBjO3uT7MgJxG2duLlVpcdEg=;
        b=HQhlOG1qilaHj8fq09Fqf0ObdBnluClzIRXwKwTDW/AxKwIKrxPxMr/q4MZoYoGDYO
         s+Zv6Eu0UyeLWMZQmdexaK8aBnXYOR1JtI8oXxw5YVmlTmyRTUgT9zpiO86oaKfuKw44
         u0yuho9F5bkPEpDyYQYcoEuCL4fZZwONtHkCeYBNRnVPzDnXwtOISZ3rIwng59X4iSon
         067t52Cydzh0IBlSg4h32h8gygN/jGHwpsTsYc+cjiZvjkqwr0WnYLMXcYeOW3Mh5tub
         OvccNfKSMokynCAmKxPCDwdc574IgyBX9VYW20p0VK0vUyBYu0FD9Hs3ybxpIE+m11m1
         1Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2cUuPYheF7MpNqTwmGksBjO3uT7MgJxG2duLlVpcdEg=;
        b=YjOhnr7gmzaWrItpWWJwIFunDdBGnxqMNvaFq73hLDCyzLzGPAZCycQGbW9OAWpoP8
         jqiE3YPylCLLb5KsgRKqOwoTHU36wHU9rhu94E6e2tQMXS0q7mSBAykubVksS8a0ary/
         G7cFvTly6DE9V6J3kqNfXc42WfeN3iFmv+qwCvYqIRnhGK5M8gSk/5fs2CyBiBdcq2Te
         IZAJneLgTKwkHykQqgWl8Hee/4R1iXz5rdhe7rpEgLIsOo8xGup/Ziyo1fh7wlAT5JPE
         wUbu32mXM+owHiPLa/OFT1t/Xjj5w04Ywz3dVhKjxBU0rNYgY0UnS8CW17y1s/qJ/L9I
         +2gg==
X-Gm-Message-State: AOAM530GsS3IyF96CpIK9c7H1xfG81hoh9cEuzcaICoi+zVBWeb+lHhu
        iBAm+BREEV72iGZRjx18zi0=
X-Google-Smtp-Source: ABdhPJz03F2uAVUGP5q+NA2jld4YbX5aZlleBTxfZ444Es0V26qTKLs/CZWAidCDgUSvQO8vJ8sorA==
X-Received: by 2002:a17:906:a044:: with SMTP id bg4mr19463635ejb.312.1628518848683;
        Mon, 09 Aug 2021 07:20:48 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id i10sm8141488edf.12.2021.08.09.07.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 07:20:48 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] phy: qcom-qmp: Add support for SM6115 UFS phy
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210805091727.942471-1-iskren.chernev@gmail.com>
 <20210805091727.942471-3-iskren.chernev@gmail.com> <YQ0xrgDjxXeNecAS@matsya>
 <86fcdc11-9f2c-0aa0-ebab-a26fa9ac2aca@gmail.com> <YRCzi9tXsUVi5kHS@matsya>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <c780ad2a-2292-6e06-fa89-4c8a5139c253@gmail.com>
Date:   Mon, 9 Aug 2021 17:20:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRCzi9tXsUVi5kHS@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/9/21 7:48 AM, Vinod Koul wrote:
> On 06-08-21, 19:09, Iskren Chernev wrote:
>> On 8/6/21 3:57 PM, Vinod Koul wrote:
>>> On 05-08-21, 12:17, Iskren Chernev wrote:
> 
>>> why are these registers 660 specific and not V3 like we have for
>>> other generations..? Quick looks with V3 regs tells me that seem
>>> similar....
>>>
>>
>> Well, I looked at them for a long time and the only thing that is similar
>> are the first few QSERDES registers from COM_ATB_SEL1=0x000 to
>> COM_BIAS_EN_CLKBUFLR_EN=0x034. Everything else is different. So I can re-use
> 
> Is the offset different? I thought all Vn registers across chips do have
> same offsets..

Upon closer inspection, for the SERDES registers they are 19 common (the first
19), the others are different (different values, different names). About the
offsets that stay in DT -- they are the same for V3 and V3-660 (I haven't send
DT yet). Just to be clear, offset the is thing you add to each register to get
an actual register value, mainline uses relative offsets (base / offset in DT),
downstream uses a macro for each register group and the offset is hardcoded in
code. Link to the DT (will be submitted after core drivers are merged) [1]

[1] https://gitlab.com/ichernev/linux-postmarketos/-/blob/b44c853caf37dd73e059628a1831ad185356a33e/arch/arm64/boot/dts/qcom/sm4250.dtsi#L878

> 
>> the V3 for the similar regs, but they are 10%, so I figured instead of combing
>> through all of the sequences to save 10% of the constants and make it slightly
>> less readable just use new constants.
>>
>> Let me know if I should reuse the 14 regs from V3.
> 
> reuse yes, but would like to understand more why offsets are different,
> 
> Can you point me to downstream code reference for this?

As I said, the offsets are the same, the first 19 serdes relative
addresses/names are the same (can be reused), the rest is all different.
I wrote a tool to compare names and values, I can paste those as well if
needed.


This is a link to the downstream code (header) [2]


[2] https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250/blob/oneplus/SM4250_Q_10.0/drivers/phy/qualcomm/phy-qcom-ufs-qmp-v3-660.h

I will do a v2 with the 19 regs reused from the v3 bunch.

Regards,
Iskren
