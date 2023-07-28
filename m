Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5274D76791D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbjG1Xpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjG1Xps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:45:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A89A422C
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:45:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so3557264e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690587945; x=1691192745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/n1JPNuJ75Ogx8yM/eUcypT1mvEpcocaIiO/JZ3Qfxc=;
        b=s3TAMdWB2VLp+qzKqtqT3x/DJi1ULZkF7rMe4lsNz95J4pXaiP/uByTb0LNZXNGI3d
         scZTRDCE8yPjHrr5gD/emXAeOjAzi78CEObkByISg+J0l1gx9RVhsz98yBXgyblXDb4M
         G/r8unR7CKbvvntvbt9b9NY6fZvC+sSgGEOqK5ywDAMnFxPit55wrWy/0ndyPRvBHYaG
         HXn1SOVa/3/FH8NwFAuV+qDt8RhqvUthtGLQF3jN9ox70TgIdw87pGga1hfEvLFiFANn
         klw6jv28N9cdnqefh5aZI3BIgCq4mFG1u1iuzC3gobAwFP38MoZjQus+HiuhnpIOKHSn
         X1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690587945; x=1691192745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/n1JPNuJ75Ogx8yM/eUcypT1mvEpcocaIiO/JZ3Qfxc=;
        b=euuQQAStHtuT2SbxvoucQ2l1sOvC4exobTUP0PaqdHGqJbNpNcUm1mpuylVJS1StgR
         o6HIpzdd54o+1gd3ctj/g18JtG5kzTIXoZaS4DO+R0iSuWYkyoTJypXJs/YlUZnab4gJ
         1iGvRmT5dYtGPfdWmGEFIkg86c16QC5Sjr2hxRAGyAILVuh2y6OD1S3Dn/H66Slgwtn6
         IEfoXFk/lPvlWwJmwuYjD8HM2IXLC4lg37Lxq4HXHxpVuVo04m0L3qWcY1aWGw5K/LjA
         H6XF5tVVUEcA+DGco1P0xPmzjmhKLPNAOWPOBK4AAzrx3RE/Whh5aHfukdmfqVPRYdQr
         cA+A==
X-Gm-Message-State: ABy/qLa9Jr8FTPt5chMcfCeTfjWAVfumD1B+ifnegDwy/4R+CDNnBFMa
        PSlVxiRWElWA13T2+gjOzSXTnA==
X-Google-Smtp-Source: APBJJlEoyss1sGA4AND5dNqRRtlBHALsG1Lxa2WfuPTBiLAiVTkdNZpX7AGh932jJq9xFuX7aewzOg==
X-Received: by 2002:a19:e041:0:b0:4f8:69f8:47a0 with SMTP id g1-20020a19e041000000b004f869f847a0mr2392145lfj.29.1690587945503;
        Fri, 28 Jul 2023 16:45:45 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d993000000b005222aee9ef9sm2254713eds.97.2023.07.28.16.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 16:45:45 -0700 (PDT)
Message-ID: <e421a9b0-5943-faff-ebde-dc94cce43e69@linaro.org>
Date:   Sat, 29 Jul 2023 02:45:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/7] drm/msm/dpu: inline _setup_intf_ops()
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
 <20230727162104.1497483-4-dmitry.baryshkov@linaro.org>
 <wv556zme7i33pczp7aqln5xcljz4xuygmqkmcrw2jayrmu4tsh@ohrbffyirknb>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <wv556zme7i33pczp7aqln5xcljz4xuygmqkmcrw2jayrmu4tsh@ohrbffyirknb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 23:10, Marijn Suijten wrote:
> On 2023-07-27 19:21:00, Dmitry Baryshkov wrote:
>> Inline the _setup_intf_ops() function, it makes it easier to handle
>> different conditions involving INTF configuration.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 47 +++++++++------------
>>   1 file changed, 21 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 8ec6505d9e78..7ca772791a73 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>   }
>>   
>> -static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>> -		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
>> -{
>> -	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
>> -	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
>> -	ops->get_status = dpu_hw_intf_get_status;
>> -	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
>> -	ops->get_line_count = dpu_hw_intf_get_line_count;
>> -	if (cap & BIT(DPU_INTF_INPUT_CTRL))
>> -		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>> -	ops->setup_misr = dpu_hw_intf_setup_misr;
>> -	ops->collect_misr = dpu_hw_intf_collect_misr;
>> -
>> -	if (cap & BIT(DPU_INTF_TE)) {
>> -		ops->enable_tearcheck = dpu_hw_intf_enable_te;
>> -		ops->disable_tearcheck = dpu_hw_intf_disable_te;
>> -		ops->connect_external_te = dpu_hw_intf_connect_external_te;
>> -		ops->vsync_sel = dpu_hw_intf_vsync_sel;
>> -		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>> -	}
>> -
>> -	if (mdss_rev->core_major_ver >= 7)
>> -		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
>> -}
>> -
>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>   		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>>   {
>> @@ -571,7 +546,27 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>   	 */
>>   	c->idx = cfg->id;
>>   	c->cap = cfg;
>> -	_setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
>> +
>> +	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
>> +	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
>> +	c->ops.get_status = dpu_hw_intf_get_status;
>> +	c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
>> +	c->ops.get_line_count = dpu_hw_intf_get_line_count;
>> +	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
>> +		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> 
> While at it, could we sort these down with the other conditional
> callbacks?

What kind of sorting do you have in mind?

>> +	c->ops.setup_misr = dpu_hw_intf_setup_misr;
>> +	c->ops.collect_misr = dpu_hw_intf_collect_misr;
>> +
>> +	if (cfg->features & BIT(DPU_INTF_TE)) {
> 
> Any clue why we're not using test_bit()?  Feels a bit inconsistent.

Yes, some files use test_bit(), others just check the bit directly. 
Maybe after moving some/most of conditionals to core_major_ver we can 
clean that too.

> 
>> +		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
>> +		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
>> +		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
>> +		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
>> +		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>> +	}
>> +
>> +	if (mdss_rev->core_major_ver >= 7)
>> +		c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
>>   
>>   	return c;
>>   }
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

