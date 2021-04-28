Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6571A36D872
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 15:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhD1NmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbhD1NmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 09:42:13 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D48CC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 06:41:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b23so16742595lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
        b=mKD+BwdqpP+b4KJs/cYSekD0cEqSNkwjJ5DGcCum6eqpKHUSCvM/ojFkhfTdJaCf1L
         YkU6lF8VpmpvOtIXQ2+DTfQWGSMHqtHXDQkAHtME33M58Q9cIbnGCoVoODFMT0OOeHIu
         xS4OTqDnhP/SMWzJRCmsMsV484MSsmaAGILVqfzwTQxc/3UKq4lDk6kouQpxk+XBc52J
         byNA8QeOoiyx52h0rJeCEb2uvsCMONG/z9C0ykmUagZKP3ZClBUXuwTxB8Mt9TEJGj5l
         MWabM6x7lSjmFYFlbpPGRYQWF9U6McKdiO3iwkZcRQP7HZWyQ+8lGMdXxAf2Osa9F7I8
         dpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
        b=n+Q7nzE4+F6BNNyZZoyEkUjYAo60Zv0OgRAB3Lh2x5xXeoePiwuGXBlznG3GvdsuiO
         kZFXhgXH3XVqqlxeo6WLSn6wwfPhuBhre12JHwM8HAs2sYDh9JuFIiMbN/Cs3uEIbzX9
         Tope1VwNwjWBzBpchyod0ZugzSzY5AKuf1B4Qo6b4r9aZc1Br+tPEaDDfAX0dHw+G4W1
         iyn7pnthDGlaKsaZVBIhPyYm3FDk/v8HpMjFKSbyqfhDAFi5l9avm2aDLFj8JeNbsjVV
         kAQnNzpc4WD30wst+jhOaR7NcqZhLkVTwfzaWxrjN0ArhUYUg3pS/5/dB11EHDQXDrxs
         op2g==
X-Gm-Message-State: AOAM533/kPg4Gewg18OvaD8t6AA5WJX9h00E/iXkMOdbXYg6A8rFGYLy
        SIQZEmFI3oF/lGz0E05wJdlB0g==
X-Google-Smtp-Source: ABdhPJwZ8hSuuPlle9JJpl95OeROAwnXVDtwnjuR43flrbjDNYUGcXMjeq6y8jBeVkreKP1v4+xBtA==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr7033680lfe.253.1619617285747;
        Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f20sm1181344ljn.123.2021.04.28.06.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
Date:   Wed, 28 Apr 2021 16:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210428024755.GJ1908499@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/04/2021 05:47, Bjorn Andersson wrote:
> On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> [..]
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 92fe844b517b..be578fc4e54f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>>   }
>>   
>>   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>> -				  const char *dbgname, bool quiet)
>> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> 
> size_t sounds like a better fit for psize...

I was trying to select between size_t and phys_addr_t, settling on the 
latter one because it is used for resource size.


-- 
With best wishes
Dmitry
