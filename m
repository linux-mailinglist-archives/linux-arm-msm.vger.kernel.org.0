Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C1B6A2CA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 01:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjBZABK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 19:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBZABJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 19:01:09 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB41E13D7B
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:01:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id i9so3939583lfc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjVLhBPAT9DIYkJC2epy3EtjhT3l2n1ZS1kPjCgoj6c=;
        b=U8VTd3FkrrdcsT34hgXS5PmfWsOfu9ktb8W1hVtaHF4ZGI7BACBfRTWF7wxn0MgREv
         88iSWDUNGSmY3ySUJN3B9eF76qv7b3ghfM8eFwXh9uvCT13VGOR+LjR3WiwvJ8I8egob
         tQzEUP3tP4+EPW0xIYMmaiagY7cKO6sqEcQ3fUEj2cjybei8Kjkcq/r2YX3tgLfrOChf
         UtZKWJhH+WdFSK6YhbZXNmQexMoyoi8mkPce/rmE9RR69fjBYPRp+NIEh8AWz2XAjyQv
         TvhmcP0w/zLx8F8A2kxW2fYavSXpo5GwSX2pXDM0cB9bQvuQS65vMjtFVIba5O82Qm/u
         wGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjVLhBPAT9DIYkJC2epy3EtjhT3l2n1ZS1kPjCgoj6c=;
        b=ukGzbTQ955C2rgOT8iKmEex3vJV9Pb/q/Vn987kZTgcoms2ICiVd4HuDcNxHktzTS+
         O11VxUvE5H3qrIPIV0zk77qobAPFDdUhomUiHiwSefE1EmCf3d3mrq23joZiihkDtS7l
         aYbZN4oz4NrQFEbVCDDFe8R1a0+0Kh2dDzzVndngjMaHEKzN/bU1zL00St5vr49L8wEG
         smWS8QlPEmq+GobN5yoQbXRlWdHdUJEWcDnWnyN1dF5mRXljpdNJcrfruyTKhvL1i3LN
         gsz6vlOGU3lfAcgMsp+9GoLG4/b4vCizo57t71eSXnXvk2TdNcWj1wIgZFOAzy8WNhM0
         q42g==
X-Gm-Message-State: AO0yUKWqvfK93WTNZJSwInIXRI052b++VDE5D74zvwdjYhZkiX553wyc
        nUEhzdQF2h7Uz6ThvOaS6XBiBw==
X-Google-Smtp-Source: AK7set+4MeIHwpZRKccsb3cOrj9nC4Wv9xP7wm5S9x9GWXb79gLNJOLhPpqBe4Z3R/6ghV3Ee1ngbg==
X-Received: by 2002:ac2:547c:0:b0:4db:3605:9bd3 with SMTP id e28-20020ac2547c000000b004db36059bd3mr6691639lfn.17.1677369666174;
        Sat, 25 Feb 2023 16:01:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g17-20020ac25391000000b004d6f86c52fcsm350033lfh.193.2023.02.25.16.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 16:01:05 -0800 (PST)
Message-ID: <eca8a9f2-3ae1-25ff-3305-329a6f8db344@linaro.org>
Date:   Sun, 26 Feb 2023 02:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 10/50] drm/msm/dpu: correct sm6115 scaler
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-11-dmitry.baryshkov@linaro.org>
 <6a93947d-496f-1720-0bc6-f0dd86d2ea04@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6a93947d-496f-1720-0bc6-f0dd86d2ea04@quicinc.com>
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

On 26/02/2023 01:11, Abhinav Kumar wrote:
> 
> 
> On 2/11/2023 3:12 PM, Dmitry Baryshkov wrote:
>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>> sm6115. Fix the used feature masks.
>>
>> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> 
> Fixes tag is wrong here. It should be
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on 
> SM6115")

Ack, you are correct here.

> 
> (please ignore the line break, I will fix it while applying)
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
> 
> Otherwise LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

