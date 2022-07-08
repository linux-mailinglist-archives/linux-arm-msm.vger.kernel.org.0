Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558CE56B124
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 05:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbiGHD4S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 23:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbiGHD4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 23:56:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6030A74DE2
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 20:56:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d12so11000822lfq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 20:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=d+W+CYgVHtPdSnaUFsEjZFbm2jY1agIXuYI2yF5T55s=;
        b=CUSWi9iZiYqV8xxuelbTxPoAfwl0RSCC5FtSv9FJHgRupYh7jA0kqdmc03Ttntsccn
         IGECCxuzBqfBpq+dyL4ZPuly0Kj45ZgfMX2JZxHKIF9+4evrZxah1Y3PeimYZEf2T+Hm
         NO9Qtk1vhQLUUcQNte/vg03RcSrtRZW5bhAEHuZa0ADAISlzWEBvMzJZx2GpA8ccGvtp
         Oi4WZVzynG6uv1YAsX9UrzYjC8QMDSrx2BCtr5V7FIWor1xKNvKkn3yLwjFsj/M2eKPq
         kZs4d2au+MZbK1Ve9cw2ln1wN36iBQmQ8RcxaIuEvDcXj7u7zYWXDwBBnjzJwi7QGTrE
         aYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d+W+CYgVHtPdSnaUFsEjZFbm2jY1agIXuYI2yF5T55s=;
        b=4cB+MejZyCeQikFQOip9swosscDV1BRK7KIWFQ9lQ8vsA9RAibAVkYOJvIcPqdFE2h
         CPp8jq0ZBEDFfSVP6ObIlnBmueYukKwkWeJOV/udvvRsKJMg0J7hMtXHleOqv/m4A7fj
         tyhJsnanX4OgBiamWa8XKYduIvM9AjQ+WGKyM+XvNgibN7zhULFZMzxNPZoHEJ0dSkOP
         VtLRgA2b/hK6JCuqP3NjZgJ6PU3R5DfZiwiiVnXphSiNqia0hKKe/cvHu1sRPIwDtVv1
         tuB8c29DnRg6bNCs3VClzRAtdVvcuqxcRcFs4oo0F9PGtVyUd+U2ehlgZ5J99ZkkXCLx
         i2sg==
X-Gm-Message-State: AJIora81Utn2jBJhWM8w+31sQYCu2gGkq7K9d6gUYPmxwX4uaYzm5ING
        KpRqxSOdrFmgFz+ahcvj/x8Nkw==
X-Google-Smtp-Source: AGRyM1v0VsbaUzE0u1YassAPiTUnCpM49yJzVyct4bGbaAQTJ3+q52gkGEn7IrfMV/C5w1BrzdrzQQ==
X-Received: by 2002:a05:6512:a8c:b0:47f:749e:8de3 with SMTP id m12-20020a0565120a8c00b0047f749e8de3mr943503lfu.568.1657252574779;
        Thu, 07 Jul 2022 20:56:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512315500b0047f6e91d4fesm4788536lfi.141.2022.07.07.20.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 20:56:14 -0700 (PDT)
Message-ID: <88d21de7-58b8-7915-9fa4-783ed07efd62@linaro.org>
Date:   Fri, 8 Jul 2022 06:56:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP
 reg property
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
 <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2022 04:29, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 14:31:57)
>> The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>> changed reg property to list separate register blocks, which broke
>> validation of DT files using single register block. Restore
>> compatibility with older (single register block) DT files by declaring
>> it as a deprecated alternative.
> 
> I think the intention was to quickly migrate the dts files to the
> multiple register regions. Why not just do that and drop this
> deprecation binding update?

Ack, will do in v2.

-- 
With best wishes
Dmitry
