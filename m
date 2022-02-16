Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DB84B7D67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241505AbiBPCRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:17:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235143AbiBPCRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:17:02 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB17BF97D;
        Tue, 15 Feb 2022 18:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644977810; x=1676513810;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Nf4w5alxBcN8IhONDyerdZKXyOFUjVM7GbSWZYsTNBk=;
  b=nXKXip3jAsfLyNW3FGt+5mOPybeoGQNDA0x3HY5yP6DK+CPkAAK4ihYt
   Dkyh9vZksjGyn/78c7hrilhApIhd+VkjyeDXKQeoMtKZDh3PZWkqSWtzW
   OGZP38rKIn1NMd1C+2HrUr8nPjSvLeNfTt8tzutLfN8QK7U/3JiwXxmgL
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 18:16:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 18:16:50 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 18:16:49 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 18:16:48 -0800
Message-ID: <7b33c826-b141-c6a2-b0eb-18b99ceeda24@quicinc.com>
Date:   Tue, 15 Feb 2022 18:16:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20220215043353.1256754-1-bjorn.andersson@linaro.org>
 <20220215043353.1256754-2-bjorn.andersson@linaro.org>
 <be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com>
 <Ygvisfhi0SY6XdAz@builder.lan>
 <6a3ef247-b26b-d505-cd85-92fb277163dd@quicinc.com>
 <CAA8EJprCaiPW=Kk0B69RNNwAk0xcqaxQA031sfR0ky+BfzcWKQ@mail.gmail.com>
 <ceb861e5-b1c8-d33e-c0b0-bea0b4cc0b66@quicinc.com>
 <CAA8EJppj+OBPVUgvefO38zp1RHpJw5pL0-4DCkgn3iAcPH-ptA@mail.gmail.com>
 <d0cac12e-7c03-2ba3-fb8d-aee09b72a1b1@quicinc.com>
 <YgxbYnpbBeOIkGWi@builder.lan>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YgxbYnpbBeOIkGWi@builder.lan>
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



On 2/15/2022 6:03 PM, Bjorn Andersson wrote:
> On Tue 15 Feb 19:34 CST 2022, Abhinav Kumar wrote:
> 
>>
>>
>> On 2/15/2022 4:20 PM, Dmitry Baryshkov wrote:
>>> On Tue, 15 Feb 2022 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>> On 2/15/2022 10:42 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, 15 Feb 2022 at 20:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>> On 2/15/2022 9:28 AM, Bjorn Andersson wrote:
>>>>>>> On Tue 15 Feb 11:14 CST 2022, Abhinav Kumar wrote:
>>>>>>>> On 2/14/2022 8:33 PM, Bjorn Andersson wrote:
>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> [..]
>>>>> (thus leading us to cases when someone would forget to add INTF_EDP
>>>>> next to INTF_DP)
>>>>>
>>>>> Also, if we are switching from INTF_DP to INTF_EDP, should we stop
>>>>> using end-to-end numbering (like MSM_DP_CONTROLLER_2 for INTF_5) and
>>>>> add a separate numbering scheme for INTF_EDP?
>>>>>
>>>> We should change the controller ID to match what it actually is.
>>>>
>>>> Now that you pointed this out, this looks even more confusing to me to
>>>> say that  MSM_DP_CONTROLLER_2 is actually a EDP controller because
>>>> fundamentally and even hardware block wise they are different.
>>>
>>> So, do we split msm_priv->dp too? It's indexed using
>>> MSM_DP_CONTROLLER_n entries.
>>> Do we want to teach drm/msm/dp code that there are priv->dp[] and
>>> priv->edp arrays?
>>
>> ok so now priv->dp and priv->edp arrays are also in the picture here :)
>>
>> Actually all these questions should have probably come when we were figuring
>> out how best to re-use eDP and DP driver.
>>
>> Either way atleast, its good we are documenting all these questions on this
>> thread so that anyone can refer this to know what all was missed out :)
>>
>> priv->dp is of type msm_dp. When re-using DP driver for eDP and since
>> struct msm_dp is the shared struct between dpu and the msm/dp, I get your
>> point of re-using MSM_DP_CONTROLLER_* as thats being use to index.
>>
>> So MSM_DP_CONTROLLER_* is more of an index into the DP driver and not really
>> a hardware indexing scheme.
>>
>> If we split into two arrays, we need more changes to dpu_encoder too.
>>
>> Too instrusive a change at this point, even though probably correct.
>>
> 
> I'm sorry, but performing such a split would create a whole bunch of
> duplication and I don't see the reasons yet. Can you please give me an
> example of when the DPU _code_ would benefit from being specifically
> written for EDP vs DP?
> 
> Things where it doesn't make sense to enable certain features in
> runtime - but really have different implementation for the two interface
> types.
> 

Like I have mentioned in my previous comment, this would be a big change 
and I am also not in favor of this big change.

>> But are you seeing more changes required even if we just change INTF_DP to
>> INTF_eDP for the eDP entries? What are the challenges there?
>>
> 
> What are the benefits?

In terms of current code, again like I said before in my previous 
comments several times I do not have an example.

I was keeping the separation in case in future for some features we do 
need to differentiate eDP and DP.

Somehow I also feel this change and below are interlinked that way.

https://patchwork.freedesktop.org/patch/473871/

The only reason we need this change is because both eDP and DP use 
DRM_MODE_ENCODER_TMDS and specifying the intf_type directly will clear 
the confusion because DRM_MODE_ENCODER_DSI means DSI and 
DRM_MODE_ENCODER_VIRTUAL means Writeback but DRM_MODE_ENCODER_TMDS can 
mean DP OR eDP interface.

The ambiguity was always for eDP and DP.

That led to the discussion about the INTF_* we are specifying in the 
dpu_hw_catalog only to find the discrepancy.

So now by clearing that ambiguity that change makes sense. That 
discussion trickled into this one.

> 
> Regards,
> Bjorn
