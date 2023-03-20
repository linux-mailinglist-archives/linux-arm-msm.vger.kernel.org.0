Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00D06C1471
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 15:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjCTOLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 10:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjCTOLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 10:11:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6E926C01
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 07:11:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so364383eda.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679321500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqsTFDEIzMfX5ajkLD3ueLEMMOLfBd6eRtfjnaY98hM=;
        b=gqNU2RmiZ+f3uZu7C3LuXSwIJc6Yziv0gP0OHPbWhIg6hmv4dgDx4ICbS8dewLVfCv
         2DATj65OkfHKdQYDDijRz48sDx7Y/xjMO6o0UMMFI1pdlyRD4A6nguPr7KoSK7Qsr5ij
         nrR37+iDv+Tva4GpFCcjK/L8heAmOGzrAw5hsxEJfEq/oOsStmuI2RSjOR6bLhM2ZgQ/
         d9Bg5W/G8LNsot/xjrPeVZ99UI2gMzVUENxRVtG+SY0WylZVZDts5tEH5mkqLpTQiD2m
         lBsYfaHNTMvjwAlc388BddPF9vnZ1F4r4sVmOuGUejmdtABqd1kZqDXcPHNwNqt7dCgG
         pX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679321500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqsTFDEIzMfX5ajkLD3ueLEMMOLfBd6eRtfjnaY98hM=;
        b=2MGH/R/lNZQTuukYO3JYss3dhgp5MYxU5qwp5lJGJLz6PjzLPrOfuOnK0w+r2xW9j/
         SfSakYqqV3dYc/CqOib71VfeQtSqKt5x9GDR7wCry2nqf9hxitkdAiCuEI+Xg3q7jSuN
         6aARs1YimX2OPgGgNaOa7JMrbc7B6EQqUkcVofirHHVUEI2pbqDcibX3m/hWpxK3VeZV
         +hjwigP4UcObgYg4PB4ZGHkJVOL8eUdwgHsLtAurT4IfD7Cy0M96sNHiXExq+4XNO+v0
         oLMSiaqHLbaMGkHbYG9zyMxyCcOqY5qOOLfLttiPnsknCX+dCek1WS30yUCj9BJwnGTK
         S9mQ==
X-Gm-Message-State: AO0yUKUEwXNrXGmMsQDIZnADXI93feUbW/1vRGQWNZabyimPCvMoGbaW
        US7HnWC/MvNdi0FzKw8YNiLryw==
X-Google-Smtp-Source: AK7set/3U1qoyrWt6Maf9b5TKS7NEcQvufNUWBOClA2yZS76LdoX0gwFYrjpGdjWbZ7IVc9CfL49SQ==
X-Received: by 2002:aa7:d78f:0:b0:4fa:e1fd:5a30 with SMTP id s15-20020aa7d78f000000b004fae1fd5a30mr13617495edq.19.1679321500692;
        Mon, 20 Mar 2023 07:11:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm4944425edi.80.2023.03.20.07.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:11:40 -0700 (PDT)
Message-ID: <1a009919-a1c9-7a0c-9f93-bdcb8cf316bc@linaro.org>
Date:   Mon, 20 Mar 2023 15:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc8280xp-pmics: fix sdam 'reg'
 property
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230320135710.1989-1-johan+linaro@kernel.org>
 <20230320135710.1989-3-johan+linaro@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320135710.1989-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/03/2023 14:57, Johan Hovold wrote:
> The SPMI PMIC register region width is fixed and should not be encoded
> in the devicetree.

It also violates size-cells=0.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

