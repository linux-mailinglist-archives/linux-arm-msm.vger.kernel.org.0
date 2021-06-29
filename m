Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1579C3B7883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 21:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbhF2TY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 15:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbhF2TY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 15:24:27 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08055C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 12:21:59 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id w13so300460wmc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=damdvsniuzfLU4xpiDlIfaXLWjelQ/xdMOEulCp054I=;
        b=mLwqFo1UJg1kJLGYti0j8XfcuDrZ1euIcaqoVvM3E1w+Tmzxu1jAOluelblZ7yfXrz
         TsLDdBy8WLWT7s7fBCJQctIAasqZyuQBM8TUGKkeTravNZ6psiFVJZhyguFvc8As9/cO
         VeXIzaO6IkkWwyOOkOglI7J52uJM35iHNoojN46XYNMM8TMhQSfAqfbp5ZgUvk2W4vZQ
         GJuHkN6tHZgMLELay7CGtMy+tdDLLcS/4PvoNAX8WWBVgktN3iA48WjvpXOv6QnvIsSA
         Zf4pnvnuhmkoooo7OX8dkibHUlkay8zjIdmMzgx8EsLSZutaXRO8Jz/bLOZ069ADtQJG
         FIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=damdvsniuzfLU4xpiDlIfaXLWjelQ/xdMOEulCp054I=;
        b=TP3TfSYdRr0cHjotVf2tiHgamhvTDeR0ZYiTULOcNt0jlD5v5wEz32eaJx98whNf5K
         M41uxsKWBX5aQYSMKXkU2tgvbO8EEl0c7/lbwtzpeC15zkpmEFQxBXE9KU0RDQlkZGwl
         6xaqCwPrFdW0RXUg+Bm3k3QhmYKHGiu5RWSYdXP9OxiO3plHjwD3yEBkv29JkReOtm/S
         HHp/0KIw54G3OGUzIXey+H/FIHvz95REW/SZ5V9rEyLwsWiWAvKrWirPvld82R9HZS6R
         PjM7bLshnUVt9XbG3lECEO6+vG/j9pnQz9W5LA0Y6s/sr9lW/jauFvqqjQ9aspA9U3sl
         s6xw==
X-Gm-Message-State: AOAM533smhvJ6NVsW1MeBHXUAy5YOYedJNQ6suFyww4auG4ifIXTCCE1
        oL+QUe0eJTZ++hwObEYzVIuiogCvg9fegRT5
X-Google-Smtp-Source: ABdhPJzZuj8O0npmSraJ2TEzSsQyN5zU3RALyAs69sSnwmooxcl5K2YUMCsR8+kc4uFTDTO5ym6jYw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr34143233wmh.62.1624994518223;
        Tue, 29 Jun 2021 12:21:58 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w8sm5436758wrt.83.2021.06.29.12.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 12:21:57 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register
 role switch
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org> <YNtAt3dCGGyj5DU/@yoga>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
Date:   Tue, 29 Jun 2021 20:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YNtAt3dCGGyj5DU/@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2021 16:48, Bjorn Andersson wrote:
> What's wrong with the switch that dwc3_setup_role_switch() sets up?
> 
> That's what I've been using in my UCSI hacking on Snapdragon 888 and it
> seems to work...
> 
> Regards,
> Bjorn

A good question, which as soon as you asked it made me completely doubt 
if I'd tested the tree without the patch applied.

I reverted both on my working tree and indeed it breaks role-switch 
detection.

In TCPM the connector is a child node of TCPM

https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=usb-next-5.13.rcx-rb5-tcpm 
line 1396

We use a remote endpoint inside of TCPM to hook up into &usb_1 line 1303

Not entirely sure what the graph tree looks like in your USCI case but I 
guess the connector is a child node of the controller ?

But I think your question is why bother with the role-switch in dwc3-qcom

dwc3_qcom_vbus_override_enable(){} is switching bits that probably ought 
to be in the PHY but for whatever reason ended up being buried in the 
qcom-dwc3 wrapper.

Certainly we want that for qcs405 if you remember - I'm assuming for the 
sm8x50 too.

Even if we shouldn't twiddle these bits on sm8x50 I believe its wanted 
on qcs405.

I'm open to correction on that one though

---
bod
