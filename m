Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F56902A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 09:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBII5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 03:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjBII5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 03:57:13 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012A94EF1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 00:57:01 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so985679wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 00:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KxcDeblWBlPqK8JS1qDFxpdeF2zE8l20BO6ADXYKdwY=;
        b=p6U2c7IFPSaJesuLiq4+FOrL/cAjTMx+7oIjujJt3G4i/U+sT6k2XGLW8lsgj1Cc2K
         uhi7LiBJ6tA5SQKwuXJTL32dfeDPU7mGPVaog66g68Py0nMU4mhjCB6rL2IobnDiVKoM
         9ZrqL6jLrMXPPVOZvro8R/QmOMbgOuUgoneO6RFF1seW276E6biixZpdKRdRd+1pwpcS
         t5Q7HJpkAHrMltbSDIZxXosMf5JpWIqFwOyV1iD1RBgEDC3mzNm8xvNDTpVYHupJfBiC
         nXEmG4lGpaUelhm2pntwbVsP6lZoi0GUu09jvYjb088UzYmYoXgIs/WgVc9ajIM6wjCx
         z0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxcDeblWBlPqK8JS1qDFxpdeF2zE8l20BO6ADXYKdwY=;
        b=Wux5QFJ0isOaZwL9+4P6cLjpFng5ps+7QKNK3DovuaIitHsy2C5ObsW4QSU4hjw9zv
         qXKYL4GQS82yFBIKzZc3hKLhXwAm+xw2WdD+XpB5J4wZ+WBL8MJgHgsTNRp2cKswWmEi
         r8/f0LFzhRodNCkJvEg5ABtEXKGOBw3T8xqu4o1eE+IoBvZ++zt3QBCWWEjClS2fy8JG
         FTbK46W7M8mnNEtPZCa40PHRM0xu94funeZxi+xsmAbHgxRcM7pSlwD/LtRAuip7YONI
         YwcCLmtjcZKDVnSGgVC315NdY2ZV0340N0h+J54qifjW8Qnp2o/Zdwpc0QBqh4helgh9
         AE6A==
X-Gm-Message-State: AO0yUKXcAcM4ydr8cJp17LY2yFNP3IbPmz026c0SGMwKgiPXA3Jb00aC
        WRGCn8obihNu7LjRNurF16E4uQ==
X-Google-Smtp-Source: AK7set8WgAoSUt5mCuBuGbr/bh3r1tW54Gpm7EV6mAcJ4Jb6+FaYWjaTHFPayCBIP9niXr88/hEVlA==
X-Received: by 2002:a05:600c:3197:b0:3db:2858:db84 with SMTP id s23-20020a05600c319700b003db2858db84mr9424861wmp.34.1675933020585;
        Thu, 09 Feb 2023 00:57:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b003dc43a10fa5sm1298698wmp.13.2023.02.09.00.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:57:00 -0800 (PST)
Message-ID: <c2901ace-144a-6576-d5b6-939b994d7a03@linaro.org>
Date:   Thu, 9 Feb 2023 09:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: remove invalid interconnect
 property from cryptobam
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20230209-topic-sm8550-upstream-cryptobam-remove-interconnect-v1-1-84587c7bad0f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-topic-sm8550-upstream-cryptobam-remove-interconnect-v1-1-84587c7bad0f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 09:44, Neil Armstrong wrote:
> The interconnect property is already present in the qce node, which
> is the consumer of the cryptobam, so no need for an interconnect property
> as documented by the bindings.
> 
> Fixes: 433477c3bf0b ("arm64: dts: qcom: sm8550: add QCrypto nodes")
> Suggested-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

