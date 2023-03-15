Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4DE6BA7E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjCOGhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjCOGhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:37:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC216287F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:37:45 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eg48so12141180edb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKMG7FwuKgyTJAuzcwu7HDQH/CIx57xUKCcGbz2xOdw=;
        b=hdxFIg50ww4nv754rn5qIjOD2cedOSnWvCHx9TTWFMV6u12BRCLWJGRzsEhSTOHgFF
         ELsFS4IKM1GjO77FLGGGd73tTNOSsTSNdFroKf/aRidDNoo15zKYAeIdskEho0PjZChH
         Ae2A8iggOU8tmppcxaNJaFkcd5rlmXywjSB045pMC78wugfsByKBDs7wSuGv/sR9TOpL
         xh7RmEENiHloaTuZ05HjEBqlMCslmVO60V0IuTRYWrawSx7A9fA6YPs79Q/uagMICNhq
         T0d4fiMll0++bxwnR/kB5bQIe4zY+WuPT4hiU0WkFEH60wjIZyKPMF4SDoYYcTM7zVJ6
         fUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKMG7FwuKgyTJAuzcwu7HDQH/CIx57xUKCcGbz2xOdw=;
        b=Myu/sQJJyi98luqvUWpm8G+yxW8KxFvSzSOS/8RCh9u+gZeji+q9tsYq/tzVE7ZYHM
         65iH3fv824zhv4pKVP1Ggz9PHQnGQur3KEB04Kzy3VNPapTlhPE+AthWCJ4WNYcWckqs
         YpdLLniDfLNK+fIJv1cokDUH/HReugXWhzXrKZrB94pp4nvUmfiLe0Iw2ZyHNCFEE/+R
         gPTZrnd+TBmPPXXtqG0NN2O2GukeerZYXTTeN2NEdtWj954amnxLeeWx3GEAhFHsOc/R
         ItX75yisSqZoHAf/GJZ7TL4BmkvZ+aXZQgTMgf4dYp7mTYlEOvkp0EeznyR6ybjk9yr2
         TURg==
X-Gm-Message-State: AO0yUKX+F6rIvkl6FdF2dVdqOt/VXWNGPuweo/SLNOaiUtzchA/E/0iX
        WPfzc6Ql+SVGVYmcRB/JNQO+4LnYCJqDuuMMZDI=
X-Google-Smtp-Source: AK7set8KI0O5q7GF2CNKSlrPSkrAarLgCzNEEO605PPxWQk2vRMLvm3EqpyKjJ97vGFQ2Y840JcBqA==
X-Received: by 2002:aa7:c449:0:b0:4c0:9bd7:54cc with SMTP id n9-20020aa7c449000000b004c09bd754ccmr1595797edr.11.1678862263856;
        Tue, 14 Mar 2023 23:37:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id k10-20020a170906680a00b008d044ede804sm2014644ejr.163.2023.03.14.23.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:37:43 -0700 (PDT)
Message-ID: <3104977d-b93f-3c55-70d0-cb54cb48da81@linaro.org>
Date:   Wed, 15 Mar 2023 07:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document the Qualcomm
 qrb4210-rb2 board
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org
References: <20230314210828.2049720-1-bhupesh.sharma@linaro.org>
 <20230314210828.2049720-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314210828.2049720-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 22:08, Bhupesh Sharma wrote:
> Document the Qualcomm qrb4210-rb2 board based on SM4250 SoC.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +

Subject: fix double space before "Qualcomm"

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

