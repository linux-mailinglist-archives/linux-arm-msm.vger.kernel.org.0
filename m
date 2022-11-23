Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC4E635A47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbiKWKjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbiKWKis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:38:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E7571F0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:23:03 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id be13so27507900lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyV5wkkV+56LS1142qAbRPAZ5W6yT49HpnDkBiKI+fo=;
        b=CWYgX3BLOd1a5W9OrGrrE00EzTu9LWEnFq7ewW/QTaQNntrtstJL3d/8qfdeYeJGuo
         sybFuUG+1wi2ZfbRx9RV2JFo/sCLKUELrWpOfTXNyFifC6TcwtnCi93Sjrhg1t9DNG23
         bv2Ekszqe9cuDp3nkePvcgKVogaizSo9bdfqY0vXs82mQCtDj2XaK2YNCvcB5kI6XDl4
         dE3Tdhzv92fWggDi627YQlpO/vYCy+mVc1zOZ4VhrfbS7gZymiQj9se5jvqSWyvscFnA
         YdH+KkCs2gy/040hKtWTfrEahS1o31TWCU+VjLRzWNNACcrptfybwBCNt9m8uIluN2tL
         S9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyV5wkkV+56LS1142qAbRPAZ5W6yT49HpnDkBiKI+fo=;
        b=uz7sFs0iIpFygGH3HVuc9pvpcZS12Obe3a5tniLvqP9FH4aEkwcKhMv4Exk38HkWG7
         P2b9fIC3l2Lv+3fbSsvJ16aFxQIU//51t0/Istsmgi4DspsXiDuBKox7fM+S1H/DarPi
         p/aEY7eNEAUeYbg5ynfPW6IeGMO0Kd875+51YXxwQJHXHSGLJzZPsUacLYrlprWl9J3e
         7YjcNGhaQGGJpde/lSDjJd0L/M4trL+lxnXVflbmgaxAZEH7EhMo5xEz+lpWHD5YidNc
         80dncwZ+XnrjvjtEpQHnMvRrfARLWpc+UX32XZcGwP6WJN61P2BENliJhBeH5Psft1lL
         3sZw==
X-Gm-Message-State: ANoB5pntUFf+KvKBSRr0QDfh6Snqn1IlQqqEJVE6+jBEpvy1BrukmxhU
        QuKLwz7CsGnyG9MxKg+dqAJrAQ==
X-Google-Smtp-Source: AA0mqf5KadIDbTlUhk+bHqHP0r/gHM476ILBj7yIIwNnSw9V4mopS+n8G9HpU9ilYX/dIC6V/cqupQ==
X-Received: by 2002:a19:dc08:0:b0:4b4:6460:24d with SMTP id t8-20020a19dc08000000b004b46460024dmr8902674lfg.386.1669198981520;
        Wed, 23 Nov 2022 02:23:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j21-20020a2e8015000000b0026dcf81d804sm2125822ljg.31.2022.11.23.02.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:23:01 -0800 (PST)
Message-ID: <2094ee64-c17b-2f9d-2497-bab4aeee5709@linaro.org>
Date:   Wed, 23 Nov 2022 11:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 00/11] drm/msm: add support for SM8450
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
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.
> 
> Dependencies for the DT bindings: [1].
> 
> [1] https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> 

I don't get... this was merged, so how that patchset is still a
dependency? Did you mean that this depends on commits in maintainers tree?

Best regards,
Krzysztof

