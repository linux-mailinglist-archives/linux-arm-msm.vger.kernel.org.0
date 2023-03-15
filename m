Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17556BB442
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 14:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjCONQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 09:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjCONQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 09:16:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48E2A4B0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 06:15:39 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x13so28045318edd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sh/0lfXx2YGCfUW8P5NOZDeAvWoK41WrCTMwsh/Wj/M=;
        b=cA/Lke8j9AwLAJVu8tB2KZKoMBwahpyKQIP6vfQihqmAfLlzBhMYZZn1QJBMK0rotA
         8uy79PoXvGcO7j/nBlK1woapvgYGHT0rRCwJxXV3lY3EaMbzogH4x+5n6GIV9w/OPhqq
         cHmzj7yk8RJ5J1jevNRi+31nQ6sAOft15CS76opGJ0vVY7sqr3fT08rJ0CfKilP30Oq5
         TAf0Qchm+zJ8lkhdFW5Q7+1NNckrltUIXIlVFEVVuGg89d+jCflLaD6UvnA500auC4T0
         lLnhFqVV4JZMOsrrTPY8PaWRTpKT86NYAyOiI1vbJMRc9xGRAD080c7PJYwLwRguoTCF
         aA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sh/0lfXx2YGCfUW8P5NOZDeAvWoK41WrCTMwsh/Wj/M=;
        b=hm2S0TkvCpvf8qEBIrqR1YGqLYnHqCofUX+D7YUEDkWpb7hBS+JJpzHfPCqrVw3J6s
         uodZtj0ghi6J0M8d+08DpqMjKQbr2JpRhWRB6i8TXAlJ4BvK+qeRbTci70DeVWVW4BFF
         AoksQiz+ubPLfVDt9aldrpYuDn/DWdsPYLhg0+mSFfF/FLQ9lNgN4bcq4r99p6YuaN8J
         Kf0g/zHvXtnJw6dIKEfR0awdVxJQo6ECbc5W7mcQHdAgAcs/nAhrCgtWw9GHpc28FsUE
         GhxISeb0pKH7PMJw3BcvineyPbxrFLM2M/KhV6hQK9tSh+FmOt9mUw2o9doT5aGO/Zio
         IPAQ==
X-Gm-Message-State: AO0yUKWIcWbZcC1gsgJZ171iUeX/aLVSRL9NwXQKMX8gtFM1POv2EMlZ
        kWqYB8SB4dU0obfewL2Hsyp/jQ==
X-Google-Smtp-Source: AK7set9m7wcnRkjdKqJAYCge+cDpe0LdwADbdp1K85HBJ1bZ79ULzEuutWk+UWdrVw8UYdcQFgLY/w==
X-Received: by 2002:a17:906:58c6:b0:92b:e87a:5d8b with SMTP id e6-20020a17090658c600b0092be87a5d8bmr7809675ejs.35.1678886138083;
        Wed, 15 Mar 2023 06:15:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id gt16-20020a1709072d9000b008c327bef167sm2498458ejc.7.2023.03.15.06.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:15:37 -0700 (PDT)
Message-ID: <8c441aca-3676-60bd-9303-230c1410eb41@linaro.org>
Date:   Wed, 15 Mar 2023 14:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/7] soc: qcom: icc-bwmon: Handle global registers
 correctly
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
 <20230304-topic-ddr_bwmon-v2-2-04db989db059@linaro.org>
 <7a143671-372a-3af8-7804-fe12f858f853@linaro.org>
 <dc831034-98ec-9d8c-1220-9934c9d5b79e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc831034-98ec-9d8c-1220-9934c9d5b79e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/03/2023 11:13, Konrad Dybcio wrote:
>>>  }
>>>  
>>>  static int bwmon_probe(struct platform_device *pdev)
>>> @@ -645,6 +816,21 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
>>>  	.quirks = BWMON_HAS_GLOBAL_IRQ,
>>>  	.regmap_fields = msm8998_bwmon_reg_fields,
>>>  	.regmap_cfg = &msm8998_bwmon_regmap_cfg,
>>> +	.global_regmap_fields = msm8998_bwmon_global_reg_fields,
>>> +	.global_regmap_cfg = &msm8998_bwmon_global_regmap_cfg,
>>> +};
>>> +
>>> +static const struct icc_bwmon_data sdm845_ddr_bwmon_data = {
>>
>> The name "ddr" is here (and other places) confusing. This is not the DDR
>> bwmon.
> I suppose cpu_bwmon could make more sense?

Yes, we keep calling it CPU.

Best regards,
Krzysztof

