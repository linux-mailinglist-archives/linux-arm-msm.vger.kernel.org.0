Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8CD65B315
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 15:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbjABOCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 09:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236078AbjABOCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 09:02:39 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A865F657D
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 06:02:37 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 1so41657042lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXJju++2XKdBI79PkJC0KgQ04gEFmokd8qhFVTrnqnI=;
        b=PaiKor2BD/80ghdsnl24/gkBWVOH5utOlz33dmULRPFqUXLtp5ZVVXTQYVtwzJ0uoJ
         I2eYUzp5+cE+EX2wao79Y/Zla43UOQQ75YvJIJNJqgSEkizNBJFjA0pkZ93j6lJpbigM
         Yxj5QVTJIurn7xRVSGgTiltNSHw1/6Geb5JTgj6S4SRFmYSdwip9BjwlfGWDcocVGTTv
         jWO9OT7BD2EpLu42+EbCgAETfmxngb49CX2YK2K/MgVMuO9YsxMt8wXseN/JMVkeiVEI
         H1KSshD1Jn075q+1HKcjit8mRqxnniPT1oAWkds2Oj5WluIQ6MaAx30c1ElNlVy6gVnj
         6aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXJju++2XKdBI79PkJC0KgQ04gEFmokd8qhFVTrnqnI=;
        b=B1Nbzxyp/CpUfFWEMPYchpceumoI/nuL8QTZdD1xwkBBlUY6jxtPupfchioTRCuUuJ
         0k5S4H+yDoiGM9FvkA5Pf539WC9y6iHvdIzXPTcOL6naQ/zlqEWIeMO71AovKA/2u6tW
         FCuwr0hU1iQaud/42nArXaSyit7ppMQWaduxR+B7Iz59QwEFeopCqkMhqMjnBHDFqAln
         lvS95AROlAso3Jwmvh0yaIgIPf+eBinhRxU/lMhbaRdaYUBsIXT1mnRMg5wDlR4CMe2v
         LQM1qL2vvDmT0O6kGZSGTSBYivi9MjrdVKekzj3+yPKoBi2Ih9tKFtpkkXffHyiUaMyB
         Z2rA==
X-Gm-Message-State: AFqh2kpU5ri1AhKXFmuNIF+qkC/ElAjl7ieWshoBwgVHMCfx5YPrQlln
        nfOsha4EUKMOtnUbFiCgvEcr2Q==
X-Google-Smtp-Source: AMrXdXsLkgY00YSFXmgTqUyJeD1nISMe/K1BIvCC5O3smu1KNtnmmVmzg0A0vjjhl1buAdEeboi/kA==
X-Received: by 2002:a05:6512:3b07:b0:4a4:68b9:60b4 with SMTP id f7-20020a0565123b0700b004a468b960b4mr12078506lfv.63.1672668155815;
        Mon, 02 Jan 2023 06:02:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o20-20020ac25e34000000b004b4b69af17dsm4515737lfg.214.2023.01.02.06.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 06:02:35 -0800 (PST)
Message-ID: <c784ad3b-1b59-2c24-722e-dee09bc45786@linaro.org>
Date:   Mon, 2 Jan 2023 16:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 2/7] drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and
 above
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-3-marijn.suijten@somainline.org>
 <925e8214-4193-bee3-c26b-f7679a60484e@linaro.org>
 <20230102102543.uboz45ahy4vj6xb5@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230102102543.uboz45ahy4vj6xb5@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/01/2023 12:25, Marijn Suijten wrote:
> On 2023-01-01 06:28:23, Dmitry Baryshkov wrote:
>> On 31/12/2022 23:50, Marijn Suijten wrote:
>>> Since hardware revision 5.0.0 the TE configuration moved out of the
>>> PINGPONG block into the INTF block.  Writing these registers has no
>>> effect, and is omitted downstream via the DPU/SDE_PINGPONG_TE feature
>>> flag.  This flag is only added to PINGPONG blocks used by hardware prior
>>> to 5.0.0.
>>>
>>> The code that writes to these registers in the INTF block will follow in
>>> subsequent patches.
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  5 +-
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 53 +++++++++++--------
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 18 ++++---
>>>    3 files changed, 44 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index ae28b2b93e69..7e5ba52197cd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -582,7 +582,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>>>    {
>>>    	struct dpu_hw_pp_vsync_info info;
>>>    
>>> -	if (!phys_enc)
>>> +	if (!phys_enc || !phys_enc->hw_pp->ops.get_vsync_info)
>>>    		return false;
>>>    
>>>    	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
>>> @@ -607,6 +607,9 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>>
>> This function works only with the hw_pp and if I'm not mistaken it
>> becomes void for newer platforms. Please consider moving completely to
>> the dpu_hw_pp.c Then we'd have a single optional callback instead of
>> having a pile of them.
> 
> It also works for hw_intf, which I'm introducing in a later patch.  This
> change is just cleaning up the fact that these are the only callbacks
> (on hw_pp->ops) that weren't considered optional yet.
> 
> Even though removing these writes should not have any effect, perhaps it
> is more clear to insert this patch /after/ introducing INTF TE?  Then
> that patch will likely already include the change that makes this error
> checking consistent for both variants, as it currently has:
> 
> 	/* If autorefresh is already disabled, we have nothing to do */
> 	if (phys_enc->has_intf_te) {
> 		if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_autorefresh ||
> 				!phys_enc->hw_intf->ops.setup_autorefresh)
> 			return;
> 		if (!phys_enc->hw_intf->ops.get_autorefresh(phys_enc->hw_intf, NULL))
> 			return;
> 	} else {
> 		if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.get_autorefresh ||
> 				!phys_enc->hw_pp->ops.setup_autorefresh)
> 			return;
> 		if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
> 			return;
> 	}


This is what I'd like to stay away from.
The following code looks better from my point of view:

if (!phys_enc)
     return;
if (!dpu_encoder_phys_cmd_is_master(phys_enc))
     return;

/* I'd use WARN_ON here, but existing code doesn't have these warnings. */
if (phys_enc->has_intf_te) {
     if (!phys_enc->hw_intf)
         return;
     if (!phys_enc->hw_intf->enable_tearing)
         return;

     phys_enc->hw_intf->ops.enable_tearing(phys_enc->hw_intf);
}

if (!phys_enc->hw_pp)
     return;
if (!phys_enc->hw_pp->enable_tearing)
     return;

phys_enc->hw_pp->ops.enable_tearing(phys_enc->hw_pp);


> 
> - Marijn
> 
>>>    	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>>>    		return;
>>>    
>>> +	if (!phys_enc->hw_pp->ops.get_autorefresh || !phys_enc->hw_pp->ops.setup_autorefresh)
>>> +		return;
>>> +
>>>    	/* If autorefresh is already disabled, we have nothing to do */
>>>    	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
>>>    		return;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 9814ad52cc04..39d4b293710c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -59,11 +59,18 @@
>>>    #define MIXER_SC7180_MASK \
>>>    	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>>>    
>>> -#define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
>>> +#define PINGPONG_SDM845_MASK \
>>> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
>>>    
>>> -#define PINGPONG_SDM845_SPLIT_MASK \
>>> +#define PINGPONG_SDM845_TE2_MASK \
>>>    	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>>    
>>> +#define PINGPONG_SM8150_MASK \
>>> +	(BIT(DPU_PINGPONG_DITHER))
>>> +
>>> +#define PINGPONG_SM8150_TE2_MASK \
>>> +	(PINGPONG_SM8150_MASK | BIT(DPU_PINGPONG_TE2))
>>> +
>>>    #define CTL_SC7280_MASK \
>>>    	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>>>    
>>> @@ -1156,21 +1163,21 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>    	.len = 0x20, .version = 0x20000},
>>>    };
>>>    
>>> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>> +#define PP_BLK_TE(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
>>>    	{\
>>>    	.name = _name, .id = _id, \
>>>    	.base = _base, .len = 0xd4, \
>>> -	.features = PINGPONG_SDM845_SPLIT_MASK, \
>>> +	.features = _features, \
>>>    	.merge_3d = _merge_3d, \
>>>    	.sblk = &_sblk, \
>>>    	.intr_done = _done, \
>>>    	.intr_rdptr = _rdptr, \
>>>    	}
>>> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
>>>    	{\
>>>    	.name = _name, .id = _id, \
>>>    	.base = _base, .len = 0xd4, \
>>> -	.features = PINGPONG_SDM845_MASK, \
>>> +	.features = _features, \
>>>    	.merge_3d = _merge_3d, \
>>>    	.sblk = &_sblk, \
>>>    	.intr_done = _done, \
>>> @@ -1178,55 +1185,55 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>    	}
>>>    
>>>    static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>>> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
>>> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>    };
>>>    
>>>    static struct dpu_pingpong_cfg sc7180_pp[] = {
>>> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
>>> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
>>> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
>>> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
>>>    };
>>>    
>>>    static const struct dpu_pingpong_cfg sm8150_pp[] = {
>>> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>>> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
>>> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>>>    			-1),
>>> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>>>    			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>>    			-1),
>>>    };
>>>    
>>>    static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>> -	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
>>> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
>>> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
>>> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>>> +	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>>> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>>> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>>> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>>>    };
>>>    
>>>    static struct dpu_pingpong_cfg qcm2290_pp[] = {
>>> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>>>    		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>    		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> index 0fcad9760b6f..30896c057f87 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>> @@ -274,14 +274,16 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>>>    static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>>>    				unsigned long features)
>>>    {
>>> -	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
>>> -	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>> -	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>>> -	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
>>> -	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
>>> -	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>>> -	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>>> -	c->ops.get_line_count = dpu_hw_pp_get_line_count;
>>> +	if (test_bit(DPU_PINGPONG_TE, &features)) {
>>> +		c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
>>> +		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>> +		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>>> +		c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
>>> +		c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
>>> +		c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>>> +		c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>>> +		c->ops.get_line_count = dpu_hw_pp_get_line_count;
>>> +	}
>>>    	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>>    	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>>    	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

