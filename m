Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE016893CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 10:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjBCJcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 04:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbjBCJcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 04:32:01 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064F668128
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 01:31:51 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id m14so4038070wrg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 01:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLZKs+NjL0TFo7ln+lij4JTo5422p4aB6l2ScqAewVw=;
        b=rlfWsuI5q8Z982O+FU17OhKBoAPVnw58ompS1VCcVJNzCXMDTpJS7GPHpgkimHJd96
         l99Si1tWBJGSZyvvcaTlXLRiYac6CUbpbCBzfN+42UiiyMDVuW7y2ycQQ2prQEIulVRy
         MGLA2xL3zT+eEcd3pL4/Bak+ZgJJPjdnM2mhfY4YXdd8s+Szph/H0XIahnD9NWVO1unY
         jgqGwx1wFE0LgoPtykIB3wPNu9ytEnOlxhgasy/h+83WMjK7QcbyQFXCfDYiCYEjpbro
         dGPKqR/v+S7tvzvOqYglYMIuQUm5/jkukactAb8SBs7sCEYnLElfvditQ1HYnlkz28yV
         X8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLZKs+NjL0TFo7ln+lij4JTo5422p4aB6l2ScqAewVw=;
        b=1dRYjxikJ+RzTrKFrCd5Hom9u4hcJGuY6CyDfB2M7C2UmZv9U7Ql9fElS2bTPupEf2
         EAjC5b9/73cyk/3qHbUkCxYfOLwLo7zFPLvy89ItBYNWUXvaF8oElnH9E0JP9TBQy5dq
         sd9LCrA7tUrWQdnhZyJYKYB1IRvwCyBa+uF5tBx2l8z4gzPQ/1DGqw3L5KptHPoBVVP7
         N3wgJGkJ7tDAu/ZZcDNZQ26HPkrQdnBgP6x3sQMz4ro41TMa/yjfCE+U5Jyry11JPEbf
         1gMBaY1+2P3MqyH8G8Z7+7J+KWTc7ga/JHngn/P7n5faPwHHGkc73JoZhTxwVzfL3QnJ
         eLBQ==
X-Gm-Message-State: AO0yUKVchiM6wa/3gCLZ4mEvVWo+RpDwYG+DXGkKWh40KltPkTj6IwDT
        kymQU1zfwrzhU6SbooASy2voLA==
X-Google-Smtp-Source: AK7set8FSDnMiu36YywbP3RsL+o7sMLNDyyGYFopZvqFmUAIBWH8OBwVKKB8vw+reKj+yUNDf716IQ==
X-Received: by 2002:a5d:6c6d:0:b0:2bf:d6f9:23d6 with SMTP id r13-20020a5d6c6d000000b002bfd6f923d6mr9551863wrz.45.1675416709374;
        Fri, 03 Feb 2023 01:31:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d2-20020a056000186200b002bddd75a83fsm1669419wri.8.2023.02.03.01.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:31:49 -0800 (PST)
Message-ID: <eee0f8ee-2abb-9de6-b032-b3cf412bf558@linaro.org>
Date:   Fri, 3 Feb 2023 10:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 18/22] arm64: defconfig: enable Qualcomm SDAM nvmem
 driver
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202155448.6715-1-johan+linaro@kernel.org>
 <20230202155448.6715-19-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202155448.6715-19-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 16:54, Johan Hovold wrote:
> The SDAM nvmem driver can be used to access the Shared Direct Access
> Memory Module registers in some Qualcomm PMICs.
> 
> These registers can specifically be used to store a time offset on
> platforms where the PMIC RTC time registers are read-only in order to
> allow the RTC time to be updated.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

