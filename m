Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B356F365F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 20:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjEAS4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 14:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbjEAS4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 14:56:11 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3876F2114
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 11:56:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2aa39ce5d26so28088091fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682967363; x=1685559363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHnHsYqeyjXMXCvsuUTFEMxlXrBzaiqDC0QHxRJwGMA=;
        b=i4jBG1PGxTIiQHLCKi0+xx3ZFX3CegUx/EKeB/IE3HH2t6S9hRmXI2/EiMUTywD7HE
         4FaRfAB2O/vu51Tg44dErZRVn2+sP9iVpyQCf9KS2W50iHlHrOwVL0wv2hq+YaVE4tCA
         3iRjIBW0UGFM2WUjKPE4wyjXN7RPLrI8POjoQfHySEqHTlU9ENx/FTOBFXry/sSXe0Eo
         8Xprf1Bc2k8jwlVPTETN6+FOPs3GDoPnC2ZC25si2+CTwfOkz3LgsibVynlWpDRHD4Nl
         6jHixqS+lM22q/GvSXkN3F54MtzJm0AL+P4hfhzf3t1DtBKs/gUH4TOGdsRDz1V1vD5w
         wolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967363; x=1685559363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHnHsYqeyjXMXCvsuUTFEMxlXrBzaiqDC0QHxRJwGMA=;
        b=Mc0kS2qRBqk+B7VCD8wKvbTgHkptqb6EDWanr5eUVNEkRni4LEoMGANEwJFhD/dhVg
         FTLaPQ1Xr79JWW8qUzXn8Zc/SPf8pfEKlJyR4a/MCoNmHGIpsPlTmACFbczmH6xcklRr
         jm983U0mqCUmfBus0HPvk6dJ/f7e6laTf2Ij2h11inLs1HWU3RBMsRAjtRHzRKzBnCdr
         DwtiPnGi9/Hbl0KmHUx5qugOn3DoaY2rvaRAq9tOaFMERtGSRSOJPfpOJ+dqfdLGP0rs
         ViKa226UiHjLm/C9haGBXj2gk292swCXu0LiyGxKE+3lyV2stWwkzyDrArI/6nwcfXdO
         ipnw==
X-Gm-Message-State: AC+VfDyhDMucfvVWLQKdH+5u7S0iIn71l1GzYjIkMRybftdk2yTnST7H
        XinUFBK2TIM2wLVNMA/SRHfqIA==
X-Google-Smtp-Source: ACHHUZ5MhdpQdvtRSrP/nh43Rexl7II961KNQVe0RIK0bT30UPeaph1/f1UUUjnVeAI2SrzSYBckMw==
X-Received: by 2002:a2e:8053:0:b0:2a7:6807:2cf8 with SMTP id p19-20020a2e8053000000b002a768072cf8mr4068892ljg.35.1682967363427;
        Mon, 01 May 2023 11:56:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u17-20020a2e9b11000000b00293d7c95df1sm4768922lji.78.2023.05.01.11.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 11:56:02 -0700 (PDT)
Message-ID: <c2e1a277-4bb7-d437-9748-be6c36e460b4@linaro.org>
Date:   Mon, 1 May 2023 21:56:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
 <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <61997e7e-1a4f-8b1d-1a7d-a1ed802ae83d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 21:49, Abhinav Kumar wrote:
> 
> 
> On 4/29/2023 2:25 PM, Dmitry Baryshkov wrote:
>> The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
>> Drop corresponding definitions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Changes since v2:
>> - Fixed commit message to remove igc block mention.
>>
>> Changes since v1:
>>   - Rebased on top of 
>> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
>>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 69d1f1e59db1..b2831b45ac64 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -380,9 +380,6 @@ struct dpu_caps {
>>    * @qseed_ver: qseed version
>>    * @scaler_blk:
>>    * @csc_blk:
>> - * @hsic:
>> - * @memcolor:
>> - * @pcc_blk:
> 
> pcc_blk is still there. So this should be dropped. Once that is fixed,

But the pcc_blk is removed in the next chunk. Please take a glance.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>    * @format_list: Pointer to list of supported formats
>>    * @num_formats: Number of supported formats
>>    * @virt_format_list: Pointer to list of supported formats for 
>> virtual planes
>> @@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
>>       u32 qseed_ver;
>>       struct dpu_scaler_blk scaler_blk;
>>       struct dpu_pp_blk csc_blk;
>> -    struct dpu_pp_blk hsic_blk;
>> -    struct dpu_pp_blk memcolor_blk;
>> -    struct dpu_pp_blk pcc_blk;
>>       const u32 *format_list;
>>       u32 num_formats;

-- 
With best wishes
Dmitry

