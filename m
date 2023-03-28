Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29CD6CBCC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 12:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjC1Kpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 06:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjC1Kpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 06:45:38 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7809F1BC0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 03:45:37 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id er13so6762005edb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680000336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtHhs7QB4pvJcwjdzLIh8LZI6q/2lcp/523QTwwGlKc=;
        b=lgW0DLNSJ485rxyEs2NYbnwTaAxRcgjs30iMncoQvvzjtI2ZNvKtbdMSoYdYWot0g0
         eiDrRKM8+0LcoMR+KXp3xamQUz1mi6cxVUA8mO2dS6a1tktv87vWFABjxlzF8FxyWDDH
         MKOC0cWhXaAVFAJUts/K+ipkg4Mf1REtq7gGGLD/rABsY5bpgleQC8R1iaL1u3bxboYx
         TI/n0arW2KQpJGP4zR7i2hxka2WPMlJz3qvgYEC0JMAxFUkr/JHRM1zB+049zkD7Oy/q
         vH+aGt+syb08gKGM2oPaGDpdor8U0SYl5vX6B/Uuw4YZ1A+MlTqXtquJzBz7IB8TumE8
         k2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680000336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtHhs7QB4pvJcwjdzLIh8LZI6q/2lcp/523QTwwGlKc=;
        b=ZkN3HSH/K7ruW5QheuWuLnAu0jHCj8w7evGUek7DoynRXK6uu12kd4g5rYsjl381TD
         HRognI52MXrw3fuYdJMiIRXdrOGECNh84iD7L48hYIzR7cLDoMDUQntGB51cJi2ku3CN
         86H2JB1njDujksscht+TqUchpcguP26N5MS58yyJDNwkh24vHeLtKwQmoTfQwhihsCuI
         QT5grgGfJWliq92KmyGb7+hHuUVs4L0xILPkn3n5trRqN97m15LKbcuOFYRZe1J3rKE2
         wYelL3dTEMnQKZxgqpo0mhVLB41/L714LcR8RahgArJf435bZlXw4JWtxpalHpR3D9tF
         qF9g==
X-Gm-Message-State: AAQBX9eZfQp9ZOeHWJvAol6GWRShKCU6Mv/5LuYW/MXWwmn0rYSMLw4l
        4rjfBe0HBS+jU4vyMYD+o99fdA==
X-Google-Smtp-Source: AKy350Zoahxskd2t4AgYpbNUQl3+Ml9SOLvhMzfmdEYZ8t+v847J2jJRWAeAzg7qLVvtNankTNF3bA==
X-Received: by 2002:a17:907:6f0d:b0:946:b942:ad6a with SMTP id sy13-20020a1709076f0d00b00946b942ad6amr2165945ejc.38.1680000336004;
        Tue, 28 Mar 2023 03:45:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906924500b0092be625d981sm15212907ejx.91.2023.03.28.03.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 03:45:35 -0700 (PDT)
Message-ID: <8b011bd1-a419-e52b-935c-d0e3752a1db9@linaro.org>
Date:   Tue, 28 Mar 2023 12:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/9] dt-bindings: phy: migrate combo QMP PHY bindings
 to qcom,sc8280xp-qmp-usb43dp-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
 <20230326005733.2166354-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326005733.2166354-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/03/2023 01:57, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,sc7180-qmp-usb3-dp-phy.yaml)
> to qcom,sc8280xp-qmp-usb43dp-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 278 ------------------


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

