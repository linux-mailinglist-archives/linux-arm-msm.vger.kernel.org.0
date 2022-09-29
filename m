Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD865EF1E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbiI2J0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbiI2JZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:25:51 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E995EA50EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:25:49 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b24so878518ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5OAeuM1FnE6AhSjbe1EwzxAODDZoh1JPm+uuRMZhdcc=;
        b=N56MGK+wRZuXVYnDwL+bG0fpn5Ti5QhwFFC1VfnJ2HReDecXwThSvQvwg+/qShQfOa
         oXDfC/nLfmrC1qYaEHT0Ni1IACMUnWCHQjrDZWmW1CzR5iYoSUisDXg/INEAcvrNPZ0b
         dsTqezYlp9y3Cb4hd+pJpcUeG20XfAtjyz7P1dNzatg3yf3bF7ASFdB8gE/u5fUcGVJm
         G7sQb5pw8Ha9KFj29+DkPchhITzKnd7MVbpuDIwRSwgQj5z2Gecw1gQkSCYGn8WHatV+
         sbDIALMOeZmcNQmTXKWkRV7eGnEvBWyeL3GEct0LUzbTpyxG9BzOuhXRRfoVCKk/ca+6
         NsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5OAeuM1FnE6AhSjbe1EwzxAODDZoh1JPm+uuRMZhdcc=;
        b=0TWboEF5t9rVg2LjY/h7ggWqxLlH04K2n5nHgDGwQIh+L3/JAxjqMlu2F4Lze7dJgJ
         uuW4dW/sREt99jRpXGFcAhFM5s324eOEbITcw1IcPyVND0SouSmwEBh3KR4KQHAbYJYN
         /PAnZ0MOi8IiB6+dPq0oBez45L9VURgdOSVghsdY64FQ0KfIFyQYt7+Uo8rGxN0L0FaL
         2hJAztB4C9avVKIogL0iqxoddITvUUHJ3tBu8qP+EVSJqWJJNE5aacvCNkNuyTlkXx7x
         ze6goTzPon9Vdt3sDL6o1+NMYuh/naH5PgSTvPYocSDyYhQqSO1Fg51P41MJzrcgzmav
         o7JQ==
X-Gm-Message-State: ACrzQf19T/zkHj15ojeVaZQaOl2Jon4+W515n0Zr/8AwqttZmEGHmIi8
        /xzZ5O25l7KpNabYq5ytrlbXaw==
X-Google-Smtp-Source: AMsMyM7BYHZMI+ch9uGsYDSjZf4sjzV84RY8eytjxT5N2U21RwYGh4HG977++CvYhmF58mY6rDwdUQ==
X-Received: by 2002:a2e:91d3:0:b0:26a:bb23:8f81 with SMTP id u19-20020a2e91d3000000b0026abb238f81mr765603ljg.60.1664443548335;
        Thu, 29 Sep 2022 02:25:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf31-20020a056512281f00b00497a3e11608sm728244lfb.303.2022.09.29.02.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:25:47 -0700 (PDT)
Message-ID: <f7d78734-f23f-ba5c-9e75-7a7b76d9473c@linaro.org>
Date:   Thu, 29 Sep 2022 11:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: msm8916-samsung-j5-common: Add
 new device trees
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Josef W Menad <JosefWMenad@protonmail.ch>,
        Markuss Broks <markuss.broks@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928184155.186632-1-linmengbo0689@protonmail.com>
 <20220928184314.186805-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928184314.186805-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 20:44, Lin, Meng-Bo wrote:
> After moving msm8916-samsung-j5.dts to msm8916-samsung-j5-common.dtsi,
> Add new J3 and J5 2016 device trees.
> 
> [Add j5x device tree]
> Co-developed-by: Josef W Menad <JosefWMenad@protonmail.ch>
> Signed-off-by: Josef W Menad <JosefWMenad@protonmail.ch>
> [Use &pm8916_usbin as USB extcon and add chassis-type for j5x]
> Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Use common init device tree and add j3 device tree]
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

