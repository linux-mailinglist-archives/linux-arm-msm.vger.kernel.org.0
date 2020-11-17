Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899D42B6C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 19:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbgKQSHl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 13:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729869AbgKQSHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 13:07:41 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9D9C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 10:07:39 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id z3so12794303qtw.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2SS128aons6BQS3TKpOR9L0j7t9FSqGwHFgxqCfMpDU=;
        b=fBNW3I5RV8rBpWXFp56lTRkZhxGxYxMOdZN4ufQ5AR7Aiv4TsAZziPHSOw4y5pWsE3
         48h5FIdIgpYKP1E2NXvI/AcxoTYF768F+P6C6JC5/+xLAM9Oj9Mfw9AKk/JD2BzUKSKd
         Km5AGnuylL2kyRGfMDnHTlVDJuLD594rUwr3nQIjw0Ejsz/cyXkVEzvjedls5q3smlSB
         CQA5AhwAi4BgZ8cZjemn6HGwSAzDB/TPGPgHJZeE0ghuB4zr7f4F6IEeOJPOpsFHEB2h
         8x1pQFbnTA57mqAqt3wS3b3p9YEWcNGMxtOLJ/MdheQpCcpHbSigJozKkVbSd007760T
         jJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2SS128aons6BQS3TKpOR9L0j7t9FSqGwHFgxqCfMpDU=;
        b=F+bDM4QCuGrfEBnGtmUxBsLWvObm9EfilAo61BGQtsk3mf+1xjnR4rY07P2+3l/sd6
         sPSs8lsBMEXUuemNYYIsetNlAlUmdJ5MfSuksCOJJ4Qi4F+7+lCp9oWbtK97TZzt1Iix
         cQOowXNRzDhNNFNO+UFcgOVqifxgWLpe5085cTevpFQ8CsiEwNdtcnvKOPa2a6W7Azr4
         1etVEPB5olDZsAmCZ5aZ8pamgHKbJOLZCSGorzOncKrvt4nEVJiYnkCtZXDu+mXr1USE
         Xo1oRIj7YTHEU6rqOLMv1GOMXHU3jM4hBBR92rOBPhAXMTsItEzyDY3+FUkrL4wVR82U
         KPwA==
X-Gm-Message-State: AOAM532pkqeMx6h3hri5oypX93Auoe8GppboKmyrVFTw4+8Ss9RTKpGu
        iChX8pEhC0zwFsHaWqyCJTa3mw==
X-Google-Smtp-Source: ABdhPJzu1uZfI39HSUvCvU1l/3UKdy6XJ21aOheouU1xUuby7ej2D5BtDzqZgwhLlk5/sYIGR/PJzg==
X-Received: by 2002:ac8:6f3b:: with SMTP id i27mr915044qtv.221.1605636459096;
        Tue, 17 Nov 2020 10:07:39 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id w30sm2997727qkw.24.2020.11.17.10.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 10:07:37 -0800 (PST)
Subject: Re: [PATCH 0/6] Enable Qualcomm Crypto Engine on sdm845
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
 <X7QA/BMr/A/jjayk@sol.localdomain>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <49ba008a-fd92-46bf-daf5-a8d3dd4132ea@linaro.org>
Date:   Tue, 17 Nov 2020 13:07:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X7QA/BMr/A/jjayk@sol.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/17/20 11:57 AM, Eric Biggers wrote:
> On Tue, Nov 17, 2020 at 08:47:08AM -0500, Thara Gopinath wrote:
>> Qualcomm crypto engine supports hardware accelerated algorithms for
>> encryption and authentication. Enable support for aes,des,3des encryption
>> algorithms and sha1,sha256, hmac(sha1),hmac(sha256) authentication
>> algorithms on sdm845.The patch series has been tested using the kernel
>> crypto testing module tcrypto.ko.
> 
> Did you do this testing with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled?
> Do all tests pass with it enabled?

No I have not. This is in my todo list though. I am trying to enable 
AEAD algorithms on the crypto engine right now. I will try to test it 
out with that set.

> 
> - Eric
> 

-- 
Warm Regards
Thara
