Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5703B3D4A89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 00:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhGXWPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 18:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGXWPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 18:15:39 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662B4C061575;
        Sat, 24 Jul 2021 15:56:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id ga41so9308652ejc.10;
        Sat, 24 Jul 2021 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2YkOr/SOjc8e1D7v+UhUxdLCEbTLFclJesQWR+kwwU4=;
        b=jPyeQ8mCSCGcS4f5mZtBfqomTp4MTHmxo9HWg11n//qazKN+3QvEBHKY5jHbvMIkDH
         t/OsPKUdaBBm8Yu81QZdxzq62a2IIT0bKomf+wAvNjIK9grlcxUr4PxpwC5DkVFStrx2
         4LkIl8ULRHMVq1g/ZkbpG/j/YYYp6Xn4v4zkTvheiCOPSpDATsSI/1K5G9oYnDuVBHVA
         zZKJmPQ0umryo1fiGCIWxzmQMcnfMHWp3jXbFr4MOmyTIi7RM+OGcu94+d6fd9jH42KR
         UM3r/wLiqkro4MR66T4YiqBO925oijtN5eMYrCqmuefI78j3YxKx76gWO/UIMmiFvxUB
         i/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2YkOr/SOjc8e1D7v+UhUxdLCEbTLFclJesQWR+kwwU4=;
        b=q5BqcEZKHIIQwZrhHhHcOOYSl0S+5FiJonH5r0851MJKh55vcD2oiZyABYfCe6P711
         IH48Z4UDZwsPMPKcHIQRgmtq9v1Etzr20Uu68m0hXti6CUXLazD6VcTpamHaD+UDk39o
         lwcQPzDwD11iq5bth0aLfIb5hbr54IiRDfa8lEGPZDf9mNlTvqPjqQN4aoOu9r988J54
         A0dtMA7J7rKe8hfoKbCweLSPdS+Jj85TXRj9S7rjxh5y0N6pe9vDdqG10cBshdpixPcb
         EZdvMw+a5+mUIHR0vQ2NLC6uKsh/kKUfZ+c6HKhF9RWgZFwmVJOi25s7iAdQav1NpURx
         6C+g==
X-Gm-Message-State: AOAM531/uD2Mp4nZJ3AyQ5xx+n8hCuQ45BYKGnmS4Lx2MymtFijMFYhZ
        OXX0F9vY7xch6Mvk21hK/Rw=
X-Google-Smtp-Source: ABdhPJyF2fwAlFNkbLur3s36viBfsxpoawYSmYWz6s8vGu2O8tNtfqRcY5iKh/GkAR7FdIVbELP3jQ==
X-Received: by 2002:a17:906:c29a:: with SMTP id r26mr11064629ejz.235.1627167368957;
        Sat, 24 Jul 2021 15:56:08 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:7f54:b3a5:1f2:dfcf? ([2001:981:6fec:1:7f54:b3a5:1f2:dfcf])
        by smtp.gmail.com with ESMTPSA id q8sm14442106edd.43.2021.07.24.15.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jul 2021 15:56:08 -0700 (PDT)
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
 <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com> <87v951ldlt.fsf@kernel.org>
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
 <CAHp75Vc7HDvCiT9Fp2hRsPTzNpRmm0E5yRHSuhpyD1Gqkf2FfA@mail.gmail.com>
Message-ID: <4955687e-1015-37d6-9905-2b68aa9a85a0@gmail.com>
Date:   Sun, 25 Jul 2021 00:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc7HDvCiT9Fp2hRsPTzNpRmm0E5yRHSuhpyD1Gqkf2FfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 24-07-2021 om 23:19 schreef Andy Shevchenko:
> On Sat, Jul 24, 2021 at 11:59 PM Ferry Toth<fntoth@gmail.com>  wrote:
>
>> BTW there is a secondary problem not related to dwc3: the console is not
>> working well and loosing chars. I can connect through wifi/ssh though.
> You mean even on the kernel before any crash happened due to DWC3 stuff?

Exactly.

And this was working fine with rc1.

I do have patches (as you know) for improving dma for the hsu. But, for 
the console afaik dma is disabled.

