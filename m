Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBBC6DC884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 17:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDJPai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 11:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjDJPah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 11:30:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E801524C
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 08:30:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gb34so13477330ejc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Itkfx/SKWmTgvLKHAD1AdOCobJxj9e9oDbXIhOz5Grk=;
        b=Soklrh6KjQhWPbFfaBnFO5reP5hGWsaazUyTUoMePLaBh/KHj/BM2NMXEUvbGQzM4Y
         mul5E1svfxf+7g85Kpf5DWc2ug5mnF9wTntDKgl37P4tfS5PC09gC6M3drJmNHiYA+ek
         nLHQD77Gk4Ge4LusG7Wgg2layKERLzNbdfpW1C7s8DUpRcl1zTzN1Dzc9XLopAytsyPH
         y6QT2mDvRSuWNkCwnqpFvNY/PgknOVasHcfZzTLUdnta+zOrMBZ3vjctjVJGMkMjHKx0
         isGhGs2gB4rZFbUuNDKJIsO+LzlBLU9CCjciSE+lbJAwfwk5uT8YZb37Zf9m8CNZZWXK
         CEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Itkfx/SKWmTgvLKHAD1AdOCobJxj9e9oDbXIhOz5Grk=;
        b=OONZ2QP8zAU2RA9b8xvR6lL01OVm4X/EGSsASEYILLUCxn12VyKkq+FaiuufoWzLFZ
         azYPuNG1FTbH+YKFAe2xJS998Xy761phlW8hR8ZZZGN1UPOk02hLhl+K59p4Q/CeCbXn
         80536MJQevTJv4lDj9+uDmbp+Qwcm1MBBkVE37i8sxvKiR/kTRnokjXJRNYHvwl0/rrg
         3WpeDpPu3E9DMFA93uAnvprpbl7QKjdbbJROkqdZFRLk60mSuVjqk+Qlj21/cU96dI1t
         FRnsPT/gv2/YqhDq7Az7OWy/X5z8v1o5OVUBWrC0ssUBXrEyckeRKF2y2/S4h946YPLi
         FVQQ==
X-Gm-Message-State: AAQBX9c7uzx1tno/6xA22NCcpc8r8RDJw/F0vujix90UHGV58YfIkGyh
        2rq9FZFj4r+d+bYEL21iF8uThQ==
X-Google-Smtp-Source: AKy350YOl6LmnKef1jR9aqU4sERFWWSnDuFwHk4cC7wGrdApNE4eG/tOeHTBsxeVq5DBEqq0wJL0AA==
X-Received: by 2002:a17:907:a395:b0:94a:6e08:fec5 with SMTP id se21-20020a170907a39500b0094a6e08fec5mr4377644ejc.29.1681140633994;
        Mon, 10 Apr 2023 08:30:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id s27-20020a1709060c1b00b009475bd8f441sm5168414ejf.60.2023.04.10.08.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:30:33 -0700 (PDT)
Message-ID: <92f8fa5c-7753-865a-83a3-2a53c2c3a8f6@linaro.org>
Date:   Mon, 10 Apr 2023 17:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/7] dt-bindings: iommu: arm,smmu: enable clocks for
 sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230406200723.552644-1-brgl@bgdev.pl>
 <20230406200723.552644-5-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406200723.552644-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 22:07, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The KGSL iommu will require the clocks property to be set. Enable it for
> sa8775p in the bindings.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++--


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

