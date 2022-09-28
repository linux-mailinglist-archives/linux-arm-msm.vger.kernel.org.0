Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C122A5ED6CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbiI1HvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbiI1Hun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:50:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABCA6F264
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:48:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id g20so13418772ljg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Z78cD0GwMhUSOjKvO7ElDuS04z1SL1nqOoVJg/TlI8A=;
        b=clpz2Nsqz6YWyp6kksw1uVnqseDWEMJec4oTdT5WniyM+sv7SAylyQZmooxGyIG6es
         GqUyADLL0JhsSPJSelBzSWB5L4WDXfWEm5/WZid+0Y31cHAdCKElX8LQRYAy0mFJj+Fk
         X9mcmZqctAqagA2kttpniYKr4FZIO3q29R+WIrpPqpMnQfoJZJZz6hsF0GZ4JKYTpS7I
         SyKOs0xxBV1K7OcTEwT0uOQ7tU9U6f3+QVj/NixoeIX9OEQZIYelqsIgOav0vKkfscyK
         2uB306S+eQXbUuSlYDqHscbmudp92M0wk5p/RmP5PB/5p3hUimQLZEDZONpyQ3qHSAlR
         gr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Z78cD0GwMhUSOjKvO7ElDuS04z1SL1nqOoVJg/TlI8A=;
        b=58dG8eYqZN1wbG5hsgJE/uhbCxAeVGLxwkpvHYI8X48wm9jCjFFMW3dlO7tOiGGSav
         ueMSmKDBpsWyHkecL6WahqAgiiS29TcGkYFVA0u3TmeYp7W5qDZPUWPFt9RXS7PDHXMo
         e/JKBl5TsOVpSkLqO18kHK4jP+dng+XrbmyOZ6caXUCTi3N+bAHQWWIoakE8BQuHjXCt
         FTm3xTsaccvUxFDtuKuBj+YqRACMcR2ZucYjuKtW2DNxFzVfP95xw0zeXDTBuRIxlYZj
         IGN6wyM1h3cqojUrHtqsV9JbwK3dL2NWGz50V+LqS6hP44r95/hqIlkdC7BwHkm7KfVA
         qBiA==
X-Gm-Message-State: ACrzQf0h7oukInhBYUd27Rllk7OpfyY5CIv0Jpv7HUjR5ss/9TcCC9ET
        4hFLEaQhWqAU3ViK/YBZrPxHbw==
X-Google-Smtp-Source: AMsMyM79aYnSdZ/ecGN4BcCcqtJPqAhhzxVW5hcq0w4X7J5OO9y7pduze4mL1/rZNvSyYYmDISRLlg==
X-Received: by 2002:a2e:a7c7:0:b0:26c:4fa4:47f6 with SMTP id x7-20020a2ea7c7000000b0026c4fa447f6mr11148572ljp.171.1664351334971;
        Wed, 28 Sep 2022 00:48:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e8e74000000b0026548b59479sm357861ljk.64.2022.09.28.00.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:48:54 -0700 (PDT)
Message-ID: <de9b0361-c4b9-23cc-c240-acb1bb28c2d0@linaro.org>
Date:   Wed, 28 Sep 2022 09:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add gpi-dma fallback compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20220927014846.32892-1-mailingradian@gmail.com>
 <20220927014846.32892-4-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927014846.32892-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 03:48, Richard Acayan wrote:
> The dt schema for gpi-dma has been updated with a new fallback
> compatible string. Add the compatible strings to existing device trees.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

