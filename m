Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949BD54B63E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 18:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbiFNQbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 12:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239104AbiFNQbW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 12:31:22 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9970443EC;
        Tue, 14 Jun 2022 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655224282; x=1686760282;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=D96JT6uaVa91vNLNM5PVooqVfZFmJK1syxu6+/l0gIk=;
  b=hDr4BwL6oPgobYshX7gOYfKZBeI+gSpjic+gKkh0X23Tz6bgzPA7wKNi
   gzvnVdR3YLY+5vQurBC98U3dBS7xmxjDh64nvfXPVBXr5T+jMuIJJqmY0
   nvyYQmfhYck9HTlHbQUhKtXaQczuhGEVPhqvGi+rXSO13OEtKQDG1mMPe
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Jun 2022 09:31:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 09:31:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 09:31:20 -0700
Received: from [10.111.164.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 14 Jun
 2022 09:31:17 -0700
Message-ID: <c258b072-82cf-71a8-fdfb-79df52c5d480@quicinc.com>
Date:   Tue, 14 Jun 2022 09:31:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        David Heidelberg <david@ixit.cz>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Xu Wang <vulab@iscas.ac.cn>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220607110841.53889-1-linmq006@gmail.com>
 <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
 <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
 <10ac04f9-6374-0f85-166c-223a220a8c0d@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <10ac04f9-6374-0f85-166c-223a220a8c0d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/14/2022 3:09 AM, Dmitry Baryshkov wrote:
> On 14/06/2022 13:07, Miaoqian Lin wrote:
>> Hi, Abhinav
>>
>> On 2022/6/11 7:20, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/7/2022 4:08 AM, Miaoqian Lin wrote:
>>>> of_graph_get_remote_node() returns remote device node pointer with
>>>> refcount incremented, we should use of_node_put() on it
>>>> when not need anymore.
>>>> Add missing of_node_put() to avoid refcount leak.
>>>>
>>>> Fixes: 86418f90a4c1 ("drm: convert drivers to use 
>>>> of_graph_get_remote_node")
>>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>
>>> This patch itself looks fine and will cover the cases when there was 
>>> an error and we did not release the refcount.
>>>
>>> But, even in the normal cases I am not finding where we are releasing 
>>> the refcount for the panel_node.
>>>
>>> I dont see a of_node_put() on mdp4_lcdc_encoder->panel_node.
>>>
>> Thanks for your review.
>>
>> I don't see it either. It's a bit messy because the reference assigned 
>> to mdp4_lcdc_encoder->panel_node and mdp4_lvds_connector->panel_node 
>> both.
> 
> I have a plan to rework mdp4 lcdc support once I get my ifc6410 lvds 
> cable. Thus I think we can land this patch now and fix the mdp4 
> lcdc/lvds code leaking the reference in the due time.
> 

Alright, with that assurance,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Will pick it up for -fixes.
>>
>>> Am i missing something?
>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c 
>>>> b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> index fb48c8c19ec3..17cb1fc78379 100644
>>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> @@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct 
>>>> mdp4_kms *mdp4_kms,
>>>>            encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>>>>            if (IS_ERR(encoder)) {
>>>>                DRM_DEV_ERROR(dev->dev, "failed to construct LCDC 
>>>> encoder\n");
>>>> +            of_node_put(panel_node);
>>>>                return PTR_ERR(encoder);
>>>>            }
>>>>    @@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct 
>>>> mdp4_kms *mdp4_kms,
>>>>            connector = mdp4_lvds_connector_init(dev, panel_node, 
>>>> encoder);
>>>>            if (IS_ERR(connector)) {
>>>>                DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS 
>>>> connector\n");
>>>> +            of_node_put(panel_node);
>>>>                return PTR_ERR(connector);
>>>>            }
> 
> 
