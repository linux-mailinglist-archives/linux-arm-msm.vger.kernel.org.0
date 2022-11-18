Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7916162F086
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 10:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241720AbiKRJII (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 04:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241717AbiKRJIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 04:08:05 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBA982BF7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:08:03 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id a15so5993104ljb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBmzyPSGKKw3Z9p4krM6pUy3zktMa1Sg6jbiYWSYWJ0=;
        b=bIPU1hmqkk7O7NRuIdeJaV14+gTHgRWrI+1l/ML9TVw6d1tbIft6SNOum26IpoPyzh
         l+XgDZB6onqLweoQchJTPOiixkm6Afm0Dg+aMcURnPuCmuSPJK34sl/ev0k9ksqw8Ey9
         x3ECUGoyS7vOI0e58WcBtuTdAq7rdsZ3Vv7+xSRtkGATXxgqjjFsUqkrGMhq/C6uUz3X
         EwfWAimj6Hv38yGBk/qEh8WEuB4N3Q0XV2wrtLGGrWcwMdXpzMIhpecuNZiYjTrxzWEl
         d2FbPFd2l8tfUxA0Ld4T4inMLxluNZxGQ6bdXsanVohSwsGFmgn7nrWij/hvyhLYV2wb
         iQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBmzyPSGKKw3Z9p4krM6pUy3zktMa1Sg6jbiYWSYWJ0=;
        b=cHHhylJx09nG0WAMCa4ez+0WMnQM3kdiWbahVzU82P8ICyEFR7edHpTSaI9R9m214b
         L6GHLVSwEMP2rgpYYPZgYMwao5/HjUIuwPUObBNg4Z17Nmg6GXM8sNdux7JZax3hIwQ/
         qgIYdJWB9lrTVwzatO7n4i0eF67d9jsFjcIiZa0hxHR4Fm0DmmUuPHxpD9DNGcjOnWSE
         XrrO22MQ7bb42gmJmv7fPJJSJP2aV1rYt6y4pRH96O+5UgYL+EMw971izIi+1AinzSQb
         GBSJ3CSPUipyMRdg8giOakIan3rjTldOpw7UIvh71dQZvEH5MflUbDGRk+xt7K6W5yRs
         XtLw==
X-Gm-Message-State: ANoB5pmIMjtGN7rgeu0eg6l1PqXbkpSGeIbgCMvWD4/pq19pQc0fuRlZ
        1sCEhtC9S47/Pad5j907qOFoKw==
X-Google-Smtp-Source: AA0mqf5XLhxbfIInkDX6ibdotI8Yq2b5nKdCDO0EcLCr8D3CblqL9hZK84IAUCcp0ISMucXbqykUnA==
X-Received: by 2002:a05:651c:b99:b0:277:c41:d44b with SMTP id bg25-20020a05651c0b9900b002770c41d44bmr2383974ljb.326.1668762481768;
        Fri, 18 Nov 2022 01:08:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q8-20020a056512210800b004979db5aa5bsm580516lfr.223.2022.11.18.01.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 01:08:01 -0800 (PST)
Message-ID: <0a1a3f62-f00d-79d6-9982-686fa7590cfa@linaro.org>
Date:   Fri, 18 Nov 2022 10:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/6] dt-bindings: qcom: geni-se: document I2C Master
 Hub wrapper variant
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-1-aadaa6997b28@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-1-aadaa6997b28@linaro.org>
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

On 18/11/2022 09:45, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> Document the variant compatible, forbid UART and SPI sub-nodes,
> and remove requirement for the Master AHB clock and iommu property.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

