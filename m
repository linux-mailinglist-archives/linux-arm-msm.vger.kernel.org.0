Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337925E9DB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 11:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbiIZJcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 05:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234885AbiIZJbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 05:31:42 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034A5140F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:30:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c7so6690049ljm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2Yu8bG0PXNsqAl47py+IuYhYzcHI1NWDde90PNG5Uqg=;
        b=XCMsfR5EP/Ik00ZfIqacGvEDgg19Ktr2neIyBBHt6d+bjhYI0yjp8dzKL0XuFPOWkh
         sxrAvutvh5DtrGmumn0+f5iK6HwYBlKIiTT0gFX1GvX6USO3WSrds3bQX0hTyZgmLL2W
         Y7SrSuY4Pd9L9rA2SxJ3Rhpsyi4LU6OJwcrSyX15QMGQgVHYtHYBbwGm9cn1VlP2E4qp
         Hwu75aqqUFvI5udV727VJHA6vUXngH4XnSeXMuj5BTc/N9l2A3nOnNBHzCIGbjNI03Z2
         ZYOF6od0Nke72p8/KGjVpYh2B9jBC5JnZS6RQAOL393bDCOT4gtM7v1TW3Bo4osv2pUA
         7ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2Yu8bG0PXNsqAl47py+IuYhYzcHI1NWDde90PNG5Uqg=;
        b=eURW8R4NJVUoFMbqvlNUYU6akuOCHlB99sKtQQjbHPbJR0XeLwhGglWOQ9jG2Vz0Ly
         PaY6j3c/uD1dSjl5oLXK66rNx36iEqbkbWL+EUiSnFW71g94cHa7jxQcO6FQbAV1/Cde
         oHeMGKaDG238LRABF4r9Dmp3yVglCQJC8zh8laR5gtSdrCxmLAkqh8j+DzcqfEXuOVw6
         vLyaQgKJCdm2ElA6O1UQxaXkDvqyUDinQOrf/LzQ1VIcW+ZO6tRWxZeYnPZJJ4DTC3vl
         u30Hb595xUlWUrAhNMvmEdKRudVIrWIIKHePdUUehfJ3YNIq1sM5V/dmewIxpDN6rVfC
         eDBw==
X-Gm-Message-State: ACrzQf2jyWOx8282rTMpIdkM8Ug5AxN40B5DErITvcnvlFyCb5OwCAFi
        Xvzk1mrrExCnbuMUbPwufAfdsw==
X-Google-Smtp-Source: AMsMyM4TUxVRJosSGk/D8n1lT4eAVP20De3VLWv4b+SbUppDW9re8JvkQWhlivWbyIJzTuLuoqdLYg==
X-Received: by 2002:a05:651c:c90:b0:26d:94f3:114d with SMTP id bz16-20020a05651c0c9000b0026d94f3114dmr2124083ljb.139.1664184643406;
        Mon, 26 Sep 2022 02:30:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q23-20020a056512211700b0048a9b197863sm2478454lfr.235.2022.09.26.02.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:30:42 -0700 (PDT)
Message-ID: <7fdcff6a-9db9-a9d0-4013-7d3ff5fd5d8c@linaro.org>
Date:   Mon, 26 Sep 2022 11:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20220720073326.19591-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720073326.19591-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 09:33, Krzysztof Kozlowski wrote:
> Compatibles can come in two formats.  Either "vendor,ip-soc" or
> "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
> DT schema file documenting preferred policy and enforcing it for all new
> compatibles, except few existing patterns.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Guys,

This is waiting for two months. If you do not like it, please respond
with some comments.

Best regards,
Krzysztof

