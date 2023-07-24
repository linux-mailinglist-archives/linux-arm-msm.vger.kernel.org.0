Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B707A75F8E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 15:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjGXNve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 09:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjGXNvV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 09:51:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97425359C
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:48:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5221f3affe4so2340539a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690206498; x=1690811298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxYYSDYA0vOcxcUc1Cpos3Fbh+vKP5JOxboFjD2CYgg=;
        b=jT6BIFVBTCxMoyi+rk6/xi/c7ZvDzXHOX3R+uQlEKMSd2hc5DklKWCEjGeJor2+KfO
         Ss7rcR9zwSmmLUQ86GBaWM9BHh1pQ171OufOMhdGvoha7AsS5wihFNP+vkDlO5Rs7fTh
         k/KGgxUNPadTsperceXDY9Isl+1/+cGIrGaPoyCPT+D7lgtqRmxBi8XwhX0QICvH5CPf
         UpH+FCytmAqbdNr/OVJEhZk3gEuA8igZxHSErdAZJfbwYTtAPk6JUspi9hYeRdQwtQQT
         s+BasJnuAEDJqloIdub2i2+CA65zfewNr9QlI9tREgzD5ElUiYh5xdDiOwmaFwNErfac
         mPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206498; x=1690811298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxYYSDYA0vOcxcUc1Cpos3Fbh+vKP5JOxboFjD2CYgg=;
        b=FQP0Baf8J1Dr1nA3D6oC3p8I9WXdD7Bc/xkwYuPVdbkL//zmFElWvVI6hoMUb40uhL
         QwmbUsUlcuhW7FGrlrfovSmYDizK7wunOl70q1oKORO+FIowwAu+hOBVavxzD9MTuPTQ
         GKNx4ZGGP8f/3kvKPJU/n9sC8D671LC8IhK8r1PPEUYmSrEHwdhcTVyFQiTIIrGrqQWV
         3s3/YEkcyIg3LSH3MD1JKt6NndNnCgbZyTf97XxKlJSBQXJRnh2xP+uc9X7YV3Ve/wmv
         pgeqEqrP9nvpKalRHeeoesmMAxqAPMPrCtHN4aH2FS60QYIAPlePSmVY9McWXaz2IalP
         cqgQ==
X-Gm-Message-State: ABy/qLbJGMbPJ64jY5tkoYr2Z6s1gjSmJn0/BCcnjvKYWTJwc7ESDhm6
        zEX0Ugq1voj10dEHVeqVTTgQeYUOviUpHMvaN6Sf5Q==
X-Google-Smtp-Source: APBJJlFM/ecxyFQrohbIrR+Dt9S5DHA2ojaLExYPV7SY/3iPoEct/sihiV43gXZNoES9ffmbM2smaA==
X-Received: by 2002:aa7:d411:0:b0:522:21eb:fee5 with SMTP id z17-20020aa7d411000000b0052221ebfee5mr3789938edq.40.1690205828031;
        Mon, 24 Jul 2023 06:37:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q2-20020a056402032200b0051d9de03516sm6245505edw.52.2023.07.24.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:37:07 -0700 (PDT)
Message-ID: <e3771434-7429-7a18-ece7-8fa07fc78aed@linaro.org>
Date:   Mon, 24 Jul 2023 15:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 SM6115 LPASS TLMM
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230722-topic-6115_lpasstlmm-v2-0-d4883831a858@linaro.org>
 <20230722-topic-6115_lpasstlmm-v2-1-d4883831a858@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230722-topic-6115_lpasstlmm-v2-1-d4883831a858@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 13:39, Konrad Dybcio wrote:
> Add bindings for pin controller in SM6115 Low Power Audio SubSystem
> LPASS).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

