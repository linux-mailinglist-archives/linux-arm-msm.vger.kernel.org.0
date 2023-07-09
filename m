Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6388A74C6AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 19:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjGIR0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 13:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjGIR0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 13:26:19 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C52132
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 10:26:13 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso454555466b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688923572; x=1691515572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXpTDtobO1jcQOlCElabmlk+yOb/N9uQ/HPZgBs/fBM=;
        b=FHs6KvkWnz5FyFhstM1sijbNDqUpdUW2ApvsQs3Zev/vyhKxgkdyqkAbHKc9xdUwZK
         FZxv5fbuViXW+Ey73/KnxEbrfPk6vNB/x+fvURhG08EsIvmuqk88df7fnyul4UfSSOem
         TyD/A3ew+BvwRP/xEdVECHDisPXeQhShPB26kAmlPg9VkZi8KNRXzX6haFRY+uWrE7Qt
         U5yRJL4xMPk9/Ns+bUQrHBY+w9YleHF2b/VEwxeaZyD+HMhXK19foAhQu3oEgv/G9O6w
         4B4oLLi08VmZhWBQGrzbaK4bMEJjCHYTREfaTqeCXrPsJGjknIhY/3iKDuclDFkABfZk
         oANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688923572; x=1691515572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXpTDtobO1jcQOlCElabmlk+yOb/N9uQ/HPZgBs/fBM=;
        b=ghYGnOjwbkagF3crri/1FdlD6NUnvVUQQ7TnEGhaPaJ3SZiBBIWbPa/rIgH3l/zJq/
         kz4fMMDtsfKqZKB0qp2eyxODv0zD/xen7ZSVEDcOeRleRq20gTI4XZjAwcRjVJyqrepA
         osB4c9WyaXQF3ANOPf4dQKWMoEH2Sk1z1n1iZlt1Ow6f/TEE2aLOg9AjvpMmoNlSmsic
         vB1XPmqODbFRAhwzlXtzMkFBNltrgRgLLXRSTnK4m1ocmwSR0pgTOdqyAiCr1vA/1yyg
         5ps17e3hCfV5JfwmhRSKxr/7CLTbvkPDxYO6XIHG3rFDOrzSm78wmOxBW+uMAC0RvzNf
         gqug==
X-Gm-Message-State: ABy/qLYBX2Y02mL2oKl/5U5fF7in0M95hSt+1c6b+wFmKkVWsBuwxF+A
        z21p+pGwwp999zufnVon6IfWtQ==
X-Google-Smtp-Source: APBJJlGVnDNGQXPbRqNHpRLhkbPRPgmmscItBBjyYRhBfAgvlrPPBd/eS982PGP4RROVSjfueIKz+g==
X-Received: by 2002:a17:906:5b:b0:965:6b9e:7ded with SMTP id 27-20020a170906005b00b009656b9e7dedmr10342487ejg.42.1688923571685;
        Sun, 09 Jul 2023 10:26:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id pg17-20020a170907205100b0098951bb4dc3sm4969675ejb.184.2023.07.09.10.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 10:26:11 -0700 (PDT)
Message-ID: <59ea565c-93ad-e8e3-10db-ae3ba481ebe9@linaro.org>
Date:   Sun, 9 Jul 2023 19:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] ARM: dts: qcom: Update devicetree for QCOM ADC
 bindings path change
Content-Language: en-US
To:     Jishnu Prakash <quic_jprakash@quicinc.com>, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, Jonathan.Cameron@huawei.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org,
        quic_subbaram@quicinc.com, quic_collinsd@quicinc.com,
        quic_kamalw@quicinc.com, quic_jestar@quicinc.com,
        marijn.suijten@somainline.org, andriy.shevchenko@linux.intel.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <20230708072835.3035398-1-quic_jprakash@quicinc.com>
 <20230708072835.3035398-11-quic_jprakash@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230708072835.3035398-11-quic_jprakash@quicinc.com>
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

On 08/07/2023 09:28, Jishnu Prakash wrote:
> Update ADC dt-bindings file paths in QCOM devicetree files to
> match the dt-bindings change moving the files from 'iio' to
> 'iio/adc' folder.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> ---

Your order of patches is incorrect. DTS cannot be before bindings,
because this indicates you broke ABI. Please keep entire patchset
bisectable and split DTS to separate patchset (linking the driver and
bindings).

Best regards,
Krzysztof

