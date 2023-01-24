Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5323E679267
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 08:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjAXH5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 02:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjAXH5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 02:57:24 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A107644A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 23:57:23 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v5so17356774edc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
        b=Yd3Me3+cKdqdLlAwp8AvD/tWrYtVn7tB/vvQyHiQc6PUX4I2VrddOvyS5s8MGqIchI
         wCdXjpZV9dYY6eIplbatXT7nWd/2599Xm1FMAUOvMbT2owgt/d0ABiNlVVpUOV64X7vb
         SgTHamw4hskUtfa1XGl99c3AhXE6sDn4cNfA8CivcJ5FEP2PXV+2krL+yJagNfHFz41h
         dI0bN/51xhbwTUg6Aahm+pdXV285AIbcPco1FW/CNJmrxWnr0lcjM7hRkGV8j4SSQFxA
         UmspSpS24H62B+6vbzJtGX/Mh5l6Y9b+RVEJzdhZNrIA8nbxv/V2m1rZ1vDLuGgAZG2j
         lSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
        b=rHcnOairh0etl0vzUB4v9z712zUtAneIzMM3e1qPiyOuaOu26UYCDnUivNWC+uJpxF
         WszSSQn8Oz9aRA9YqIHrOJIB3BjaYkdCcdbKbUjwPLw8bZ0ovUj/iUhWSqsv7JWidRNx
         WpGeS3Us9sTZwkOMPLM9UYmUytQWKMsMswQxIdUuWKCd0VKD8wMg4IGoN6H5E/dNhE7c
         Qf/MaHk1q2pBQjR0pY4XIE4MVuQ0XUoMrsSoRZt5T5MDjZX8weI+saT62WJtMG42xRb/
         TekLqo0Kqppjl3zfySTg45SaCmv8tQEw6eA1K3hv1z7hHUAu4bheWn/mt3lVfRSG7JAL
         15jA==
X-Gm-Message-State: AFqh2koy499A/IIrU46bx8u4/SRcz67AIdN6a+RYHtGIi8PDwxz5VotO
        m6BYxFM8ptcLRKUgGA3EhEGjbQ==
X-Google-Smtp-Source: AMrXdXt+1GGRxvTU201N0GgA/ANjRYl0kMjG+dTlxFaG95i9L3Q80YyqWCvwwDwBnIPn0Lwak3CV6A==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id ef11-20020a05640228cb00b0049edb431722mr14083304edb.18.1674547042151;
        Mon, 23 Jan 2023 23:57:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020a50c052000000b0049ebbee7134sm698378edd.94.2023.01.23.23.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:57:21 -0800 (PST)
Message-ID: <76500be3-08c8-311b-6f9c-ad9e2feaf2ae@linaro.org>
Date:   Tue, 24 Jan 2023 09:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: convert UBWC setup to use match data
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
 <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
 <2a5c8934-a479-6ea7-4236-9e156e26b29a@quicinc.com>
 <CAA8EJpp4h1Pt2cNuQi94ShvERmDKTrui_brJORqzx6_wT=KC8Q@mail.gmail.com>
 <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 03:48, Abhinav Kumar wrote:
> 
> 
> On 1/19/2023 9:26 PM, Dmitry Baryshkov wrote:
>> On Fri, 20 Jan 2023 at 00:54, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 1/17/2023 5:04 PM, Dmitry Baryshkov wrote:
>>>> To simplify adding new platforms and to make settings more obvious,
>>>> rewrite the UBWC setup to use the data structure to pass platform 
>>>> config
>>>> rather than just calling the functions direcly.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I was reviewing this series and
>>> https://patchwork.freedesktop.org/series/111732/ together.
>>>
>>> More I think about it, it seems like we are duplicating the same values
>>> here and in the catalog.
>>>
>>> Yes, these two are different drivers.
>>>
>>> But now that you are adding the UBWC entries here using the compatible
>>> string so you are creating something like a "catalog" here.
>>>
>>> In that case, why dont we remove the entries from dpu catalog and in the
>>> DPU driver get the parent's match data as we know that the msm_mdss is
>>> the parent of DPU driver
>>
>> I should give it a thought, especially since we are trying to clean up
>> the DPU catalog.
> 
> I just went through the cover letter of 
> https://patchwork.freedesktop.org/patch/519752/ and it mentions
> 
> "My itent is to land both series and then to make
> DPU request this data from the MDSS driver"
> 
> This means that the parent data suggestion will be implemented?

Yes, at some point. You probably saw the dpu_ubwc_cfg structure. As I 
wrote, I'd like to get it from MDSS. Just looking for a best way to do this.


-- 
With best wishes
Dmitry

