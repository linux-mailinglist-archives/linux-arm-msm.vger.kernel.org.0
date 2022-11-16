Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A5B62B50C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 09:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238863AbiKPIXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 03:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbiKPIXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 03:23:20 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6A32C108
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 00:21:35 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x21so20821386ljg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 00:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOhON3c92uOQG/q5cu0aF5WgWtMVsl/yA7D31IBRUvA=;
        b=v3xeJRqsQ25HIf13rxAwKE+/6/K6rqVfZRhQyECOPVLQ7icsDHkVtYjpCaFYlBRba+
         NnfDliMvRv8EowYlm8UwXF9AIhq8ryISGJdbQenYBhP6zVJtE0p+U4akJ5FyAwrVvi7r
         55VMwNJQKFbqLHdk7qLf7DSYhxiny765h7f/AVAYyeLz7eQ4wT0uUBXajTaiLoQi/2IX
         bhUnvVgWKY9wzj4ijwOxGT+VGTI9msc9yehCwaf5tJArF+DEerMe+OtlIyXDwqItc81r
         OyU0W+2HuIm03oNHNP07ue7gC/NBDMUE/Tjj4xxMFKKsFBuNZlrTpwIia4lUGEVlYQdQ
         6q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOhON3c92uOQG/q5cu0aF5WgWtMVsl/yA7D31IBRUvA=;
        b=oWKbbnBTXCAmhHGjxw0JjgQ56aHmQyrfv07RW2GH8nxHVrpA+b834NtRZeWsbDkv3W
         raRlJ8aV6cYMNGocxynWSf3ATuWwLoLgMqfuKFgTLsFyO7NzE36SwyqmUQo/6shuUrmC
         TfJKs1tnML39ZHX02iMxk5PYEoo3jgmxlIx+LqKWD8sLmyXbJdmHGZzJ3im8jm07AYFu
         kEv32ZiVEnpYOnIH1S4yRAUPSOBHGgYYx6HLrPCkMrUD51V3zMl0h8GGFp6KxSTXBx5V
         ytev+WWdTdNgB7xnNOjsGB9px1gZ9QODLOCP3ACYaEwE02fBBkaCNsivE0m8/MLc/ilo
         OaHA==
X-Gm-Message-State: ANoB5pnciVCZoO8ecZFr/Hv0sTdSDNIRc9cfV2QJQwliGX9Nj7fyIEVt
        pV0bt8b7UIb/79QGqBcblC05wQ==
X-Google-Smtp-Source: AA0mqf7D9jtRcm31IK4h9nEOJcLgzidioIPjn0kKfE18WRLFBDH5aYRGy0EDuLZaRrezjI86pj58Ig==
X-Received: by 2002:a2e:94cb:0:b0:277:3df:90d0 with SMTP id r11-20020a2e94cb000000b0027703df90d0mr7184219ljh.234.1668586893685;
        Wed, 16 Nov 2022 00:21:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e5-20020ac25465000000b00492dbf809e8sm2485379lfn.118.2022.11.16.00.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:21:33 -0800 (PST)
Message-ID: <a7dac56d-0fb0-b45f-a722-4cac8d1f777e@linaro.org>
Date:   Wed, 16 Nov 2022 09:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: mmc: sdhci-msm: Document SM8350 SDHCI
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221115172828.14372-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115172828.14372-1-konrad.dybcio@linaro.org>
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

On 15/11/2022 18:28, Konrad Dybcio wrote:
> Document the SDHCI on SM8350.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

