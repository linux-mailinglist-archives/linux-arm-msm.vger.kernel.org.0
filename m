Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8889B5F3F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 11:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiJDJAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 05:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiJDJA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 05:00:27 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DA02AC57
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 02:00:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o17so1319837ljj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4c8vpo5F95Qig7EfKdEX8DG3F8TdYJTAwpAxMXpH+DM=;
        b=U6C2CgPsvqQPZn3Xfg5wiFx/x7MDtSUlxTx6w3Kruk6Er9pHex7PCNb58yAMeNn8oE
         9GoIfbfT/Tijf3TapOuEoLsutxVHj6GKM92qOv+cGuIyNI0vG8Udtm81Na2aLvhA+jVa
         qw774N+7L9u5QHBCy1O9sKeJZvLnn1A0jufF02dVUrJ0XrcvjWHbf/GIwLirXBDnli9G
         eoa+emHkqj6om1p1xSyXEZJjwOhnWISKpXQQfDsZrvGaoE1SR3sGituFWI96kiqvoYBd
         nbD0UKsFNCmgZ65lJZr2JvbyKx6jzsoDl+4m/l1ilGKsId2GhDcctw9lkcp9Su+aXFnY
         Evqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4c8vpo5F95Qig7EfKdEX8DG3F8TdYJTAwpAxMXpH+DM=;
        b=S5fG5ZQlliaDdq3giHCD71Rs6ZGhW2My1mzKE2+dWPIXp1a3t+7ABNZBNbbX4Q2vp5
         qOnDtBYp6e4Lg/EaxDbX+h2d63MAVb0lo0GethiOGx+dlFuVtwPIDAJDvcEcvhX7RGZl
         bT79lIsFEOdhz6PcLCgpRJSqhCVkj24oKwx5b1LNJAd8iv3OpIpSeKT5YtdWfgBcyaFW
         XQVErcsVuq15wdwxdRhTqBuRrV11wjOvCafJgLLHORZ3rJInaz1sDbm3X6Fb5kFAth/c
         E0pUZKQlrhmfwLA9G5JxRsc4ndW0wL5T7jVfeHgKa5ntGZ3DkeEDmvRPmuUXr5NAkKoX
         lzPg==
X-Gm-Message-State: ACrzQf3DGijebpvoOaTNWdf3r+hvrg/SqP3eOf3Kw9Amk7v1+N6s+c0x
        4saHpjy1d2QH4BCP63z5M2Ubtw==
X-Google-Smtp-Source: AMsMyM6ZhzByl2xI/OGuAJ0zHS8q5Dt5QKw8fi6yn56e/Yg1tKrKZ+iamP4MYnHYc41nhurThCY/bw==
X-Received: by 2002:a2e:b611:0:b0:26d:36a:696b with SMTP id r17-20020a2eb611000000b0026d036a696bmr7605431ljn.257.1664874022535;
        Tue, 04 Oct 2022 02:00:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf40-20020a056512282800b0049110ba325asm1825323lfb.158.2022.10.04.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:00:22 -0700 (PDT)
Message-ID: <91ffa6c5-9d79-30e7-dd52-b66dbc56da1b@linaro.org>
Date:   Tue, 4 Oct 2022 11:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 07/11] dt-bindings: rtc: qcom-pm8xxx: document
 qcom,pm8921-rtc as fallback of qcom,pm8018-rtc
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-7-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-7-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> The PM8018 RTC is used as compatible with PM8921 RTC on the MDM9615, document this situation.

Please wrap commit message according to Linux coding style / submission
process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 

With wrapping fixed:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

