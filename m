Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFECD7682CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjG3AWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3AWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:22:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEEF100
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:22:50 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5221c6a2d3dso4667069a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690676568; x=1691281368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlP3J0xhxo2b0PW6U+/tsrSrf7Y3FjtKuZpG8pbYeww=;
        b=uic88FpzzINXJKI7Ia3HTP/JLba205iSm8WzxPBhdOw7D0a8f0WriSvg5cHcOPHkbk
         a+upm06QPkq9q6ka5LnHg82FyNIcpfOaOUGNLJck25cYp+GQ7OU0k8LExDMw/hy35Wnj
         hddOZN/WUTIVrNo/h089maMVtG0OW7KEAvWvWQbGEPuLDEyjTZ/y4OWedNfr7Lnqf3MI
         CLBxwVgpfuEuPCc85RmJypqObaH88HBnr7lkmHNnD5Un3oFUHAG4l9L8yKacaa1dhjFb
         tem6QnX4DwWGiPZMtJvEMjbvHE09gVqwf7v7nUAqjwroI+JIjuXQUuuALJEOxi5B1oYg
         H8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690676568; x=1691281368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlP3J0xhxo2b0PW6U+/tsrSrf7Y3FjtKuZpG8pbYeww=;
        b=ZUJ7z1iR8R55ADmEEqjcKMi9sTBaRG/bLNxpGtnhsCnvEmBFkl8KmWroUNNv6a1Ls7
         KTd+qZJdxl1tb04QCC3X4KdciJ2i703V8naEwLoiHuXkCnW6sSn1W+AhUCiD9nDsjCuL
         bB9s+shxNr55a0HYZ1sIu5x9Xg9s6oLLSbFp0XsUzgDGKZQfWR890g0BHIuA4ohQ2Zod
         38GOGir8HCy4E/ay8pS1uHOLfI4QMv8+DyqKFgvjIpCjkNju9caufcFroQAfz3XZ1EPI
         onF59htoteQ3gK96K8b/uTXjqJh5Hb5pvkAUWitLdWFtxBR8HF9p4zbUZrEXGI/EeX4G
         r8nw==
X-Gm-Message-State: ABy/qLYbfCLbw+B+gErCecixxVPtsOVOelNXOXEFDRMpZ50rfD9l6OP9
        crkeabUhU/TvewLg+jAO2YjtNg==
X-Google-Smtp-Source: APBJJlGY6jIiRs0coVTmmdIlq5hbzqGv4/GB9BgC6o2z45sTgVIIbc9TzAZrmpNo+Z6F4PY/+Yg0fA==
X-Received: by 2002:aa7:dac6:0:b0:522:7d21:9ed3 with SMTP id x6-20020aa7dac6000000b005227d219ed3mr5255993eds.19.1690676568699;
        Sat, 29 Jul 2023 17:22:48 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020aa7d6c4000000b0051e2cde9e3esm3475894edr.75.2023.07.29.17.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 17:22:48 -0700 (PDT)
Message-ID: <726501f5-7c69-6321-38eb-1b57676cf389@linaro.org>
Date:   Sun, 30 Jul 2023 03:22:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/7] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
 <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 23:12, Marijn Suijten wrote:
> On 2023-07-27 19:21:01, Dmitry Baryshkov wrote:
>> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
>> only INTF_1 and INTF_2 actually support tearing control. Rather than
>> trying to fix the DPU_INTF_TE, check for the presense of the
> 
> I would more exactly expand "fix" to "Rather than specifying that
> feature bit on DSI INTF_1 and INTF_2 exclusively..."
> 
>> corresponding interrupt line.
> 
> ... which the catalog will only provide on DPU >= 5.0.

I'm going to rephrase this in a slightly different way to follow the irq 
presence -> major & type change.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 7ca772791a73..8abdf9553f3b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -557,7 +557,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>   	c->ops.setup_misr = dpu_hw_intf_setup_misr;
>>   	c->ops.collect_misr = dpu_hw_intf_collect_misr;
>>   
>> -	if (cfg->features & BIT(DPU_INTF_TE)) {
>> +	if (cfg->intr_tear_rd_ptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

