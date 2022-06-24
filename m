Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB04655A523
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbiFXX4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiFXX4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:56:53 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E428BEDC;
        Fri, 24 Jun 2022 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656115013; x=1687651013;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ce8+3ivRZLrF1oiBN5WLS8F06pigi2WinsNpYBazKPI=;
  b=D/8sb8LgMl5fWx1gdO3Ck+zToNmBTFrhRnlfQPYRr4OONOFO/N16v8no
   BY3u+hOgkMtLJL1PAyztS+YhluFZnonfrFkFnVMUVCtnZfAOEMkh32Sdf
   UJUs3I/rGcn8azGjjgJJ8ahOOyIpjOR4TcPafdMSiGWG5BXKf6yQXsrl+
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Jun 2022 16:56:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 16:56:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 16:56:36 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 16:56:35 -0700
Message-ID: <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
Date:   Fri, 24 Jun 2022 16:56:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dianders@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
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
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 6/24/2022 4:45 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
>> On 6/24/2022 4:12 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-06-24 15:53:45)
>>>> MSM_DP_CONTROLLER_1 need to match to the index = 1 of sc7280_dp_cfg[] <== This is correct
>>>>
>>>> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
>>>> of MSM_DP_CONTROLLER_1.
>>>>
>>>> but .num_desc = 1  <== this said only have one entry at sc7280_dp_cfg[]
>>>> table. Therefore eDP will never be found at for loop  at
>>>> _dpu_kms_initialize_displayport().
>>>>
>>> Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
>>> the intention of the previous commit was to make it so the order of
>>> sc7280_dp_cfg couldn't be messed up and not match the
>>> MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
>>
>> at  _dpu_kms_initialize_displayport()
>>
>>> -             info.h_tile_instance[0] = i; <== assign i to become dp controller id, "i" is index of scxxxx_dp_cfg[]
>> This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of
>> scxxxx_dp_cfg[].
>>
>> it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF.
> I thought we matched the INTF instance by searching through
> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
> INTF number. See dpu_encoder_get_intf() and the caller.

yes, but the controller_id had been over written by dp->id.

u32 controller_id = disp_info->h_tile_instance[i];


See below code.


>          for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
>                  /*
>                   * Left-most tile is at index 0, content is controller id
>                   * h_tile_instance_ids[2] = {0, 1}; DSI0 = left, DSI1 = right
>                   * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
>                   */
>                  u32 controller_id = disp_info->h_tile_instance[i];   <== kuogee assign dp->id to controller_id
>
>                  if (disp_info->num_of_h_tiles > 1) {
>                          if (i == 0)
>                                  phys_params.split_role = ENC_ROLE_MASTER;
>                          else
>                                  phys_params.split_role = ENC_ROLE_SLAVE;
>                  } else {
>                          phys_params.split_role = ENC_ROLE_SOLO;
>                  }
>
>                  DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>                                  i, controller_id, phys_params.split_role);
>
>                  phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>
>                intf_type,
>
>                controller_id);
