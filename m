Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D4056C3D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238354AbiGHTiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 15:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbiGHTiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 15:38:17 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D0270E4D;
        Fri,  8 Jul 2022 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657309096; x=1688845096;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tRTAvQvXyCx+iHi+vFlwJ3NFM7bf+wS8w/ZhSeqFyeI=;
  b=SX0EFPit6yEOnBtg/0/82v6lCEfPJWFDh8IAfyOrYdxbEJFn2xnDFAe1
   OBLumRaBp3LVoC7xLmQzsN1frrhwwJ7twEZgBzTpJyzQnkumJ+h7o9WsB
   DKpua/NH9AJfzq66XLCTGs/guDMmJVbUpQRUVmXQpiDaNlSVuvOexnm9s
   8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jul 2022 12:38:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 12:38:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 12:38:15 -0700
Received: from [10.111.160.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 12:38:11 -0700
Message-ID: <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
Date:   Fri, 8 Jul 2022 12:38:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

+ kuogee

On 7/8/2022 12:27 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 20:46:43)
>> On 08/07/2022 04:28, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
>>>> The p1 region was probably added by mistake, none of the DTS files
>>>> provides one (and the driver source code also doesn't use one). Drop it
>>>> now.
>>>
>>> Yes, looks like the driver doesn't use it.
>>>
>>>>
>>>> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 94bc6e1b6451..d6bbe58ef9e8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -29,7 +29,6 @@ properties:
>>>>          - description: aux register block
>>>>          - description: link register block
>>>>          - description: p0 register block
>>>> -      - description: p1 register block
>>>
>>> The p1 registers exist on sc7180. They start where the example starts,
>>> at 0xae91400.
>>
>> Do they exist on e.g. sc7280? In other words, should we add the region
>> to the DTS? For now I'm going to mark it as optional.
>>
> 
> Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
> can you confirm?

P1 block does exist on sc7280 and yes its address is same as the address 
mentioned in sc7180. So its not a typo.

Yes, we are not programming this today but I would prefer to keep this 
as optional.

I did sync up with Kuogee on this change this morning, we will check a 
few things internally on the P1 block's usage as to which use-cases we 
need to program it for and update here.

The idea behind having this register space listed in the yaml is thats 
how the software documents have the blocks listed so dropping P1 block 
just because its unused seemed wrong to me. Optional seems more appropriate.

Thanks

Abhinav
