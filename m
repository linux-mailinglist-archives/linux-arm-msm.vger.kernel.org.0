Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C83C5668F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiGELNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbiGELNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:13:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F7B15A32
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:13:07 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j21so20016508lfe.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QrXr/J2hqDMZnPja47ouKqHCNCSXX62rUd+oU7fHrVE=;
        b=ld10z4BMu3SPYvQjMUNxI/WoH4qQDOu8NDQX6v9q5XyH/7AB+sYcA+jTTTxJvIxPiI
         QF8Wr3neT9klB20DKd39SUPyiH3Spa2LwHCcx4XJiufKAgoGjoMA+KzmupUDsIxhHZIZ
         vRFypw8UfeLP2N6t358u9zWZHma/AYAVwRtGZQ2tv1SPbswF1rjvDDC8PpgN0oP54ivF
         ILpkCMAolNQTLmh2d4aYdHcFtReaHrp1Jo484+ezkP7YhKMSZH3mJmrIRiYkvpgPLXj7
         qKuM5wrrNoFrM6uPYwmHwz/quiYx+4PTmWNFEazKfe0YNIAp8KYV7NZgJqUCI/tMyV+1
         2hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QrXr/J2hqDMZnPja47ouKqHCNCSXX62rUd+oU7fHrVE=;
        b=rf5MeNVdwIXcyE5SeuN7qTECHJ6gbDmcVZEFn7iYYdyQbMnO6RCmlcDR1cQkm0BHKK
         1i7OwQNwpatr00rL49IxAZPGZJhqPTdOK0EldJOXI6cCvlypnSyQk3ooq32akKcbXLW8
         IUwRakRuDT2uxfo3aRDZSiQ1d2omO+dW/V0h6+pCO21fJeA8piLM2ST9tA01JipdblMU
         OU9AwDNVmXV4wFwcJ9IvNOay5O4emBxTPg5jbmSzULtsqFrcS6ov3Dv4Cp+Xquu5gYnj
         4wplMvDln0DflgPJFW/NBkVT5h+ALUl6HfuWCrbXy1xKk6Y4hyjSPdY9FJC6i6SflmKj
         lwvQ==
X-Gm-Message-State: AJIora+/ZKJV7mMtFi1rY5zs4lD0jsiC/Imrg+YRbYGxWCoKuELBrMpQ
        cNc10ljyXODydKAZJ694AQcGgw==
X-Google-Smtp-Source: AGRyM1sAdS98Ne78ejyP4qj9Qn0wMJLTsqJ4OfDUzVBDDJTlyAB/4I5+75jXeyJRkXEkT/FwOp6ysg==
X-Received: by 2002:a05:6512:12c7:b0:481:51ff:d027 with SMTP id p7-20020a05651212c700b0048151ffd027mr17914254lfg.577.1657019585986;
        Tue, 05 Jul 2022 04:13:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f13-20020a2eb5ad000000b0025aa51b069esm5368789ljn.5.2022.07.05.04.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:13:05 -0700 (PDT)
Message-ID: <76508b56-6733-b65c-d81c-31ac173780c0@linaro.org>
Date:   Tue, 5 Jul 2022 14:13:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 38/43] phy: qcom-qmp-pcie: drop pipe clock lane suffix
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-39-johan+linaro@kernel.org>
 <dcff330c-92ec-2302-8e2a-4ac124e72942@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dcff330c-92ec-2302-8e2a-4ac124e72942@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 13:20, Krzysztof Kozlowski wrote:
> On 05/07/2022 11:42, Johan Hovold wrote:
>> The pipe clock is defined in the "lane" node so there's no need to keep
>> adding a redundant lane-number suffix to the clock name.
>>
>> Drop the lane suffix from the pipe clock name, but continue supporting
>> the legacy name as a fall back.
>>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index 385ea3d8de08..254ad25591b9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -2210,8 +2210,12 @@ int qcom_qmp_phy_pcie_create(struct device *dev, struct device_node *np, int id,
>>   	if (!qphy->pcs_misc)
>>   		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
>>   
>> -	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
>> -	qphy->pipe_clk = devm_get_clk_from_child(dev, np, prop_name);
>> +	qphy->pipe_clk = devm_get_clk_from_child(dev, np, "pipe");
> 
> Just get first clock and no need for handling any deprecation.

If I got it correctly, passing NULL instead of the name would do the trick.

-- 
With best wishes
Dmitry
