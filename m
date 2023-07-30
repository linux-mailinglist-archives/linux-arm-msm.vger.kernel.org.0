Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC88A7687BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjG3T5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjG3T5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:57:07 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72D5B1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:56:54 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so57575951fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690747013; x=1691351813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dez6yROj2mk37yKZWkEbFWMrDjDN4RNQY9j12HF2svQ=;
        b=uo/lnXv9TCGvKJiiNFGpvPN8UjlcVV61NSMYHkc0aX33dW7ZG1BMLX5kBMMMfSH25P
         LrWpkv7/QRcoP6K9ebnSKAKkKjaX3p3Zz0v8EKfnfFmp9R0BK16YKrEOp1cPPKEgXHbi
         xL1pII2RYhSbX276rFnSfxOg3HNWWZ2RJoW6jO1qtmwIREBtpHvQgpGhj+wJrrGMxCk2
         f5SIOgm/J//1m8XVJIWmxhXE1RNRJ3+Ai7OmwJplqMEJSF1s4+zWJceksQlIPNkxs4kJ
         BoyNH47L0fvDowUtaZ1cDqr26YMOjeeIP3AsDEfoN7aV+pqoMWJVJMsIUWg/4nsQfWvg
         f6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690747013; x=1691351813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dez6yROj2mk37yKZWkEbFWMrDjDN4RNQY9j12HF2svQ=;
        b=h4cxeNrYv0b3zkeaXd4WL9n1FrYPytNHtOCcjBdI8JeMB2ARjNQtcUfnRVpC4W5yxg
         bzCkTgtXsKI/W+780Bd0JB1zduFZdkbiaecNISwnlIaH4geRdV6iI3W2a6bF71QJ2LMD
         K2rtImzrrZ2+Km4krZ1mSRcs5r6SyuhvrpyuAGYSLOk8uKjX1sri4o5UvapUrLEviKra
         su30PAbJ2yKBu/B+d9vovpJHppuZVO6TruXmRIVL5OAfqTEL/E700dO1ogKalok2ANda
         Ob34MAQBfYv34IbLv7NbuyQgiwCBWdxFVPgZe37n3kz+kVAh/Ta3zoAPrp7A9HCeCkCQ
         Bocw==
X-Gm-Message-State: ABy/qLYD4wxcGTEiT2p1JQ8Ur6XYsLLauEEyWDM3ZqLsX2odrFVzjmIt
        NrjCol72AOnES365UgEn2o8ahw==
X-Google-Smtp-Source: APBJJlFMM0nVE1uEWBGAeggc2Wnw7K0tokyDh3LQAI156Z/Fbv8lY4fRXhLjBSWvxetNAJN51x91cQ==
X-Received: by 2002:a2e:95c6:0:b0:2b7:339c:f791 with SMTP id y6-20020a2e95c6000000b002b7339cf791mr5104410ljh.25.1690747012540;
        Sun, 30 Jul 2023 12:56:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9614000000b002b9af8422a8sm2213706ljh.130.2023.07.30.12.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 12:56:52 -0700 (PDT)
Message-ID: <009f05ab-5425-5afe-4381-d8b5df74d1d9@linaro.org>
Date:   Sun, 30 Jul 2023 22:56:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
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
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
 <iicue6zvfcv5jhwhemivl7fjjiil6w7a74owafrztqlc4eakzp@fao3dzsil2tf>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <iicue6zvfcv5jhwhemivl7fjjiil6w7a74owafrztqlc4eakzp@fao3dzsil2tf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/07/2023 22:52, Marijn Suijten wrote:
> On 2023-07-30 03:35:18, Dmitry Baryshkov wrote:
>> As the INTF is fixed at the encoder creation time, we can move the
>> check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
>> This function can return an error if INTF doesn't have required feature.
>> Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
>> useful, as this function returns void.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
>>   1 file changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 012986cff38c..adbd559a5290 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>>   	unsigned long vsync_hz;
>>   	struct dpu_kms *dpu_kms;
>>   
>> -	if (phys_enc->has_intf_te) {
>> -		if (!phys_enc->hw_intf ||
>> -		    !phys_enc->hw_intf->ops.enable_tearcheck) {
>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> -			return;
>> -		}
>> -
>> -		DPU_DEBUG_CMDENC(cmd_enc, "");
>> -	} else {
>> -		if (!phys_enc->hw_pp ||
>> -		    !phys_enc->hw_pp->ops.enable_tearcheck) {
>> -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> -			return;
>> -		}
>> -
>> -		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
>> +	/*
>> +	 * TODO: if/when resource allocation is refactored, move this to a
>> +	 * place where the driver can actually return an error.
>> +	 */
>> +	if (!phys_enc->has_intf_te &&
>> +	    (!phys_enc->hw_pp ||
>> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
> 
> We're probably overdoing it here if I request a WARN_ON when has_intf_te
> is true while enable_tearcheck is also non-NULL?
> 
>> +		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
>> +		return;
>>   	}
>>   
>> +	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
>> +			 phys_enc->hw_intf->idx - INTF_0,
>> +			 phys_enc->hw_pp->idx - PINGPONG_0);
> 
> Note that hw_pp wasn't printed when has_intf_te is true.  And it doesn't
> seem like that pointer is dereferenced anywhere in that case, perhaps
> hw_pp may even be NULL within dpu_encoder_phys_cmd_tearcheck_config() at
> some point.

No, if I understand correctly. It is only called from 
_dpu_encoder_phys_cmd_pingpong_config(), which checks for hw_pp. One can 
not run CMD mode display without a pingpong block anyway.

> 
>> +
>>   	mode = &phys_enc->cached_mode;
>>   
>>   	dpu_kms = phys_enc->dpu_kms;
>> @@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>   	phys_enc->intf_mode = INTF_MODE_CMD;
>>   	cmd_enc->stream_sel = 0;
>>   
>> +	if (!phys_enc->hw_intf) {
>> +		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
>> +
> 
> No need for this newline?

I just usually insert an empty line before return. Let's remove it.

> 
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>   	/* DPU before 5.0 use PINGPONG for TE handling */
>>   	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>>   		phys_enc->has_intf_te = true;
>>   
>> +	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
>> +		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
>> +
> 
> Same here?
> 
> - Marijn
> 
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>   	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>>   	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>>   
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

