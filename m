Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEE956444F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiGCD7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbiGCD6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:33 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165A4BF5C
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:39 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id t189so8919086oie.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VbM3m0wdaoXEDEWrc+MeHd1nc6KrRLPdYcLcN/HoqNA=;
        b=ZWJmqKNly/PS/9lYuwxJQC2LOS80/9okwJQphsEBcdnwWOvD++o3Ov7T5GuImbXheh
         qgFMhlmpW/ADhpxHuGH7XdAUz7Isf9baxswfXzeSweoFaXriWAHGPoeH8QWd57uz4CQ6
         6CKLn4vMrbafTxB2W4c9XX8JsZEOw017fEI+PUUB+BC8Ta1jzIQjrf1X8sXcg5Kww8l8
         ftfhwLdCSfNMck+3E+wmZWDY87kjc/y42r2cExlHl3jvTJgGPAPk+bWM2YWjEOs1GVY3
         yxB2/YAisHCvl++n8a8Hi706DYcr/gtPINk9HPwAK7476mg/P9wjjqVhmSgRKHf/SFc7
         2TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VbM3m0wdaoXEDEWrc+MeHd1nc6KrRLPdYcLcN/HoqNA=;
        b=OTvpCexmCQU6db4+6pTfTl8ZS4h1C7VJufBaK6MITUeibR8Nfb9HaI00vtauHm3Hr0
         iWU7pQRAJXV6wZI7ASXdBlzDZyMoGoFiGnxbZTCpkP8XMkn/t0q8N0E32wobO5l43Gwa
         el4GDQ6RXnvX9oGH+JIdV5N57sjBQzyKjGCj4S7WDmhy1d+jyHA+b9sN3S2HYfP8b8ka
         ClU4Zz6A5LIna4pVhTt+0XO07CelwOrTjbotLyFLufoqwwHHsZlMMC0//ZUrWuzn76/D
         7X6tab+Y7FLUoCNPigJ6eRXR0oHmOUX3+WRzGFVtg1keEuhr+ofWojMQgqnUhuxgvBSP
         8TAw==
X-Gm-Message-State: AJIora/ZKL2HYIpUq5cRp6w4h7Pc6alCXLhTCAZTjr06gPtpWPw83Kf7
        I5Ff/w2s5+f+KaFo2lgWwrq9Qg==
X-Google-Smtp-Source: AGRyM1t31R7c6ugSbVOmvIFW3uL+Pa9g1SphC7YtRDrqwQcvVZN8qZwwMhJYDzSzg7uWuR3q+vhINQ==
X-Received: by 2002:a05:6808:6d4:b0:32e:fdb9:9c7b with SMTP id m20-20020a05680806d400b0032efdb99c7bmr12809151oih.287.1656820658832;
        Sat, 02 Jul 2022 20:57:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org,
        "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Nikita Travkin <nikita@trvn.ru>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [RESEND PATCH] arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen pinctrl
Date:   Sat,  2 Jul 2022 22:56:32 -0500
Message-Id: <165682055971.445910.13695986393723902534.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220610175332.104154-1-linmengbo0689@protonmail.com>
References: <20220610175332.104154-1-linmengbo0689@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jun 2022 17:54:09 +0000, Lin, Meng-Bo wrote:
> A3, A5 and most of the Samsung phones with MSM8916 SoC use GPIO pin 13 for
> touchscreen interrupts. Add touchscreen pinctrl to a2015 common dtsi.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-a2015: Add touchscreen pinctrl
      commit: 7618a2de8121d5723c0fd68a381877c8f2e31826

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
