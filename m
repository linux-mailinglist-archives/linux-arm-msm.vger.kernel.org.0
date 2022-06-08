Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643A3542E81
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 12:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237697AbiFHK4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237009AbiFHK4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 06:56:42 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5079C532EE
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 03:56:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b8so9858382edj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=kIRlqaVdYZXIRIZd+hxgZZVzy6dDxLLFwKImFQpXotU=;
        b=hyU4X40Nz/Lx9qIGeam6AzSooNWmYpAIj+Q+gE+cj8MElb1+Q+hEADV08PBLOgtNrh
         zUR87XGmaeL3NUwDsLr1Sv9xRNo3J3TFTRhhDt8zpuR1D0HrAWt2uFsJ2A3hLaSTZz4p
         hJpZFYuVYZPVcRcefIGSGNcNBmRo4nLAMdeKaGLQ/vkVhlCM+Al2Q4mk/E4O4m3dADIA
         N0bi4lpG3zoPsmV3Lm+TsO1DUxHXTP9RUb57hH9AJDluqpTOTgwbKXXZ6iK8iq+OxE2w
         msKCLpNyAJUUtVk/Oa8mNbz+8X/gYkBND8mb2OTVgHmTkHLIXmgstV/2g1NySuanFSS4
         hBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=kIRlqaVdYZXIRIZd+hxgZZVzy6dDxLLFwKImFQpXotU=;
        b=KnUgyV/TUlTk0ukV4306xsxtGthm4GjQvyId01Y7w8R4RHibP3twZibl3DxdekL8dV
         B6Iu2ZO4iv/T2Rn7xicAz5Yu1lQ02gKvZdv6TjBw8nkIay92TmRtZqLH8i58FKYWW0O4
         iDN4ARcwcO1Qa/2uW5p093xiVgVSfmFyabyK1jGhEyYI3i4zlv8QlCpewxumjCO58gGJ
         la4hW30aJ5pN7BO4AZ/rkiDY/PSASKCC1RhkgW1V93MCQjhC9vhE5vciJx2i+nHSifor
         VsrGWwalx4GQP07r8sZ04U7+lZPd9I4HdIdWDsT/f6A+5U7yoApCdo9lu+6pB0+8AdAQ
         okrw==
X-Gm-Message-State: AOAM53051RAAsCfcjRV8wb635VESHDDBtlz3DktVV8khK72rpzDd5cIe
        uNrOqAs1WxXO0FF+6lPgKtX9NA==
X-Google-Smtp-Source: ABdhPJzy5br9NjWAf8PF225RB1/HmWvrycaeauU/GGCLCLTNLM2gmBgGG82ySrg9BgkPsZV1gsG0yQ==
X-Received: by 2002:a05:6402:388b:b0:42b:5f20:c616 with SMTP id fd11-20020a056402388b00b0042b5f20c616mr38538173edb.50.1654685798678;
        Wed, 08 Jun 2022 03:56:38 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i2-20020a056402054200b004315050d7dfsm6014158edx.81.2022.06.08.03.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:56:38 -0700 (PDT)
Message-ID: <1334adaa-83f4-8682-7033-1549cfd8af49@linaro.org>
Date:   Wed, 8 Jun 2022 12:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/12] dt-bindings: vendor-prefixes: add Shift GmbH
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 18:45, Krzysztof Kozlowski wrote:
> Add prefix for SHIFT GmbH, phone manufacturer
> (https://www.shiftphones.com/en/).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Bjorn,

A lot of new boards and patches might conflict with these series, so can
you pick it up early?

Best regards,
Krzysztof
