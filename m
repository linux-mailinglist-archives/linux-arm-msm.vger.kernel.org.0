Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F706BE3B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 09:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjCQIeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 04:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbjCQIeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 04:34:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3AD5FA70
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:32:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y4so17426475edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4gMB7SZxNWv+MDYaayvd9ycdrz/eczmjD/cN2vt4Ac=;
        b=SsZG2iK2wjRdcnUwAMmT5zPS6jyIUtZbrTrAAVflo135hSbXsOvpWlR8KLwMzSmTW3
         xdwxHgYbSU8lwIcKvoHo10STBzWmiEzTdWe8LPTVEZhycJeLEhTz/dJe0DhFAjCuWnIu
         khP4ueaX6E7uY7xOmB+WxCNyCfkujfRVAV30lfZO4DlCcRo5PGib+/nIU8eB712xgmeG
         7Lbnm8qV5u46uchvUgA9q019euMT5CwjIdZdPh2gavS7kBElhQAcQv4ThKWimifl2YOB
         XnSikjFomgxB5nLs6rzB/ButK7zWL6RcHwylhqvm+n/1AWa2aIAmMhvvWFK4ZNScfOFg
         ytpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4gMB7SZxNWv+MDYaayvd9ycdrz/eczmjD/cN2vt4Ac=;
        b=0LkM+2sZctAJo6XxFGQj+RbvXHn633yRIoOcNFL4Zxw6ppMRwM63ZNPBnkXr6PlYZx
         sz8/c70dTyhgiT0cMN4UShhYw6QZFGkQQREmB8ProiAPf6X55tqnzXSJunCEpDHyKGfx
         dmhGA4VU65JP6ceuA5wXxtZ2nXqeEx06dpZAN3pJIiXy6vQeztzIAEWKihAyU9oK4Npm
         c4PuI6DFVBb7//GhgAAltsO9UOhOR93Q2hU03NZWQG5fR0+sGxYuUuKNi3PLaoeXD0yH
         GQTYIHmHdRcq0uFjmxVfu7CMExf/QXOmDOyn71vIu6irMCQ9YHATYElrn/W7KZ2+/EGP
         mYug==
X-Gm-Message-State: AO0yUKVGzPEfLu4N/Jc0wWbBAm8C1TMFg7yX7RbwXlqU/lsqIGZSDH99
        CUfI0CkT2m0fQ31i/rjx8mezEg==
X-Google-Smtp-Source: AK7set9zDb+LdLCcDtcK8Y4Z2Ema368dGsLYXeN2m7ir7jVLdOXjO1ztr1HTB4kC/41/bOxhmnJdhQ==
X-Received: by 2002:a17:906:fc5:b0:8aa:c090:a9ef with SMTP id c5-20020a1709060fc500b008aac090a9efmr13536902ejk.55.1679041963869;
        Fri, 17 Mar 2023 01:32:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id lc13-20020a170906f90d00b00927341bf69dsm692631ejb.88.2023.03.17.01.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:32:42 -0700 (PDT)
Message-ID: <2f2d253d-a247-afc8-519d-9e41512c17f9@linaro.org>
Date:   Fri, 17 Mar 2023 09:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Document SM61[12]5 GPU SMMU
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230315-topic-kamorta_adrsmmu-v1-0-d1c0dea90bd9@linaro.org>
 <20230315-topic-kamorta_adrsmmu-v1-1-d1c0dea90bd9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315-topic-kamorta_adrsmmu-v1-1-d1c0dea90bd9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/03/2023 11:52, Konrad Dybcio wrote:
> Both of these SoCs have a Qualcomm MMU500 implementation of SMMU
> in front of their GPUs that expect 3 clocks. Both of them also have
> an APPS SMMU that expects no clocks. Remove qcom,sm61[12]5-smmu-500
> from the "no clocks" list (intentionally 'breaking' the schema checks
> of APPS SMMU, as now it *can* accept clocks - with the current
> structure of this file it would have taken a wastefully-long time to
> sort this out properly..) and add necessary yaml to describe the
> clocks required by the GPU SMMUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

