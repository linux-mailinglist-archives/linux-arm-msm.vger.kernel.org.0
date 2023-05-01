Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2996F30FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjEAMj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbjEAMj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:39:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C703410EA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:39:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4efe8991bafso3412799e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682944761; x=1685536761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txv8tQSio/M3dr4hEPoHmQc4pniTKGNhytxfW6spvgI=;
        b=KSRQ2R4Sz5YdufUS6lM14Io9QXefXtExQ2pWueysRvPauRftuHvhUeZ1bI1TbV3Tzu
         xmmHCdo/IU8xtjilSr8bueOb2ISWezC+gzzWqwxYJYcqIIztdPJQwFDQC5gR5mRjX2VR
         FD8Jv0WR7T+pU6nsYVFuBG5DEFu2xisYEvIx7vDQDj1ARsuAYmLGRNBZvX04OH9Z+HG7
         weRW4wU9uWKqybWfHRDTq6+Gq2Dw1mnG4P8O59ZslOHInWJfIcjxyLdmNxrZc7kzQmat
         NxXZe+ZgUS+f52xLRJaJM9Dgw541L6eurO2wJhc6gh0v6MUGcRq3IB6wbI5HnT1vUrsU
         ajYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944761; x=1685536761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txv8tQSio/M3dr4hEPoHmQc4pniTKGNhytxfW6spvgI=;
        b=OsRFsPU5olg024hul7it5EiovdW98gqWZIFvxPTsObGpYb6JHEoLAM7Cjtam85oqUN
         zYKch3zLmp1pj1JBjt0z+4zbn5Kk33mFGq8yw2bhVKh7zdEpfHMnptASqQq1UCaeAfz4
         Yu3aXjmtzQTmkyORSVs9GGRaO+PPD9i2hn1Bam8wJMtQfJCh0oC9F0MRRcrQ9tUeDKAW
         5G3Qcur1kf5h+xTUSGL31p+MoO6xPKE92eOV5fpuZZ2mkh15e1Fo8NKoAWed27kHvzdw
         KJGzuQBWjCVA+mbyxZY1h1BU8sxCLQPdpLSe07+yi+v/+BwE2QrdX9bDnvYHzswB+Ur9
         CoAg==
X-Gm-Message-State: AC+VfDxiAEDkqd0lrM8fOO6m6E6RdHzj7G/V+6nzMzX1yzovbpAVvD7A
        4FTatslQfxLmQLJ+jUmFZfkUXQ==
X-Google-Smtp-Source: ACHHUZ537lR+5PkqrFZ3S2brdOeZdCOK7zcgsaCORpxqMGPqbBWcXLvuItzwaWxyKhQmJnG3m8pdxg==
X-Received: by 2002:ac2:511d:0:b0:4ef:f64b:65a9 with SMTP id q29-20020ac2511d000000b004eff64b65a9mr3750337lfb.36.1682944761355;
        Mon, 01 May 2023 05:39:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q27-20020ac2529b000000b004f021a4e5f6sm1038349lfm.52.2023.05.01.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 05:39:20 -0700 (PDT)
Message-ID: <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
Date:   Mon, 1 May 2023 15:39:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
 <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 15:37, Konrad Dybcio wrote:
> 
> 
> On 1.05.2023 03:12, Dmitry Baryshkov wrote:
>> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
>> enabling VCO before the rate has been programmed. This can cause clock
>> lockups and/or other boot issues. Program the VCO to the minimal PLL
>> rate if the read rate is 0 Hz.
>>
>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> I think this should also be implemented on other PLL gens.
> 
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> index 9f488adea7f5..3ce45b023e63 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>>   	if (unlikely(pll_14nm->phy->pll_on))
>>   		return 0;
>>   
>> +	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>> +		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
> VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?

No, this is the parent rate, which is VCO_REF_CLK_RATE for all practical 
purposes.

> 
> Konrad
>> +
>>   	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>>   	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>>   

-- 
With best wishes
Dmitry

