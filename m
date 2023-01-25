Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD06D67AD57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjAYJIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjAYJIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:08:11 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB1342BC5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:08:06 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ss4so45651235ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2XUBr6mewmiPBl5OYmyWzaQUcYCO2uD+Ydn8zp2onA=;
        b=dfDHbfiAnoSY9UbqNuN45Goe/Zk1oIL6lTucUIO0BPvTShJwK4iGo++KJ4vXkJoQHY
         ub8wN3UIpqhFUdiTP8DFpM5QDqZEMADkM2xDnBPok8+RP7qCFAu1gVthdUHc/MggLYtp
         +1JH8To8J5XAPsmKOwBf6zUjhgykyLR8bzDoQAsoqpwMPMKwvmiN2YUzLeN+tNz0uZMl
         y0QG6hJ4NYRPd5nBVJ/J7LKD7R7XeoJKS37m7fO69D6XoktLaGs+L1CN26mNz+ml7N2f
         1k/EXbdaaH2y+Fhppbe/UX3TOt3hLHocIbnvx+Ug7d2apsORBRiyj3RLpdmiNLP2QCM1
         JYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2XUBr6mewmiPBl5OYmyWzaQUcYCO2uD+Ydn8zp2onA=;
        b=fGn+BvQ2RvJetqOG9q6NbPOOWJwps842YA6nU7R1e9vv6X/CsMdwryGv5Z0zGRJLoT
         PWTupboSLlIoqcglz3sEFXvRT5cASRVoQGPhsdDwWa3iiaaRJYhFtQvD8+rFx8oiLh7N
         pCYVQOoBaFyjIiYS/8pn4yUFd+ZZ6+BrYzQGbRHqgnpEDnqa200xZ/H7wJQ256ETkhe+
         ox7ZpI1AtC1HyKBM9ynp4AhuLlHxsekF32bpJGQ40L74aJo8nPBCluzs+rOxWfkGypbw
         gdb5D75nv0pf05N2qemUV8D8Hb5HYCkX8eMpKdfcVq2iPhuErAloUOI7DOLEPv7ee/Jk
         5GZg==
X-Gm-Message-State: AFqh2kr7seHav2Iqose/Hcv9iaAREQxCkxjbklhnfEri8jNsVl+YcQXo
        J138UZBv/zQBeSsWYVGBhZN4TQ==
X-Google-Smtp-Source: AMrXdXtJTelrDG6WoMCRrLpPH3bLCjHiaAD120Ec90X/hWOH2EdlYwNi6AG0QZdXTunVVqc9t5S2Gw==
X-Received: by 2002:a17:906:c409:b0:863:73ee:bb67 with SMTP id u9-20020a170906c40900b0086373eebb67mr32523218ejz.73.1674637684157;
        Wed, 25 Jan 2023 01:08:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id lr26-20020a170906fb9a00b008566b807d8asm2073673ejb.73.2023.01.25.01.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:08:03 -0800 (PST)
Message-ID: <13b0be51-b36e-4e91-aa70-ded7a6d0914d@linaro.org>
Date:   Wed, 25 Jan 2023 11:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/7] soc: qcom: rpmpd: Expand #defines into structs
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, linux-kernel@vger.kernel.org
References: <20230125032728.611640-1-konrad.dybcio@linaro.org>
 <20230125032728.611640-3-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230125032728.611640-3-konrad.dybcio@linaro.org>
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

On 25/01/2023 05:27, Konrad Dybcio wrote:
> Expand preprocessor macros into human-readable structs for easier
> reference.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/soc/qcom/rpmpd.c | 839 +++++++++++++++++++++++++++++++++------
>   1 file changed, 722 insertions(+), 117 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

