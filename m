Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C09701CB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 May 2023 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjENJqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 May 2023 05:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbjENJqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 May 2023 05:46:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AC42D59
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 02:46:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so21631990a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684057566; x=1686649566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUq9orJTp8tpRY9EE2cKjH3Tr15y2qOFuSkUd9KjDZc=;
        b=uK/OLyOrWRL1NdRWoGKMv0FfcWgylJZbnmbuuAOOx4Wzu2I1IHCm7+0AukaxmwPT2z
         GJYtF3AX/JmyON9LC/5W5yq9R28F3MD0aRRwqAcrUVCRuvc3HI8Xm2Z35bWUdByALFoY
         3K/Npqp0p/U+HM+fDZlTyux/NxaANWf3h+znXiA6Uphabw+cCpWAfNPaJYfXS+ijebmX
         Lcg1DG4FR0edqH9ELouV/DNMOrmNZN6ivMzW1ZoJ0SQnpCkw6rhsLMpAjIEFtnicUFxc
         RLxquIl2mRyoMo10T4JbP5cTA/M5DBQgSKpf7oMTryzdVZJu7LqkvhBHntpMry+UdQRh
         VpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684057566; x=1686649566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUq9orJTp8tpRY9EE2cKjH3Tr15y2qOFuSkUd9KjDZc=;
        b=OO/IewW4Ir3Z2AgCKFuXjca6bn3Ra8UBgchV02r6xHSlpX/JH/kTB6WtbwDnk7cEvh
         mcIXynE6/UHXf9OspPvSOoQ2DNgAregnWQqAEqf7IPep4HfJGz3soB3sYzyUjQilLfAX
         SJF+19Ca9QPmIaRJdfw43uB5jyRgNy8vbtM/cYIZOMmEGWWrUKB0YrcgM379xfZ9pIaR
         Jm0g2OetEP1/aFVjwbsN8Jfg/z7NwVajN3Hy7767WTV8ouF/jvMqF4ugRO98ZCIR0anY
         TfKStBOwX+YRCiFocdkTtA85Ecc98kXf9O3DXzaDbW7Da4eHH5gRxefdPAJGdm8Ishrr
         fbog==
X-Gm-Message-State: AC+VfDzHJX9bbLj0eYNYJarlpyE78bA1ypi0qjeSft8/a2aBAypcwREe
        sqKv6vlMf9fbLhC06oryc16GDA==
X-Google-Smtp-Source: ACHHUZ4FvIbUUYRC5nuyVHalVD0/1mrWPwl8VBSaK4qjoSMY6EQcYo2xqmtE73aKrWq7iDmrVlcPhQ==
X-Received: by 2002:a17:907:1687:b0:94e:1764:b0b5 with SMTP id hc7-20020a170907168700b0094e1764b0b5mr33067880ejc.69.1684057566222;
        Sun, 14 May 2023 02:46:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b? ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
        by smtp.gmail.com with ESMTPSA id ht7-20020a170907608700b0096a16e49b0fsm6324817ejc.51.2023.05.14.02.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 02:46:05 -0700 (PDT)
Message-ID: <6199f4a5-e8f8-31a9-bba2-730829b84a23@linaro.org>
Date:   Sun, 14 May 2023 11:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/9] dt-bindings: usb: qcom,dwc3: Add bindings for
 SC8280 Multiport
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, ahalaney@redhat.com
References: <20230514054917.21318-1-quic_kriskura@quicinc.com>
 <20230514054917.21318-2-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514054917.21318-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2023 07:49, Krishna Kurapati wrote:
> Add the compatible string for SC8280 Multiport USB controller from
> Qualcomm.
> 
> There are 4 power event irq interrupts supported by this controller
> (one for each port of multiport). Added all the 4 as non-optional
> interrupts for SC8280XP-MP
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

