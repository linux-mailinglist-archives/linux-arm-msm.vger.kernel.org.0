Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DE066663D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjAKWbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbjAKWbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:31:37 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE868FE7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:31:36 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so25737285lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rp25D3bpkGkPu4rqAIvIiJqw9TCkFV237Xcq6MSn6jI=;
        b=nZpODa42Zjq+siNDxStA+Is8kupwkixG+uXrwgRWHIUE+AzLuKoMPB5nJ/sFjAWQqQ
         VdqrEgA1dxZsSNSIXGz4Q+ExhQDYRDnDxX8a1/fQj1UPQOy/stiBE1iWrVLyNiDOIld6
         ZFcnfxeqcs00WfdlgetgUVLbLNOV4UUItolTDVKScgYiL4RAni83TOaBwy53CbXQpYiu
         UvjUU7q6css5wo91vkpD8naP+3MNUtcx9O7On02lSjKQMCKQyDBSF5HzN+SBZgFOdp4g
         mdSSVhTQF9t7XEaB5pY+Ma1RYy8O/2eGnUUgXTeOmRWF+DvvZIfq4QgE8+pF064+F7gS
         qCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp25D3bpkGkPu4rqAIvIiJqw9TCkFV237Xcq6MSn6jI=;
        b=QmkC/1ZTcrY0EbFBZdBeT0OHxHVvE2zVeA66NEWveAWmBY9iNDFXuwoMGoRUdFHXon
         Ygf/MlbkJ93zgwdY2uamTZ2PFE4SdMjOM7/jNT1r6JutwpG55wdVdn6oMLUG4aP+sJIW
         p+c4pdJa5h0eQYe2boLJMpyXtlDydhIpChKlc+AeBeJ9KsSELurlbMI6f3syGlEDVaW3
         JXvhO4kLpAd46yKQEYd1e0iOTev7L5Q0y3KU98heA5foEVuVbH386aPsG69/jYsXbBNC
         q90wkGttDN3SaPSG4xL+pwLJG+6uWAiHf+/Y8yuHz69rac5IuXOpW9zXOJzkfLwT0fcb
         ydZw==
X-Gm-Message-State: AFqh2koCArjOxFPJtbksXvLppnVGErXI3PaLFpIhPU7tNZzuiXl9BOya
        PO97VvAMmOar+zmK1t+izDEq8A==
X-Google-Smtp-Source: AMrXdXuxyWEMX6IypiOJufOVsEp8WAmQoSdkUxEDG8qfqBbzmpGWiUKheQU67c6WPsTqA3daYULgqA==
X-Received: by 2002:a05:6512:151e:b0:4ca:f3c2:2675 with SMTP id bq30-20020a056512151e00b004caf3c22675mr19737511lfb.31.1673476294647;
        Wed, 11 Jan 2023 14:31:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004cc548b35fbsm2926896lfr.71.2023.01.11.14.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:31:34 -0800 (PST)
Message-ID: <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
Date:   Thu, 12 Jan 2023 00:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
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

On 12/01/2023 00:29, Marijn Suijten wrote:
> On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
>> On 09/01/2023 09:49, Marijn Suijten wrote:
>>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> <snip>
>>>> +    description: |
>>>
>>> Should multiline descriptions be treated as a oneline string with `>`?
>>
>> Ack, I'm fine with either of them, let's use the >
>>
>>>
>>>> +      Contains the list of output ports from DPU device. These ports
>>>> +      connect to interfaces that are external to the DPU hardware,
>>>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
>>>
>>> How do these double colons render?  Is this intentional?
>>
>> double colons is an escape for a single colon if I remember correcly.
> 
> I thought no escaping was necessary here, especially since this is
> already a value - it is a multiline string.

I was mostly following examples, grep :: through the dt-bindings.

> 
>> BTW: how to render the DT schema?
> 
> I'm not sure if there's currently any rendering tool to view these docs
> in a "friendly" manner, e.g. an html page, or whether they're only used
> as specifications for DT validation.

Probably there will be one at some point. It might make good addition to 
devicetree.org.

> 
> - Marijn

-- 
With best wishes
Dmitry

