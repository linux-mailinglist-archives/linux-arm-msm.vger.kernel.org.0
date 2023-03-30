Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE9A6D1101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjC3Vqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjC3Vqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:46:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7C9D52B
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:46:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bx10so2765991ljb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680212790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
        b=WmHvFUjiDiAFrxZFfl+bZeBK0iAf6Tj5THXzn01fH+JxsoUeSOFGQlKsfh1VpKEe3f
         xTIQXo+y64LBXTWMgBzmiS0dEjljfvbVz7itexOdegJSt6RhHp3uUqbcsEXvlcrGojX8
         ZgokuuEsVMw/rbNeyDqHCOcNJXby2FfRzIOIwcxn1KcI1cVuS8cHtLijorcLrs5Pnl78
         qFXdem3lXnXMS8mYOjC2FTfsDNkfgRUxHLgL+Hr91UeZWe6Xpm2qWOujYGssujGv/ECK
         24LLdaDEEfkEk0gqPNpA/murHiZ20zc49BY7ht6oiSO/lWQOswcaS/FdDwplPk8kDO90
         q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680212790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
        b=nwGCqudPR57FnXmUkOLPB+YKSx/JObLrDkkHj1QrVnIBlnBX5qPmfKsLSavO7EZNL4
         jyIBol25u4qK9gI7B6WPHybLf7rOUjBQTju2XHXGRWHbrthmEN6jb7ASDQ6+pWkIikEh
         CAzdzXVVIelGxmmw5BrJLOdif5iZHVsQZLnxGc+bLHH8iuSi1MFzobu/pEVMfSanIPnc
         iJFO/JAH3/HMqibO122iYaucLW965817w87QWXfytSTyQe7gHSr7PyaCkaLNHTTJn9UM
         +m8TQppVuKhIlJ1+ftb6yeB9wN7mSQgA5TSvSWOFnUdLxYDwzeet4FdEvGAXucCXWjEp
         WupQ==
X-Gm-Message-State: AAQBX9exq05nplo8HSbLCjuydT4dvP2xxXTAn9mzog+zw6Cpn09E7Fsa
        DWuMm3SaD0X1SEDxl6LK6UgI7uqOaIaXCzH/lGM=
X-Google-Smtp-Source: AKy350ZAVBee1zE0gHQ5G0G/YmpxsOLpK53mmAjtYNsKM4JztgEI1u8WQOEpLhH2tb8GE83WwxkNEQ==
X-Received: by 2002:a2e:98c4:0:b0:299:a8e2:2176 with SMTP id s4-20020a2e98c4000000b00299a8e22176mr7520920ljj.24.1680212790415;
        Thu, 30 Mar 2023 14:46:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 21-20020a05651c00d500b0029462e98c07sm79875ljr.35.2023.03.30.14.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 14:46:29 -0700 (PDT)
Message-ID: <8d12f4fc-8a7b-c44b-071c-014399fcfa54@linaro.org>
Date:   Fri, 31 Mar 2023 00:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
 <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 15:39, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> There's only a single difference between 8150 and 8180:
> 
> qcom,sde-dspp-dither = <0x82c 0x00010007>;
> 
> is only present on the former. Not sure if it makes any difference.

I'm not sure too. Currently we support only PP-based dither, so DSPP 
dither doesn't make any difference. Let's ignore it for now.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index c51e1bba1533..457733a6986e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>>   	.sspp = sm8150_sspp,
>>   	.mixer_count = ARRAY_SIZE(sm8150_lm),
>>   	.mixer = sm8150_lm,
>> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
>> +	.dspp = sm8150_dspp,
>>   	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>>   	.pingpong = sm8150_pp,
>>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),

-- 
With best wishes
Dmitry

