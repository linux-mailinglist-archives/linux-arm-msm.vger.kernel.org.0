Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD9363D8CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 16:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiK3PIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 10:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiK3PIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 10:08:01 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B0C19034
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 07:07:58 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id p8so27403175lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
        b=RPnc/lltAqPuUJR2we1iwIcV3yGPf/+Rq00frStCStqEAEPC2KiqlNAK0E+USCVdMR
         AdX5iqF2ljKhuWEZ3zFTsU3qwhArQrMRIVVZR2mnLpuoUo7/8kUNqx6FSinAXd+qvcY+
         USy9Q3fxaysmVgNgtEU8UoYrPgfzphMi3vPzxDen/c8xafkFwI9ryL/3sq3dKJQBu1kx
         pdv9nv2tu9K0vNgFA4FoEbrP5hKNXR01xhyECNeR+HC+Mlf03gW3dInsD1j2IsdbERKi
         ajd9/SXttFzRZIQtoBlPOktOaqH92jE96L+8OfcYpe5NN6kFsxKAtdMZJe8yVVLA+TDU
         6UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJqrClHiZPXq+FVkSMKW0Xw+s2okc9K9A5evAAtGTUc=;
        b=rou/JW5n2c9uXFzg9WDqAfYrsj23UbhwklS3QFTtVRcntzvMorRoceb+RQl9X0vm9X
         drEaM6qLzELMQ7UcpY9iS1VA5ENe4PTxpYpE1EMyYUHoagb5Id1SLCLFe5NDXEBQKvvf
         35EMWTce+GHYCM+ivpWoQSW7MW+oHAcFoAsLncn16gcCELhBGmeiVG9DRK7UkjGjV4st
         o3H5mWnAb/3foXkTWwd4ak9S/pNTBcmR5IBS77rRJVOjTNDXxDIp5iIfGi+nYJB7AJ0u
         P/80K5YMQH1zzFGoEFaDGfpPP6DSGNhmLCMZ8mY35rG84gxNaF/Td7+XGRPTbcei7uyA
         Sc5Q==
X-Gm-Message-State: ANoB5pmlynYXS7nlXOO19HpQ73KY208M6uRd12BuOqQW+Oew8kabYz3Z
        4nXI94aIY5vbbx2zGKz9K6y7+g==
X-Google-Smtp-Source: AA0mqf734sY6ZDYeK/G5AR3EnvJhvF9S6ueO3jz/KPo7tyikas7hMGIGuMUsj5L17EBc21tQpzfyNQ==
X-Received: by 2002:a19:6717:0:b0:4b4:e13f:6a17 with SMTP id b23-20020a196717000000b004b4e13f6a17mr15560450lfc.372.1669820876997;
        Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q16-20020a2e9150000000b00277045dcb5bsm155073ljg.97.2022.11.30.07.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 07:07:56 -0800 (PST)
Message-ID: <502a28b2-e77d-37aa-4f14-10917fca18b2@linaro.org>
Date:   Wed, 30 Nov 2022 16:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 01/12] dt-bindings: display: msm: Replace mdss with
 display-subsystem
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/11/2022 21:46, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name.

That's really not explaining what you are doing here. Your commit msg
and subject suggest you rename mdss. But you don't. You touch only examples.

> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml      | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Best regards,
Krzysztof

