Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887316A59A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 14:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjB1NCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 08:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjB1NCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 08:02:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5268830186
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 05:02:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id n2so13014272lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 05:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8opb0IgGXLUx/MSqXkZyuJAceZKb6+tDxEgzfDsO0s=;
        b=Gwq7KeXUYx6aBVDqpjW00B/Zh6JGolQdx39yvfFPCUxawYiLrBuoHxLStg2ARPR2yD
         r8UgVHfqjR6La3XfpM/NPJL42hNWjDeMnBiuGCMZ252JNQmeAGDiR/3Xj5+HIEZw9mRV
         w9JCAG1iDSIcekQvDVfDeLrL8nEYLU64LHkuyckMdxNolXflsvlRl/1+x1AEfmJEgpwb
         bt8yIGpqI/TDr23ff4DhGavTQgTANK7jTGTnBj3XH1Na4VT8wvILG2ynyFN30HpECFSz
         RkTWqIxhVfhb+Zy8Lzqb1+CiuG/MjIU7k0VfpM3qqKHtlz6/RuZuNMoCXC9IY6xfGJ7D
         ObCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8opb0IgGXLUx/MSqXkZyuJAceZKb6+tDxEgzfDsO0s=;
        b=LCObKHeboB9I/M4h2w0+iT9Ay8UcNZNnKDNfwxDlVi4H7gRThReEEcVj9pQ3Fo9nU5
         1SYQWzOwM3021YvOmdpBTE/ibaG8lrxmzka8eE0DuwtUPzBlCuCUfSohKEZP5tG2+rLj
         3McPPXsBkMw/SXFhqA1QbozM8WjqcEEWbh7WuGJ4VHJ8dCZunJVnhQovcoyD2RRjWSCK
         BZwkftKABCJkK+gKZjxm+GW5J/N2UvR1g+VLqRylKif1I5chpUrtToHOWzAN+jH01DPg
         34hNw/+4INetfhUc6r61vydipHbg/cajsNokMS3eHXLN059QEy3wmmbyrLGwsM65KQSg
         K1yQ==
X-Gm-Message-State: AO0yUKVinlMRPkNzb8bFjfx4ugWt6XCH84gFnnrsFwNbZk3H7416Any0
        xBSaeLlDzcwU1jpR0koS1F8DSw==
X-Google-Smtp-Source: AK7set/Su3LSbNhDd09F4PabH97lCSdw/VJpqzgfwDJ8pPnl4+UMykLikDNj5xmwZfoED3oHiJoAkA==
X-Received: by 2002:ac2:4a90:0:b0:4a4:68b9:19f9 with SMTP id l16-20020ac24a90000000b004a468b919f9mr642943lfp.33.1677589365519;
        Tue, 28 Feb 2023 05:02:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f19-20020a19ae13000000b004db20d07decsm1327160lfc.209.2023.02.28.05.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 05:02:44 -0800 (PST)
Message-ID: <d9a30c80-54b1-317c-61d3-dc872ad03458@linaro.org>
Date:   Tue, 28 Feb 2023 15:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
Content-Language: en-GB
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
 <87mt4yyo2s.fsf@intel.com>
 <CAA8EJpoubQQjuUAs342TVYgx09nw9vENXcsiJiDOq0e0_q=6Fw@mail.gmail.com>
 <87h6v6ymxd.fsf@intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87h6v6ymxd.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/02/2023 14:49, Jani Nikula wrote:
> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> On Tue, 28 Feb 2023 at 14:25, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>
>>> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>> The rc_buf_thresh values are common to all DSC implementations. Move
>>>> them to the common helper together with the code to propagage them to
>>>> the drm_dsc_config.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
>>>>   drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
>>>>   include/drm/display/drm_dsc_helper.h      |  1 +
>>>>   3 files changed, 39 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>>>> index c869c6e51e2b..ab8679c158b5 100644
>>>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>>>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>>>> @@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>>>>   }
>>>>   EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>>>>
>>>> +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>>>> +const u16 drm_dsc_rc_buf_thresh[] = {
>>>> +     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
>>>> +     7744, 7872, 8000, 8064
>>>> +};
>>>> +EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);
>>>
>>> This needs to be static, without exports.
>>
>> Exported this to let other drivers use it, while skipping the
>> drm_dsc_set_rc_buf_thresh(). For example amdgpu driver sets buffer
>> thresholds on the interim structure, so the helper is not directly
>> applicable. See _do_calc_rc_params().
> 
> Regardless, I'm still saying don't do that.
> 
> Data is not an interface.
> 
> If you make it easy to just use the data, nobody will ever fix their
> drivers to use proper interfaces, and you'll lock yourself to a
> particular representation of the data even though it's supposed to be a
> hidden implementation detail.

Yes, I usually do not export data, exactly for these reasons. I could 
have argued here that the data is constant here, etc. etc.
However let's stop caring about other drivers. I'll drop the export for v2.

> 
> 
> BR,
> Jani.
> 
> 
>>
>>>
>>>> +
>>>> +/**
>>>> + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
>>>> + * in accordance with the DSC 1.2 specification.
>>>> + *
>>>> + * @vdsc_cfg: DSC Configuration data partially filled by driver
>>>> + */
>>>> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
>>>> +{
>>>> +     int i = 0;
>>>
>>> Unnecessary initialization.
>>
>> My bad.
>>
>>>
>>>> +
>>>> +     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>>>
>>> Please use ARRAY_SIZE(). Maybe add BUILD_BUG_ON() for DSC_NUM_BUF_RANGES
>>> vs. ARRAY_SIZE(). (Yes, we should've used ARRAY_SIZE() in i915.)
>>
>> Ack
>>
>>>
>>>> +             /*
>>>> +              * six 0s are appended to the lsb of each threshold value
>>>> +              * internally in h/w.
>>>> +              * Only 8 bits are allowed for programming RcBufThreshold
>>>> +              */
>>>> +             vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
>>>> +     }
>>>> +
>>>> +     /*
>>>> +      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
>>>> +      * as per C Model
>>>> +      */
>>>> +     if (vdsc_cfg->bits_per_pixel == 6 << 4) {
>>>> +             vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
>>>> +             vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
>>>> +     }
>>>> +}
>>>> +EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
>>>> +
>>>>   /**
>>>>    * drm_dsc_compute_rc_parameters() - Write rate control
>>>>    * parameters to the dsc configuration defined in
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> index d080741fd0b3..b4faab4c8fb3 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
>>>> @@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
>>>>        MAX_COLUMN_INDEX
>>>>   };
>>>>
>>>> -/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>>>> -static const u16 rc_buf_thresh[] = {
>>>> -     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
>>>> -     7744, 7872, 8000, 8064
>>>> -};
>>>> -
>>>>   struct rc_parameters {
>>>>        u16 initial_xmit_delay;
>>>>        u8 first_line_bpg_offset;
>>>> @@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>>>>        vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
>>>>        vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
>>>>
>>>> -     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>>>> -             /*
>>>> -              * six 0s are appended to the lsb of each threshold value
>>>> -              * internally in h/w.
>>>> -              * Only 8 bits are allowed for programming RcBufThreshold
>>>> -              */
>>>> -             vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
>>>> -     }
>>>> -
>>>> -     /*
>>>> -      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
>>>> -      * as per C Model
>>>> -      */
>>>> -     if (compressed_bpp == 6) {
>>>> -             vdsc_cfg->rc_buf_thresh[12] = 0x7C;
>>>> -             vdsc_cfg->rc_buf_thresh[13] = 0x7D;
>>>> -     }
>>>> +     drm_dsc_set_rc_buf_thresh(vdsc_cfg);
>>>>
>>>>        /*
>>>>         * From XE_LPD onwards we supports compression bpps in steps of 1
>>>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>>>> index 8b41edbbabab..706ba1d34742 100644
>>>> --- a/include/drm/display/drm_dsc_helper.h
>>>> +++ b/include/drm/display/drm_dsc_helper.h
>>>> @@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>>>>   int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>>>>   void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>>>>                              const struct drm_dsc_config *dsc_cfg);
>>>> +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>>>
>>>>   #endif /* _DRM_DSC_HELPER_H_ */
>>>
>>> --
>>> Jani Nikula, Intel Open Source Graphics Center
> 

-- 
With best wishes
Dmitry

