Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381325F1AF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 10:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiJAIwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 04:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJAIwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 04:52:03 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03371231F9
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 01:52:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id x29so7056612ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=I1mD3KhZ97/pcxxbeRPMN8rmXWsQFsIGEPXFVCg+paA=;
        b=cjxN68w6xaquilwgvT3r6LMYpq73k5/7nVcVR7behxHtZZxWcW/zqv4gJe5wGAtnj+
         dOQ3CNXikhPfUzlMIZTTWCnd4SD2G0Ul1nBECxUgJWDeFRPn4HuGyCVsg7LNxClKegBH
         Cs2rRXE+7F+MNeRP8JVd6og/94zsMW8XJLyj5sgjbhaEMKxvOSy175iuyypqS5kL4HFl
         aqDfLklgTMvLBSedj03GyVKDT/g2Dw9qDVWTLImJ582r+y8NvxaeQ4PT41fUt8QKe4ht
         7G4HudNp2Zz8tKidNV3HNF88DE1pdnFbZ2bPDGLQmYskzVKJRcxqYC5PT79hKlPuHyas
         IqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=I1mD3KhZ97/pcxxbeRPMN8rmXWsQFsIGEPXFVCg+paA=;
        b=KWYql4gBVQ/ueuud7pxfR/SpkPXHseTFrJuGUmWnqZ+A4ZPtBUQ3/dBvbzYddBVI5u
         S70j81xcxFdGCTE1w6URsFH0SAqZe+DwK7Dk+BR1etaQMa2f65K/lIVzQYe0/6G54aL/
         oB+M3jOpAVm97EBO0WGCGZBNit/JlIZhryaeRUdSaL3Q6cZbt1rPIjh4c0NQRVZYWmMB
         ne7Pk320lxvod+q9lSibvq0rEMZtDf56PoX6jrrl57O2sc8C4FT7J56Is4R4w6TL3ib4
         3fKMKvJyIHQR/alw6Ct+9nZmJ67g1GN6RGEesI2o8BKw/mBWSVthyPZ3zcej+Ajp3A+W
         7ypA==
X-Gm-Message-State: ACrzQf1ytQKzNwpQE0lauQPgwJAxAqyg0oXVfNUFBgunhgWNk8qFzdvE
        DL7stw3F5LTvYuN8fKQdwy/C3g==
X-Google-Smtp-Source: AMsMyM41o3/d0KC5vTj9rJ15t1zx7AJU0dSJ/zjhXOWcl1cuF12b/kr6NMpWPFG6Po6Fr5boHNf3xQ==
X-Received: by 2002:a05:651c:1795:b0:261:af46:9d12 with SMTP id bn21-20020a05651c179500b00261af469d12mr3892218ljb.122.1664614319987;
        Sat, 01 Oct 2022 01:51:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b6-20020a05651c032600b0026dcf6a5827sm8686ljp.119.2022.10.01.01.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 01:51:59 -0700 (PDT)
Message-ID: <9acde2c8-ebd2-f603-c6df-98af9ba1c80d@linaro.org>
Date:   Sat, 1 Oct 2022 10:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: msm8992-lg-bullhead-rev-101 resets in initramfs
To:     Petr Vorel <petr.vorel@gmail.com>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ilya <ilya.manyugin@gmail.com>
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
 <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 23:39, Petr Vorel wrote:
> I'm sorry, forget to add links.
> Petr
> 
> [1] https://gitlab.com/-/snippets/2420133
> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs/init_functions.sh#L514-523
> [3] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs-hook-debug-shell/20-debug-shell.sh
> [4] https://gitlab.com/-/snippets/2420128
> 
> On Fri, 30 Sept 2022 at 23:30, Petr Vorel <petr.vorel@gmail.com> wrote:
>>
>> Hi all,
>>
>> [ sorry for sending mail twice, now as plain text. I should move away
>> from gmail.com to something which allows to use mutt... ]
>>
>> Some releases after 5.17 bullhead rev 1.01 started to reset.
>> I'm not sure which kernel version it started, because it might be
>> caused by kernel config or dts changes.

I propose to try to bisect it to specific commit in Linux kernel.

Best regards,
Krzysztof

