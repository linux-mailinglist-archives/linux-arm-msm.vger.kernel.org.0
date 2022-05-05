Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD99151B839
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 08:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245037AbiEEGye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 02:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245544AbiEEGyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 02:54:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADFA17A98
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 23:50:39 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kq17so6898206ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 23:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J2j9EXhNS02qzUZ4UKY8kx4CRlU9zWWbcZ0qt22oRDQ=;
        b=o2ewtQwCad4qB8oEZ6CSRXAKP3RXy8osCcV8RtqCxRykFSeKI4939xfIVft7NG+WX4
         bgDllbsziJhSc2Up9zO20yXWT/dWJtghb0XDA79rVfqlIWmDOjzpR8hHtMmq5/I5nVUZ
         +bUZm95fcmLgAEiMONC557BWLNcFZRui0B7Zwqh4yGyWW8grgSxtXxlWiha7a9O68hsy
         J1DjrRQJl/MZJH2wYxLCrCz0MKRWBTtkuXQLS+6NaVrDNj4AT3ZtdphLdPjZiVLcGm69
         EWWTPKox93BFEGMmOKYBa5BjK5bE458hWGzVl48J8b4pMBO+5AVmWBsqyzY/gWvb0hXQ
         /ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J2j9EXhNS02qzUZ4UKY8kx4CRlU9zWWbcZ0qt22oRDQ=;
        b=iMC4eg+umc2/8wN2b+dIJqE08A2lcOeXgAt47W61syd1bBOR8v4cfIMyp+JahoGuxp
         E6PGES1h1GBwsj5Hzja56Ff4Da1/4eSaQyjlT7gy5eylZuVjXYM3y3LchLRyCmM07TH7
         s52xXwo43OEIqGIZ/j5FLHUyddnpm6/n+oRIoQ+MdKNuMn+KpCV60vPMOUvaID81WqLp
         WAzwBE7d0sP6tUweFS0hc9s4EjAvq6GfUn/kQ37ifq0WlxgjwFpzsCClEbDwwD8Q58mE
         ZKN0nj2Exd/5HmsUCSzw7Zrf28YIipHs00mbkJl5BYoI9iM5uZcOhbbaJ/xQOTIxr0ng
         BGFw==
X-Gm-Message-State: AOAM530rCSlJmpMW4MGf1hsA2S7hwnxwgOx0MBzO6zyyQkb6SGLUmtZ6
        y6NcZpsn1csfGU8mIWc+QJtlnw==
X-Google-Smtp-Source: ABdhPJxpmx592NBbH6ZMLepBK/ioYRGh0mxSUaPeeCkwN4NbZ1s0jljmd+KE7DfQyzyt9/jQL3gTQA==
X-Received: by 2002:a17:907:3f25:b0:6b0:5e9a:83 with SMTP id hq37-20020a1709073f2500b006b05e9a0083mr24966683ejc.659.1651733437862;
        Wed, 04 May 2022 23:50:37 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h6-20020a1709062dc600b006f3ef214df5sm393388eji.91.2022.05.04.23.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 23:50:37 -0700 (PDT)
Message-ID: <172f168f-4253-f63f-e0df-c64fd77a2580@linaro.org>
Date:   Thu, 5 May 2022 08:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] spi: dt-bindings: qcom,spi-geni-qcom: allow three
 interconnects
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504125119.190526-1-krzysztof.kozlowski@linaro.org>
 <YnKdnv69vueSURiU@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YnKdnv69vueSURiU@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 17:37, Rob Herring wrote:
> On Wed, May 04, 2022 at 02:51:19PM +0200, Krzysztof Kozlowski wrote:
>> Recent Qualcomm Geni SPI nodes, e.g. on SM8450, come with three
>> interconnects.  This fixes dtbs_check warnings like:
>>
>>   sm8450-qrd.dtb: geniqup@8c0000: spi@880000:interconnect-names: ['qup-core', 'qup-config'] is too short
> 
> I'm confused. A length of 2 was already allowed before this change.

Me too... I think I copied that message not from original code, but from
intermediary fix setting it to three elements. This was also wrong
because some of nodes have two some three interconnects.

The actual error is:

arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: spi@a98000: interconnects:
[[46, 1, 0, 46, 4, 0], [47, 2, 0, 48, 12, 0], [49, 1, 0, 50, 1, 0]] is
too long

	From schema: Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml

arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: spi@a98000: interconnect-names:
['qup-core', 'qup-config', 'qup-memory'] is too long

	From schema: Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml

I will send a v2.

Best regards,
Krzysztof
