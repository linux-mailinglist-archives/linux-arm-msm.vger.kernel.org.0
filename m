Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96876662F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 19:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237683AbjAISb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 13:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237716AbjAISbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 13:31:08 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A0172896
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 10:27:56 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y25so14341115lfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 10:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxYPnnoghobJBBaTSe4UpQEXrK0A3XTblMlNo+lNKnw=;
        b=N5iszDV3mgeHPrAvF/9tRC+vKFBKYrz7Apqh06BeapGPdvoJYONuE/tfsSTiwDbIOc
         SISlclRbKC8zbmblfRkNPFVO7mQbTZJxv4iYHdxM9cS720U3Os1Kfp6UFvvwdjNFRLaN
         +rhe1D3q6p03AqvPSK0Oh1k6SaN+VL+BI9BpHsSDAPv4lnmbRce4kWhDuwIrV+I3RxkM
         YS6RTxU8phGc3GJ8uqKRMcslmstBDpPK5zI0d+CLOHi7cCD/Az9LL5zrLxV7v7+IAWJ9
         oTYo5Af2TyqnUJEbUFrc6yTkMLyCEEryiBPcMNNH3Ii+KF3ACyPsGzsM8wYzUe/EVTLM
         Ooeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxYPnnoghobJBBaTSe4UpQEXrK0A3XTblMlNo+lNKnw=;
        b=vRH5XdvqHcx9xem7sTqkQSQ1lQw3Y48omksOAT7wxuHvWmOUMIsS93atcrtYHnZ5VS
         +/T7DKasoGFYNenWm3ShFAbKzRexSBoB0uzfe2WhBC3eKyFCn4Gj5cyKyRTy/DMo5Qqe
         E2BwxdG8kmiQOlEwVFwsDOy5WqOCIh4PXN6NnKUYBNDhCKFV7E78KGgakOxc7NNrKS/w
         wNYpZQ6lJRGxdrtU6R7HW2uqFW+AhdGESyz807K0hZ8BQVeBHSLqYXsC0z0PpECTEVzp
         sZeAQHsgM7G4T6TYDxXZZRKSgqWMYkiN5TkVq2GR7/GCzvVCh8pS8T1x4rkCBr31WQbF
         oT9w==
X-Gm-Message-State: AFqh2kpzK7VwW+pbRmu5nf9Jb8FCuAjQwzfMAd5vLqTTyZv3O/bk0oBQ
        MVbyc3nP6NhGGVStVQ7+lfa7IA==
X-Google-Smtp-Source: AMrXdXsvQo0NvFzBEknwIyyBRBQGy1hIEDfz6ILvqd2xvN8nHcpkCUkW5+saH9fDGyxWFbjIzrkLqw==
X-Received: by 2002:a05:6512:1281:b0:4cc:8682:ec65 with SMTP id u1-20020a056512128100b004cc8682ec65mr749371lfs.39.1673288874809;
        Mon, 09 Jan 2023 10:27:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id br11-20020a056512400b00b0048a934168c0sm1732866lfb.35.2023.01.09.10.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:27:54 -0800 (PST)
Message-ID: <a2f427f2-ee79-600a-ce01-088f786f5a35@linaro.org>
Date:   Mon, 9 Jan 2023 20:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes to
 display-sybsystem
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
 <20230109160005.GA721066-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109160005.GA721066-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 18:00, Rob Herring wrote:
> On Mon, Jan 09, 2023 at 07:13:57AM +0200, Dmitry Baryshkov wrote:
>> Follow the 'generic names' rule and rename mdss nodes to
>> display-subsystem.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>>   .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index 59f17ac898aa..ccd7d6417523 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -15,7 +15,15 @@ description:
>>     Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>>     sub-blocks like DPU display controller, DSI and DP interfaces etc.
>>   
>> +# Do not select this by default, otherwise it is also selected for qcom,mdss
>> +# devices.
> 
> for NON qcom,mdss devices?

Actually no. This schema is used by qcom,SoC-mdss devices and it should 
not be selected for legacy qcom,mdss devices.

> 
>> +select:
>> +  false
> 
> select: false
> 
>> +
>>   properties:
>> +  $nodename:
>> +    pattern: "^display-subsystem@[0-9a-f]+$"
>> +
>>     reg:
>>       maxItems: 1
>>   
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> index c218c9172608..47fde9b6779f 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
>> @@ -15,6 +15,9 @@ description:
>>     encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
>>   
>>   properties:
>> +  $nodename:
>> +    pattern: "^display-subsystem@[0-9a-f]+$"
>> +
>>     compatible:
>>       enum:
>>         - qcom,mdss
>> @@ -153,7 +156,7 @@ examples:
>>     - |
>>       #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>> -    mdss@1a00000 {
>> +    display-subsystem@1a00000 {
>>           compatible = "qcom,mdss";
>>           reg = <0x1a00000 0x1000>,
>>                 <0x1ac8000 0x3000>;
>> -- 
>> 2.39.0
>>
>>

-- 
With best wishes
Dmitry

