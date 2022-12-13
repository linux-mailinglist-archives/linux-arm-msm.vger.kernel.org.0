Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF10364B5E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 14:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbiLMNPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 08:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbiLMNPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 08:15:44 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BCE1FF8D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:15:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so4786811lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKHuBiG5bn0UFG61Yqwdz0QHJ0cX2ppNH1TiayU1Q2o=;
        b=ensnDSrEu44YeNbGbwFOzBKWKixUCwqYBsxZkxclujpJr1dSc1JlIIPAwlwjzG1U/f
         OxwyEB3rLtLXnqOdfDcijaI7wX+ZMm3r47P+39ftfrEqZwW2vbsA/2BolSUMnm+0O+Ov
         o/fjqXpnJYMc9SV9FnGrhdFCor0hX/iMr8xCppy3zTYV/vM4o4zFbCQW8QSKRwua9KKe
         U7jeBpztkz9yw63c/pAFpcJ2zMssJ/XgZFKdPdb/wr4S3v7nV4vvIOfC7yYcJ+z/5BA3
         ZsBVNyas1eXJ4Loo4KpUvgliQT8kj64d9K0kMrDqQjUna0hsMYXDE1fqsordWumWxOBI
         d5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKHuBiG5bn0UFG61Yqwdz0QHJ0cX2ppNH1TiayU1Q2o=;
        b=X4R+TApKNVXbX7fhXddQ9Wpke/Gl9FnIoUO3RKgJ6plTc7yFA/CtXnIe6hC5F3uFBS
         jA5SdVtNqqaq5DMRxPCQlNr5lwc5oRyYuM2qyTi2BeWqeieQLFUi80a7A7tEwmibucoA
         JOnc/Kf7AbRgm44scufQQyvR0GR3B71vVZCZDW5wPj9hucU6meZm5SU9NTg/u84s8DvF
         yKULJuCoEfywnug83P6aJl1TkGaDQ3DjbmLut4m2R7jOQYrai40SBdiGli1K64zLd2uX
         HaqWskR2ailoCLNkiw4eYgul2o/DNPeEjSOGwkPviy9tGBejNf1c/a8WIS/Idx5pdOaK
         /4wA==
X-Gm-Message-State: ANoB5plCcAXVTTicml2lXULE63iLqtkuod9GQ6Q/h17v4ORY6E2SmxGZ
        NzH+8vsbe/Wtby939ulqUsXS6A==
X-Google-Smtp-Source: AA0mqf5tU/Ma5YpbX86AbY/XiEHidBFkWVYYIi+47CjDu764F7Uj5i7SXZRUaPL43IkeKYz3YWIZfA==
X-Received: by 2002:ac2:4c98:0:b0:4b5:688e:ee10 with SMTP id d24-20020ac24c98000000b004b5688eee10mr4840617lfl.16.1670937342156;
        Tue, 13 Dec 2022 05:15:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w13-20020a19c50d000000b004b5284a92f9sm360837lfe.208.2022.12.13.05.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:15:41 -0800 (PST)
Message-ID: <10cdb865-9052-f535-a2af-c872fe456bc1@linaro.org>
Date:   Tue, 13 Dec 2022 14:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8150-smmu-500 to the
 list of Adreno smmus
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213002626.260267-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213002626.260267-1-konrad.dybcio@linaro.org>
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

On 13/12/2022 01:26, Konrad Dybcio wrote:
> From: Marijn Suijten <marijn.suijten@somainline.org>
> 
> sm8150 has an smmu-500 specifically for Adreno, where the GPU is allowed
> to switch pagetables.  Document the allowed 3-compatibles for this,
> similar to sc7280 and sm8250.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

