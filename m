Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D7E26021F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 19:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbgIGRT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 13:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729696AbgIGN6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 09:58:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DB0C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 06:58:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so14331073wmk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KSoj6sKRWwSf9PriSO+wN8e6qNhuzgGj+fP6vt6TsCI=;
        b=DwP8otAS0fcugQQgYAWDkANCxP0JcAwtKGF2dn0yUwAGnhGaaq3zEs9RzmpIavjPdg
         HidmYtxqR1IFP/lpxnVQEHEw4kpZYuCqg/xq2Pmozm59zYdHM61GwwW3u3uc5c27oeT+
         0kOWZOwR7H+ZMJManpi8o/v0Iv3ztE51PH96Nzv3sapCoesJvnfuMVYgCtwT3KFyvuYz
         tP+NxwzIk+sOO0Wgg+PtCKRHMa96pixRgQDkfapy1hE0rXQGlUSF584of52GSG0s46JX
         qwnzmeCpxizGyaS+jia1nCnX8GIJg3LBKuQwWLkU9GK6btKvCKUA/Qum8u9vJNsQ1Xri
         trwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KSoj6sKRWwSf9PriSO+wN8e6qNhuzgGj+fP6vt6TsCI=;
        b=ostpU5MVYzherC4EX1F+ZCPOKo+m4zHYLum4d7LGifR3g0CkX1W6vtNh90PmGSqoV3
         JkQBPy7AmT8P6ZGSqVyHDLNlnbrZ7cQo+hVKf02Tulue4Q4xBKpW6W2bbgSoaRnE+m1e
         doxSR/T8NWkF8tiCm4/JYrYLPeNyMrTqajJ00mMyjo49ZPtaLvNDl1s1jTkND556gWC9
         578JHQThf+Ihv1C13tjD3fU9+Tch/lRKbhQ8vxI5YqgO2HLyvxpvRF3GMCuFpIfq+zr+
         47PkDQx34DtrRwejVYoqbe82E40DfaFIST1cCjT6PM7QN21K/m3Wuxo7D8zfhAxEYHlg
         LYEA==
X-Gm-Message-State: AOAM533Umb9SJ1OR7U0xq+XM9QvYghR8x6smiURPhaVeGm/y9+muXF9G
        9U39lAZ5xZeGNQ4lCuLnWWxceA==
X-Google-Smtp-Source: ABdhPJy5VU1DOVDqVdHvBGvU+6zu9otJ00OEZVZ67AfNGf7jmEo1JrN3hn4hNW11pU2KZKRJanq3qg==
X-Received: by 2002:a1c:67d4:: with SMTP id b203mr8910409wmc.120.1599487085253;
        Mon, 07 Sep 2020 06:58:05 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 11sm26388804wmi.14.2020.09.07.06.58.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 06:58:04 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
 <20200907123344.GA2371705@kroah.com>
 <a9d142c9-8a61-ee59-d849-393af1b3eaec@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e0db9beb-bbd2-8f20-d7f4-675b62acf782@linaro.org>
Date:   Mon, 7 Sep 2020 14:58:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9d142c9-8a61-ee59-d849-393af1b3eaec@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/09/2020 14:51, Jonathan Marek wrote:
>>> @@ -1477,7 +1477,10 @@ static long fastrpc_device_ioctl(struct file 
>>> *file, unsigned int cmd,
>>>           err = fastrpc_invoke(fl, argp);
>>>           break;
>>>       case FASTRPC_IOCTL_INIT_ATTACH:
>>> -        err = fastrpc_init_attach(fl);
>>> +        err = fastrpc_init_attach(fl, 0);
>>> +        break;
>>> +    case FASTRPC_IOCTL_INIT_ATTACH_SNS:
>>> +        err = fastrpc_init_attach(fl, 2);
>>
>> Shouldn't you have #defines for those magic numbers somewhere?  What
>> does 0 and 2 mean?
>>
> 
> This is based off a downstream driver which also uses magic numbers, 
> although I can make an educated guess about the meaning.
> 
> Srini do you have any suggestions for how to name these values?

These are domain id corresponding to each core.
you can use SDSP_DOMAIN_ID in here!
these are already defined in the file as:

#define ADSP_DOMAIN_ID (0)
#define MDSP_DOMAIN_ID (1)
#define SDSP_DOMAIN_ID (2)
#define CDSP_DOMAIN_ID (3)


--srini
