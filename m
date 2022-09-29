Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92EB75EF4E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 14:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbiI2MC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 08:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbiI2MC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 08:02:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C549B9E111
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 05:02:54 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l12so1284542ljg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=syheU+TKGj9Y08xsdkW00P+yFPSkxJQDvDxG5JY2w34=;
        b=tFi+lszQ+SADWzMz+y0bP3QW2IqfYLA+g1pnhED2tKJeFs9DXHyjeUeJef71H2+X5z
         cvRpQoq3IiwMk0+u039PVIYh7c4RSJOSNvhgNb5zJSjIg/UcIWvnUk0YvLhI+ciY/4VR
         afCHv6LuYRsv0PTRXmGgT5Bo0x70R/KR018GIlCG0PdkXiSKF3dOOlXlVagzHf+6D4My
         N0VJT9o5vgWpxuSY6wuMiEfl9hc+E1nu/BHpmb49WJco/EdWS0gct6e6jbckL1DMPZpT
         sG9LHES8jrTqpTlCaZZaI5os9SDUVDPY2sZmR+jFZTKAASnJjlCzzyJ0yTzXO6BiqNtB
         2ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=syheU+TKGj9Y08xsdkW00P+yFPSkxJQDvDxG5JY2w34=;
        b=qM6C4asYlo+ZxDD0sN3gQVkOqBh8Bzc/ElVZ8nuKv4a5E9UymGwbgihtqSi57eW4VC
         8vm7Ov+lzoh8LhyjAbJAJijnp6MqoVnFPNY+13hRF2K6E/gtC5GsIKDP4IAY3A7fXNrj
         VIxsrU/y8TKCv//Z7otJKkitKPcecgRQN4onTemnRIVvmepHVXkp47STr2fioF6OJmX6
         ZIjzSYqlihs5x40F7cx7zV5Z+7dRNFOJeoVLsuiOUrBMKszjtZBYyBela0vOq74Z7eUA
         lB4B6nhWmmwCA8Qg0gECPEPICDfuAGeINmNYkuZRPX5LIXJfzqTxaxQWqDioyaYZmgwC
         XPLQ==
X-Gm-Message-State: ACrzQf3PIkIYzTLHn+FnMIwJ7GOWpSTkW5WXyejHiZoc4FAIPUMNDuoz
        R8vYrkT46FUbbgfL0rlNNDyORA==
X-Google-Smtp-Source: AMsMyM5gd5ZLzoqdbDWYocxDi3L9JciLfX3usLIMZoWL2SNpP6fwgSkMkjZgA/bvOgqa7IGMS1MCZg==
X-Received: by 2002:a2e:8297:0:b0:26c:1d83:82c4 with SMTP id y23-20020a2e8297000000b0026c1d8382c4mr1091246ljg.489.1664452973080;
        Thu, 29 Sep 2022 05:02:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k22-20020ac24576000000b00497ac6b2b15sm762939lfm.157.2022.09.29.05.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 05:02:52 -0700 (PDT)
Message-ID: <07c75827-b8e5-7c70-315b-48617b9818e0@linaro.org>
Date:   Thu, 29 Sep 2022 14:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 5/7] arm: dts: qcom: mdm9615: remove invalid pmic
 subnodes compatibles
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-5-b6e63a7df1e8@linaro.org>
 <0636d53f-508f-8a86-0973-2641c9020622@linaro.org>
 <6ed642ea-424d-49ed-eb30-e09588720373@linaro.org>
 <1a3c6766-9be5-1e55-95eb-bc9656e5c9a3@linaro.org>
 <7f8572ab-ff97-54bd-a5f3-fe0e179ee48e@linaro.org>
 <84cb8941-eb15-1bbf-59b7-bbcd6c15c30d@linaro.org>
 <07405d0d-8534-6470-21d1-26b85dbd7de0@linaro.org>
 <f54377f0-a152-9367-1b06-f49df7466282@linaro.org>
 <3fa19362-118b-232e-0baf-ee365fa2f2e2@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3fa19362-118b-232e-0baf-ee365fa2f2e2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 13:59, Neil Armstrong wrote:
>> That's not really an answer... Bindings are correct because they are
>> correct? What is exactly correct in the bindings? How they reflect the
>> HW in a proper way, while DTS does not?
>>
>> Or let's focus on actual hardware - what are the properties of the
>> hardware which indicate that DTS is wrong?
> 
> The actual PMIC is an PM8018

And DTS is saying PMIC is PM8018, isn't it? I see clearly in DTS:
qcom,pm8018
qcom,pm8018-rtc
qcom,pm8018-pwrkey
qcom,pm8018-gpio

Best regards,
Krzysztof

