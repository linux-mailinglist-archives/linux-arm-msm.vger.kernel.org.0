Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D2557F0CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbiGWRvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbiGWRvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:51:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FA61A3BA
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:51:10 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id by8so8704787ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=agdArHh5SbhgdioP4BB2MYv9Y8D0CysiIdnbqmL/H8E=;
        b=lvEbC0Qz93sEJC6tzaDt2LgpTP2E6IMOK/y8gb3ChVzPwYgt2UTMixA4zjRrN7C9vp
         b5o/9VJ6+Y3IjpiRSXhdZhomI/d1F58OJy7TwrI18onFODv00gvKolErqxqptTizOVnL
         aj+7f/2L2EMK3hkBaSVZv9NiYAlupsZel56FnGPTet+Eu+0fkvn//9zwCuLlmFHEDyp9
         Rr0w3Tg1xdz3UXLE1g5FO3IKD/8Aii/CDx5eSpbEttRqpbJ1qLl3+CZwI99CbEYSmJGQ
         cz+1qrnA3FO1u+J5C4TqiNawGR2AQ0Zdqig5CNt+QPw/esI9rsD1c+rmDJN9rSYhN++T
         AVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=agdArHh5SbhgdioP4BB2MYv9Y8D0CysiIdnbqmL/H8E=;
        b=knkcwcgSC2Br03a1OOZnAH6x4GS3Xa1rQ8SeMfhTrH+kEe/JapvJPilvGJUOMUjas8
         1zUoQk+2QiAbSC2zCmYxAl9YdPRdPPGH/Mjw0Th1wap+o9bfmB4nkKk1EUj3VhW+khsy
         B2vvloT27WpMZsCYQ/reAVvqDetKarACh3rMm4xnDATO8usd/2xbLQdKVOh8dsY1Typs
         WkxyAHkBeXptMnZDYpFeCM8MGh4p1WpslDGBTaP3f2i+5oOIJV0rCeyLLEK7LLG9tCNp
         QtQEZF08g/LCD/ALW+MNCtudrvgUUR7JWfaloAOQ85ajZRSqUvGtJFx0Uwrdwk92nuDH
         RNag==
X-Gm-Message-State: AJIora+WJjRY4XuMe7OVWiHH49FaRvfzfrP4kN/IcG3LBwTt8yb7BDWv
        84MbCX5UGNIj5z2/l3IL3bkuYw==
X-Google-Smtp-Source: AGRyM1trscYplJw4WIFHlqum6hUMZ5ybQaiUjn6zuIgyQDVa4iAHXywH8q4ArklUw451ooXtZsuV7w==
X-Received: by 2002:a2e:9a8d:0:b0:25d:f8b7:fc22 with SMTP id p13-20020a2e9a8d000000b0025df8b7fc22mr1032820lji.389.1658598668727;
        Sat, 23 Jul 2022 10:51:08 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512370f00b0048a39e8e4e9sm1780640lfr.80.2022.07.23.10.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:51:08 -0700 (PDT)
Message-ID: <19577ad1-cd45-6331-3f13-314e15bf0212@linaro.org>
Date:   Sat, 23 Jul 2022 19:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dt-bindings: arm: qcom: drop individual descriptions
 of Google devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <20220723090942.1637676-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723090942.1637676-4-dmitry.baryshkov@linaro.org>
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

On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> Follow the pattern and drop simple sc7180/sc7280 device declarations.
> The goal to leave in place only non-standard cases, rather than
> documenting every possible device.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As well no.


Best regards,
Krzysztof
