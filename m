Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43F85E8E8A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 18:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiIXQm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 12:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiIXQmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 12:42:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC00804B9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 09:42:23 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id j24so3208113lja.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vZUaPTqoVWgsInpTzgT9h+FI6z7QTidVmPkHypoNty0=;
        b=A8RgYz8uv29b0xVlOtUQ2IblCd/KDGmEfsqSDeAfa6nFOee0ltmKl2bFy0h6dv3TAw
         xjldYJpBmiTgz1navbtzt+zytXJI83B++6rPu45SB8yC86ymxlslG/ShALMAlEXTp79w
         6UE9/mj9XeLFI8nOCKFiH6fOtNM6HLUHT+nbrTxSe03KFPNsiU1p8q6VtfCLFtI6qh9S
         xBp/Kt+lnZN4skUWT9eQOCfrsCdzYPtKMvEeXFJQvmM/uoWTYYwUrzUI+JOPY29bWV/d
         HiR5UBdZ2+Oqfa+jBqq4sJtNR89BXynAGH/OvS7J9EdROF7K39StNlJ1WU/LMdpXdPYk
         XJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vZUaPTqoVWgsInpTzgT9h+FI6z7QTidVmPkHypoNty0=;
        b=BdPykrmUFRNQNbc38ajEQLWRPH7Xus8/T3O97ErPJZNdM3QrsXKowFjjzQhRCp+BB+
         BzHeqtUqvdEuo2IWCOjeCHU4fjf0L3KzMl2x39EhbLujRbyjA0V5c9txRYM3KX95IuhX
         vfNNT7obpHLZQLsU6vqECY1eWQXorSgtsYoLoV/SIiOWX/cUj9xBr8oh/UX0OmPYdI40
         3VxKdezRqL8Yd+RvJkjIcnZXzTUh4NrOxqXNZ2VUpA0kKn6G61umMC3MQzF/fuEds+CV
         ytjMiuaqf/Oxihk34uDgnRwS/kxi+P6UFceg9Wat4Q1VkjINHhrcvD9ct7y/oLqXOJlW
         NEaw==
X-Gm-Message-State: ACrzQf0kAx2ghcK+pjj5PyYtnBUoEITFvkSTSz6gbGBKN55hvFdJthoz
        cCg0HBecQywFK+hLOaL1b+/HOw==
X-Google-Smtp-Source: AMsMyM6kFvAiQOwvriHJrKJbIjO6DZoXbwEVMfShkCFuutnOeek6i5XjwLY302OS3c4iXGCufTxpuQ==
X-Received: by 2002:a2e:9142:0:b0:26c:3e1a:c866 with SMTP id q2-20020a2e9142000000b0026c3e1ac866mr5105977ljg.433.1664037742356;
        Sat, 24 Sep 2022 09:42:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m8-20020a194348000000b0048a8586293asm1945555lfj.48.2022.09.24.09.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 09:42:21 -0700 (PDT)
Message-ID: <839cd883-f587-a642-30a0-9b705fe95144@linaro.org>
Date:   Sat, 24 Sep 2022 19:42:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 06/10] thermal/drivers/tsens: use generic calibration
 routine for msm8976
Content-Language: en-GB
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
 <20220910124701.4060321-7-dmitry.baryshkov@linaro.org>
 <c397e8e7-3126-c1f9-8d0e-4b3181e5c5e0@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c397e8e7-3126-c1f9-8d0e-4b3181e5c5e0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 11:57, AngeloGioacchino Del Regno wrote:
> Il 10/09/22 14:46, Dmitry Baryshkov ha scritto:
>> According to msm-3.10, msm8976 uses the same routine for processing
>> calibration data as other platforms. Drop the msm8976-specific
>> compute_intercept_slope_8976() and use compute_intercept_slope().
>>
>> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> As far as I remember, at least some MSM8976 versions don't have the slope
> fuses populated and/or the values are bad. This is the reason why slopes
> are hardcoded.
> 
> This commit would break support for MSM8976.
> Cc'ing Marijn, as he should be able to re-test this.

Angelo, Marijn, any update on testing this?

-- 
With best wishes
Dmitry

