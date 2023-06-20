Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053F67369F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 12:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjFTKxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 06:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbjFTKxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 06:53:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B3EEB
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:53:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5905974e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687258385; x=1689850385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGZA36U9+mS8P8FwUzMqtiJLWLWVTpus9jpYOIpJAHI=;
        b=zCLktcawGwl3ZsPxU9EJABiM6P9enioML2D1kbJFa+KbHw1qJ5sjDW0ffcEe9niZ/0
         K4D0P/vMKB8dwFifr6bjUBTbEeZUj0QNz83ZF8KnmM3+++6nDECD86HqiQaxoI5yrxDP
         9D83SaroydyiLMvQuL0C1UMyz0CG2GnoDtfuDCxE3iDPA92DT405VdpgFL+uC+UPvFWf
         c80eTqgAua38kS9+DW1YKIpXn2I6IpAVceUyWS9HPJusdCb6AbMJwNdV3jZK8CKVv4+s
         5PrZNmI2rhcJSsa/W/YV090GYv95VmFJ4dRY1LIzpVMGHyWnhC+di5QaokLwUgoNSAh1
         4tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258385; x=1689850385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGZA36U9+mS8P8FwUzMqtiJLWLWVTpus9jpYOIpJAHI=;
        b=AOM/SFDwJgheVaFt6doC2ySSfrekR+6XeNIN6bhygxxKnSP6fzB8ZVOznmefKkmHuI
         mtHEMi1jyZEwkbi5GLdjdpk3+WyIg3zK2y1iWyzxLNv6lKQhhB5u5Ry1+nu1GcjpsZjn
         IBdcTUgFzi9y8gQJ6U3Ii8UFHdPLR7Jd0OdTSzyy6zP16VcjdLanYMn8dIJCuEtGt/LA
         RQIzRzPK2bDSr9hMip8H3I4c7kbmdAbuMhUwT9hWadYtgcYVkQZ1gz2soa0XQk5yR4Ps
         MG2HHJOWBTXBUi0jEPYfwllQnIjiCdykzxxHTM8jS+qxEhGM1wmauN3Z6r2UpSEID65N
         KJHA==
X-Gm-Message-State: AC+VfDwRzaX6WSa1N8/x9lnMuk+Bu47YieFqPIQHWE6iEstmAEakwPfr
        lxW+9RiGn4PMMYy6BQRJ/l/vuw==
X-Google-Smtp-Source: ACHHUZ40vJmWNB5SpAS465doS632Log2ryoWnrvOSMPC8fEFO3Ml72G8Z0/MPWI1sB4NDEzcqssZtA==
X-Received: by 2002:a19:6544:0:b0:4ed:cc6d:61fe with SMTP id c4-20020a196544000000b004edcc6d61femr6652989lfj.24.1687258384796;
        Tue, 20 Jun 2023 03:53:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w15-20020ac2598f000000b004f60a2429d4sm322093lfn.78.2023.06.20.03.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:53:04 -0700 (PDT)
Message-ID: <58cb9077-5c39-5374-3d81-7922af9648a0@linaro.org>
Date:   Tue, 20 Jun 2023 13:53:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/8] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-4-dmitry.baryshkov@linaro.org>
 <5b72eb45-d2fa-a3b7-5792-d496dbde4314@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b72eb45-d2fa-a3b7-5792-d496dbde4314@linaro.org>
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

On 20/06/2023 13:46, Konrad Dybcio wrote:
> On 20.06.2023 02:08, Dmitry Baryshkov wrote:
>> The max_per_pipe_ib is a constant across all CRTCs and is read from the
>> catalog. Drop corresponding calculations and read the value directly at
>> icc_set_bw() time.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> This looks good, but doesn't apply on next-20230620

Hmm. It applied w/o any issues here.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
>>   3 files changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 9902febc72c0..ba146af73bc5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>>   	memset(perf, 0, sizeof(struct dpu_core_perf_params));
>>   
>>   	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
>> -	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
>>   	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>>   
>>   	DRM_DEBUG_ATOMIC(
>> -		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
>> +		"crtc=%d clk_rate=%llu core_ab=%llu\n",
>>   			crtc->base.id, perf->core_clk_rate,
>> -			perf->max_per_pipe_ib, perf->bw_ctl);
>> +			perf->bw_ctl);
>>   }
>>   
>>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>> @@ -199,9 +198,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>   				dpu_crtc_get_client_type(tmp_crtc)) {
>>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>>   
>> -			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
>> -					dpu_cstate->new_perf.max_per_pipe_ib);
>> -
>>   			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
>>   
>>   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
>> @@ -217,7 +213,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>   	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>>   
>>   	for (i = 0; i < kms->num_paths; i++)
>> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
>> +		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
>>   
>>   	return ret;
>>   }
>> @@ -320,15 +316,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>   		 * 2. new bandwidth vote - "ab or ib vote" is lower
>>   		 *    than current vote at end of commit or stop.
>>   		 */
>> -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
>> -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
>> -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
>> -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
>> +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
>> +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
>>   			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
>>   				crtc->base.id, params_changed,
>>   				new->bw_ctl, old->bw_ctl);
>>   			old->bw_ctl = new->bw_ctl;
>> -			old->max_per_pipe_ib = new->max_per_pipe_ib;
>>   			update_bus = true;
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> index e02cc2324af2..2bf7836f79bb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>> @@ -16,12 +16,10 @@
>>   
>>   /**
>>    * struct dpu_core_perf_params - definition of performance parameters
>> - * @max_per_pipe_ib: maximum instantaneous bandwidth request
>>    * @bw_ctl: arbitrated bandwidth request
>>    * @core_clk_rate: core clock rate request
>>    */
>>   struct dpu_core_perf_params {
>> -	u64 max_per_pipe_ib;
>>   	u64 bw_ctl;
>>   	u64 core_clk_rate;
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 1edf2b6b0a26..ff5d306b95ed 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1400,8 +1400,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
>>   	seq_printf(s, "core_clk_rate: %llu\n",
>>   			dpu_crtc->cur_perf.core_clk_rate);
>>   	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
>> -	seq_printf(s, "max_per_pipe_ib: %llu\n",
>> -				dpu_crtc->cur_perf.max_per_pipe_ib);
>>   
>>   	return 0;
>>   }

-- 
With best wishes
Dmitry

