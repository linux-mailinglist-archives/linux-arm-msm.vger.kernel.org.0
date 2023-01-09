Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446CD662322
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 11:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236605AbjAIKX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 05:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237181AbjAIKXh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 05:23:37 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C8D1928F
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 02:22:33 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so6243277wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGY2WfIMH5NbDK2UFtX7kYF6wj0td7t4Uuxyfu/a2lY=;
        b=jRWsn90HOq4cs97PbbcUF8R/IEBTYbEMDPmQDemX+kuQE4QKg2cOYPCViC/8uQL5yK
         kgPr0nbVFqlalhNEiGmjR9po/azhbEJVETY8bvqo8fnzJqd96tuc7Wojt0yx9nX3qLIE
         xF1nFwVXDb8TJ2/vCESAAdmxO/bg28kX74JMWViD7HLOzP+2F2qhkzTq0y8lrbyHNNbh
         jWHOL1WrvDDdRYYezXyI7YDVilZ6aEYslC8vrrM2pe27UiS8sUuq5Twv3Ha7CeO7p3vf
         0uVEBVXnT5tyxI6IBv7OCTrqiAcp6xAqwm92kQtDYuVen6/XioPmpxqftV6Al5cD6K5B
         2mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGY2WfIMH5NbDK2UFtX7kYF6wj0td7t4Uuxyfu/a2lY=;
        b=w12gdrn5E2erRkJkleKaBQzXxOJMEO06/SPSWzM9aNOpcrSI6hUOuw22OInuCgnbTM
         LvuOtvtc/OL3iTPnyNKRUYHi2yhYZaK/K4MHNisbQcVNyHLJESMtfFB5SDPaAJ6Og3pz
         4e9q7SlyZat2iSlr3Z2B4+jeh1vgqLgklPHH65gmT92xa1IgVRP00tfJSHcMfp+mumQQ
         7L3WSqdcomrnjum8IBfscxxENVYrzqLJ4BSnbr8fm9spZI2SF7SYRa1VkwlIjVegtL+H
         rzOwmYPmpeLV6MY0M5zozO6pwzEJGGrUWzTqHyzMIRFsI3ijJGBnHWy3iawtY7dOi2Te
         02BQ==
X-Gm-Message-State: AFqh2krJt+qfbgMo7WOf8wPiBF81nce/r51/rDEhQFyBkb/iKKtYjhlQ
        aSpwEBWWOi+FiXiYx2oUE6vKJQ==
X-Google-Smtp-Source: AMrXdXtwhS/Hw81Hf42gN976U+RfMh+Em2M2OULImNjiCySdiWW8ppb0AHe2ByEiCDwPUU8MBLXThg==
X-Received: by 2002:a05:600c:3b21:b0:3d9:bad8:4e9e with SMTP id m33-20020a05600c3b2100b003d9bad84e9emr18493818wms.40.1673259752038;
        Mon, 09 Jan 2023 02:22:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b003d96b8e9bcasm16860567wmq.32.2023.01.09.02.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 02:22:31 -0800 (PST)
Message-ID: <a6330ecc-021a-9943-1bbd-61603f40f152@linaro.org>
Date:   Mon, 9 Jan 2023 11:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sdm845-mdss: document the
 DP device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109045458.316114-1-dmitry.baryshkov@linaro.org>
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

On 09/01/2023 05:54, Dmitry Baryshkov wrote:
> Document the DP controller added to the sdm845 display subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

