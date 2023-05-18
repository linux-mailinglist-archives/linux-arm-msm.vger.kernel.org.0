Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBD070770E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 02:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjERAng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 20:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjERAne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 20:43:34 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB32D3AA1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:43:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so645688e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 17:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684370611; x=1686962611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHOTj/CMkiap8652C/bhAKB5XN/VG0tHwKZODbR8/aA=;
        b=llw3fSjc5uv3NP6L8uEFMWDBfB2RZAbVIXEK1PE4WAwD9R1OupOjyXR1CumbK1Wa+V
         XdJRLLu3Lihov2rtxMdEWCr0MAapQECEdjkEnHUpRGpYqMvakIwEgZdRwPl2kf2MjB1m
         zI9Zw54X7BSTB5EASFkz3JB4++rj4cnSRfMfiQJsygMLdyECik4Qybi5WnDUU/1IucLO
         Dj+qS2BM2y6QYqgnmbc4EuZwTHRYMBx3M3iwGNOWKEgQo6z8Ewhf0jb8qIbgZ+H7iaVt
         ZY8bmQiAjs4JaiWwMtsXbzNnrlS+QbGNttz/2ujqA/NVk9bH9aif+52zGWQMlqdYWbfA
         Hqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684370611; x=1686962611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHOTj/CMkiap8652C/bhAKB5XN/VG0tHwKZODbR8/aA=;
        b=X99M+5ftgsrlmqdiwGtcjEMqPIZpiNMI1PDDPgsRn6fJxeluceTWAdM6gXH/r4GTDq
         BWQ5XnFpTzxj0TvM812pef/R6mKTYPGiXeAtAPWbWNZLTR9XLgUnwdH3P2qyF00yd/aK
         kmzTpSIrBApBWaNEHxiMjV2BxC8+Gtk+OdXqqfc3uxQWZepwaZMk6Y1GHC2yb/zEQIwt
         JDAJDAtJXWNIe5Z1IXceUhPCDUQaZeVg5yjvN+cBQEw4sCeC9vkNgiPvTtWyWSYVIVcD
         DPV1L4YPlluBQWT5L8eCOE22k+ShfSgjm/cT/6LfhFuPWx84tfykNq4/SmJCgqX0+cfi
         k4Xw==
X-Gm-Message-State: AC+VfDxEx8Oe7HG1mUC653GbqYIo6V4Pzsb41DVH155Q60lPM2YBBQbb
        SP/lqwtqBaV//jo1ybZr03LKmQ==
X-Google-Smtp-Source: ACHHUZ5uziY8Qkm1p2E8ArQ/+sk0F+ZuY+R4iVyubNv4dqFApIXQQMclfNzMItVJXSIIDgQoN63MvQ==
X-Received: by 2002:a05:6512:12c7:b0:4dc:8049:6f36 with SMTP id p7-20020a05651212c700b004dc80496f36mr868441lfg.1.1684370610867;
        Wed, 17 May 2023 17:43:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512093100b004f27cecb68asm59507lft.166.2023.05.17.17.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 17:43:30 -0700 (PDT)
Message-ID: <561465d2-0b34-a277-4683-3d8404d5ac8c@linaro.org>
Date:   Thu, 18 May 2023 03:43:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-1-30270e1eeac3@quicinc.com>
 <oqodgwsp4hybx5fzy7n72kl64t4bjrb5rvxbytledcjeh6a2cg@474be3fom6rm>
 <f50cf783-2cb2-44c1-7aa3-e009407fba74@quicinc.com>
 <dhkvnr3inohrkxpwlhia65zip6m5f766scxniluv42xzjibqae@vczzpgynsmos>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dhkvnr3inohrkxpwlhia65zip6m5f766scxniluv42xzjibqae@vczzpgynsmos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 01:58, Marijn Suijten wrote:
> On 2023-05-17 14:32:42, Jessica Zhang wrote:
>>
>>
>> On 5/17/2023 2:13 PM, Marijn Suijten wrote:
>>> On 2023-05-17 11:51:10, Jessica Zhang wrote:
>>>> Add helpers to calculate det_thresh_flatness and initial_scale_value as
>>>> these calculations are defined within the DSC spec.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> Was this r-b dropped because of changing the return types in v10->v11?
>>
>> Hi Marijn,
>>
>> Yea. I'm not sure what the protocol is for keeping/dropping r-b tags, so
>> dropped the r-b because I wasn't sure if the change counted as significant.
> 
> Yeah, seems to be standard practice on nontrivial changes but in this
> case I left a review on a patch that already has my r-b, and you changed
> exactly what I requested.  Probably fine either way.

Yes. Usually for trivial changes (e.g. whitespaces, renames, commit 
message changes) one can keep the RB/AB/TB tags.

-- 
With best wishes
Dmitry

