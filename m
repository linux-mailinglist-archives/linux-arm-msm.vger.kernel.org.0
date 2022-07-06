Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD5F5680D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiGFIMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiGFIMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:12:08 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C00318381
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:12:07 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r9so17447276ljp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=pJErkHQntPITF4VPDoqolMq7VSxF5SErheXcHqjyS1I=;
        b=qCvjLQSwMf35t9FxPA7VLddoudrLowOunpFrkWbDqxVOI/lOZyUbOvLyXUKtTag70t
         yYUwMiVBUvnQdD7QjFpCPtT+jcn98xSH/4Utw7FZEcVHGWIrKz2xuGvOcN3sIR0Asfgq
         ldPCY2DQB045OKYEbcoLX7cimj2gVYSYFjn3NxY/yntIn6Agc2rKXak9PlbieELR+u0P
         lbbd6UeegZnDECJgm/UY/CCNR6nEbPElWYXUfzXytSZFausPA+wKvQTbyIO9xp4Enz3W
         exk0R8NPRCaJ9LBhIcchByfeSvuXVvTam7Z7IZijb7U3OZvrw/f7/JUIIdXEpKL+nHkJ
         L7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pJErkHQntPITF4VPDoqolMq7VSxF5SErheXcHqjyS1I=;
        b=ndezHvIxETclOhOrTs9UzkTqHKbkpK+oW53xvP9VgaTJ26WlWc8MsffOq6J8EAm+Ps
         Hfxr6D6cb2mBs0J97XXbAfXhTcywaR1RqufKpx89jDl1pjFnh8LeP4HQC33A5kUUcQu/
         BZfAPDEHOCNwBCBxLbk6p5v3ZT5/J1yp/a5gzf2x6vE9J4bny5oqeBkSCYUy0v3V6TTl
         fpc4n1lhLE6AQmthlV0Rv3CBF6cT7qCAI+9iL+EMjUkq8GPu9zhhb2XQ7Aq/5vyIVrhY
         GyaqsuW/joiJUq2dk+JI5AgrFZnA5Xqo0lBqHBTv78qfWrqF8oLbLjsOWGnVn9xc3bDc
         hLBA==
X-Gm-Message-State: AJIora+nZIK6BKtDyAo9eRTGKJEX09ENamhl/Z431qgdYIDZoZ7kcgpz
        M5pdm92O/pot+shKlEYPqGj95w==
X-Google-Smtp-Source: AGRyM1t/MJbViYZF+bdv4ae99LILKJMm9FUACYyx1M/1D70WCnFOy8rnM7TAkq7tVb+CVMCQtk1uKQ==
X-Received: by 2002:a2e:502:0:b0:25d:390f:2c27 with SMTP id 2-20020a2e0502000000b0025d390f2c27mr3259211ljf.261.1657095125834;
        Wed, 06 Jul 2022 01:12:05 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a6-20020a2eb546000000b0025a9dccbae5sm6072067ljn.112.2022.07.06.01.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:12:04 -0700 (PDT)
Message-ID: <e25b43b4-6d06-d24f-5758-d3f1b0c492ee@linaro.org>
Date:   Wed, 6 Jul 2022 10:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 08/12] dt-bindings: pinctrl: qcom,pmic-gpio: add
 PMP8074
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        lee.jones@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, jic23@kernel.org,
        lars@metafoo.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org
References: <20220704212402.1715182-1-robimarko@gmail.com>
 <20220704212402.1715182-8-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704212402.1715182-8-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2022 23:23, Robert Marko wrote:
> Document the compatible for PMP8074 which has 12 GPIO-s with holes at
> GPIO1 and GPIO12.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
