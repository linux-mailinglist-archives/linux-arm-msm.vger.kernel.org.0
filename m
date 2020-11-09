Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269192AC230
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 18:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731384AbgKIR21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 12:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731378AbgKIR20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 12:28:26 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B146C0613CF;
        Mon,  9 Nov 2020 09:28:25 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id y7so8779791pfq.11;
        Mon, 09 Nov 2020 09:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/QlnmvdxwQ9xj4gaNBxnILqVStfu/a/ZgzdrBVFti+8=;
        b=aCTHknDbz5sR0I+a/WAXyOw8e0v+5VRcyJc+S/nxnT0LhuDqQ4G80ZdzJh3lgB2Pw0
         opzvGFftAkYNPVK9j/DrVzWgEenr9V0B9mK6eg8tqXJV0lejuvcSHoQ9Yi+1YvGnO6UD
         uHAMatBgjj6KGiYPZ/FGMLLk6+97UGeQwsqAKLeIYdA3061I1gD7SIUIhxlS75ctb0Og
         2KphUXr1HUyACHIozcHUW7aVV2fNR3FFEKV0Jy5iAIB6O9xHHgDk7CFnZY80xA/N5f82
         8ofFlWpMOSSdPtC9oDbtNZzrrsoAMDLUqceWjtE9m9+Cqvy515ZXXL1tRndbQNS9kVJW
         l5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/QlnmvdxwQ9xj4gaNBxnILqVStfu/a/ZgzdrBVFti+8=;
        b=gYOJ1dMQcADyrosLBJQJICXiBHmswa05em1mQW4xnZp7jCKsq9jEtQDf4oagC0U6gZ
         kGtSH9OrsGVGwMG+aAkkoMFklLjpxyQkVXDMu9LEjGaiARGHYf5XGoQ/hvci786EOlmb
         h9NPKJkvNBx+C8VYBcr1lTerxUbEdk7m/uCo4Eol206F/YVNKw05I4MZewTKrJn7I+LC
         ZvOwRopg2K5BjeLZ9STlm5HhLqbR/66r9fEXD3qqOn8SoGcklK0U8hDHNJEKDOHzKVTG
         KvXzBqJyBwEKD2pYyk3tZTkTIi1b13nFi/K27HqPoPx1/9wxD4dr1FrWZpqD2PUtyeN5
         JWpA==
X-Gm-Message-State: AOAM530ZrXn8dIpLdGfVFcZzTcgqArOgaxhKVDwGM9KGTEFYMyt5Wfec
        iGYLRdFVtBMzY/SkJ6E6LCQzjRDU0SE=
X-Google-Smtp-Source: ABdhPJypIE0N9qNCd5VYXBuKR64bHV8aYY67C5iAtTaSpoYajDTbXS8Aw6n6b9dG+ym8aDRj4URMrQ==
X-Received: by 2002:a17:90a:e2c4:: with SMTP id fr4mr198563pjb.185.1604942904584;
        Mon, 09 Nov 2020 09:28:24 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h20sm10231664pgv.23.2020.11.09.09.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 09:28:23 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <CAK8P3a2TSmsNSi-XFpT6AQ3jvVxJ1AW7Uf5tAo477wtwXZwUzg@mail.gmail.com>
 <e27dc152-7aef-10df-f391-bf56e13e23df@gmail.com>
 <CAK8P3a13ywHh7igdfDSPQz9Bw8YAnKWFLKARkk2NL5u6=6yb=w@mail.gmail.com>
 <0eee3fd2-7400-7de7-27a7-7fcaa0955854@gmail.com>
 <d42745b7-ef76-e584-0da2-751ac8c1cf3a@huawei.com>
 <CAK8P3a335TT1+bdHqB=FetPanXXfGv3dC7ZCkx+w+F3j00kj5A@mail.gmail.com>
 <07ab3bdd-dcb1-5a59-d813-f82451b3f028@huawei.com>
 <5980552d-6e96-fd9f-c758-1b1e9f57100e@huawei.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <43986e17-f493-b3b6-2829-3ba7d92f2e8c@gmail.com>
Date:   Mon, 9 Nov 2020 09:28:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5980552d-6e96-fd9f-c758-1b1e9f57100e@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/8/20 10:18 PM, Leizhen (ThunderTown) wrote:
> Hi, everybody:
>   How do we deal with this problem? I updated the kernel to the latest and the problem still persists.
> 
>   make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j24 dtbs 2>err.txt
>   vim err.txt
> 
> arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)

I was hoping that Ray or Scott could give this a try, and TBH, I am
still not a big fan of having to mangle the 'reg' property to be
compatible with #address-cells = <2> and #size-cells = <2>, I would have
preferred omitting the 'dma-ranges' property entirely.

We have plenty of time to get this patch applied for v5.11.
-- 
Florian
