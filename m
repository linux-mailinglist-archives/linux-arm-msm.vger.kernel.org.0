Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E17724E25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 22:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238484AbjFFU30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 16:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236918AbjFFU3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 16:29:23 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C857B0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 13:29:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f61735676fso5691454e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686083360; x=1688675360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hF5eGVNixQNvDp+Il2XhkfMFtmBZo3W/YgfbUs4NESk=;
        b=E3QnRfHkXAZHhjknIm2jTxjtvWEGglOSUcriiZvWIcSqIB+qDPR0SA0DMckT9SbT6/
         2MtZO4gsDmH89upDFeSMFJpDaGaau/eOXiWYNiZN8Igb6Hqzda7p7KAESIpGU6DgBMfW
         QvLHQWzfxKYDuNdok9vTPlqj3LNU+gMMVlj/8gXj74rJWNeDuSQ3QkBYrRz0YkuClfSi
         ohYYmesAw/v6cPuM7l5YSr5gdkd3S6MISdLZ0aCStGWcnhpIwyi/MbBzLqYWCXfqtgwY
         qQZ91NmEaehX4bgfsny23z4ERplGNXMyAwvplXrkXqZ7WbCNrk/P0ZYi3Gcwg0bFei6R
         Qx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686083360; x=1688675360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hF5eGVNixQNvDp+Il2XhkfMFtmBZo3W/YgfbUs4NESk=;
        b=VtP0dT3qd5FXSqqYpvBZ3MrcOdnnKRZaRIphyKFuvhKLOzp2WhAI8lWcjcfwQBuIns
         M5nBGK0f5jS+VDC9hB7GTHwoMaCejVb4UXR8HPPqJqHaIBxkVbx/aOO3t8bq79jANLS4
         cnCYdBkLLkW5Ax6xHRM00AY1uFwfaH3OTqZLAfkk7m1HIuuUlSAZBJ0RfZToHajczORD
         i1NYtqIODY/KV5vtqkDhAodiB70Fjykb01dT7xQN4aQ2mAsH4tJi0vWTrItENqVL3h9n
         /fM+cqbGNF8ENVqX0A8KbTrKVvoxlmkOkfl1GYfvrE/LtG1IJLrRI3SQfPraCvcP9W+3
         Qigg==
X-Gm-Message-State: AC+VfDwEcgPcS1pYBjqt2gFBD0yCwb96/HNzQKLrIsIQtQkmoChYlDDt
        tpLmcBHuUk3syy6M81VJ5Ux5uA==
X-Google-Smtp-Source: ACHHUZ7mj2uTobyo8UlfxQ2Ve5z2RYjLEUJwOO/my7qgJsLk8vjKmSK/8o/F6nrgm2MglmJ9FZ+C0g==
X-Received: by 2002:a05:6512:61:b0:4f1:458c:c4c with SMTP id i1-20020a056512006100b004f1458c0c4cmr1311631lfo.43.1686083360282;
        Tue, 06 Jun 2023 13:29:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651204c800b004f3afa1767dsm1546747lfq.197.2023.06.06.13.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 13:29:19 -0700 (PDT)
Message-ID: <5bcbee05-5468-d853-df48-82bf3ae448d8@linaro.org>
Date:   Tue, 6 Jun 2023 23:29:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 04/13] drm/msm/dpu: remove unused
 fields from dpu_encoder_virt
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
 <94d7d0bf-ad61-628b-f10e-2d676ebe3838@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <94d7d0bf-ad61-628b-f10e-2d676ebe3838@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2023 23:25, Abhinav Kumar wrote:
> 
> 
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>> Remove historical fields intfs_swapped and topology fields from struct
>> dpu_encoder_virt and also remove even more historical docs.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 28729c77364f..4ee708264f3b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
>>    *            pingpong blocks can be different than num_phys_encs.
>>    * @hw_dsc:        Handle to the DSC blocks used for the display.
>>    * @dsc_mask:        Bitmask of used DSC blocks.
>> - * @intfs_swapped:    Whether or not the phys_enc interfaces have 
>> been swapped
>> - *            for partial update right-only cases, such as pingpong
>> - *            split where virtual pingpong does not generate IRQs
>>    * @crtc:        Pointer to the currently assigned crtc. Normally you
>>    *            would use crtc->state->encoder_mask to determine the
>>    *            link between encoder/crtc. However in this case we need
>>    *            to track crtc in the disable() hook which is called
>>    *            _after_ encoder_mask is cleared.
>>    * @connector:        If a mode is set, cached pointer to the active 
>> connector
>> - * @crtc_kickoff_cb:        Callback into CRTC that will flush & start
>> - *                all CTL paths
>> - * @crtc_kickoff_cb_data:    Opaque user data given to crtc_kickoff_cb
> 
> no concerns with the above 3
> 
>>    * @enc_lock:            Lock around physical encoder
>>    *                create/destroy/enable/disable
>>    * @frame_busy_mask:        Bitmask tracking which phys_enc we are 
>> still
>> @@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
>>    * @delayed_off_work:        delayed worker to schedule disabling of
>>    *                clks and resources after IDLE_TIMEOUT time.
>>    * @vsync_event_work:        worker to handle vsync event for 
>> autorefresh
>> - * @topology:                   topology of the display
> 
> As we are still going to go ahead with encoder based allocation for now, 
> we should keep this topology and start using it for DP DSC's 1:1:1 
> topology.

It is currently unused, so it can be dropped. Your patchset would have 
to reintroduce it.

And I'm still not happy about the encoder-based allocation. You 
persuaded me that it is irrelevant for the wide planes. So I'd split it 
and post the allocation patchset after the virtual-wide is fully 
reviewed (when would come that blissful moment, btw?).

> 
>>    * @idle_timeout:        idle timeout duration in milliseconds
>>    * @wide_bus_en:        wide bus is enabled on this interface
>>    * @dsc:            drm_dsc_config pointer, for DSC-enabled encoders
>> @@ -180,8 +173,6 @@ struct dpu_encoder_virt {
>>       unsigned int dsc_mask;
>> -    bool intfs_swapped;
>> -
>>       struct drm_crtc *crtc;
>>       struct drm_connector *connector;
>> @@ -201,7 +192,6 @@ struct dpu_encoder_virt {
>>       enum dpu_enc_rc_states rc_state;
>>       struct delayed_work delayed_off_work;
>>       struct kthread_work vsync_event_work;
>> -    struct msm_display_topology topology;
>>       u32 idle_timeout;

-- 
With best wishes
Dmitry

