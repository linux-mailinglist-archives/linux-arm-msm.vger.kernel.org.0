Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA57469449F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 12:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBMLfO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 06:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjBMLfG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 06:35:06 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8693448A
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:35:05 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s11so4695641edd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kO61Xdr+q3Xm/aE1pgal7R7MWN8+6oxdSKgU0U1UyM=;
        b=aNkt7NyT/zDXkcN+k4nhOMnT+Q4V2oMXq57WA+MQzmYKT828gn+Qb0d/73CmKSyGVy
         ZsKQozLMCViOvi/1/0vN2cT9pzpvfHXg7Hj/jF+mq7BAO2UdBGhpvqubOcUYu8UMetwE
         +xG0txJEaTcuJuc3k76xnvbkedvCjF89AhaC9Bm+wzeslIQk0vfbclQJKlJ+pD4exWx1
         Xe8Z+2T2QitIwu9FTxgRQDHOC3tkhMjlbf/ZIBVwmv1qkLAjUs+jP+bOSt4zIuqmXAmK
         3yfh4vnWbd12j05E1qaphjH1VYJTGSxRH6XJpANN4WIsOVgao+322I1nB6opXkPZ6twq
         aIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kO61Xdr+q3Xm/aE1pgal7R7MWN8+6oxdSKgU0U1UyM=;
        b=akcCQ7kZbzjUk8g6vGcH4RMveY/JwZmsCk96T/XP/OT+DyhU6e8FBv5TQWuJhg4aFs
         eI9qnDoAXZeZ/a8CZiTXej/MyZ2PqmghzBV95Oo+ftQKAiOJYP4hp/YrOfaesD33EUTC
         27x6ak+/0x/f2mcpk8U4wDM7GvVUZXzpZpJU4SeSqSVCpRTYV2a0Ft4MI2iRfH6Nlm1z
         jg00hWGUqv6FYoVrIRpOZeMlBOnDC/CT4421iFUxvgsPtR090R+ufpXpF7JIHzgaYzG0
         A6mlKyWSdSAPSTD6KSfJrKs7Yjihxfeuho7Xln3IJpEQ3kwCIDkNMo0SOb/zWrjMxRpu
         R+cA==
X-Gm-Message-State: AO0yUKUblR+9tpniwGWnRbKhx9CU2Qt5n3QYgDj+WDYErJufvzmpsd7w
        zQAB6VOg8kMf+MS+t/hyESW2rK72mYihhlbT
X-Google-Smtp-Source: AK7set86B+Ujcg/vW0N50ATX4TqqCB7mTK19gsN++SiRbozDYUP8807huE7WiHrtRmFGrNHon15wcw==
X-Received: by 2002:a50:9e2a:0:b0:4ab:d15:7e5c with SMTP id z39-20020a509e2a000000b004ab0d157e5cmr19017164ede.36.1676288104215;
        Mon, 13 Feb 2023 03:35:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id eg21-20020a056402289500b004acb6189693sm3760351edb.83.2023.02.13.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:35:03 -0800 (PST)
Message-ID: <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
Date:   Mon, 13 Feb 2023 13:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Liu Shixin <liushixin2@huawei.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 13:30, Marijn Suijten wrote:
> On 2023-02-13 12:15:19, Konrad Dybcio wrote:
> [...]
>>>> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>>>>              DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>>>    };
>>>>    +static struct dpu_pingpong_cfg sm6350_pp[] = {
>>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>>
>>> No TE support?
>> It's.. complicated.. With just this patch, display refreshes, albeit
>> not at 60fps. Marijn is working on getting it going, though
>>
>> https://github.com/SoMainline/linux/commits/marijn/longbois-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> 
> This branch hasn't been updated for the longest time.  I'm preparing v2
> of the INTF TE series at:
> 
> https://github.com/SoMainline/linux/commits/marijn/dpu/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> 
> and it has about ±40% of Dmitry's review applied.  More to come now that
> hiatus is over.

We should agree on landing order for my rework vs your changes. Can I 
try persuading you to review that 50-patches beast? With the hope that 
you'd agree to land your changes on top of it?

-- 
With best wishes
Dmitry

