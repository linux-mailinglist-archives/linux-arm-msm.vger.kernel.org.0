Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7FE669117
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbjAMIgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbjAMIgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:36:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088A9D103
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:36:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id g13so32115475lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbcF412+htBpP6c3Z0Q4p3qLBGDCwBxu74wvh/PMgNw=;
        b=VpSslbPElfSFkioF2esjTVMWOD8pQfbbCeJ6uRoN7SwA/DpDfkNJg5YbMKDjOyQm58
         Lref6nMkgaioreG3O9Kqk3MKFGbEuLb4YGcEbtI8+FxecrhtP5vogKIiQQd/BeDrIU7P
         B5yaBqDCZbyuMlczVjJ8CCUwZXTvBC954sVEXQfxdbvLdx7tYmrvCvPJWtb2fMYKEZ4a
         /Ji8PZljruID8qRbeX8XbMukIH+Q3qfRpdLg6DWzsLjrc9qYlr88xVRYrHpMSORoINoF
         nDgPE7T9M9KYW8qRICOu5YW/OAo98RpWHb5ILPxNfgXsLbQLw3D+ICsSsfVuFiqSQve3
         lEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbcF412+htBpP6c3Z0Q4p3qLBGDCwBxu74wvh/PMgNw=;
        b=dpLOVw3FZMR4p6VtRZcFSWCrk82v9gEoGmnM2PkGVwJ04lI/ndj82N5BHju5VABAg1
         C8ly2QMzc89BowtibHI5Uc+V4OHJV+TBzWuKcoY43SzLp4YKx5T9zbfqjSJk3Uyje+Q6
         JCykriwmaQxr95h2JGx/ba8Ati4zIPCiEh7nvg0dXrZ1wifbmoLV5eBt1TmrNFbvNeAr
         2nAAL2K26KB/R34Yl0ka79wsW0fD30JZk9JzDLrc5QziUKze7GsGxmwU7Nou97InBhPp
         gQXdBUCi4OJzSg2tYJptPuIfj89mARouiuW7fX6BtIaOXL22htW+3hNLsNnVSaufWhro
         IYjA==
X-Gm-Message-State: AFqh2kr9LbqkHODUjXtV7M59psljGporV+qQUZ6uVqn8xLfQHivbZo0p
        6g8MWK1ZvRIsbOMv7/wRBBNebA==
X-Google-Smtp-Source: AMrXdXvWNzx7rgSBewTKrQ2TXk3lTNoL04kHq5ZP4XC25VP4PEcDLfWV9uvN9qcdP5fMa1q3Tiag1w==
X-Received: by 2002:a05:6512:224f:b0:4cc:586b:1834 with SMTP id i15-20020a056512224f00b004cc586b1834mr9610322lfu.45.1673598972387;
        Fri, 13 Jan 2023 00:36:12 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id v15-20020ac258ef000000b004b57a253deasm3739416lfo.162.2023.01.13.00.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:36:11 -0800 (PST)
Message-ID: <81cf71ed-1daa-222d-d67a-efded42e70d2@linaro.org>
Date:   Fri, 13 Jan 2023 10:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
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
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
 <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
 <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
 <20230112215015.GA259261-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112215015.GA259261-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 23:50, Rob Herring wrote:
> On Wed, Jan 11, 2023 at 11:35:53PM +0100, Marijn Suijten wrote:
>> On 2023-01-12 00:31:33, Dmitry Baryshkov wrote:
>>> On 12/01/2023 00:29, Marijn Suijten wrote:
>>>> On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
>>>>> On 09/01/2023 09:49, Marijn Suijten wrote:
>>>>>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
>>>> <snip>
>>>>>>> +    description: |
>>>>>>
>>>>>> Should multiline descriptions be treated as a oneline string with `>`?
> 
> Depends if you want to keep paragraphs. Generally, we use '|' or
> nothing. If just a colon (or ???), then I think you want '>'.

Ack, thanks for the explanation. I'll fix this for v6.

> 
> I get tired of saying to drop unnecessary '|' in reviews. It would be
> nice to analyze the text to check what's needed automatically.
> 
> -- 
With best wishes
Dmitry

