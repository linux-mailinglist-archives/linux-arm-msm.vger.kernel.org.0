Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73955E8AD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiIXJa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbiIXJaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:30:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A907EE022
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:54 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l12so2424665ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=hh7eQEeW6wXs4cFtgikwHPFejQs6Z2iZT49SRVErbpM0JPT9bkVbj+UE4NK40uTWGx
         yRRzZxZkcyeWhPDshqZT7nOCg10uktxFTJ8drdK0gqu8bzXz8I/sWhhgkCNZDoQn66eK
         rrzu4gXwmRZXRqO2LEs4ZiH2zwjj7MIlm6LiU8Xe2hWTeOwYcy8WBNN3n7/KrYVHyfLV
         juqQjvBR6EP9GRQaO7dV9BppulXNEoQ65mAYdLHi6B+sx0MpUeAlVzwm2UvBU0XXHsFw
         40ebE3mjnhuTmi6gkIrd5xMCyE2fY7zxWkgPUbe2YMaPlfa+JePEyUrdoEakscxGeF1W
         /A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=AtjF76Gz/OaUPzdOJvRICztW2kMfWsDC/syFVPGi1gEOb/+XPI9US618zYJIC6r8v+
         SfZlTVPdrvzFRrInebmK6CNMb1RP6hqoCvLgpVId+Iqjq70MOM/PNM0oJZySSpBk7+gf
         5qtFWz+2M5nyo2CIJOYs7QpjdzrMbZqCdRzD57rgfKk4nLVbdl1OUreeO0DTBGJbGaTa
         +8ZipCSVZ/94qUOR1QczW5+s77Biz+1FckoCIlj1C97lSGgx/by7uzOKWjDWwynxFXDM
         XxyqYFLcmnRmQfbU4H2pfq9N88t57KDMK2Yyj/Ak7NB0py/G2W+C2aiBaA+JWYX3T3X5
         yKVQ==
X-Gm-Message-State: ACrzQf0/Z+Gb+OV7XX+X+1fT3pRGGMKZ87IhN4MuZzKp6cT43MK4ADbC
        wLhmR8pANpzXM1eFCko+KTKcGw==
X-Google-Smtp-Source: AMsMyM6q7OFFmd1o39LcSba3lrIQxa4YwVSfF+8mWBXUcfDHwPhNUgchHb43l4lT5adb2/5ei3KeUA==
X-Received: by 2002:a2e:9608:0:b0:26a:a73b:b8c1 with SMTP id v8-20020a2e9608000000b0026aa73bb8c1mr4456920ljh.328.1664011853076;
        Sat, 24 Sep 2022 02:30:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f5-20020a05651c02c500b0026c0d7a9f5bsm1712863ljo.96.2022.09.24.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:30:52 -0700 (PDT)
Message-ID: <bba397b9-891e-4ff4-17b8-cd15c04b4239@linaro.org>
Date:   Sat, 24 Sep 2022 11:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/9] arm64: dts: qcom: msm8916: change DSI PHY node name
 to generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

