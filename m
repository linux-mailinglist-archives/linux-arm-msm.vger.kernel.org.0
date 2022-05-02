Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2156C5179B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 00:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiEBWJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 18:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358256AbiEBWHn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 18:07:43 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1680011175
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 15:02:45 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 17so20017458lji.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DRg345qlmHZAutVgm3n8hsU+OaMYpjvZXMdM8MOZnjo=;
        b=ga3FaG/X/ohjFMc4Jujlc2ehmmBpUcz2YJkY3fsJ2gyyb7p5hEbT98qbNLFwL8OYp4
         RE6Q1ZWxI2k5jUmRfvnLsWAn7XmAo9br8fsMyjpckUVbYialm6bA9iuxQWNywMB7IW4A
         z6GinRfsS7w52iylRW23sd/cvPHWm86Fsk7OSbkRmZVkiXJRHs2irI+h2hj+Fn34QgDl
         LK2WF+scf4icvuUIe7tYyegROsLIw4YfQA7k1u8vFEctfDHb6sORERCBpcVrVT/qS35d
         LY9E0FucDPXtrMsCmaPWF7c6QmcpFnOmAHi4174dVN5CXEcQDdPIrdchKzV8w4Ca7leK
         3qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DRg345qlmHZAutVgm3n8hsU+OaMYpjvZXMdM8MOZnjo=;
        b=rXRVZOlEJ7f+sLvlmYg93VptjOoDK4bwHLH6sHHQZDbWObN9ICq2v/yjULXyyTIkdL
         4zJ71Qd2xiI8RAieE1NMbjUFMCanzOr9+YxXZLillwolLLWxc8xCbzDXUuyb1HifatV8
         CLikL/H521kOF95p7ijoG1GFXrQj2UcFoQKlbCt9E1H7NgXKU7rXRKWUTllCdM4+mL+I
         5EP1drXfIsXk8RI/MVfVAGwgUH7y6by5mrTr3EXtj1qBzvIgBiHCqhuAseYQ0JqH+0Ex
         H5xuwW8ZqzM0DU3hVRMBNLzihiBqjhoA6d09gvMDrJl7qqxOwDi2icj35n99y2oVPhE5
         I2aw==
X-Gm-Message-State: AOAM530HKJgnZ7+Y00uHDXzTY2j3RLqIzgWViLVrHx/wgsdAd0O1ObSl
        8ttedHub2ltQ5yWFosjCgSFqb1HGFlmRqg==
X-Google-Smtp-Source: ABdhPJy6WNB6x1qrzJ4sPQwweY1VOjh4o2BX1ltnVAoPkxi15Di0ZVsfPq77IUaAOO6EguhKxxYqzQ==
X-Received: by 2002:a2e:8317:0:b0:24f:1578:2872 with SMTP id a23-20020a2e8317000000b0024f15782872mr8548271ljh.129.1651528963403;
        Mon, 02 May 2022 15:02:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g9-20020ac25389000000b0047255d21127sm803876lfh.86.2022.05.02.15.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 15:02:42 -0700 (PDT)
Message-ID: <f01f5ace-4ae9-2b65-2ce8-fb2cdc0a5af1@linaro.org>
Date:   Tue, 3 May 2022 01:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI
 pixel clock
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
 <20220502214235.s5plebunh4ttjhge@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502214235.s5plebunh4ttjhge@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2022 00:42, Marijn Suijten wrote:
> On 2022-05-02 13:47:51, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
>>> Remove dividers that are not recommended for DSI DPHY mode when setting
>>
>> Is "DPHY" intentional or just "PHY" should be here?
>>
>>> up the clock tree for the DSI pixel clock.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 6e506feb111f..66ed1919a1db 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>>                  snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>>>                  snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
>>>                  snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
>>> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
>>> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>>>
>>>                  hw = devm_clk_hw_register_mux(dev, clk_name,
>>>                                          ((const char *[]){
>>> -                                       parent, parent2, parent3, parent4
>>> -                                       }), 4, 0, pll_7nm->phy->base +
>>> +                                       parent, parent2,
>>> +                                       }), 2, 0, pll_7nm->phy->base +
>>>                                          REG_DSI_7nm_PHY_CMN_CLK_CFG1,
>>> -                                       0, 2, 0, NULL);
>>> +                                       0, 1, 0, NULL);
>>
>> Can you followup with a patch to move to clk_parent_data instead of
>> strings?
> 
> Dmitry and I discussed this a while ago, and I actually have patches in
> progress converting this.  Dmitry, if you haven't started on the
> conversion yet, perhaps it's efficient if I respin my efforts and submit
> them soon?

Yes, please. I'm under the pile of other things. Your patches will be 
appreciated. You don't have to convert all PHYs at once.

-- 
With best wishes
Dmitry
