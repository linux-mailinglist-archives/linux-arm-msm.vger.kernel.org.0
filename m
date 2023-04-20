Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11A16E8684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 02:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjDTAaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 20:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjDTAaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 20:30:17 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D993
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:30:15 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id k15so958469ljq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681950613; x=1684542613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjYfYnDJZBAzDWx6eRLQT+C5EwlIz3eVbbP17K4YFi4=;
        b=pSPF3eYSttBa//bUOC4PVefWz6bpr3XzETGiR+fsP/txPHI1pvJPU4zlfJxhsVuvQD
         Mp49TatcZMl+8gZLtOweJIGEo0MOWr9UvZYmh5hzaRoIKejl526k07pw/t96R7seZtmy
         b0eZ070ydv+Ah31/Cz7ngEjG9w7IZCGc8QdtpLECVZsEw+9s6CSzvBHwhxp4XIX7vn9u
         2hUaYKkqy7YAZuSJu1zs98sM+ZzXTLEKFFPxZbb49nv02mwNhFVnSsv3ohPcN0OMi0yr
         AWbB99btb+vcdogUmw5QmHS9KaRn40H63aGO1Gbs8wkj03qIrJ6IXJBXAGp14mNK05Jq
         9Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681950613; x=1684542613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjYfYnDJZBAzDWx6eRLQT+C5EwlIz3eVbbP17K4YFi4=;
        b=eCpV+JiSNy9ePHPvO0jUloQz+iiSDXl2o3nKzgpy43oLQbjKEoddf3E6AbOEU0FHb6
         iO61jDA/Q1i1fz21471ccWqAIHw/D4Eupwddk9IHOPCYnkSgjha9429lHUTgKrl8QtLc
         eaoQkCmmuliWovMY/hh4/vM+FIw1rhOUnXYrTtXMUkaLcgfT7cBkLyQMCF0pm3Y73afI
         SUpuJe57ITRm4a2ynISUR0UfImuaafXowOgTyYwjDS6m4ibxZ3H3NJawIcZ8r1gX6GMR
         OUUjpZfLYgFs1k4US8kYvrcDS4AHR0q/SpCJR57cOb1JvfvH+kgceSpWVbVLt4voUo8F
         at3g==
X-Gm-Message-State: AAQBX9c4+S1dOb5XHiMkGbXRcomEr874Nvk6Q4/ArmODng9jdvwZoep8
        gmwcXQDLHYRaK0/fTLf0el1psg==
X-Google-Smtp-Source: AKy350b3i6spucIAsgQRYZVrGDw8F0A2so3lJhto2wuvAaz2r4V9DR+4XGiEEZneH9hIWC2uDb1xuw==
X-Received: by 2002:a2e:9cd7:0:b0:2a8:bade:e382 with SMTP id g23-20020a2e9cd7000000b002a8badee382mr2626176ljj.9.1681950613303;
        Wed, 19 Apr 2023 17:30:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z8-20020a2e7e08000000b002a777ce224dsm10860ljc.138.2023.04.19.17.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 17:30:12 -0700 (PDT)
Message-ID: <fe7c7533-b918-9b47-c1c8-959d967081d5@linaro.org>
Date:   Thu, 20 Apr 2023 03:30:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm: add some cec register bitfield
 details
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnaud Vrac <avrac@freebox.fr>,
        Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
 <9d7f81fc-945e-9704-4eb2-d2e5cb31297e@linaro.org>
 <5797c537-fe70-27be-ef1d-f4c8b19806f5@quicinc.com>
 <639b264b-08e5-b84e-1933-ed768b6d1512@linaro.org>
 <5014976f-3026-9fef-e1ec-270d421df078@quicinc.com>
 <bfbd0ecc-342b-1321-8ead-b3e462099e51@linaro.org>
 <7de672fb-e9ac-5594-295f-ac29951c3066@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7de672fb-e9ac-5594-295f-ac29951c3066@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2023 03:27, Abhinav Kumar wrote:
> 
> 
> On 4/19/2023 5:21 PM, Dmitry Baryshkov wrote:
>> On 20/04/2023 03:17, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/19/2023 5:11 PM, Dmitry Baryshkov wrote:
>>>> On 20/04/2023 03:10, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 4/19/2023 4:53 PM, Dmitry Baryshkov wrote:
>>>>>> On 18/04/2023 21:10, Arnaud Vrac wrote:
>>>>>>> The register names and bitfields were determined from the downstream
>>>>>>> msm-4.4 driver.
>>>>>>>
>>>>>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62 
>>>>>>> ++++++++++++++++++++++++++++++++++++-
>>>>>>>   1 file changed, 61 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> I have opened MR against Mesa at 
>>>>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22588.
>>>>>>
>>>>>> The patch is:
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>
>>>>>> Minor nit below
>>>>>>
>>>>>
>>>>> Also, shouldnt the register updates be done using rnn tool instead 
>>>>> of manual edits?
>>>>
>>>> We usually update the rnn and ask Rob to pull it at the beginning of 
>>>> the cycle.
>>>>
>>>
>>> Sorry, I didnt get this. So you are saying, we will accept manual 
>>> edits and then replace it with the tool generated xml later? I was 
>>> not aware of that, because previously I was always asked by Rob to 
>>> use the tool to generate the xml and push that.
>>
>> We accept manual edits for the patchset (so that one can test it), but 
>> before merging the patchset we ask Rob to pull the xml.
>>
> 
> Interesting, and Rob generates the xml that time or who does that?
> 
> The MR you have created updates the freedreno/registers which is just to 
> keep the XML in the driver and mesa in sync.
> 
> But I am trying to understand who generates the updated xml to merge it 
> with the patchset if its not the developer who does that anymore.

In this case I went on and created the MR as Arnaud didn't create one. 
Yes, usually we do this on our own when updating the register file (in 
other words: I usually edit the xml, then regen the xml.h, then add it 
to the patchset).

> 
>>>
>>>>>
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h 
>>>>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>>>>> index 973b460486a5a..b4dd6e8cba6b7 100644
>>>>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>>>>> @@ -76,6 +76,13 @@ enum hdmi_acr_cts {
>>>>>>>       ACR_48 = 3,
>>>>>>>   };
>>>>>>> +enum hdmi_cec_tx_status {
>>>>>>> +    CEC_TX_OK = 0,
>>>>>>> +    CEC_TX_NACK = 1,
>>>>>>> +    CEC_TX_ARB_LOSS = 2,
>>>>>>> +    CEC_TX_MAX_RETRIES = 3,
>>>>>>> +};
>>>>>>> +
>>>>>>>   #define REG_HDMI_CTRL                        0x00000000
>>>>>>>   #define HDMI_CTRL_ENABLE                    0x00000001
>>>>>>>   #define HDMI_CTRL_HDMI                        0x00000002
>>>>>>> @@ -476,20 +483,73 @@ static inline uint32_t 
>>>>>>> HDMI_DDC_REF_REFTIMER(uint32_t val)
>>>>>>>   #define REG_HDMI_HDCP_SW_LOWER_AKSV                0x00000288
>>>>>>>   #define REG_HDMI_CEC_CTRL                    0x0000028c
>>>>>>> +#define HDMI_CEC_CTRL_ENABLE                    0x00000001
>>>>>>> +#define HDMI_CEC_CTRL_SEND_TRIGGER                0x00000002
>>>>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__MASK                0x000001f0
>>>>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT                4
>>>>>>> +static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & 
>>>>>>> HDMI_CEC_CTRL_FRAME_SIZE__MASK;
>>>>>>> +}
>>>>>>> +#define HDMI_CEC_CTRL_LINE_OE                    0x00000200
>>>>>>>   #define REG_HDMI_CEC_WR_DATA                    0x00000290
>>>>>>> +#define HDMI_CEC_WR_DATA_BROADCAST                0x00000001
>>>>>>> +#define HDMI_CEC_WR_DATA_DATA__MASK                0x0000ff00
>>>>>>> +#define HDMI_CEC_WR_DATA_DATA__SHIFT                8
>>>>>>> +static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & 
>>>>>>> HDMI_CEC_WR_DATA_DATA__MASK;
>>>>>>> +}
>>>>>>> -#define REG_HDMI_CEC_CEC_RETRANSMIT                0x00000294
>>>>>>> +#define REG_HDMI_CEC_RETRANSMIT                    0x00000294
>>>>>>> +#define HDMI_CEC_RETRANSMIT_ENABLE                0x00000001
>>>>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__MASK                0x000000fe
>>>>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT            1
>>>>>>> +static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & 
>>>>>>> HDMI_CEC_RETRANSMIT_COUNT__MASK;
>>>>>>> +}
>>>>>>>   #define REG_HDMI_CEC_STATUS                    0x00000298
>>>>>>> +#define HDMI_CEC_STATUS_BUSY                    0x00000001
>>>>>>> +#define HDMI_CEC_STATUS_TX_FRAME_DONE                0x00000008
>>>>>>> +#define HDMI_CEC_STATUS_TX_STATUS__MASK                0x000000f0
>>>>>>> +#define HDMI_CEC_STATUS_TX_STATUS__SHIFT            4
>>>>>>> +static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum 
>>>>>>> hdmi_cec_tx_status val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & 
>>>>>>> HDMI_CEC_STATUS_TX_STATUS__MASK;
>>>>>>> +}
>>>>>>>   #define REG_HDMI_CEC_INT                    0x0000029c
>>>>>>> +#define HDMI_CEC_INT_TX_DONE                    0x00000001
>>>>>>> +#define HDMI_CEC_INT_TX_DONE_MASK                0x00000002
>>>>>>> +#define HDMI_CEC_INT_TX_ERROR                    0x00000004
>>>>>>> +#define HDMI_CEC_INT_TX_ERROR_MASK                0x00000008
>>>>>>> +#define HDMI_CEC_INT_MONITOR                    0x00000010
>>>>>>> +#define HDMI_CEC_INT_MONITOR_MASK                0x00000020
>>>>>>> +#define HDMI_CEC_INT_RX_DONE                    0x00000040
>>>>>>> +#define HDMI_CEC_INT_RX_DONE_MASK                0x00000080
>>>>>>>   #define REG_HDMI_CEC_ADDR                    0x000002a0
>>>>>>>   #define REG_HDMI_CEC_TIME                    0x000002a4
>>>>>>> +#define HDMI_CEC_TIME_ENABLE                    0x00000001
>>>>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK            0x0000ff80
>>>>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT            7
>>>>>>> +static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & 
>>>>>>> HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
>>>>>>> +}
>>>>>>>   #define REG_HDMI_CEC_REFTIMER                    0x000002a8
>>>>>>> +#define HDMI_CEC_REFTIMER_ENABLE                0x00010000
>>>>>>
>>>>>> I think this should come after the REFTIMER field.
>>>>>>
>>>>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__MASK            0x0000ffff
>>>>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT            0
>>>>>>> +static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
>>>>>>> +{
>>>>>>> +    return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & 
>>>>>>> HDMI_CEC_REFTIMER_REFTIMER__MASK;
>>>>>>> +}
>>>>>>>   #define REG_HDMI_CEC_RD_DATA                    0x000002ac
>>>>>>>
>>>>>>
>>>>
>>

-- 
With best wishes
Dmitry

