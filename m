Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861C269444A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 12:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjBMLTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 06:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjBMLS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 06:18:58 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A13E04E
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:18:46 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id rp23so30928976ejb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIx9QnDEiIMrF+ea+ic9s2yvBT4Dedk7T3dn3hJI1QI=;
        b=pOOkQDaSGu4cphWcInPo7p2cNnaPIdjifY7CyoPkbXO66aI5vGY/I2rsKksmODIoiD
         bL86qkglO7JgYVX1tkHq+AstdqQA59JYh4YHfbMwPm+2Q7UAtIvnoODioOBApbYLOi0x
         Z46SFiumclgP8AdfuJmCRSPl2sorVNHqWZXAeB+gnp7Q0Ohxer5YiQYwNV7KNCacdbRC
         4RQ8xmuJIDWKE+bRok0yvx/q9PvQ6mPsSQLmMFkm65vHbm6Ihi8KUheR4GY0tXDB66ni
         EQnLS4lBbAp0l6hhkSBfpRBXw45OX+lKzvdz9ZSUTUxljFKoWXwGpSVxTK5C9pjbf6Kq
         gBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIx9QnDEiIMrF+ea+ic9s2yvBT4Dedk7T3dn3hJI1QI=;
        b=tTKMxiN8NLtoJWEQfxplDmDlVf0dA5jh0yj91a3OWn2gE6kK+ERqqljraF+VOp8tMg
         YGPE8cdetpmHmfIF3huk73gMRj9ubfqNy524/d0ztmpqxVLRx8N5jwQ3ywbR9R891hGm
         8T7w06VSd5L9u9tEWMK5XfPYmKigxEEi/GPGBf+ITQQyHfBhsvU1QGKFP3at7u2mdvZL
         sA8KL5lofZbQTCZKOe3BchfWLfQua4pz2TAZcXOXPR7PrB0XweNpf1CagO8A/nrKyFbs
         3Rqnn9v+OcVL4zRqOR8iH0CkMJ9SXnJ6ui6v7GvYn3+t7C+R4HD/yuRAl9AGWIY1Hr1s
         NFUw==
X-Gm-Message-State: AO0yUKXG6MX/5Qh244w46hy244t+G9rSv7d0mfEm7SHN9csbo1yBcT4K
        Xzc2OTfeQ9tpFlanwwy27e9OFU60fN0/YF6t
X-Google-Smtp-Source: AK7set/vk5VCJ4aeYKvsO3L83u1LiQeST5URkCTbDzfs2h9uWKdJZFMZ27L/BDnDZtErGxAbuiCGnw==
X-Received: by 2002:a17:906:70c7:b0:885:6a2e:f941 with SMTP id g7-20020a17090670c700b008856a2ef941mr22618956ejk.54.1676287124813;
        Mon, 13 Feb 2023 03:18:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j22-20020a17090686d600b008aeed39adc7sm6648687ejy.63.2023.02.13.03.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:18:44 -0800 (PST)
Message-ID: <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
Date:   Mon, 13 Feb 2023 13:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/50] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
 <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 13:01, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>> intf) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Oh you fixed it quicker than I could respond!

Yes, I wanted to include it into this patchset, so I had to fix it.

> 
> Still, I think the 8280 sspp size should not be
> 2x the norm..

Let's doublecheck this with somebody having access to docs.

-- 
With best wishes
Dmitry

