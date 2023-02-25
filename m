Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B96B6A2C84
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 00:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjBYXGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 18:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjBYXGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 18:06:32 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECA216889
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 15:06:31 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id n2so3790280lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 15:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FA/YirM7p+Dh9nbswy+HG0CqRccl7sb7V8X1DNYAnTI=;
        b=szOP7EgnMFR+SPGSD3oaex+otVCF+1uInkGxH6BxN0JWeHTPKBgTiyNd7lYMnRAU1i
         YgL4B2nuYuF1jucnkhHU0oXp/cJ92VLXb/tC5rN8MI1eY6aKArXdNmjZG54ra114Gcmg
         XuXNc7CCO2igJ3WFNIP68RpW34hqbuDX/Q4rWLdi6+F+eiDZgDNvWAsxUeieO4y/tBc3
         +LjqLFzJBhanD+ni7k5A2KovhC94uFRCTweZhxUNABzjaLcBycmQWeofrtNg7ziRw345
         VwQpCEetFW2cPgEdsiR5ymqUt/zbjsIK7aVAKbK5zXZ6z8g5VYCOADYBTVFVSPi/ezZR
         LhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FA/YirM7p+Dh9nbswy+HG0CqRccl7sb7V8X1DNYAnTI=;
        b=LGACD5zC7ZiQeSO3aM5bhpGoQpEtNh5fwIBax4Z3CY3Qp9/v1XmFxzUGMLpmuZAXxG
         6dqP7ExLHzf90pX0LTdPgrUqznFdaQq5+4tQOXWOT9dzyihsGrbs9hkizfmsoipxIFo8
         G36/YMqZUKqogb0iNjvHDSw8T6JVRyzUbsY4C4U6/KNGpvA+N1ihzXWc+4q2YNBL6pwp
         U3gZ/XU7qTAbXpHLfwpyo+XVM7hne4xfTo9GMGgx1CCuwhKr5vJZ8VsBllZg8T8AUW5v
         J/rNeJWxWeMW+2ionGiNtL4mfpzUs/81kkdV3n0LTW4r7XuVJWnsaFB63IPbTsxDW65A
         a/0Q==
X-Gm-Message-State: AO0yUKUUmJaubqbR9Xb92wamzRFrRj1MM04WmoaAC5kb+N/6OyWHaRZx
        FIdK6pyx+tdkQj4ghIRqlZsN6w==
X-Google-Smtp-Source: AK7set8clTQ93KuM/JaMKReIW3PQwHhL4/2kiKHsaZ5dyKokDl58RKAppNDmAyrqaNt9HUMZV0dGsA==
X-Received: by 2002:a05:6512:968:b0:4dd:a5ac:f0a2 with SMTP id v8-20020a056512096800b004dda5acf0a2mr3578558lft.39.1677366389511;
        Sat, 25 Feb 2023 15:06:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t25-20020ac24c19000000b004dab932248fsm337070lfq.180.2023.02.25.15.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 15:06:29 -0800 (PST)
Message-ID: <2f7fb041-edf0-79b1-5005-2af19a3d4934@linaro.org>
Date:   Sun, 26 Feb 2023 01:06:28 +0200
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <298eff36-1a55-75a8-d957-ab97504e5caf@quicinc.com>
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

On 24/02/2023 22:51, Abhinav Kumar wrote:
> 
> 
> On 2/13/2023 9:36 AM, neil.armstrong@linaro.org wrote:
>> On 13/02/2023 12:16, Dmitry Baryshkov wrote:
>>> On 13/02/2023 12:41, Neil Armstrong wrote:
>>>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>>>> sm8550. Fix the DPU caps structure and used feature masks.
>>>>
>>>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>>>          qcom,sde-qseed-scalar-version = <0x3002>;
>>>
>>> And then the techpack tells us starting from 0x3000 the v3lite is v4:
>>>
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59
>>>
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102
>>
>> OK then:
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>>>
> 
> This little bit of confusion is because with downstream, the qseed is a 
> separate usermode library having its own revision. So the SW lib version 
> in this case is not exactly correlating with the scalar HW revision.

Can you possibly spend some more words here? I see that sde_hw_utils.c 
programs scalers slightly different depending on the version of the 
scaler. At some point the SDE driver was reading the register to 
determine the revision. Then it switched to the revision specified in 
the DTS (which, as far as I understand, corresponds to the HW register 
contents).

So, where does SW revision come into the play? (and which library are we 
talking about?). Is the 'v3lite' an SW revision? Or is the 0x3002 an SW 
revision?

> 
> Since upstream DPU only cares about the HW revision of the scaler, we 
> should be going off the qcom,sde-qseed-scalar-version.
> 
> This change LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


-- 
With best wishes
Dmitry

