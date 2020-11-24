Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3149E2C1B87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 03:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgKXCnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 21:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgKXCnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 21:43:02 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2A0C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 18:43:02 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id d9so19193369qke.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 18:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tNsYBLHLT9rrNvfsGBebo2tQKLhppSv7kANHpJdP/lI=;
        b=s4JDUqbrpI3rYJL0OWcii5UkUUD8CaKQ66QI8UxdC5zm5henEoV2h3SKIcT4USD8Is
         BxPdNoWkR8tYRTfFXFBrnAi9psiWgUpOSQtB5jKqoJ1ccx56LTdolESBS+vmRsjSWx4G
         i4BbhFoZcKXAwPiSThUFIHzJh1QRHIRUxL+p1EHCXYhWJQSP6TdJ6A4ZqOAky7qrcpZ9
         8DZgMnuEVlHYJO6X+foxpndqNcWTx+q0Eb0UgEyJH3PmA+VGF83fQsQn6QOnCW68PI+P
         S+WqPKCnOUae2/UAyZEw6u3s+avVSwxCtkDbvuQWnID2rVyk35nz4hP5h/dTsPPMB00O
         6I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tNsYBLHLT9rrNvfsGBebo2tQKLhppSv7kANHpJdP/lI=;
        b=cUflp5XupOeESIWQenv/Bn60nYE+GDOJSG1QmND9GJ1Qvxdsli88fQ+BSlQJcHIeyA
         d6M24F+inNV8UzWqNIbtiFbrSBoQl1bKxAHnlq39Qr7l0/w0X0LguEdaXccuSZZyUesg
         E0+iL34AZcZiRTy6PA7jCDaeVBjoGrcOv35JcS9i+l+uhHd8tvLzHNCMPYChs3Dwy4sS
         Zmgn0Miqikh2URMf4dOotjs3DwX/HhFgOznv6RhEpZF+WLXzcRG0uecPKeXMo/uF7CXO
         4slPoNnt65UqNaMWMYkbO+SWdC13oW0B99Mzd956og1DoxADH17C7fuJngoMHLEj/Wur
         dqdA==
X-Gm-Message-State: AOAM5335/mgY1YTfDJqVsRbL9EQpwPQSvYjFMYI32MEFdadwQ42JcKe5
        XtR7smXAF/2MxdgGA7gks2m1HA==
X-Google-Smtp-Source: ABdhPJw/2B3Xvuv7XA3fOYRpcJIpddnZFsIHjVXs8JpTBEDrceEvtKqoaAZU37k5M9FR5+uSqtg6wA==
X-Received: by 2002:a37:a249:: with SMTP id l70mr2545611qke.79.1606185781595;
        Mon, 23 Nov 2020 18:43:01 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id 68sm5412251qkf.97.2020.11.23.18.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 18:43:00 -0800 (PST)
Subject: Re: [Patch v2 0/6] Enable Qualcomm Crypto Engine on sdm845
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
 <X7b1ZX5SEMq1PbVN@sol.localdomain>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <48ea0a56-397e-5345-d693-cdc73b20875d@linaro.org>
Date:   Mon, 23 Nov 2020 21:42:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X7b1ZX5SEMq1PbVN@sol.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/19/20 5:44 PM, Eric Biggers wrote:
> On Thu, Nov 19, 2020 at 10:52:27AM -0500, Thara Gopinath wrote:
>> Qualcomm crypto engine supports hardware accelerated algorithms for
>> encryption and authentication. Enable support for aes,des,3des encryption
>> algorithms and sha1,sha256, hmac(sha1),hmac(sha256) authentication
>> algorithms on sdm845.The patch series has been tested using the kernel
>> crypto testing module tcrypto.ko.
> 
> Can you please test CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y too?  Implementations of
> crypto algorithms shouldn't be enabled unless they are passing all tests.

Hi Eric,
Yes. I will get around to this probably next week.

> 
> Also, did you compare the performance of this hardware to ARMv8 CE?  I thought
> that QCE (at least on other SoCs) isn't very useful because ARMv8 CE is faster.

That is surprising. No I did not compare performance. But I see the 
Qualcomm crypto engine driver enabled and used in the downstream tree 
for this platform. I see no reason for it not to be in mainline and to 
be maintained as an out of tree solution. I will try to run some 
performance benchmarks soon.

> 
> - Eric
> 

-- 
Warm Regards
Thara
