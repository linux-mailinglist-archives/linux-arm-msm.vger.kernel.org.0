Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2FE7321A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 23:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjFOV02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 17:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjFOV0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 17:26:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6B52D73
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 14:26:17 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-982b1a18daeso138518166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686864376; x=1689456376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDc//YuFtaRzUGzoigOUfnlePn6bsnGkSi4GnqCGPOI=;
        b=Q+ndHP4r4HVJ3u8v3TCAG+frLji7WtcnSfr01vaPVut7K4QRzIGrbGmnTOXQIuDrHD
         s1gP6fhHNfMTFYb7Lc3Je8+9Lyfwq47ffhicQjABo2ukXCd7mvGowbv+eqt/leaduiTV
         JvpOlRtVhhQdl2Vh/YhrtVsLuDzFW4CJqoCADl9shRVm6hQuDLgIjTGBGHPYi4bIxdjz
         Chgs+zjH6d/Rog4rQwcEze+grM+3KtqPI4V3ubIeVdDqJdo3cSLL/Q7NGri6kTQGi58W
         5w74gv8z/oVjAJHIzXFXwq7uUV48vzmwCQzSU2x6Yrb4ZHOdEkyY865bxmEWhJdxhls/
         htKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686864376; x=1689456376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDc//YuFtaRzUGzoigOUfnlePn6bsnGkSi4GnqCGPOI=;
        b=B9Lh25JSIhnBWvV+ZRvcoOGBlDHv0rzIF9Z0TQj6E8SisM7ON31AiB4i1g1N2VlmxV
         pcxNGm5vC16rGZPWNsrVPrqw8PiUtK97ANjAoCyyDQsX0tF1eD2VZ/LdjvUiyp8/PNu5
         nDy5+Y/mil4Vvd6bVlYl30re2isbYAOHVJnkaElshyo9U4TdurMIwJA+gH1nApz+Px9n
         qBOiuLgoLj3LNHVHeIZytQAVPzhq5j7H8xnHFW1nqq0G9Cldp4IvZeqHWvJE61jVsj/y
         LttjZ0A1t06BWUwUzoSFpGeAocdcns8YM6IlF5fAqMUhgD0Ikc6MGf3MGgXgU7cGRxiO
         JoYg==
X-Gm-Message-State: AC+VfDy8uyoLza0KttYoEo62aGSvi5A5NmoN5R8/hHxgnSuYcdGHzDbJ
        yLFx5wNu1fkx7kRKq1M7UZV8dTALf3lWUosPXg0=
X-Google-Smtp-Source: ACHHUZ7wayRGqgUZ8/2y8R0hUAIBjq0zVpTBo4zliveDHPzeqzsSY8uHKSZ1PQ4en2Koy8S8lgiS9A==
X-Received: by 2002:a17:906:6a06:b0:94e:e97b:c65 with SMTP id qw6-20020a1709066a0600b0094ee97b0c65mr202766ejc.60.1686864375885;
        Thu, 15 Jun 2023 14:26:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906044a00b009845c187bdcsm244451eja.137.2023.06.15.14.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 14:26:15 -0700 (PDT)
Message-ID: <3364339a-908d-7ab6-7d62-a05ab8e67739@linaro.org>
Date:   Thu, 15 Jun 2023 23:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Don't ignore return values of
 regmap functions
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230615-topic-bwmonretval-v1-1-223bd048ebf7@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615-topic-bwmonretval-v1-1-223bd048ebf7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2023 23:12, Konrad Dybcio wrote:
> As it turns out, not all regmap accesses succeed. Not knowing this is
> particularly suboptimal when there's a breaking change to the regmap
> APIs. Monitor the return values of regmap_ calls and propagate errors,
> should any occur.
> 
> To keep any level of readability in bwmon_enable(), add some comments
> to separate the logical blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Nice coincidence, I just had some talks with a friend about uselessness
(IMHO) of regmap MMIO return status checks.

Sorry, for me most of this makes the code difficult to read for no gain.
Errors are not real. This is some artificial problem. Solving it makes
code less maintainable.

If we used here readl/writel, you would not add any checks, right? Then
don't add for regmap mmio.

Best regards,
Krzysztof

