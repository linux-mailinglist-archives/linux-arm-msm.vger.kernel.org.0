Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704065748F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiGNJ3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234827AbiGNJ3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:29:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D927DF75
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:29:23 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id p6so1460197ljc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jU4sG0mo0OAljG7wSES/D6Zu2DuuJojhSoJOsa882Zw=;
        b=Grxg/mWHPUcGKz59jXb0bd60gQZXJ7Hei+tlpBvvFlEQYViUTWpM+QFD814cRQt+Vw
         RRB45E0w1xR7yse+lUkhZyTzj6PPJaHT49qoFP/3v0ziBK9nzuZZlI+G1lKprJgHA72z
         LDZl5TAyIFI5FvOwlJGI3ZswAwSsc23l4eCjgEqStzhIeT4ryBY4V3iRiwE5LZo3Z4i5
         SId8oKUJTtgNXBRcizuCuXmkDIScup7i8scYDxr4raj3CPpxul8E+JQYN4rfUc/YVSpD
         4XLr5eWca2pLqDR/hGNUtbsxQ0uF33EHtdzDCQaEb1tdMRg3jF8CgyVJ0rJJEjU8Htid
         y4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jU4sG0mo0OAljG7wSES/D6Zu2DuuJojhSoJOsa882Zw=;
        b=C5UJB4JT8phARRswDsHyTwnIh4W29lKW941vSM7aMVKuJiqHr289436ZmM5DUfioHC
         pGncshLP6EH/7xQlwtsYJbXdjapSiISGNUaq2XXl15tBboghp5u/06RucUJ+wFQTts0Q
         c/2M4F+zB2nWF48MDV0Ms4XuAF9pZUwDOjEvXisqj4yasHdD7TJdhs0vh92Dixu2QMLn
         3NRVJgIussBwMHF9d6xp90pIHpaLmG/1LnVGMu8FOpZcx6gooVBbwgHEhTTbXDst8UrC
         mH2LBJ5FL/RKMCBKYkfVxR44cAnwRRN7rE64/W9bkFhHZc8IQHeW2H+DZNMP7/eLo9rd
         KtQg==
X-Gm-Message-State: AJIora9x40a8vjzRqhfafgfAfatvYfLcrnDXswMYdUC8bN0tIggyFsCI
        +8q65znLylbpJ2udxOa4Cl+NwQ==
X-Google-Smtp-Source: AGRyM1uDzQxXNKv9FXmqNr2sb7xQqh6CETrz4yVqsX1kCT6W2B6acb3r6llg6Y3sumEdw35Mlo6TUA==
X-Received: by 2002:a2e:bd88:0:b0:25d:5282:48e4 with SMTP id o8-20020a2ebd88000000b0025d528248e4mr3863024ljq.383.1657790962267;
        Thu, 14 Jul 2022 02:29:22 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512370800b004790506cf98sm258424lfr.303.2022.07.14.02.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:29:21 -0700 (PDT)
Message-ID: <31674dc9-e44d-9757-6428-704bfe58902b@linaro.org>
Date:   Thu, 14 Jul 2022 11:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 26/30] phy: qcom-qmp-combo: drop unused lane reset
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-27-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-27-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:47, Johan Hovold wrote:
> Drop the unused lane reset pointer which isn't used by any combo PHY.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 --


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
