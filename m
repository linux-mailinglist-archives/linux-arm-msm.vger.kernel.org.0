Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571BD72CE2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjFLSag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235831AbjFLSaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:30:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8327110C9
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:30:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso56695391fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594607; x=1689186607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86ugo32DRfKDcuMrDG0yQ43XUYb0oQVlSxJDfDAPaVg=;
        b=dKoteqlNv9+E30xypMf0WlSywBagA+fPeLhvu2Fwd4e7n1wieMST4o4+Ozdl8lNxF3
         ZMTMCH3HagCdQ6OhGn3PUMxABYNBP5508IgD/EWwXfUuEnyCJe+MVhSccbj2TpWPJyJ/
         R+kwu6JVoopOxT3LMWS7RbvXphKyQ2eAUWRUXEnZ6kNraY80ffrzXv2dc/1Fv4N2Fy6T
         82wQc6Fa/QWvESYq43VLgwBDOuFduNnh4ZcUQAukv9xS0KRr07PKiFMQwWUXcpQfE9bD
         EEBAg5cuZaCHXRnZQXQnkhg8QQ5Tyq0TnfyYnGSdq0tFs+PCCXm7ahVsdhPR95S+K4ez
         gQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594607; x=1689186607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86ugo32DRfKDcuMrDG0yQ43XUYb0oQVlSxJDfDAPaVg=;
        b=lYgGtj4szOZ6s3Cx1QhH1WSgx6YwIBMXa6hOcWqP65n3ZXCj/TT5J9D72zm7MCWSSQ
         4PXiVYGl8ZXhpuNSnUgMeCw8c8PYVrg6yWb8UQxgKCT16N9VbWcHeL16TK4HkeS73M+M
         K1A9+f4pkoMJRsQBhsVa0uOlK10BO9gd/NUvw8ksepmc590QcrE/eETzNOGKDaciOVAU
         NBQwOywsewOwUkEmrBdUQm5Xz+P8TTs6jCwltS6nRBIxXRGRXGREW6ly1rIeOvEVhwps
         zsaxtxhbOWFCa67wZ5MA/wtisoHZhoWdGlqbpRPeaIVU6EAq9twOu7QnHStCqdu61/z6
         oFxA==
X-Gm-Message-State: AC+VfDwqJocBBBNFBxint3H7i3FXUxCCdNOvFtM8NauB4emtY6oTC0dh
        hV7gbJLypjenULB2ds/S4VBL3gRkYnouXLcElds=
X-Google-Smtp-Source: ACHHUZ6X9nloN3ygOvB6chpZTre6E0HKZJ17Z6MMO57ovWo5jJeV9l7k/AX8bvH4CTKcSrSzc9+hkw==
X-Received: by 2002:a05:651c:1023:b0:2ad:dd7e:6651 with SMTP id w3-20020a05651c102300b002addd7e6651mr3634093ljm.43.1686594606728;
        Mon, 12 Jun 2023 11:30:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f9-20020a2e9509000000b002b32d4a59d5sm530954ljh.117.2023.06.12.11.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 11:30:06 -0700 (PDT)
Message-ID: <a8b72f2a-d5b2-723e-405a-e7c304ddeed4@linaro.org>
Date:   Mon, 12 Jun 2023 21:30:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
 <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
 <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
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

On 12/06/2023 12:21, Marijn Suijten wrote:
> On 2023-06-12 11:15:53, Marijn Suijten wrote:
>> On 2023-06-12 06:16:16, Dmitry Baryshkov wrote:
>>> CCF can try enabling VCO before the rate has been programmed. This can
>>> cause clock lockups and/or other boot issues. Program the VCO to the
>>> minimal PLL rate if the read rate is 0 Hz.
>>>
>>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> This unfortunately regresses my Xperia 5 (sofef01 panel driver that's
>> on the lists) to now run at 30~33Hz instead of 60Hz.  I can provide
>> debugging and clk trees later, if needed.
> 
> I'll also retest the Xperia 1 with this, which has a 4k DSC panel.
> 
> Is this intended to get rid of:
> 
>      msm_dsi_phy ae94400.phy: [drm:dsi_pll_7nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000: -110
>      PLL(0) lock failed
> 
> ... at startup (and relevant rcg2 update_config failures, unbalanced
> disables etc)?  It locks after a couple tries but it's still
> unnecessarily spammy.

Yes.

> 
> - Marijn
> 
>>
>> - Marijn
>>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 3b1ed02f644d..6979d35eb7c3 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
>>>   	wmb(); /* Ensure that the reset is deasserted */
>>>   }
>>>   
>>> +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>>> +						  unsigned long parent_rate);
>>>   static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
>>>   {
>>>   	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>>>   	int rc;
>>>   
>>> +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>>> +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
>>> +
>>>   	dsi_pll_enable_pll_bias(pll_7nm);
>>>   	if (pll_7nm->slave)
>>>   		dsi_pll_enable_pll_bias(pll_7nm->slave);
>>> -- 
>>> 2.39.2
>>>

-- 
With best wishes
Dmitry

