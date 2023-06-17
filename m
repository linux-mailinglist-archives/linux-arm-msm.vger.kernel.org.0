Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23FCD733D40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 02:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbjFQAjo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 20:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbjFQAjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 20:39:42 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63FA3AA2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:39:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f76a223ca5so1863456e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686962379; x=1689554379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VC2x4FJWSiZrLeCPn46ZG1+j93fJD7lUVKQDEFrK0FA=;
        b=CBIBfEyqNRpOh8YrirE2e7k4+/aIWs/4d6wDAcQtVY19CbM8oworR0RVksJuIQtqzN
         EZ7yeci1b/eTQPWh2FqXrBR8kBv4mtSj1AxXF/TiSd2EEp0ax7uZawwIL7sX+jqEE4PW
         quCEQajT2NT9ijtIOfKjPauWHExP38VcdP72CYk/5aJ2BfmcqdNLl4O5FjBqFfP2jl7d
         mII0PVC3Y4azN6yk3LGlmDRLRFrU21A9Zk186KqOQ3pqEzCui+NbuZBnZdObOEMP6mBs
         4pl7gd8USmwQ4p84hf+ZGyH6e15sNFT+KyrJ91xKR2Az97zV+w16ajcDZj8Io4kCz5Z0
         q/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686962379; x=1689554379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VC2x4FJWSiZrLeCPn46ZG1+j93fJD7lUVKQDEFrK0FA=;
        b=Hy8Ioqmvnji0n2M2nLj44VouAC9vqUTHHWff36X10r5ZbzVrUK9NsK1xIhxFDl3vXf
         QN/rPOv6PT8Rrpx8TOcMupXq3FhLzObi1TaGtiOIJvqH/Mt4GYG47BzENGffx4IxAKbI
         yngvQbmz+vX51seguYiY6FZDEpRPqX4LPPZ3vdCajFXU8vhMjPKxZmUk1SRvN5/Ft7Xu
         LlwKbkeYndJvohoNBAUePv2cZkBIzJXny3i0ihcz0MOrVEKDmuUUp9Ifudn0cRokCyvb
         lfAx/8HFHCZqnEsPy7c05IUC3XTbCReAZHuGoZZXT9sI4jvE9smldAM+I2SNInC51/kA
         PUeQ==
X-Gm-Message-State: AC+VfDwqra2pGBMRuztOMH2WRR885jQOdtUzsfzbpgEd8PNWBdtbPP5U
        KKmU1CFujvZhnvL5lWNWtO5qFg==
X-Google-Smtp-Source: ACHHUZ7Rqa/PqaXfrw0QXF7elEEIGNbjqMM5XZ4t0rgfP0fN+WchgFBHQwaELP42bBuRNIzAuYiVgA==
X-Received: by 2002:a19:e301:0:b0:4f6:2b21:ece1 with SMTP id a1-20020a19e301000000b004f62b21ece1mr2279923lfh.43.1686962379181;
        Fri, 16 Jun 2023 17:39:39 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24250000000b004f4cabba7ebsm3212342lfl.199.2023.06.16.17.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 17:39:38 -0700 (PDT)
Message-ID: <eb73ceac-4a9d-8bc0-226d-3359e547d5a0@linaro.org>
Date:   Sat, 17 Jun 2023 03:39:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/19] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
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
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-3-dmitry.baryshkov@linaro.org>
 <b6junzecn74xvb5gk3tg7d442now2jw336czqcxn2uuup6cowu@w6ghvte6ivo3>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b6junzecn74xvb5gk3tg7d442now2jw336czqcxn2uuup6cowu@w6ghvte6ivo3>
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

On 17/06/2023 01:03, Marijn Suijten wrote:
> On 2023-06-16 13:03:00, Dmitry Baryshkov wrote:
> <snip>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 8da424eaee6a..8fa9d83a539d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -169,11 +169,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>>   			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> 
> This doesn't apply cleanly on top of your interupt rework series: do you
> still intend to land that?

Yes, but most likely after this series. If everything goes well, I want 
to land this series, DSI DSC docs and last minute fixes to 6.5, 
everything else goes into 6.6 (as its review was not started).

> 
>> -	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>> +	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, MSM_DSI_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>>   			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> 
> <snip, same for the other catalogs>
> 
> - Marijn

-- 
With best wishes
Dmitry

