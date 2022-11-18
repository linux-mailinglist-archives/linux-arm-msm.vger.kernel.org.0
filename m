Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29ADC62F53C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241883AbiKRMny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241449AbiKRMnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:43:52 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB07645097
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:43:50 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a29so7989521lfj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NiJMwiexjpUP7f7ZjsLLypcVQ7mNaWepQNRbw1OYtm4=;
        b=qtpZx1/UIdHoxayltqQ4wSi4b4Rfeard4Y79ULV0zSSgxeJ7phYlh4wnkyy/PjSae0
         6NFV+z60FnqaGFYXywY+OTus2kfJ8lCKPX/JkZqVmbzlOVPyGGdCzapAmCnD1n2q7e5U
         vPH8whYhm+jF63rmSUQAOOkyWWe7J0xmZz/ZG8jDgEbG61YeY2wy1NwtAZTd2GKz1PEu
         hD3EqnmNEMCNr8FuHHVeOnHYzg5FkFH7XljW+uKEW+5AqIoLnb4J02VF5cyT8vXUPasf
         977lGiIbZ1SP0gwZPGAEapXiqB3ihxehgKpEUHO2Bfu+BzkBWQtHcN2rZ57TMkjN1p/u
         CZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiJMwiexjpUP7f7ZjsLLypcVQ7mNaWepQNRbw1OYtm4=;
        b=3pBb5y7WgjBXxjYZUg86gac4YA2mHkVx0ojdMMchXGbyxvR7mWFbBZ7sffQNWW7DX5
         YNcWx0Mjb4Wdj/1r4QXJqoan4nWTU++VSGRwR68kNaED5STyRWfdp/KZ6jEOCxMOOig5
         YYztHoANrCxhvJOmsR3/deM6HQRj8977AaZGWsOMHhCNslQIh00MZOpYMMkdI4WFhi+i
         zQ0nCy6DpZ6Ncezwfy9qdp7xli6V7AGPkij6FSOoFK3OWHGewZxE2VjQR4DhPFQt4iZg
         H2qypadydPu+hyErJG9yOX2SGJJQ4kpgeJUbFic8jiwZl0lNMbhk7aTpc7Pj5dEEjuuD
         7XaA==
X-Gm-Message-State: ANoB5pnYiePNY/2IhtVpKwn7qSlB917+Jv2KTSG3eiljaorw/5Ie8B1N
        5yYPjBjogSYVCVqA7BZk4OK0cA==
X-Google-Smtp-Source: AA0mqf4kFMQPrBQUIqNY/nnzlWJ+TlDHY1ENdLRVDtsiTkbe7Sl/yPRQ7nACIJ2NZY3PH0R/GP8kBw==
X-Received: by 2002:a05:6512:4017:b0:4b1:be16:4a4a with SMTP id br23-20020a056512401700b004b1be164a4amr2724427lfb.0.1668775429326;
        Fri, 18 Nov 2022 04:43:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y25-20020a2e7d19000000b0026dd4be2290sm637438ljc.90.2022.11.18.04.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:43:48 -0800 (PST)
Message-ID: <e45614a2-5c86-ead2-c7f3-cc7f0720ce75@linaro.org>
Date:   Fri, 18 Nov 2022 13:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 03/10] dt-bindings: arm-smmu: add special case for
 Google Cheza platform
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
 <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
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

On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> Cheza fw does not properly program the GPU aperture to allow the
> GPU to update the SMMU pagetables for context switches. The board file
> works around this by dropping the "qcom,adreno-smmu" compat string.
> Add this usecase to arm,smmu.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

You already got my tag.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

