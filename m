Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8476A7654
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 22:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjCAVqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Mar 2023 16:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCAVqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Mar 2023 16:46:49 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07184AFCB
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Mar 2023 13:46:47 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m6so19581158lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Mar 2023 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvEvYtECFjXZ14pQicD12i0aDPOh0c/iuZFDIRdeUxY=;
        b=DmE74FCYBv2GQl82QmdjTejZeOwniQ+5ZzgeTd7/JjsbI26i3t+O8bpeUo7g/5K1uy
         Hko1Zxm7uD9/8/9yivM5Tf4nxFMKi23t9h7QQaJ78CxmL/kgL6GIO4YchbJm2yIf3ftR
         Ba4lVwegFr5+SBygGwn/3A30u9EN2Vg4KJBEhXWqkbKOqRI42eFGR72r03OSYK7x1dQM
         xBD/930tIp6vwjGAx7UNXo28hcFHEgbgCaSU6fQGy+3+u2K9oWAm+Ngly6Xu6qzgjEDQ
         +KSj0/qIPJNNy5QQo2CQ79ox6SRD6dA9vLvPmHySghSDgSwWryuESwwjCyfK53eSG+gC
         pkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvEvYtECFjXZ14pQicD12i0aDPOh0c/iuZFDIRdeUxY=;
        b=VXySztDATO6ynK2WTNWdenLSVbvVa3wZ+j66P5XACVhbnny/jvsKKqzoAxXFXXLw2R
         ZYjKkkby/ti3nKxSZew0uXhfRRLAbakP6fmeGwE/jvPVUgYJlHRMeahoMe5ZqiPeK/dV
         R6cmCHJMrBTfeokiNN5pfemiVNUa+aMOUUM5gs1woqCXboS2ZwwnQj1IRR0V2gvdbzE0
         BkqAVjlVzRGFD22zIGZsfFa1K3RgFcAB9+praImGxxA9hVgmrVYmXWLbWtW/5nBExaae
         DoifDoZVIVYhqPWixWEAJJPgh6p1UPmO1HmVmUgdjSGRxB5pn0e/uv7AAeajJA63ID35
         4Ipw==
X-Gm-Message-State: AO0yUKWyoFHunpR4oPXqhggjnbDbR3IYMh1x7zHKSkgN4R7wZaBBTDSX
        nSU+jmsAlE/7L8Cj6N4qmhIzOg==
X-Google-Smtp-Source: AK7set/+Xd7daAY2Co/XPkhqFnBQODqXXDc6d6eZAVH8x8ELROcdmctj91n/iSzcxHW1XyMSVOvVZA==
X-Received: by 2002:ac2:5690:0:b0:4dc:4c1e:13ba with SMTP id 16-20020ac25690000000b004dc4c1e13bamr2025046lfr.23.1677707205112;
        Wed, 01 Mar 2023 13:46:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k11-20020a2ea26b000000b00293cc5f83b4sm1844046ljm.27.2023.03.01.13.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 13:46:44 -0800 (PST)
Message-ID: <3ae6709f-5d05-bc0b-3dec-c4819c832fbb@linaro.org>
Date:   Wed, 1 Mar 2023 23:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
 <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
 <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/03/2023 19:08, Marijn Suijten wrote:
> On 2023-03-01 08:23:28, Abhinav Kumar wrote:
>>
>> On 3/1/2023 2:03 AM, Marijn Suijten wrote:
>>> On 2023-02-21 10:42:53, Jessica Zhang wrote:
>>> Then, for some patch hygiene, starting here:
>>>
>>>> Depends on: "Implement tearcheck support on INTF block" [3]
>>>>
>>>> Changes in V3:
>>>> - Added function prototypes
>>>> - Reordered function definitions to make change more legible
>>>> - Removed prepare_commit() function from dpu_encoder_phys_cmd
>>>>
>>>> Changes in V4:
>>>> - Reworded commit message to be more specific
>>>> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
>>>
>>> ... until here: all this info belongs /below the cut/ outside of the
>>> messge that becomes part of the commit when this patch is applied to the
>>> tree.
>>
>> For DRM, I thought we are keeping the change log above the ---- ?
>> Which means its allowed in the commit message.
> 
> I hope not, seems unlikely to have different rules across kernel
> subsystems.  The main point is that this changelog and dependency chain
> isn't of any value when the final patch is applied, regardless of
> whether it is "allowed".

Unfortunately this is one of DRM peculiarities. So, some of the patches 
have changelog in commit message.

I myself prefer to have changelog in the cover letter, but I don't 
enforce that.

-- 
With best wishes
Dmitry

