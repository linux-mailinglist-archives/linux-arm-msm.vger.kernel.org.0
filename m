Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3441E5F6EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 22:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbiJFUO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 16:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbiJFUO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 16:14:28 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F49C7070
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 13:14:26 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id f9so3460005ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YnO5PITRS5SnLid2smpNjEkJ3U0pp9+QtZmh6jQdXqc=;
        b=y1k3uOb9DhhdgrhwnCep/XOW5UcqnP01xobEOWnxehlkE2le6UyePPRGl67RlW1f6S
         myS/pXnsk+XVlapPD3843JuOw3PwBjlDY0ffWneioudUPHrVvd2/C7O3O4Swcb2VsZJ3
         HsCQLLo95zC3t+eaLNyomaT3V7XqwgiB2rCLb7Jojm8Foh/jPLZo9EEcGnsBKRQDIDG+
         sWZoLA9DnQhbTlIHXJA0G2hPZyfjYA7izcnN22qooRc/bGcBgJSFMzGAPjTxYLa2Owas
         FCBcN3UijQS3TVSpfM5i3OiKpQq6MsqhndRhtLmcOKCdVqcDC/3JUe8GL9n439wOd1bH
         YUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YnO5PITRS5SnLid2smpNjEkJ3U0pp9+QtZmh6jQdXqc=;
        b=TzXtfoNwO10m5hTHMiJuXll7SbTrnGwNG5uXwx6L+1zIQ9Anlb+XvsOCJ0XKSMdHTO
         o9h6qfpxErzXCYcODpLlHLuQmb8iOpoReNJlUbyucYTxsrvRkNTnj0ZscpD5+OIVOpNi
         NRT9Tl8ljopISo1TjpE5o3VfAiqk7I1iEshA9w7EUXawkWVeC1DWkzS/uiRzR+jmsDVh
         7gAYAK+7VL2LO5BOlTkA4iC6dpMM0zrKrDxDMYfDm+kzwzpuP5tYQhWxFo1JtGsrdtCR
         3zlkL/WkhzFQo1Y7NaZCQzzNKhg22ROIV26iQvhBregzuLShnxsDm8IsFsXa7PhC2EfC
         wwbA==
X-Gm-Message-State: ACrzQf35JD9V+6ePKEl1MOyGzmw2SAq3F1nc11kAScnAWgk6IyV9jmxM
        UT58mIewKJbFS5DFRaSEmZorpQ==
X-Google-Smtp-Source: AMsMyM5PqWEmLXFWjkM4Pa7rOAO6UktcqFhW6HbDja0bfDUofaov/KmBMqzx9N7wRfGSeHB5BivORg==
X-Received: by 2002:a2e:b74f:0:b0:26c:426c:60fc with SMTP id k15-20020a2eb74f000000b0026c426c60fcmr511975ljo.432.1665087264312;
        Thu, 06 Oct 2022 13:14:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i20-20020a2ea234000000b00261b4df9ec4sm6414ljm.138.2022.10.06.13.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 13:14:23 -0700 (PDT)
Message-ID: <aa84760f-bc2a-09d0-6a57-45eb2de7ada9@linaro.org>
Date:   Thu, 6 Oct 2022 22:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 4/4] dt-bindings: pinctrl: qcom,sdm630: convert to
 dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20221006104104.171368-1-krzysztof.kozlowski@linaro.org>
 <20221006104104.171368-4-krzysztof.kozlowski@linaro.org>
 <166505883313.1602848.6191967643505476092.robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166505883313.1602848.6191967643505476092.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/10/2022 14:27, Rob Herring wrote:
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/
> 
> 
> pinctrl@3100000: 'blsp1-uart1-default', 'blsp1-uart1-sleep', 'blsp1-uart2-default', 'blsp2-uart1-active', 'blsp2-uart1-sleep', 'cam-vdig-default', 'cci0_default', 'cci1_default', 'i2c1-default', 'i2c1-sleep', 'i2c2-default', 'i2c2-sleep', 'i2c3-default', 'i2c3-sleep', 'i2c4-default', 'i2c4-sleep', 'i2c5-default', 'i2c5-sleep', 'i2c6-default', 'i2c6-sleep', 'i2c7-default', 'i2c7-sleep', 'i2c8-default', 'i2c8-sleep', 'imx219-vana-default', 'imx300-vana-default', 'sdc1-off', 'sdc1-on', 'sdc2-off', 'sdc2-on', 'ts-int-active', 'ts-lcd-id-active' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb

This is fixed by earlier DTS patches in the series. Maybe they did not
apply cleanly.

Best regards,
Krzysztof

