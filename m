Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C9062D5F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239738AbiKQJJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239729AbiKQJJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:09:49 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6786DCEC
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:09:48 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j4so1860884lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLB7LJXnnfAW92AEsrUtvLDVqopJCLCs4/6lAI87UUg=;
        b=y2oMxqLdH9dvX+z0E2zWB/mu5bfmTV0cg1QWyqDHocbbE14iSn25avNuxhlOfXO7L4
         XQQvBdpx7q+cbVGdeZF9jGJVAPw4yGQ20v9EED9snb/i3kqLYMSTKsFwD8nJPMqGUUQN
         tJ10wdZ4syvUEEt86Q6075CL8xmhBgDEKdEGURwttlQctpzS/ddNQs0ZSBm7DFFfAkQJ
         TlC8p34qU0rI2YQ+h+cs/5P/VMRGjAW6I8Kr5Lal3XYulNfBPCO+ugzpJrnANJVjXr5D
         eEgsQt0ZcwUCD7oenY8rsd1Bx6q8AzuKnTs1q3j/uZIFF2/liPYq/p4eOoC1gEAX/sM1
         MWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLB7LJXnnfAW92AEsrUtvLDVqopJCLCs4/6lAI87UUg=;
        b=Vigu8zX6k5oTnFdh/zIUc5a4yv2DSrEJHzN5hjOw4fL/z1o9H5CUQLfJbjfKRPk3us
         12LdHr5uJ3eP/+6DviQtq4IV8la4jhIvkqkDitv7bo0ZbfS9C5N8xQGuPye66GFcYiaP
         nSY/Q4HrSD8SKi8PU0TUjzbNI5+eoiaqHlH7PimdvpTG3IGooCl6A5ON16zeUEwsYBWb
         1oumI3XJ1lDHpasNZS7oo8LN2YJ/7J5JQTWZjhhHv6BHSJnTvhYuj7YQuuVlu4NdmT8N
         c5gihK8CNPrOl4F/VxnD62SvkiUHZgBaiYVzniP5ye0GkzJxeW86xTq9EFBLCtpT0Ekb
         XlNw==
X-Gm-Message-State: ANoB5pmS3HfYB4XfeY3wRJxUN+BkIHBQbJRSMSIBQUpckJUA6/kI0sh6
        HTkiFj9qV36X5OGyZEk/9reXRg==
X-Google-Smtp-Source: AA0mqf6r5Zldh8oskQVxhWZjjFU41fp1Ye1oscq3Ewk7VOK7s/YkxZIlYws+JSH8J/R7E9xLTDj8qQ==
X-Received: by 2002:a05:6512:3b0d:b0:4b4:7cb4:f932 with SMTP id f13-20020a0565123b0d00b004b47cb4f932mr553349lfv.243.1668676187910;
        Thu, 17 Nov 2022 01:09:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 13-20020a2e164d000000b00277078d4504sm92653ljw.13.2022.11.17.01.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:09:47 -0800 (PST)
Message-ID: <ad350d24-4954-ecf7-4d1f-3a2f784c212f@linaro.org>
Date:   Thu, 17 Nov 2022 10:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-7-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116104716.2583320-7-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:47, Abel Vesa wrote:
> The SM8550 has a new fixed divider as child clock of CXO
> called CXO_PAD, so add IDs for it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

