Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA3564B5EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 14:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiLMNQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 08:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbiLMNQt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 08:16:49 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C44320190
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:16:47 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id h10so3228954ljk.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpGS/sLfJxOssPdaaO0i3vLsbjRZ/QFKT+W7Ixf+RBA=;
        b=JMhitTV6dbHSNBi5lG8kfpe0v4v4PjALRyni8Tgoy5X1fILLoiestrd2zMSm+8ed7E
         jP+HSNbSB6NZQoZCdfD8KUZRbTT5oCGQ4LG+Wsl7K6JFurtUpRz0cRzVzmvueh/oo3DB
         lwHBUoKoolhS3i4YWJLzv6U1DUpd8I6Rb120N6tBefDLyEd+wiY0po51Zq+L57vtKgO6
         ogCycbgCvMZIjexasVJke6cpxeOMCwBwV8Y8TqCubqG9V6EaTAkeJAjXhnscln9lDzlY
         dAp7FOyomZ7sRUvV1i638x2Pw0q3DgHXHHleS8sgCeRKIIgcu8shWeZ/+Xfzm9pFn0Wi
         Zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpGS/sLfJxOssPdaaO0i3vLsbjRZ/QFKT+W7Ixf+RBA=;
        b=CBViPu6F8CfEOJJfuu3ec8KeSwnozKDu0IyUS1MeoPJECxRvSCWZTrA30ucuUN7zag
         5NOEbR5cvhBFMuJkipPU+hbMbKm1ucyoTNknpaZhOG2YQlVKiFqFRIWwHxheEwRn/iNH
         qOUZquJNm3dW4Wj63YYlCCv9D1IUlLtnOTPB0Azo/JjNAsjhygV1yQVd+KD2eAMoAJYY
         fSiJyJLUZ6dF0k1Wkgz9BJWgI1qpuJhiHi7ILAJvOt3tyHCbO3URH4psubPXD770AfaA
         5iQtEzcx/SurPH0L6WlDPIJNapk9+YziaWss6ppYttPWfIuiuVSFBld/hNI/6L7F61kO
         bY7w==
X-Gm-Message-State: ANoB5plFSqNQeuPbxmIWUHKYdaquHVNeqjU4ewwLQibWpjGHaeyAuJGb
        bzOTC5GfljTJqbcoXfckfR1vnA==
X-Google-Smtp-Source: AA0mqf7h9JdmO1o4fZ5CvwWZSLzxNP4uB3CqDgju8Mga2Rm0IHZvbY8kfyTBYoVwBBTX1+MYSw75Nw==
X-Received: by 2002:a05:651c:198b:b0:26f:e24e:a41f with SMTP id bx11-20020a05651c198b00b0026fe24ea41fmr6573438ljb.49.1670937405820;
        Tue, 13 Dec 2022 05:16:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i6-20020a2ea226000000b0027730261350sm258386ljm.131.2022.12.13.05.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:16:45 -0800 (PST)
Message-ID: <336ad377-8273-0eb5-d4a7-006e84707b7f@linaro.org>
Date:   Tue, 13 Dec 2022 14:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/7] dt-bindings: nvmem: Add compatible for SM8250
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213002423.259039-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2022 01:24, Konrad Dybcio wrote:
> Docuemnt the QFPROM on SM8250.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

