Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9BE3B7933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhF2URS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbhF2URS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:17:18 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11819C061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:14:50 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p10-20020a05600c430ab02901df57d735f7so2658747wme.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k+EFgZQkWxD7BGwPQ4ao+/XMZhybV8mEbFAgsBYJPt0=;
        b=CBFOC0/FwRuDBorBLr1uAVgXwoj0/HH/ssWbR7+6KKMj3pWgLrmS0z21rn4ZMS1hkj
         wE/y2GDUxi51zcyB2bR7X217MNsE48wjPyAZQerdWg8KJja1DsqClYYDaRUR4dOyO67Z
         KOnz5Z8IK/I3cZyo6gz18hH77MGQcWLPQWxAAe/VKfLmcX62sgfHNftjABb7qP840vte
         bX9u5hXplHirF7txR9/P18ZihntUMXUJ7V+/2fgAkZ28IEQ48B8soRl8btP0IsjFQJMW
         gLTjioKrkSAF4sndy4A3w4IikmmVbQvxbOwBOGuZbO4Uh/qdOw8MPU+fEMeF7tBJ/Jxm
         v1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+EFgZQkWxD7BGwPQ4ao+/XMZhybV8mEbFAgsBYJPt0=;
        b=nYX2hqkmIj8PGDhY75NRk7+OOyw7LVh1kz0PcMOcCp5bES+8da8ImnPN6q06kEF6J1
         ga0VjVzd+/inVTs712dYl8ICmQU5RLGCQEgpfPayryxCe0ui5H9lPj53py3cBSOe/rOA
         5LleQOObEAga8y0elH0jqNIU3qEvbDLEgn+P/GsqrvuIy+rUOUSUgbAom3SZlUK9951o
         lIEMy9TUwOrCHA35GKKyJsO56wxiFWdiaYmeauqchhgUWYnL4mGSVIt2JcYP7HzmGdX4
         DO9gdR/+AHjsstTplfmh7lfTSbG0LciWnDPfm4ZjM8SOEHP2PlPrx0ePoXHM6s8MgPQp
         lThQ==
X-Gm-Message-State: AOAM531b4scRAGVihf1jfg3TDsGSJpr01iDrYjxn0hWaJcQaXJL3eGnT
        9Xs2ropN00pPN+CY9MI5CIyBag==
X-Google-Smtp-Source: ABdhPJxX6GJhFGRqH4RZBbeMemBrOHpCtS0VcohCJsXu4eo7o4av1NS0Dfu+dOJEx+LK5oHASm5BRA==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr34008548wmh.104.1624997688711;
        Tue, 29 Jun 2021 13:14:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r16sm10330769wrx.63.2021.06.29.13.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 13:14:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <b55ea2b8-b9a2-2a02-56f1-77345a04adcb@linaro.org>
Date:   Tue, 29 Jun 2021 21:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210629200228.GE25299@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2021 21:02, Jack Pham wrote:
> IIRC there had been an alternate proposal to keep the role switch
> connection only at the dwc3 core but in order to handle the vbus
> override business an additional notification would have needed to be
> done either from the usb_role_switch class driver or as an "upcall" from
> dwc3 core -> glue. (found it, it was by you Bryan [1])
> 
> [1]https://lore.kernel.org/linux-usb/20200311191501.8165-7-bryan.odonoghue@linaro.org/

Which had a bug :( Bjorn found

My excuse for not following up is I had to hand back my hardware and got 
sucked into doing something else.

I think Wesley's approach here is a good one so, that's also why I'm 
re-posting.

I don't have a functional qcs405 setup but, I have validated it on sm8250.

---
bod
