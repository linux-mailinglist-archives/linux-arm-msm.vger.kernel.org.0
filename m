Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149CD6F22E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 06:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjD2EbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Apr 2023 00:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjD2Ea6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Apr 2023 00:30:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A552D73
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 21:30:56 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso2210825e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 21:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682742655; x=1685334655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70CLsPLPGvYuNGCjjpWeKhkV30RvIZvFqib8wvNo8BI=;
        b=S/kK6yVm8up3febiwVIbdTbOHRiu4sICNqG7fPocRLpCbKh7ooJiFrB74BwT2cBaH1
         /IogxMopSr+iRD9yMRLii3vYSJelmEp8PrbgBs4UeBiCcZeZWS11hCD3q5JfVh9Lbfg9
         iVXZ+kq0xbbBc+bMJ/kQSGONAotxpEnxGTxrIWb4J088lvXMXq2Yc9jqa/ko+TBWJof/
         vjOmeN1AYcZ+oQaQoClZ+WCduwzp2Psz3phLIwySlcyC7S3Jbqo8+Mu322GjnjRAAyn1
         bKQyR5v44C4po8rHXc9fNbQPxyJR8/f4xW2fgfXpwVH0BXMoYjOC6O5GWiePJ1a2oAk/
         XUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682742655; x=1685334655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70CLsPLPGvYuNGCjjpWeKhkV30RvIZvFqib8wvNo8BI=;
        b=FlIPbDPYkFNakvazqR0zI9VMZop7EH1dkqnxJR+7n6eRLRRnsB74qMOrRh4/aLhTPD
         ZkfvmQS3CjGuAGZCcwvwu+OkmKK/ZV06LYdikPLNqbgt4Ly5nDxmZC6qmI5WB/7uBFTP
         fSTNgwau40X61yuF4beqS0MbCbJ4nDci86deqjXfa82UhUa/mUn7OaORYFNk3XBzaa1U
         rAYl1Y64o7kYO6Ulv1Fu5OMzJWT2GFOM6G73dqxUosuTRnbQRTNbwBgWIWZHgkDNrQxN
         7Ui1rsgW93mQZAHqSwIyipHabt4+2iCKqKUYlBwbxpBVqkefx2PqrXgYR7/hqsTWR1Ud
         yzxw==
X-Gm-Message-State: AC+VfDwCswEyHAcVXVRAchq2cXRG4tirnU0BS/BRg0Dkz4VRtI6dIog5
        pCZnubFGWkexUeLj1PI0Ojr70inqxLGi6ooH32p0Tg==
X-Google-Smtp-Source: ACHHUZ7yGixdJAGrCOCAVMIN2RhZecVVxHWLhGGgOW4BlsMHqcuFh0X45hj11xVYaxopwGAcwZ+BVQ==
X-Received: by 2002:a1c:ed01:0:b0:3ed:2e02:1c02 with SMTP id l1-20020a1ced01000000b003ed2e021c02mr5399359wmh.23.1682742654802;
        Fri, 28 Apr 2023 21:30:54 -0700 (PDT)
Received: from [10.6.30.123] ([212.140.138.202])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b003f1978bbcd6sm28540488wmo.3.2023.04.28.21.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 21:30:54 -0700 (PDT)
Message-ID: <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
Date:   Sat, 29 Apr 2023 07:30:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
 <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2023 07:29, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 7:42 PM, Dmitry Baryshkov wrote:
>> The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
>> Drop corresponding definitions.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 3e92c2c66716..db6488a6929d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -384,10 +384,6 @@ struct dpu_caps {
>>    * @qseed_ver: qseed version
>>    * @scaler_blk:
>>    * @csc_blk:
>> - * @hsic:
>> - * @memcolor:
>> - * @pcc_blk:
>> - * @igc_blk:
>>    * @format_list: Pointer to list of supported formats
>>    * @num_formats: Number of supported formats
>>    * @virt_format_list: Pointer to list of supported formats for 
>> virtual planes
>> @@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
>>       u32 qseed_ver;
>>       struct dpu_scaler_blk scaler_blk;
>>       struct dpu_pp_blk csc_blk;
>> -    struct dpu_pp_blk hsic_blk;
>> -    struct dpu_pp_blk memcolor_blk;
>> -    struct dpu_pp_blk pcc_blk;
>> -    struct dpu_pp_blk igc_blk;
> 
> I have included IGC in this patch 
> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
> 
> So that one can be dropped from this patch?

It will get dropped while applying because of the conflict.

> 
> Rest is fine.
> 
>>       const u32 *format_list;
>>       u32 num_formats;

-- 
With best wishes
Dmitry

