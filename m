Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637AC2F5073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 17:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbhAMQ4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 11:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbhAMQ4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 11:56:04 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7356C061575;
        Wed, 13 Jan 2021 08:55:23 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id s15so1389619plr.9;
        Wed, 13 Jan 2021 08:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cqqZHzMu0jlhd8bHVYI9gffrZzfV4WEJkw3uCp+3Zd0=;
        b=eUgjWVvfhT1Q7u9HWl1HzMfIaCqOi9z/nMLWVCHjSJ/YuxDFncmxzL/t5brQrK+h6c
         +aBrhwpBHlb1i3hkTh9eutNeI/NlIvaFqZdr1HedzVbFefjnFzObNFGzZXZBzEhOruao
         ms1nV836WV3DXiFT3sUaYRwK7oQccZxaZ2vCa9EQoq/4UtpnFklgDS6dVmSns0BuSKJb
         2TUdm6S8Wy7+iyhBpcb5ClNZ8Md6Imb+woGAiWbQ7K9whsFFY5RCjhoawftYryVB6pU8
         5cz05Avo/fUgLGVMiZNiEeU9m+ZMilH3Hm7pYdn1g0dEm8jlS6GMouEc1J7ZCeYRAK2c
         AS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cqqZHzMu0jlhd8bHVYI9gffrZzfV4WEJkw3uCp+3Zd0=;
        b=djXQxSTASSZg73UnV9CvAduIumG2dhiJxeIIj+FL3USTroE+mU8+EnLgJHQx4HSVJm
         h0h5cm7OGB/TWu7gvjC3quUq/18yEb54E5hcpL8Uhg7OOc69236JUwed7Y8VuqVv2d/W
         hIEJ9QK3U/RL5oCpXpU8PeZNb1gpY0E+pfQwo/vlRuBbMRwiqZr1pbmgFL9yvy78ro2R
         /qd0CjPvqQgc0CFUZ1I+HHOcN1OXKi9IGvcFYG0nm7L9/O+TYXCjg2OFbCNq85gOJJ8i
         jU54/QZceZ8Yu6YFf6EXjT3RrJ51uzpbEoouqcXEuyAimNZOoDJm8Kj1+0f89PmfIWWU
         QybA==
X-Gm-Message-State: AOAM530GuiF9J+EDv5RxroLkRtRs9H9nNFFvhX4Vy7gA/LP6wXI7LFaZ
        x1/tz9Awuk6audyJtHyBZi8TyqrhLT8=
X-Google-Smtp-Source: ABdhPJy8RXrsZ9SmvkJc3nlRnDYwwk6ziQ2CP+dkYTYD6+4ktGafc08FW0ILBfpUCIFM4W3QDb2BGQ==
X-Received: by 2002:a17:90a:4cc5:: with SMTP id k63mr188749pjh.202.1610556923162;
        Wed, 13 Jan 2021 08:55:23 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c24sm2970383pgi.71.2021.01.13.08.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 08:55:21 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Arnd Bergmann <arnd@kernel.org>,
        Bharat Gooty <bharat.gooty@broadcom.com>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
 <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
 <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com>
 <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
 <18112862-a42e-95b1-39a3-2e414667f39b@broadcom.com>
 <CAK8P3a2+EfOKAo3HLb+_qd-gnqWD55dyW0juSw1TM8jHKiZYoQ@mail.gmail.com>
 <8aaa7bb9-a81e-cd0e-8e67-360515313748@broadcom.com>
 <3fc2b0174965ec6b911ab4bd73da1525@mail.gmail.com>
 <CAK8P3a3SdvOk=chp39-ypvHsqCJkuqFG1qn+tyJ3h71OrzgDWw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <d97a0c4c-15b5-272a-adc5-152c41a6a212@gmail.com>
Date:   Wed, 13 Jan 2021 08:55:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3SdvOk=chp39-ypvHsqCJkuqFG1qn+tyJ3h71OrzgDWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/13/21 12:05 AM, Arnd Bergmann wrote:
> On Wed, Jan 13, 2021 at 4:42 AM Bharat Gooty <bharat.gooty@broadcom.com> wrote:
>>
>> Hello Ray,
>>
>> I had cross checked with Design and integration team.
>> Yes we can set the "dma-rages" to 40 bit DMA ranges. Tested, it is working.
>>
>> -----Original Message-----
>> From: Ray Jui <ray.jui@broadcom.com>
>>
>> Bharat can correct me if I'm wrong, but I don't think we have a bug in
>> the USB DMA engine that causes it can only address 32-bit. I believe we
>> can set dma-ranges size to 40-bit here.
>>
>> The dma-range property is though required to be specified, instead of
>> leaving it as empty, with the use of IOMMU. That seems to be a v5.10
>> specific behavior as I described below.
> 
> Ok, thanks for double-checking. I had misremembered the version
> that actually went into the as the one that used 64-bit dma-ranges
> and thought that was what broke, rather than the version without
> dma-ranges.
> 
> If any of you want to send me that bugfix directly, or have Florian
> pick it up through his fixes branch, I'll make sure we get it into v5.11.

I have another change for v5.11 that I would like to send, so please do
send a bugfix when you get a chance and we can lump those two changes
together, say, by the end of the week?
-- 
Florian
