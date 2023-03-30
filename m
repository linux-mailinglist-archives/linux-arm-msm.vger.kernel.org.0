Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C156D10E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjC3Vcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjC3Vcc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:32:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF43CC38
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:32:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x17so26328109lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680211949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
        b=OVuKVEb7pgKQF3vr0EZSfol5Mig2ns7Yk/XprlTV1hA7JdOoQY9G+bTWfz06E6sbp3
         1Tlz81N4K6++tgWAQo1Ca1WD1NRidQBpa01VzgKDXWxjjF0UKLI1WZ8mV1RBaG5ybUSQ
         SgmZGPPbIcz5acSGalsZEsWxzVUbo/h7wkZCh+RC+LruyquKXLnhgNuPstIwU9wlhZzb
         g6ZNjqO+xKWjuPZmqIQ2/GJS4o0CjyW49TWoL9XDvrv/YIeZvWed0sM2IRjeDqErplSX
         eQo+8GaQXobpVk7AWl2UK6CjOIKnbEYp6w5STq2Vk6Av/Dfq5Z0bkHKthJgAjxyu7TaB
         a5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680211949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
        b=JbcqOBD2V6oQJ15swKvMWj5zCNdNuY2SJ2ZFhK0qI/B27CAVKltTIM72OSo2bxHSAl
         XS6XhDu0AYuHgi0OHOwCiA4bIr0ng1kGl9IqnHbRrtNSCWOpDaI8syt9lFYg8e+MEYON
         78bYZpxqE9ZTWiLnxFTNpSmtxAss+uSjoM7eqNpPyEzlyw5Ja3QzKsAiNO7ayEj23lF6
         nFq6SnR1/So8LG55CTDGdYOfIv4kd1h+8Q3XFnq0TTmjG71i2J6gcHBgFsibiJRuEBRm
         vkEIYs1/80uS5iOx8hY6qLEgu8sQpg0d2efHamSCciNxWSdn4AUzMYTxUlPRor7k6+gj
         AvmQ==
X-Gm-Message-State: AAQBX9d1d3b1kohiZlHcqNAOFToElr19Hby9ox98B0cUUuboZchaOhaB
        Y6AD2iKzQX0SZ3uiU/rgcTBtdw==
X-Google-Smtp-Source: AKy350ZGflQvaIlYJPAclGpHbzprCG3zHk+Wm/YCGsHyvM4odrKaN0sSrPL+HGoNMk0vnKUo3BdjQA==
X-Received: by 2002:a19:2d1c:0:b0:4d8:86c1:4785 with SMTP id k28-20020a192d1c000000b004d886c14785mr2188004lfj.26.1680211949367;
        Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25a59000000b004cb45148027sm94871lfn.203.2023.03.30.14.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Message-ID: <63fd5b75-e4a4-0d15-db9e-461a8f4a1cd9@linaro.org>
Date:   Fri, 31 Mar 2023 00:32:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
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
References: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
 <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 15:29, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Theoretically since sm8150 we should be using a single CTL for the
>> source split case, but since we do not support it for now, fallback to
>> DPU_CTL_SPLIT_DISPLAY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Hmm.. so is it a software construct? E.g. "pass half of the data to
> each of the INTFs and tell them to cooperate"?

It is not a fully software construct, if I understand correctly. You 
have to program either a single CTL or two CTLs for a flush.

> 
> Apart from that, since it's temporary, I think it deserves a comment
> reminding us to fix it eventually™

Sure, this is, I think, a next item on my plate after getting all of 
wide planes and catalog in: to rework CTL support for sm8150+.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index a3a79d908451..094876b1019b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>>   	{
>>   	.name = "ctl_0", .id = CTL_0,
>>   	.base = 0x15000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>   	},
>>   	{
>>   	.name = "ctl_1", .id = CTL_1,
>>   	.base = 0x16000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>   	},
>>   	{

-- 
With best wishes
Dmitry

