Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C292555A56D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiFYATU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbiFYATT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:19:19 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E61E4E3A7;
        Fri, 24 Jun 2022 17:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656116358; x=1687652358;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yH8ARlePzv+LKfX7vhX/HnsL+DzReP9FZfD5bDuZrio=;
  b=OwrXpgu86dHBMGFO1/Ree00lmPdLG7BCgglSuTkmGZZpxD9mdPwZZzqg
   BWrx53RuXfKrYzgrB8LJdrLQs7o9Gdy9QqmQQxDCp8P+xSeiEMyv5l1M2
   zjxAIe2Jvl0xNrZd4C49swPyrwxHvyeOI4kaChz7QRAFjiAMQRR9Ucd0M
   g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jun 2022 17:19:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 17:19:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 17:19:17 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 17:19:16 -0700
Message-ID: <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
Date:   Fri, 24 Jun 2022 17:19:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dianders@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/24/2022 5:11 PM, Dmitry Baryshkov wrote:
> On Sat, 25 Jun 2022 at 03:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> Hi Stephen / Dmitry
>>
>> Let me try to explain the issue kuogee is trying to fix below:
>>
>> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
>>> On 6/24/2022 4:45 PM, Stephen Boyd wrote:
>>>> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
>>>>> On 6/24/2022 4:12 PM, Stephen Boyd wrote:
>>>>>> Quoting Kuogee Hsieh (2022-06-24 15:53:45)
>>>>>>> MSM_DP_CONTROLLER_1 need to match to the index = 1 of
>>>>>>> sc7280_dp_cfg[] <== This is correct
>>>>>>>
>>>>>>> The problem is sc7280_dp_cfg[] have two entries since eDP place at
>>>>>>> index
>>>>>>> of MSM_DP_CONTROLLER_1.
>>>>>>>
>>>>>>> but .num_desc = 1  <== this said only have one entry at
>>>>>>> sc7280_dp_cfg[]
>>>>>>> table. Therefore eDP will never be found at for loop  at
>>>>>>> _dpu_kms_initialize_displayport().
>>>>>>>
>>>>>> Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
>>>>>> the intention of the previous commit was to make it so the order of
>>>>>> sc7280_dp_cfg couldn't be messed up and not match the
>>>>>> MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
>>>>> at  _dpu_kms_initialize_displayport()
>>>>>
>>>>>> -             info.h_tile_instance[0] = i; <== assign i to become dp
>>>>>> controller id, "i" is index of scxxxx_dp_cfg[]
>>>>> This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of
>>>>> scxxxx_dp_cfg[].
>>>>>
>>>>> it it is not match, then MSM_DP_CONTROLLER_1 with match to different
>>>>> INTF.
>>>> I thought we matched the INTF instance by searching through
>>>> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
>>>> INTF number. See dpu_encoder_get_intf() and the caller.
>>> yes, but the controller_id had been over written by dp->id.
>>>
>>> u32 controller_id = disp_info->h_tile_instance[i];
>>>
>>>
>>> See below code.
>>>
>>>
>>>>           for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
>>>>                   /*
>>>>                    * Left-most tile is at index 0, content is
>>>> controller id
>>>>                    * h_tile_instance_ids[2] = {0, 1}; DSI0 = left, DSI1
>>>> = right
>>>>                    * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0
>>>> = right
>>>>                    */
>>>>                   u32 controller_id = disp_info->h_tile_instance[i];
>>>> <== kuogee assign dp->id to controller_id
>>>>
>>>>                   if (disp_info->num_of_h_tiles > 1) {
>>>>                           if (i == 0)
>>>>                                   phys_params.split_role =
>>>> ENC_ROLE_MASTER;
>>>>                           else
>>>>                                   phys_params.split_role = ENC_ROLE_SLAVE;
>>>>                   } else {
>>>>                           phys_params.split_role = ENC_ROLE_SOLO;
>>>>                   }
>>>>
>>>>                   DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>>>                                   i, controller_id,
>>>> phys_params.split_role);
>>>>
>>>>                   phys_params.intf_idx =
>>>> dpu_encoder_get_intf(dpu_kms->catalog,
>>>>
>>>>                 intf_type,
>>>>
>>>>                 controller_id);
>>
>> So let me try to explain this as this is what i understood from the
>> patch and how kuogee explained me.
>>
>> The ordering of the array still matters here and thats what he is trying
>> to address with the second change.
>>
>> So as per him, he tried to swap the order of entries like below and that
>> did not work and that is incorrect behavior because he still retained
>> the MSM_DP_CONTROLLER_x field for the table like below:
> I'd like to understand why did he try to change the order in the first place.
>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index dcd80c8a794c..7816e82452ca 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>>
>>    static const struct msm_dp_config sc7280_dp_cfg = {
>>           .descs = (const struct msm_dp_desc[]) {
>> -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
>>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
>> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>> +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
>> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
>>           },
>>           .num_descs = 2,
>>    };
>>
>>
>> The reason order is important is because  in this function below, even
>> though it matches the address to find which one to use it loops through
>> the array and so the value of *id will change depending on which one is
>> located where.
>>
>> static const struct msm_dp_desc *dp_display_get_desc(struct
>> platform_device *pdev,
>>                                unsigned int *id)
>> {
>>       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
>>       struct resource *res;
>>       int i;
>>
>>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>       if (!res)
>>           return NULL;
>>
>>       for (i = 0; i < cfg->num_descs; i++) {
>>           if (cfg->descs[i].io_start == res->start) {
>>               *id = i;
> The id is set to the index of the corresponding DP instance in the
> descs array, which is MSM_DP_CONTROLLER_n. Correct up to now.
>
>>               return &cfg->descs[i];
>>           }
>>       }
>>
>> In dp_display_bind(), dp->id is used as the index of assigning the
>> dp_display,
>>
>> priv->dp[dp->id] = &dp->dp_display;
> dp->id earlier is set to the id returned by dp_display_get_desc.
> So the priv->dp is now indexed by MSM_DP_CONTROLLER_n. Again, correct.
>
>> And now in _dpu_kms_initialize_displayport(), in the array this will
>> decide the value of info.h_tile_instance[0] which will be assigned to
>> just the index i.
> i is iterated over priv->dp indices (MSM_DP_CONTROLLER_n, see above),
> which means that that h_tile_instance[0] is now set to the
> MSM_DP_CONTROLLER_n. Still correct.
>
>> info.h_tile_instance[0] is then used as the controller id to find from
>> the catalog table.
> This sounds good.
How can I have eDP call dpu_encoder_init() before DP calls with 
_dpu_kms_initialize_displayport()?
>> So if this order is not retained it does not work.
>>
>> Thats the issue he is trying to address to make the order of entries
>> irrelevant in the table in dp_display.c
>
>
