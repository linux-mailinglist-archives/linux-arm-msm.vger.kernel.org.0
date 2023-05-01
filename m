Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF36F3114
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbjEAMmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjEAMmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:42:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7125E1BFB
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:41:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4edcdfa8638so3039870e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682944913; x=1685536913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRAAC9w75oB/bIFgwxyTbBa5xqYXWbXvoGPKDNUWQSc=;
        b=zCAcfUi4sMydaQf3bWSZhtQ+7vrCZpB4JSecvfQIDL7W/UjnSOSDl9VWfMu+zpkfCp
         U01caRTVNBS1XLe/DX1lIpJbicWq1AOAuLcWJ84VyfmlMbZQghUjObMbb1GUaYedx8C8
         qEO9WpDOVMyLlPx5u3qqyg5P4MdlTsn4+E6gaCZWLjur9tNHK9kMbY7zM3nilqvXrp3N
         hccqFYzlACsnszl2tLO7VBvueuuYQNGPRDPQoNbcxrod2ultC2xbWaW194p97m8no0Pd
         PR4Db3+xyEQqrIkniSqcvgXpxO4LWX5keL5ULyh2VVnnfmqPjmgZ3t/ihPCevKf96C/F
         W0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944913; x=1685536913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRAAC9w75oB/bIFgwxyTbBa5xqYXWbXvoGPKDNUWQSc=;
        b=ClB4ucBPaoan86W/xKOhV2rw0KZ0EDw5gQe3SlOq40glHUw1amLSVvIeRbAlBAjyse
         4yYUCOIuFcfDrkK3rT2qwKNzPW6CeeAMVbeb7OtL6F3guM9/dhUZ8mIr6/6AjDuDsHGZ
         pS6LlMcaLDJLeQCnXrKtzxGkjjpP64loc9I6fFUa28jcz5QKvHlYqJlljoZyJ8yrsfUV
         VCb7OubpliHxOY1VCdwrU1i9GGRYn0AK4fWIZsNv/iEnzow2CCz7DiQ+8AbUUPClax2p
         aAaOO7FW5QvpiQdoFXS2RGWOA475PNttURUtBqaVPFML0bk7jLm0aa0zkb4ERuxogbey
         D8lQ==
X-Gm-Message-State: AC+VfDz7l2sPwq+oBVhYGFOpQfBFFWpJCvgef2ILJ7xU+3bUiihQ7sXL
        f7ldv/XOGq3o4gJ3eHAhy0Mc4w==
X-Google-Smtp-Source: ACHHUZ72hLbvezX9uXS2Nydb9J0ngfEYbPtHxnRItKvjEZMFhFA2lLzYs5k6sPy+hyIKhRZ24pQzVA==
X-Received: by 2002:a05:6512:21ab:b0:4eb:252e:3ec5 with SMTP id c11-20020a05651221ab00b004eb252e3ec5mr3596940lft.14.1682944913514;
        Mon, 01 May 2023 05:41:53 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id q27-20020ac2515b000000b004efe8174586sm4008405lfd.126.2023.05.01.05.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 05:41:53 -0700 (PDT)
Message-ID: <cfe771e1-6ce8-b6c5-dd65-ed18f84543a5@linaro.org>
Date:   Mon, 1 May 2023 14:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <516a1313-5dff-d471-2c41-405e2beed4d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 1.05.2023 14:39, Dmitry Baryshkov wrote:
> On 01/05/2023 15:37, Konrad Dybcio wrote:
>>
>>
>> On 1.05.2023 03:12, Dmitry Baryshkov wrote:
>>> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
>>> enabling VCO before the rate has been programmed. This can cause clock
>>> lockups and/or other boot issues. Program the VCO to the minimal PLL
>>> rate if the read rate is 0 Hz.
>>>
>>> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> I think this should also be implemented on other PLL gens.
>>
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> index 9f488adea7f5..3ce45b023e63 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
>>> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>>>       if (unlikely(pll_14nm->phy->pll_on))
>>>           return 0;
>>>   +    if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>>> +        dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
>> VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?
> 
> No, this is the parent rate, which is VCO_REF_CLK_RATE for all practical purposes.
right!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

This probably deserves

Fixes: f079f6d999cb ("drm/msm/dsi: Add PHY/PLL for 8x96")

as the driver previously allowed for erroneous (and inherently racy) behavior

Konrad
> 
>>
>> Konrad
>>> +
>>>       dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>>>       dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>>>   
> 
