Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71A46D715A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 02:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236669AbjDEAfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 20:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbjDEAfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 20:35:40 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498984200
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 17:35:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a11so35710531lji.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680654936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
        b=tDcur6hQq8gbQ2tTKuacPs8wWNMtuXhdNZjaQTX1lVlbhqvqOz1O0YmX5CSm12D5J2
         uGNcLX6WiO7HphJ2GeytYeGNQsiuYN38F/TgprkDBrBFO0nJDwyOnLo4Ow6l959Cgxuc
         w/Ds8DXxnPVkSzXyZGkgFX0rjRcE85hUbp5rI95CS7/59BqIS+3dhH67slzWVHW3QInh
         mNUwfcMXEl6uPBXQaZ+qtYoT3ZJgMKcmjfEti/32xOTes9U1fyVnAHm8qvT6seUset9n
         CnfTv9rGwJZCe11wgro+QQIPNRLEhHDoWGLytN+1bK6P6s7jNwx5ybxrVtte6V+FpEox
         +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680654936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
        b=D8Fx2m5bVJCF7ISdGLG84LpG9cGvcQT/ZhoZdA7yotKzbkLt1PkBT4wwLtFy4JFzBf
         JJ38k7otW00I7p2YRb3z5wIzpbo8BoEcr3ECgOGnb5peXNeUkTnh7j5FPJQddACtWcer
         aRvU57I8f+mxEtuDrIXPQlAGOBPkNSUsDyTb7kgytDA9TYQwCXFVOpUaoZCpbwU2u2oj
         gl39Nscg9NZ5CUkWy0HM7/w8ktO19IfxDqUzChvhN7WJBjrYKdg5H7YCZoXY1P4eUGz3
         5GBadCNsDE4K0HuvZcKR/mjo201Q7fH3ZaUvf1zkR3W/XDCoR9xkCU1+1TGkpVnutpjx
         ONaA==
X-Gm-Message-State: AAQBX9es3CfB2ATtozj0Zuwakq1Quouc8B8MTkZICHENuOn3BTG7ef05
        ftCCznQuBzQuD2wumqK9/7E/L9Qv95kfs5JifOzKHg==
X-Google-Smtp-Source: AKy350YLeRc6KY2le+IjjR/XGprQsv1A2gpFyYvLi1D+1ckPJ2xme/FjlbB7ZbchrqG8F5b2V8vJOQ==
X-Received: by 2002:a2e:8ec2:0:b0:2a4:4ce4:1f52 with SMTP id e2-20020a2e8ec2000000b002a44ce41f52mr1405441ljl.34.1680654936570;
        Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e86d4000000b00295a8c68585sm2608774ljj.56.2023.04.04.17.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Message-ID: <4fa6cbad-4daa-e030-9d41-4f9caa2d8a28@linaro.org>
Date:   Wed, 5 Apr 2023 03:35:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/42] drm/msm/dpu: Allow variable SSPP_BLK size
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-3-dmitry.baryshkov@linaro.org>
 <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 01:19, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths, split the INTF changes away]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Everything is fine except sm8450. As I already wrote in the previous 
> version's review, it should be 0x32c for sm8450.
> 

Ack, please excuse me for missing you comment. I'll fix this in v5.

-- 
With best wishes
Dmitry

