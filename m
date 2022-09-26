Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10105EAC70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 18:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiIZQ0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 12:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235212AbiIZQ0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 12:26:18 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BFF7820D
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:15:14 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j24so7822598lja.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=41+H0s9mzbnLGR9+fi4ly83ksh169zOL2Oo1hCvYfDs=;
        b=ltUC29WvsCbi2+VNDVRR+Kv0umh1uz7+SreOXBdbgvqOmjq1dF0VaxOLgnpLf4bmH2
         rOLzW/ft9gfY57CKE8eqdOdbrmmX/sGO/2DURsqKmo2Rg3idtRm8aHHTW7qO+/XUR8F9
         1otutBYAe6p7QQc72V/j0tvOPn9MDVqI4+wCfVElZqopBg5bqpZTABhl6w4odpCr2rQY
         vY1bDUE8FF0DniEpHr5Rl+BnR4yU5XFKPi3BAnDFtJwT4zTqeD0s2McpWMrvtI3wU68U
         ykvqceA7Vqqerc6DFYVQjhIrfqmUjb2c1xvoHoLpdg5Za4STp0xZEXc86Ajlsc2yumiD
         oTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=41+H0s9mzbnLGR9+fi4ly83ksh169zOL2Oo1hCvYfDs=;
        b=s81EhlyxICMmZSC1NMfvAWqxT5gnXdEAQGDowsaDMi+M2KIEt4Avljg0RrVsPpG+Fx
         Va+PSFHElo/ow90jpiag1qe2DhKzVDcy8crsA8ANtdmluuUvuXyewIz9ipJeziWMYIHw
         o3NUckpEptvYu5/FKJesXJUnVvcUC/GcGSf11mWP3cIL85otuZX9HVW+wuIO1MjpjJsW
         dg4/+GQct7NIDG+vA9wg/5prwxQzu7FprOh2jslNqjoJP/j+sK8TFpjqYfPds5QCW7ym
         p6NSDv1MZc3GTXI+YdM+qSneJqjFSX4WOgsKqS3S5aOJ4vOHDjnT1jElq+awrSa0VXy1
         eAxg==
X-Gm-Message-State: ACrzQf0PzIR1sPA2d8X56yk+4EewaJqMIeaj3YWc+xd18f/cELPfGxj5
        QpriHKIhJgYUUiBC8znlVDAzzg==
X-Google-Smtp-Source: AMsMyM7IoH7p1DDO3mGHyh/XKjZmYc+1u1qc3d1QomrqKWaWpVrSdkvyOjNikxvt5SYfzehGPE4YMw==
X-Received: by 2002:a2e:a7c7:0:b0:26c:4fa4:47f6 with SMTP id x7-20020a2ea7c7000000b0026c4fa447f6mr7792159ljp.171.1664205312783;
        Mon, 26 Sep 2022 08:15:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e9516000000b0026ad0e61b1fsm2403505ljh.88.2022.09.26.08.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:15:11 -0700 (PDT)
Message-ID: <3434c098-3a5c-c4d1-28ee-1636f394092e@linaro.org>
Date:   Mon, 26 Sep 2022 17:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg
 dependency
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
 <20220828132648.3624126-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220828132648.3624126-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2022 15:26, Bryan O'Donoghue wrote:
> The PWM node is not a separate device and is expected to be part of parent
> SPMI PMIC node, thus it obtains the address space from the parent. One IO
> address in "reg" is also not correct description because LPG block maps to
> several regions.
> 
> Fixes: 3f5117be9584 ("dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC")
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----

This still waits for merging... probably because maintainers were not
Cced. Bryan, please use scripts/get_maintainers.pl to Cc necessary
people. Otherwise your patch won't be applied.

Best regards,
Krzysztof

