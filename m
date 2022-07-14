Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382A35747BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237575AbiGNJIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbiGNJIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:08:01 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27B13CBC5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:07:59 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id e28so1765487lfj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jl4DNwb2Gyurm+zGL+d676Qd+COluIRUuESVpeQKWC0=;
        b=L3RT6QR1ni+Q+ys1fl+pnF8bB7RPAWkwFMz+tnF3P5v1Jd3wUSFvPf5Mwvsx/eJ8Xm
         iNzAdw6xIF4RU2F1JxKzt2a4hw685/Rb8T6LbbfclXbSotZWIf3zXg5OV6ZZdC2sY+cI
         xcQliuqOuOtC8RFonaNA7Z7Ik5jWmb8JZfLQS/v+FPQuFLHcil5o0XmKEUZzFdKtjPxz
         HiZE0WIFMTqbi1PZdHggLX2RU/eGbRstiskNjBo0eBXT+SPIXCkim2fafcRnXtS5UCfx
         ci+DfnRFFa7hL8mdOR9JRPvDC5vSfJyO90ldyJ7nGLjNtHLB1MBwSMe3cLgmfwbhL8Jv
         qAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jl4DNwb2Gyurm+zGL+d676Qd+COluIRUuESVpeQKWC0=;
        b=Abi6A5aUh0RbRGFRBn/uutNajn32xFDZhfybgOpi+GyHJrZd1tDzYvvvyi5ET2OHS4
         CWOV1Iz/27/UmrcLHDXizqE/SxLTPxDKtUvXBsKJyYQcbuqO3CrNugsURr9mB3UivECJ
         ve7t+REC78uz8pt+px/pjBWct97Vq8Bj5bUP8fEY0r5Br4fXnkcHEhU3sluJHh51R4XQ
         J2kRN95MXJYHgvIllOgNAzDgtkooYwoNhsxVa+T2V1UiL7H06HOWMqcdoBgC7Ar9c6Zk
         gRpP/eQNOmVcgoXiDYFlv/TW4aDfAaBq5Y1jWFU2WuYV6xAT8t+mWNtfGxeC7RS1NGPm
         +PJw==
X-Gm-Message-State: AJIora8hIyWeBGAzw3oQUhx1ztfuveYf56vl2/reu2wVEikl+QwioQvq
        1s0lR/XyFM11iavDTQJV8vePAg==
X-Google-Smtp-Source: AGRyM1tsipuDR7LJx1E5SIC+SfOIqDfrOGGC9rV1JuuIXdT8wzO+pIR201gcIftWNEW9UcvQIALmLw==
X-Received: by 2002:ac2:4288:0:b0:489:da8b:293a with SMTP id m8-20020ac24288000000b00489da8b293amr4412363lfh.106.1657789678414;
        Thu, 14 Jul 2022 02:07:58 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id q9-20020a056512210900b0048905c6103csm253120lfr.9.2022.07.14.02.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:07:57 -0700 (PDT)
Message-ID: <b09f8007-ffbd-94cd-e5f7-bc30f40cee0b@linaro.org>
Date:   Thu, 14 Jul 2022 11:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/30] dt-bindings: phy: qcom,qmp: clean up
 descriptions
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-6-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 07/07/2022 15:47, Johan Hovold wrote:
> Clean up the remaining descriptions by using uppercase "PHY"
> consistently and dropping redundant information from the register
> descriptions.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
