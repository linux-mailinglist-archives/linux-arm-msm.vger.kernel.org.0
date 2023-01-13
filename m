Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E30266940C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbjAMKYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241236AbjAMKYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:24:07 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E876800
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:24:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id co23so20618065wrb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqtzVGrTtS3gFp/fjZnt8TYVU0rki/TedO/gvVXrUY4=;
        b=G5hh/TbPPPGivzK06Wtaxl14ltYQwgD5aXXykZJdDfWzyAAd/zBWf8ff23AcE7Zt1R
         aenC0OhRMdY8PRZ0AoMYXlnKjqk9/b9Q0WCgf4R110gKXkzsCvOP4lJuvimohBuhWXps
         9CokOm+E97paJOr1PdZT2xX+kc8zEM/BeNZfFZ2i/W3gJUdtYknCeWoXLEkWo9fISM5I
         df0HYA1041aloE5naRoVk32wT6sbHkXGdVYZ8/1Ch3qLjeBR9TL0e2F6AbRFVkqxMllk
         SxvRbfsb9YvwH7HF2ZZak9AIL2xGIOaSFZZKRmOEcBaL8f7dfVIM1VMbT9saEmH4PAuI
         BRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqtzVGrTtS3gFp/fjZnt8TYVU0rki/TedO/gvVXrUY4=;
        b=P1VGwSIPZpg9s7zYgwuqJJpCSfeSU5a2BkVtUnD9VTLexfKtBoLzf7ZY9L9maxc1Q5
         YBwSr/F0clqY+4VIELDu9/eurVs7pdGNlYfaQ3umxucz/NXpKXUh23sggxVDcGN3kXSN
         cT7zabW3n5tbUQwzK9Kh3mtO6KeBQXBxIpYP4sSH0oXe7rj+H6yftIz0NPolZafXvBbi
         h9IruZEwnsCF75j0L/FWES5wSMh+uQol/HmG7gFAIstNPm3ZNqh/yhjAWG2HAgIoSfvR
         UqXk4LIZr0xhhzognYQA1dRUOYmaUS1DMXpQlqtMzGMIeOgQcjUuxCb+l56mvJnjXWPc
         Dbcw==
X-Gm-Message-State: AFqh2kpaKgrkplaVzoeDknisTPaMiK//jyrhFCPZbpJPBlUgCqZ0l4Jz
        aD0aykHcXole1q5TpPR+nHiRMQ==
X-Google-Smtp-Source: AMrXdXsGzXFr+tg/hsqZNC+jjJ/VyyEaElf0gsWdPvvSkpheloNgqqRHLCKCVYcPwFbmUPPheX/EAA==
X-Received: by 2002:a05:6000:1e04:b0:273:e385:1a89 with SMTP id bj4-20020a0560001e0400b00273e3851a89mr48740996wrb.67.1673605441963;
        Fri, 13 Jan 2023 02:24:01 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id n10-20020a5d6b8a000000b002425787c5easm18496811wrx.96.2023.01.13.02.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:24:01 -0800 (PST)
Message-ID: <7f58c70f-3ccc-429b-ab98-86948743855e@linaro.org>
Date:   Fri, 13 Jan 2023 11:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND PATCH] dt-bindings: thermal: qcom-spmi-adc-tm5: add
 qcom,adc-tm7
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20230113090107.18498-1-krzysztof.kozlowski@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230113090107.18498-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 10:01, Krzysztof Kozlowski wrote:
> The qcom,adc-tm7 compatible is already used in PMK8350 so add it to the
> Qualcomm PMIC Thermal Monitoring ADC.  Based on downstream sources, the
> new compatible for TM7 differs from older TM5 by allowing configuring
> per sensor decimation, time measurement and number of sample averaging -
> unlike one configuration per entire device.  This was not reflected in
> the bindings, therefore comment the new compatible as incomplete as it
> might change and its ABI is no stable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Resending because it is waiting for half a year.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

