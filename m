Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4A95B2033
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbiIHOMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbiIHOMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:12:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4D6B08A5
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:12:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w8so27881760lft.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rBedGGkftQnlv4NIgVqAbrLl+ZeLAXAQge8il9iIZ+o=;
        b=v007GwtXGKN2h769Wd/AHIiAsmoQJPCizLCC4jrssmR8UnZjBiN+XuytuuPWctWTkq
         q0XEaCuuCZA/xnCPVGFxxojyI6U7Z6mJXsj+/RdMHXQfRCYbE+P1GVV69sRF6UUYw9cZ
         f/Nn5piK66ScNbDF+NvKpHZMeA4PkMv0P6tjmiI77f5zBTS7BMDEcqfK00rAv2Wn8t7a
         pABTwmI1Bu1hBGi1qkh+X6sEC7H3Xt2VKXVMh7lD4047Zr5dGmnhg1sx3FNdDuybWH/F
         xEXdpTJ6XkIysLKhRyEuWb7xJ4BhqjafVFvsu+gXCmo/0u9GkgvEmbAvYxr70uTZnQWh
         zzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rBedGGkftQnlv4NIgVqAbrLl+ZeLAXAQge8il9iIZ+o=;
        b=gDZuZKGSQ1EeV+YNJS8GydEfEWA4Cny8zKDvgYMthPIlxv5BnzXYjVAwkrrOYs63Pd
         hTJrrGKb/pWghqUWqMWDy4hfQ7MP1Cz981rvcTwErjSbm7rUKhUnv6QyJDcsaFstXZOu
         ep1KbNuawE7ah4vIoVHEkJx/4ieEQwpj5vEF4Z3OJcOuFXCl6efvDou4qfIxwIqowJru
         3OPcpivnVKcdzaGh8M0J6Sk6+ouwsCGIAOiOTcENIQroSJjurWsKPhKHm+98bVW3IDto
         Q6hn2p60WqAUB10VUyqyH+Vy3IuOalelcqdifwYKrwHtjyuf9cSzqNTniiEkgNNlZfIT
         G4sQ==
X-Gm-Message-State: ACgBeo1lCm/wBHKl4oqJAIuudGPvEnhi3UPjtn6FDbnyVQMa0SY8x994
        oo2OmG9jS3q2DcjkkYpCONAIPg==
X-Google-Smtp-Source: AA6agR5rWckfttdOKB6Q/tbXVH1kZprka9vUcUxRqo+KHnWXp1kbeAc9XrL3z0GVfE4QWntn0yYgHQ==
X-Received: by 2002:a05:6512:228a:b0:492:b7cd:9599 with SMTP id f10-20020a056512228a00b00492b7cd9599mr2610516lfu.625.1662646349473;
        Thu, 08 Sep 2022 07:12:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v22-20020a05651203b600b00498f44629bcsm61049lfp.86.2022.09.08.07.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:12:28 -0700 (PDT)
Message-ID: <217c804d-93e7-f84e-b0a3-a351be874e08@linaro.org>
Date:   Thu, 8 Sep 2022 16:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/11] ARM: dts: qcom: msm8974: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:00, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the msm8974 DSI
> controller block.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
