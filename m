Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A4E35AC53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 11:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhDJJQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 05:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhDJJQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 05:16:58 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CC4C061762;
        Sat, 10 Apr 2021 02:16:43 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id y124-20020a1c32820000b029010c93864955so5931996wmy.5;
        Sat, 10 Apr 2021 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=43mUlGvVYGuNLrekJwI4Gc0DXIkRXywrJQsY4UWWlS8=;
        b=rh+ruAb9P4RvSytrbNKf13EhS0YyK9i5aaO2cM5ZpyG5SjjKCO/7Vo+k9WO5ILnFdX
         lbgOrqQugR4jz2glMbwgQcPAx8Rua357UkROWkfqYDyH3eXUeZo9fRNtfK3UIAm/Wr+a
         RKTVcAuV0UdfOLp3gX3/MHbVqdE6kTyhfc1gbk0JZfnYQSNlAmdtN2Piho2Bu5k+E9cQ
         R3h455RXuQKfMIvBsTVGa3ZMgie/Ei1SdfI5kMhoESRGqURgEkkDj5saUPfv0LKFsbvI
         7aOY5Yc1EBju+lDulHGeQ8xMF4Ow20FQE8S2y6Ny0Xudj3rj6xTOf0gkDfS+Gb4XiW4G
         OJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=43mUlGvVYGuNLrekJwI4Gc0DXIkRXywrJQsY4UWWlS8=;
        b=AAm6Oi9WRFKSZ0B88jj9C10H7QJoVcjHWkB1/Ue4fQRNN8R0fBKjYMBJ73q4bsc/WF
         Qk4rws3gRZJd+PrS4FnisHvDmlLdTcYxWZLrKuz2MW82+Cz8lfWzAzD43AdIMaD55GVo
         V05Q2VZWD0oKwvbk4mO3MKv0a3ZyZfwm13Vj7CPX6Ww0oOhRdRjBfUtVKIdGRev3TlR5
         2Rp7B4aziH5pDbPXzBTj6Nizy2aDWkqINRXFZG8VqOQhZlEQo5gQYLEa7lmeO/RA8Iz8
         JZYsGu45FYYp0Df9dm/XRMzg8MQFesEy2eHyxTNX4ahUujGQ4sYDiy4HFWdyB9a6UeZJ
         f4Ig==
X-Gm-Message-State: AOAM533OxiMjgscDgZ5hZw6SE/BdzhvC8aBkxEhz9gwyh/b/iyc/w5SV
        K3pGydfES4R+R+Y/rM3ss5yaLY85xShjRg==
X-Google-Smtp-Source: ABdhPJzkioRmTpd4/s3QPcvqK9am0YdoTNAZDabTAybYSdHej2HBT4PyTOS05otDqq9AF0noYu18Qg==
X-Received: by 2002:a05:600c:3590:: with SMTP id p16mr17388059wmq.140.1618046202526;
        Sat, 10 Apr 2021 02:16:42 -0700 (PDT)
Received: from [192.168.1.101] (abac128.neoplus.adsl.tpnet.pl. [83.6.166.128])
        by smtp.gmail.com with ESMTPSA id c18sm8287384wrp.33.2021.04.10.02.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 02:16:42 -0700 (PDT)
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
To:     Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik> <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
 <YG/HwrzRcm7bwgFe@pevik> <20210409033726.GT904837@yoga>
 <YHE9Df/Ztq7VaoK2@pevik>
From:   Konrad Dybcio <konradybcio@gmail.com>
Message-ID: <10d2cd96-3c35-2b06-82f7-98800888e244@gmail.com>
Date:   Sat, 10 Apr 2021 11:16:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHE9Df/Ztq7VaoK2@pevik>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> Konrad, is there any public docs about GPIOs on this secure peripherals?
> It it somehow related to Chain of Trust? [1].  I guess it's not, because once we
> boot Linux all bootloader stuff is over.

No, Qualcomm pretty much does security through obscurity. It's *probably* not even that very secure considering how big in size their TZ+HYP stack is - number of bugs rises exponentially with code size. But not many people tried breaking into it considering the complexity and QCOM's legal team size.

There is no public documentation on that, and even if there were - you are not allowed to flash the "secure" partitions on *your device that you unlocked the bootloader of by choice* (which is absurd).

Also, while "all bootloader stuff is over", the platform is still under control of the proprietary hypervisor and the "Trust Zone". For example if you try to write to some IOMMU registers on certain platforms, the hypervisor will treat that as a security violation and shut down the entire device. 

This is essentially the same as your issue. You're trying to poke a thing that Qualcomm *really* doesn't want you to (the fingerprint SPI pins) and since *they* are in control, they say "nonono" and your device dies. All you can do is comply with that (or find a way to replace the blobs or politely ask Google to release a set of unsecure binaries for your Nexus - which they won't do).

Konrad
