Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00ACD6A2CB4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 01:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjBZAGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 19:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBZAGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 19:06:49 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4052614233
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:06:48 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so3975704lfb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhH6eL86JRt/f5hI/U2QxwOg9FlS80RqBFSHKAjVKJM=;
        b=b6rXPipOE4LQRQKwN78/CsXr6FR3E29RdC+yZrmK3diLOhMqwSBBO2uqDRxn/v2yme
         pmMRlqPF9Zsea3uy2wL0bhXKjq7wCTRxTXJo7F1GYnzdz38HdWPhrQID1zVON4OHEgmH
         1GYlnInac9XgSe1h93krC/EXOCz7Z6phVAyFsJFsNGJ/W3657cxDiUuyxWLAtInvd60N
         2uPOBtgEm2dzo1ibwKGFXQOTMA2LycFO9ncyrNHZ2yT42KhjnOt9MCE7D6QMOfd/Nufq
         kGduIFbmtKy2sRrW0Hhgrp2CRV3Rv4GwJbaffYJ98GUI8aK6r0K9Q+IoWSIhy33VZzgp
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhH6eL86JRt/f5hI/U2QxwOg9FlS80RqBFSHKAjVKJM=;
        b=JN5RyYOEFEJH1Kaxgn7CXZUl8/ynmg0sD27aW7BuQqsUYFzuInrzONj9/ddqdgwZU+
         nNZFleH82sMU23MKP6u+BL1dSsX+Fqkn5aQUldwNLuT2qT2Pnae0chfAz2eiUXmoQVAS
         KN7GlORIOVRqoZokP2EaX/9p5sGFcChrfBFdzZqntAuZZ+sOZxPmPD9Cg+1FsSDyhlLu
         jN5NCZ4m5ZXr3CbI+KB5camgn4eDpAL5b+/HJAfpEjttk+dRdrvEq5z9iUfFVXs2aReR
         VdRYxumu7FHXrTCNE7Sv3Tsz5iyK8sefVQbj58GXyrLYxn29oGctTNoc+8d1Hr6ON8Ql
         px7A==
X-Gm-Message-State: AO0yUKWvl8ocsipImao+X1RFSsjvUj5ehAhnfBB38kIZyQWGANuKHLXK
        8LTSCJFRRhuRCUN1pHapReOSsA==
X-Google-Smtp-Source: AK7set8n9UGiWcvFqUc2DL9AKECbYhGrhV+PPa08jJYXxIaIByhxVK+iIdBvFl4sxBrdXjOcM5VuPA==
X-Received: by 2002:ac2:5691:0:b0:4db:d97:224d with SMTP id 17-20020ac25691000000b004db0d97224dmr6518847lfr.19.1677370006472;
        Sat, 25 Feb 2023 16:06:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512006400b004db51387ad6sm350999lfo.129.2023.02.25.16.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 16:06:45 -0800 (PST)
Message-ID: <423c71d1-70ce-ae97-3453-737c9cb179d3@linaro.org>
Date:   Sun, 26 Feb 2023 02:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
 <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
 <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
 <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
 <533f2da0-fecc-27e9-7bab-2a9d51377833@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <533f2da0-fecc-27e9-7bab-2a9d51377833@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/02/2023 01:27, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 2/25/2023 3:06 PM, Dmitry Baryshkov wrote:
>> On 24/02/2023 22:51, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>>>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>>>
>>>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>>>
>>>>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>>>>
>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59
>>>>>
>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102
>>>>
>>>> OK then:
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>
>>>>>
>>>
>>> This little bit of confusion is because with downstream, the qseed is 
>>> a separate usermode library having its own revision. So the SW lib 
>>> version in this case is not exactly correlating with the scalar HW 
>>> revision.
>>
>> Can you possibly spend some more words here? I see that sde_hw_utils.c 
>> programs scalers slightly different depending on the version of the 
>> scaler. At some point the SDE driver was reading the register to 
>> determine the revision. Then it switched to the revision specified in 
>> the DTS (which, as far as I understand, corresponds to the HW register 
>> contents).
>>
>> So, where does SW revision come into the play? (and which library are 
>> we talking about?). Is the 'v3lite' an SW revision? Or is the 0x3002 
>> an SW revision?
>>
> 
> qcom,sde-qseed-sw-lib-rev is the SW library revision for libscale.
> 
> This is a proprietary library used to calculate the LUTs for the qseed 
> block. Its not used in the upstream version of the driver.
> 
> For upstream driver, the driver uses default settings for the LUTs which 
> work for most of the common use-cases we see.

Ack, thanks for the explanation. If default settings work, that's good. 
When you wrote about the proprietary lib, I started wondering if we 
loose anything (like worse quality of the images, etc).

> 
> You can refer the below property names, there are programmed by the lib 
> for the downstream driver.
> 
> 3733         msm_property_install_range(
> 3734                 &psde->property_info, "scaler_v2",
> 3735                 0x0, 0, ~0, 0, PLANE_PROP_SCALER_V2);
> 3736         msm_property_install_blob(&psde->property_info,
> 3737                 "lut_sep", 0,
> 3738                 PLANE_PROP_SCALER_LUT_SEP);
> 
> No, 0x3002 is the HW revision of the qseed and thats why this change is 
> correct because the SW library name/rev doesnt exactly match the qseed 
> HW revision as its possible that even qseed3lite library can support the 
> QSEED4 HW.
> 
> So we should be going off qcom,sde-qseed-scalar-version and not 
> qcom,sde-qseed-sw-lib-rev.

Thanks!

So, we should further drop the v3lite/v4 from the scaler name/subblock 
and use qseed3 everywhere. Correct?

> 
>>>
>>> Since upstream DPU only cares about the HW revision of the scaler, we 
>>> should be going off the qcom,sde-qseed-scalar-version.
>>>
>>> This change LGTM,
>>>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>

-- 
With best wishes
Dmitry

