Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08677260D64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 10:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgIHIT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 04:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729554AbgIHITz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 04:19:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0185C061573
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 01:19:54 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k15so18065679wrn.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=onJm5JoeC8wX6+ligEVQFIaG2k7uPzPHxbYAuHbpW6s=;
        b=dzitBvmxxPd0DOKY9vCthE+mkoJQdvLGSUrs45nVY4M2qJIhMIdhBpg+WPNIEgAjwp
         5UWlLrxf7Ppw74nA3bkqczIe988DdwWh1PM+3HL101h8pJB9EtURdgqnb7ni48A4zE5T
         UUxGfMrgNOVAtzRNhGwxcue4hF8QcriQCL26kKOANnOTW21JuHdjbn9Q4IQlGBMMu5TY
         jJkmwnqSskLaP3dH4lSMdhEetwX5bQVtQlMHWU0KFDaax4lvrE4F0OdR1Ofj3KgmC3BN
         7GHontSjT9d2tK8/GyDr5/MIWOQvrYqBJb2IrFXXIZ+b0P2zbDeYwDIIQcmP7CRAQkh4
         HCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=onJm5JoeC8wX6+ligEVQFIaG2k7uPzPHxbYAuHbpW6s=;
        b=EZ/ZrgD7xJnIqzOUG1OZYBHKrGvBfjCKxDg4wkoC3/3H4N+XMmSS7K+0IcHB3+9BRG
         37v8+ozPIhCUrdug74fs1YuL5lrUuD0cORtAb4iV431eWZIL741ifr0GF7rJ3kbs0CFA
         9Rqlg0UhJgpOfxeBGcK73Im66bL7fcIqsne9PTlV8l8wGb/PmQs+DG8wR2nsVoIT5MfM
         7j0wlwhFpOFp+IPzxqHvZq7P3CgnAXlrMOgWAivT43YuakWd1QwPCUCMIrQel3+K3Sc6
         ESriBtyjl0l4uBtOAmE+bGwciv7EQT1pdb+eds7Q6m2+4aEo/R+2Xdbu2kKh5eIKNfnE
         h5uA==
X-Gm-Message-State: AOAM531wpJdhfJAO+u8dtKD29mPsqW+wxdom1+qqShWcJD1Gy8h0shnH
        LNGScOAIbUA5Ngaxo9ia9I+0/Q==
X-Google-Smtp-Source: ABdhPJxj2bfSNW8Ovib+gu1LoHpS3QT4XJEReAaEIVQ3y4/K/GkrM+u+4MSvbj4y4JreCiUH4teq/Q==
X-Received: by 2002:adf:ab5a:: with SMTP id r26mr24977054wrc.194.1599553192356;
        Tue, 08 Sep 2020 01:19:52 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id c205sm31146488wmd.33.2020.09.08.01.19.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 01:19:51 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
 <20200907123344.GA2371705@kroah.com>
 <a9d142c9-8a61-ee59-d849-393af1b3eaec@marek.ca>
 <e0db9beb-bbd2-8f20-d7f4-675b62acf782@linaro.org>
 <4b617c4c-f0f8-3d6b-c726-9dd4bf705fbc@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ba161732-038e-de38-e357-a36494ad92ab@linaro.org>
Date:   Tue, 8 Sep 2020 09:19:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b617c4c-f0f8-3d6b-c726-9dd4bf705fbc@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/09/2020 15:02, Jonathan Marek wrote:
>>>
>>> Srini do you have any suggestions for how to name these values?
>>
>> These are domain id corresponding to each core.
>> you can use SDSP_DOMAIN_ID in here!
>> these are already defined in the file as:
>>
>> #define ADSP_DOMAIN_ID (0)
>> #define MDSP_DOMAIN_ID (1)
>> #define SDSP_DOMAIN_ID (2)
>> #define CDSP_DOMAIN_ID (3)
>>
> 
> I don't think this is right:
> 
> FASTRPC_IOCTL_INIT_ATTACH uses pd = 0
> FASTRPC_IOCTL_INIT_CREATE uses pd = 1
> 
> And these two ioctl are used with all DSP cores. So it wouldn't make 
> sense for the pd value to correspond to the domain id.
> 
You are right, values are pretty much similar to domain ids but not 
exactly the same as Protection Domain(PD) ids.

I spoke to qcom guys about this, and this is what I have.

0 is Audio Process PD
1 is Dynamic User PD, cases like SNPE or CV
2 is Sensor Process PD.


Hope this helps!

--srini
