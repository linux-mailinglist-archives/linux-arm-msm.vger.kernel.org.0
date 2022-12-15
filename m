Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3FD64D4E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 02:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiLOBIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 20:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiLOBIT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 20:08:19 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E92D53EDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 17:08:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id q6so13273846lfm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 17:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsaRLkm/vwXxzlLyKu4jlm4+2WM6DP8526OuSSygcWA=;
        b=e/tyXnEmKVMlosrxYNSJ4TRWBkVHKV1WcoJK2PEqUyRNf1XAG9Zb02fA8uSRCohEgC
         eCP7uqTEtyYK3XitbmXIRskOlTd0Oq9GOIAnxPVLbXncgZAgw0Ml/yTy4V8LI83AjAuW
         ZgCFd8fRWlnkVW1sACMj0XWvsH1JV9znURWYIeu4nsX1tYw2KEkKkL3xwQ56V476bx55
         IoBLqBytC29sL/z6xjwbeAw0XvO4yqQvLn2mBxQnWIjRNbsOgYP/726YA9HFUrfhyTlg
         niWjxdRrruIizGya29lq2sVTIImV6oiAKNh5dqfNk1t2XV74ibNvAeVo372KFE5BOW1D
         HgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsaRLkm/vwXxzlLyKu4jlm4+2WM6DP8526OuSSygcWA=;
        b=lzZyJAhObni906qw2y17Wq1FA2RaXDSL+7Ig0G/xcmRCHDsYmZK+6SxVLYImWrIKMl
         aoeLPgMjDl9cOi3tKBJDaPZuPTADC/NOIQhbGtkrw9YGSlCcU3Y8iQak1G3VkJzZCABs
         6+6YFBBiwYfRAXosmcQGDfXlYo0mjEyTqrDoGhWCNdasXXWwYCIfKIEhXo1WS0wPHrzR
         cxCuF+vLGzRlFgTTSpJMtDoraXaeyw7Ogemt4F/juDYYLo1HEDUwF4vHpmByiagAiH0p
         oAkd9tBVdYke2EYuFfPEe2C0oJRwyJcflwlPRfI6QlCFaCsBXDu+sGJqYqBI9sIhNe0c
         0VWA==
X-Gm-Message-State: ANoB5pmnQxWfj9BcJpDpLsC7wZ1FstQCGFb/Ad1EK+F79CsDuixOz7pf
        NzoDrWxlpt5kW8oUjWJ6w1S64w==
X-Google-Smtp-Source: AA0mqf6MsCNHCup6o2mSk9vO3rQaFw8him0OP9c58cXZ0X38Ti+iLAHJ/FMdd873Vlf/mWarROFF1w==
X-Received: by 2002:a05:6512:2a86:b0:4a4:68b7:d625 with SMTP id dt6-20020a0565122a8600b004a468b7d625mr7210662lfb.12.1671066495361;
        Wed, 14 Dec 2022 17:08:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f20-20020a193814000000b004b55ca70844sm1003547lfa.175.2022.12.14.17.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 17:08:14 -0800 (PST)
Message-ID: <658da2cf-1e1a-af27-b085-edf0887b8dae@linaro.org>
Date:   Thu, 15 Dec 2022 03:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 3/6] drm/msm/dpu1: Wire up DSC mask for active CTL
 configuration
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-4-marijn.suijten@somainline.org>
 <184d22f1-7ed1-4a67-1c25-9fafeb94db83@linaro.org>
 <20221214193026.dv2fuubysctcvlkg@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221214193026.dv2fuubysctcvlkg@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 21:30, Marijn Suijten wrote:
> On 2022-12-14 20:43:29, Dmitry Baryshkov wrote:
>> On 14/12/2022 01:22, Marijn Suijten wrote:
>>> Active CTLs have to configure what DSC block(s) have to be enabled, and
>>> what DSC block(s) have to be flushed; this value was initialized to zero
>>> resulting in the necessary register writes to never happen (or would
>>> write zero otherwise).  This seems to have gotten lost in the DSC v4->v5
>>> series while refactoring how the combination with merge_3d was handled.
>>>
>>> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 ++
>>>    3 files changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index ae28b2b93e69..35791f93c33d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -61,6 +61,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>    	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>>    	intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>    	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>    
>>>    	/* setup which pp blk will connect to this intf */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index 0f71e8fe7be7..9ee3a7306a5f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -274,6 +274,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>>    	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>>>    	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>>    	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>    	if (phys_enc->hw_pp->merge_3d)
>>>    		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>>>    
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> index 7cbcef6efe17..92ddf9995b37 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> @@ -209,6 +209,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
>>>    
>>>    		intf_cfg.intf = DPU_NONE;
>>>    		intf_cfg.wb = hw_wb->idx;
>>> +		intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>
>> We usually don't have DSC with the writeback, don't we?
> 
> I am unsure so ended up adding them in writeback regardless.  Downstream
> uses a separate callback to process intf_cfg.dsc instead of going
> through setup_intf_cfg().
> 
> To prevent these from being missed again (in the case of copy&paste),
> how about instead having some function that sets up intf_cfg with these
> default values from a phys_enc?  That way most of this remains oblivious
> to the caller.

I'm not sure this is possible. E.g. intf_cfg.dsc should not be set for 
the WB.

> 
> On the same note, that callback on non-DPU_CTL_ACTIVE_CFG hardware
> doesn't use the intf_cfg.dsc member anyway, but it was again added to
> keep the blocks somewhat consistent (in case it ever becomes used?).
> 
>>>    		if (mode_3d && hw_pp && hw_pp->merge_3d)
>>>    			intf_cfg.merge_3d = hw_pp->merge_3d->idx;
>>> @@ -230,6 +231,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
>>>    		intf_cfg.wb = hw_wb->idx;
>>>    		intf_cfg.mode_3d =
>>>    			dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>> +		intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>    		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>>>    	}
>>>    }
> 
> - Marijn

-- 
With best wishes
Dmitry

