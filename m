Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6295F77DA49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 08:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242048AbjHPGL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 02:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242042AbjHPGK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 02:10:56 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACFD1BCC
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 23:10:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-313e742a787so3618894f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 23:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692166254; x=1692771054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLgYjBnr1a+GUC8i+zwPCXmJXdHbs5C8fS0fA8QCuyM=;
        b=WUMSi9LhYgjTaZKyBwLkW4Gh0gYEKU5tB67Mg8CsnBUU2vlfilZyjO7Lyh2eqeDNFK
         QMgnEPPPmXT6hCKBg8LDGHiOydSE8W2HdOZOc+KjKbTsLN2p/tKaSf+hnU+eFniS8rS6
         17y3m228FiSrX47uPULULKBX8yOcgCjlz1uNCdfNmeQVUat3fPRN8cdInxw8DZipdQMx
         4qfHcg2xPEUhSYSzm54pQUbUq5M/Dj1SkcJO2C91XDLKnlNH57OTIPhlxSj2PVklXVzA
         SBvrx3Iv6jl5mvVTUrCm1wG0a7cN63dsAytT/flUQSQNmCTe9IIODEgUCsI5xWE7La2a
         NPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692166254; x=1692771054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLgYjBnr1a+GUC8i+zwPCXmJXdHbs5C8fS0fA8QCuyM=;
        b=MUGDADAkcVFg1GTsY8FmG2UVDAYWhjTOoMoF8HRjjL2NXyylj97xmbEUxm4HDLk7AG
         QIk1nxCs3zJas1I4Ugj3z4dIjVdBCJwsIzZoZ0luE90BjsOnSe5qDxKNg6cbVHVb9cbt
         O/rBrSYJodi0cDwaK82rxSC0VwPav4HIB10woHrSzmL9UIZEEv/DoG4QapLrT2NtpnMR
         pR+yXuS+BzPZ87YZAppUVJJYins3b4Nx9vWM26oQ+1mglNBRwRpwqcUJqdVfXvpQz/c4
         waLyNfiazgpwR1mQePVTLnDa7oEjlaVucce6pDSCJssSBJkvoxS6j/xTEJtUbGBS1Csr
         0mDw==
X-Gm-Message-State: AOJu0Yy53cGJ/rM8aoA13BCeA+JmX1f9ehzoCf/qYsUQ6NLh0A4KFyKO
        61FYR0Vp7uQJ9++OYwLK7HttSQ==
X-Google-Smtp-Source: AGHT+IGJlquxNv63cLtSF0xE2AT2adYs1i+eTHqL1MiaERZvUNWrrTmO6AZGgsIwwvLWDDMWG4rw1A==
X-Received: by 2002:adf:cd82:0:b0:319:7abb:4112 with SMTP id q2-20020adfcd82000000b003197abb4112mr2945584wrj.21.1692166253828;
        Tue, 15 Aug 2023 23:10:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fa8dbb7b5dsm20090696wma.25.2023.08.15.23.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 23:10:53 -0700 (PDT)
Message-ID: <0bb12177-e8f0-1873-4ffb-9a0df0a9f24d@linaro.org>
Date:   Wed, 16 Aug 2023 08:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] dt-bindings: firmware: qcom,scm: document IPQ5018
 compatible
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     computersforpeace@gmail.com
References: <20230815140030.1068590-1-robimarko@gmail.com>
 <20230815140030.1068590-4-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815140030.1068590-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2023 15:59, Robert Marko wrote:
> It seems that IPQ5018 compatible was never documented in the bindings.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

