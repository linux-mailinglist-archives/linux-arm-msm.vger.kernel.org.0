Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF9F616F42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbiKBU7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiKBU7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:59:07 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A72F110D
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:59:06 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id e15so13341817qvo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYcMAtX5RNG+cAlcomaCH3MLzGY3RZqr/TOXlBcFA80=;
        b=KZmseVRrRclZFspbMULUnM4pl5+tTyavONwffZSt+tCcZaYH3obEaiJbvNGm7Dtg5t
         uC6ostsBZRlAL+lca1nUJbLPilhLtpYn31YAYRpiRcy+6afQd47NmYkgkKNntAUb8RHX
         YVpD/j82q5bLwnA37i0HowStUvWbvFfngeh0QV0w3rQ5C0UnZNgIm6QNFl4wbxF3s+PU
         FlCsHQITeeXx+tAbbMsg0ThsqGh0gNsLibxll0xQdwZdfZtEX6bRy7TjcIEQqtoWZykm
         sxU/GhEYkawx5hWMhDNxGGfJT89xmjEKS1Qa3l2ppdb5s9OAx9qtZ/AvuUB9PgXUCQFs
         I9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYcMAtX5RNG+cAlcomaCH3MLzGY3RZqr/TOXlBcFA80=;
        b=lIyM+kBLlwjwTFk/reXIUALN5SQctgRmDNBPzsY3Cp9Jb3AWI4iaS9E/MqEE3buANj
         +vESJ1jl9LKxoSGQs/1imiTBvALnUZsFS3BNUW4WHpu81gZLpI1J1v7kVqDpdBOPTiF9
         vM1qhyH9XUpuGWAwraOUeiOpqDo09N0LG4IzPRkGNh80AOvDHmTpuIBvqyO+dmXry/L3
         0riak67gg2gQLtwtOBQQ17PAe071grQ9g4fdNjL1IwQF7WjRmiWYZGtilPbMrnIiPRFg
         RPIhheIhP2mp88PrB/bu323mwORc/3A6K6dSEWUjFivU2zJo+byggE46en4YcImeY5zB
         4GsA==
X-Gm-Message-State: ACrzQf05QF1768a2AnP3g7Y478aoEwS2PedgAXOor+HTSqC2jaEkhCBy
        PYPPBe4lfr3IDJZp5Egoje9GHg==
X-Google-Smtp-Source: AMsMyM4VzuJehisXyF5sCsBE3/Y+jG7Mbb3k9naaPHhHaEa5zWjzBEFyw6fp8Ov/Ip4YKqT8FY82Iw==
X-Received: by 2002:a0c:c684:0:b0:4bb:fc53:5ad9 with SMTP id d4-20020a0cc684000000b004bbfc535ad9mr14794112qvj.3.1667422745513;
        Wed, 02 Nov 2022 13:59:05 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id e18-20020ac845d2000000b0035cf31005e2sm7146861qto.73.2022.11.02.13.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:59:04 -0700 (PDT)
Message-ID: <fd6ae966-63a2-8f76-07dc-f1ed7ca076e1@linaro.org>
Date:   Wed, 2 Nov 2022 16:59:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 04/11] dt-bindings: arm-smmu: add special case for
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
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-5-dmitry.baryshkov@linaro.org>
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

On 02/11/2022 14:44, Dmitry Baryshkov wrote:
> Cheza fw does not properly program the GPU aperture to allow the
> GPU to update the SMMU pagetables for context switches. The board file
> works around this by dropping the "qcom,adreno-smmu" compat string.
> Add this usecase to arm,smmu.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

