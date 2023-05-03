Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39EB46F5C02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 18:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjECQ3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 12:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjECQ3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 12:29:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F54955AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 09:29:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so8457728a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683131368; x=1685723368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8xJEgnpSELadKDejwAQZg002RUrUiVZtdDq/3PLDPs=;
        b=MC65Zb6WL1liGPUHeGdaqfzKoClU/ksE0QbCOraXf1AjsnkVSqwU5jJz7+sPUQqtB8
         ZWm53OniqWQzUwo+cpkiijDc5nVKXx4k8O2AQAVm95PW60Xtg40IK0tUlXuIRK4gRb49
         BnErnelAqTPElxD4C7ShBAbySwDzyuRQ3ZE/R8NYPEv0nxWg3j40ZvGNantzc5XNKeuE
         e1W2OkvH+SzU178u4S+7LfPnlPxB252FftSLZdn5D5KndDDctujkP5Qv0ClprSpSCcAC
         qW+NCb308NbSEqM7GdGeJY3zSrkS3y6A6w+KXSaypx4/JhBybbKeeS/oKu4C1dIAmwmo
         I9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131368; x=1685723368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8xJEgnpSELadKDejwAQZg002RUrUiVZtdDq/3PLDPs=;
        b=VP0jmaEcJxo0P49hSeIE0qrAPf5i+IhVU7/HvbntOxeeGIhew1TzEwpo0GgqlAIdz/
         FpeizCJ+mp/yvchI3rPnQECCe78Y4Eo+yr0u/fm/MkCU7Akoz4pDazYoR+awzGsG5jK+
         +UiCFGO5nY0I3lqoAvhqzmhhDGlwBpZUiSUfXL/QaG8IpVf5SPMMwPqizxz2XK2v7JO6
         OJVl4XHYgQZcvmaD82dxBUvoqNKPVIAt5RrM8EVMpRWl9lqsP4m+EYDV2R8/OgeKpcKr
         PTd9aeOPFG0HPFYx0I416Oc+6SsICtHL9/yks2LqslHRa/W4eXzJCIGI0jQrSGU2a0Zp
         w12Q==
X-Gm-Message-State: AC+VfDxVvJAn5CnzKVoTB1ygzkwq7itHReuOLuvxf4UWgeNCEaCvcqpU
        epmeBRzjf3NlzSwpMO8+dd7WUrKgkICw/AbnfqUbAcSX
X-Google-Smtp-Source: ACHHUZ5jTRV181bnSVuq7YnJbKj/P9VUmQmAgm8VE0jBmXt39oSfXXEXMIEppmvLOgbHZnRYj7UVng==
X-Received: by 2002:a17:907:7f91:b0:94e:ffab:4ce3 with SMTP id qk17-20020a1709077f9100b0094effab4ce3mr2678624ejc.32.1683131367926;
        Wed, 03 May 2023 09:29:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:db42:e3d0:c55a:8cf1? ([2a02:810d:15c0:828:db42:e3d0:c55a:8cf1])
        by smtp.gmail.com with ESMTPSA id l3-20020a170906230300b0094e7d196aa4sm17363847eja.160.2023.05.03.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 09:29:27 -0700 (PDT)
Message-ID: <8afbc289-3f54-d015-b2dd-c8adf629fab9@linaro.org>
Date:   Wed, 3 May 2023 18:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] arm64: defconfig: enable FSA4480 driver as module
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230503-topic-sm8450-graphics-dp-next-v1-0-d1ee9397f2a6@linaro.org>
 <20230503-topic-sm8450-graphics-dp-next-v1-5-d1ee9397f2a6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503-topic-sm8450-graphics-dp-next-v1-5-d1ee9397f2a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 15:10, Neil Armstrong wrote:
> Enable the FSA4480 driver as module for HDK8350 and HDK8450

"for Qualcomm HDK8350 and HDK8450"

> platforms to permit USB-C Altmode support.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

