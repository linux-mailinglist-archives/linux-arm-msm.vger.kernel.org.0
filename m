Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A1A46989A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 15:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbhLFOZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 09:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245044AbhLFOZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 09:25:52 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94767C061354
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 06:22:23 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id t83so11222772qke.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kRncryoplbgaJpeV0eEsttn1Wbr7ZCHuVrWpcBNe94w=;
        b=Xnyjr/h4PKcJrMEYIfxGKzmK2zKxryeOFNIVXSFxZj1awPEotWBG2ePd3id51lK/d8
         msHza8noDMbrkBQqEHD1FfRPgLaMw7sSBB5O9CTpQcuPqFuqvPQBtspoo12K9UHUImpa
         bcH7jUckFJCA4E+luCE8qjRMdWYWs7wPMwwyNA1BG7DHP3SmPhjENDR2+CM4VRbsUZ+g
         WLnVR/XTHKDm+G9bDKskNNtkSz1e3a2sjxZAb08Ytxs81iydwUrOtUGLitZSsBF4Zk9M
         OQzVSA6iu14FVK0roN0sKmIgJaYYY+XgU0V997ylxWGPaqUFaoP3jf4eIddtPMoLz6dy
         h9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kRncryoplbgaJpeV0eEsttn1Wbr7ZCHuVrWpcBNe94w=;
        b=AFA0ph/cP6ogNEpsGeqdm2nyFunNk28h3C0j7DpX7oNA9/zDRe4tx2YiU8ImSUHUUw
         73u4qODYOu07VtHbMuZuZywz5fxR28LiD/3l0u9Tqh8uYHCpDMR7TwDmQqu+bX6xXUD8
         XHCPOczyHUgPMo78DSFl9dPKlommn4Xk9FkKMJMdDjCdVBit/xkCVlHMSu5Bljc/oL3C
         er7lkqm21134cK8j/hQoAyNLGymmBEchsz+bDVcYYCX5sTFQmIAvYiQ9X5NdN7IUaziu
         bBmhCqBq6r45WSV2RBlxJ+smWiv/z2A9w2/H9MKzNVohjSD+CLc6k90wKIcb7HFK6/ex
         ox9w==
X-Gm-Message-State: AOAM532tHQiI+Jd1+BN/yTsoDZyup+5YKOVbIcpa9uyYf4Il6/9vN0PQ
        Dv2wjE5+tH1AIuGk9MabZ18QlA==
X-Google-Smtp-Source: ABdhPJzqbwIJbL1QNoOo2PSy4XdmW3rAvUfZaFujGIJX62m6SEIXm+R9F5DJOTut1jzGyZ7SctFg2g==
X-Received: by 2002:a37:f619:: with SMTP id y25mr33578687qkj.201.1638800542654;
        Mon, 06 Dec 2021 06:22:22 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id f1sm7653268qtf.74.2021.12.06.06.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 06:22:22 -0800 (PST)
Subject: Re: [PATCH 1/3] thermal: qcom: lmh: Add support for sm8150
To:     Konrad Dybcio <konrad.dybcio@somainline.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        rafael@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211202223802.382068-1-thara.gopinath@linaro.org>
 <20211202223802.382068-2-thara.gopinath@linaro.org>
 <f0ae3d36-8317-b297-cc99-645adca1f25c@somainline.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6771fdd4-b863-6a63-8cf5-441e866f771c@linaro.org>
Date:   Mon, 6 Dec 2021 09:22:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f0ae3d36-8317-b297-cc99-645adca1f25c@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

Thanks for the review.

On 12/4/21 8:34 AM, Konrad Dybcio wrote:
> Hi,
> 
> On 02.12.2021 23:38, Thara Gopinath wrote:
>> Add compatible to support LMh for sm8150 SoC.
>> sm8150 does not require explicit enabling for various LMh subsystems.
>> Move this piece of code under condition that it is executed only
>> for sdm845 SoC.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>   drivers/thermal/qcom/lmh.c | 61 ++++++++++++++++++++------------------
>>   1 file changed, 32 insertions(+), 29 deletions(-)
> 
> [...]
> 
> 
>> -		return ret;
>> +	if (of_device_is_compatible(np, "qcom,sdm845-lmh")) {
>> +		if (!qcom_scm_lmh_dcvsh_available())
>> +			return -EINVAL;
> 
> I don't believe this is the correct approach, as different SoCs may
> 
> require different sequences of these writes (for example SDM660/MSM8998
> 
> seems to only enable the thermal algorithm), and there will (hopefully) be interest
> 
> in adding LMH support for more platforms, so perhaps separating this somehow
> 
> could keep this a bit cleaner and easier to work with for the next person..

I have not looked at SDM660/MSM8998. Are you telling me that these SoCs 
don't enable the current and BCL portion of LMh. Maybe they have an 
earlier version of Lmh which does not support all the features. The 
right approach in this case will be to add a match table with flags for 
init based on SoC. I can send v2, adding a match table with a flag to 
specify whether to do the init sequence or not. Since I am not adding 
the support for any other SoC at the moment, I cannot put in flags 
separating out thermal , current and BCL init.

> 
> 
> 
> Konrad
> 

-- 
Warm Regards
Thara (She/Her/Hers)
