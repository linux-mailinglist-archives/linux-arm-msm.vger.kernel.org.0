Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783986D7160
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 02:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236565AbjDEAhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 20:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236000AbjDEAhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 20:37:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2383C19
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 17:37:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bi9so44513710lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680655041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnFy/mc3jjx4iHEWDYd4GHdbJCwwk5KKTntX8Ov8D+8=;
        b=YvxkDs5PG0gD2K0wdqmsnrrRw8bpd32plagXwN4qLpDRETmCzDe2Q6LgjWkaHbMa42
         2mUT8x2AggDFJ/Xmyxza17vyqUEBMyX3SpS3DXy6nNtqhqbjtq37cl1eTucVnggbgz+U
         N71JT8RbCC6QTvNQ6eAVgt/HIukKsU+90dMNv8vbgjFYLDpkfHeZqoUOxv1nXdWy7meF
         M4o8CHEh/CXIsdtvfsB2cEuQe2g43VApclRQIdhTEzMUaloOyvrOJAt9JTAjwnagjnt7
         NzvJEQ8sx3tDgUUaw2Qmk9Wypom/+1Z/MPyqSXX0zHysa0gR4R6t3BoKh/xwACyFdLW+
         4s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680655041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnFy/mc3jjx4iHEWDYd4GHdbJCwwk5KKTntX8Ov8D+8=;
        b=IvblqkrUnZgRhtK2n/380QWWOmeZK3p90Pvoa8K14U3NRQNkX2eJzaimzSA2KNmro5
         d57QkHWg8poo+aMfeCf2Y+hr7o8nS+KXyuij4Gm0G1X45+8zPDfbmpt1DOdtjfdU9dXx
         6usVtJ/zXP2QD/UJmY9xEl8dnrwLvFHPBdI2idN/X7MG+yf41/VPuwAw4x6BLZ4k9wG0
         zBkzIuP9xzorsZGvd1qrCGrVYowC1LavU0Xz1JLnncB3r5dcCwLsmekpbl5ptqw5SlIE
         VXvoyXqJh0PuRAgKXl1TqlRbXqQxcRxPN/fdV6Esz4N1fz02za26HWKHQNrPgP8scxzD
         UrMg==
X-Gm-Message-State: AAQBX9c/E+8u8YIWecSz2jDg8QkknWbSgDhLrjwe6NXf0O+SlY1bv61N
        8YKfgy4dGAtXdl6YvXN9cv9FVw==
X-Google-Smtp-Source: AKy350bDZEw747lsQV0d3rorHivEdfSxopq154vTzY2wwLiW6OQzh8+JoHMaMvGn5m/Tdjmhvh6YMQ==
X-Received: by 2002:a05:6512:961:b0:4de:ca63:b2d2 with SMTP id v1-20020a056512096100b004deca63b2d2mr946380lft.26.1680655041499;
        Tue, 04 Apr 2023 17:37:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u10-20020ac243ca000000b004e90dee5469sm2565760lfl.157.2023.04.04.17.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 17:37:21 -0700 (PDT)
Message-ID: <b00d0507-c492-7ad6-d253-cd218376fa5f@linaro.org>
Date:   Wed, 5 Apr 2023 03:37:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/42] drm/msm/dpu: Allow variable INTF_BLK size
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
 <20230404130622.509628-4-dmitry.baryshkov@linaro.org>
 <8663b3e5-8745-50ca-670e-e286652202c6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8663b3e5-8745-50ca-670e-e286652202c6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 01:30, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x280) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some lengths, split the INTF changes away]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Everything is fine except sm8250.
> 
> DPU | SoC      | INTF_DSI size
> 5.0 | sm8150   | 0x2bc
> 5.1 | sc8180x  | 0x2bc
> 6.0 | sm8250   | 0x2c0
> 6.2 | sc7180   | 0x2c0
> 6.3 | sm6115   | 0x2c0
> 6.5 | qcm2290  | 0x2c0
> 7.0 | sm8350   | 0x2c4
> 7.2 | sc7280   | 0x2c4
> 8.0 | sc8280xp | 0x300
> 8.1 | sm8450   | 0x300
> 9.0 | sm8550   | 0x300
> 
> Today sm8250 is using the same table as sm8150 but it needs 0x2c0 and 
> not 0x2bc.
> 
> We should de-duplicate it add a new one for sm8250?

This is done in patch 22. It makes no sense to play with the data until 
we are clear, which platform uses which instance.

-- 
With best wishes
Dmitry

