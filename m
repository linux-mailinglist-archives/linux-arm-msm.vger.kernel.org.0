Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE255F623E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 10:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiJFIFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 04:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiJFIFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 04:05:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0933C37FBD
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 01:05:18 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a12so1308861ljr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=aQgLDXbifM0rqp5u4DrjFvn4pd5ZSxqJ7lQA2KzRsRM=;
        b=nl346wPBz2+HsobbRx3iQ6LR29S6myMXMumDS5sYHXz9p43T+o9hd5fQu+RaAgYz0i
         1aBUgoNG5LAXoJxu8SX3e1qJAO/F0SOLDRSKaJaZIVCGkmzGTnXXWOOWshx47n9N/wrl
         QtJOCmq4XYN3DuKZhtamBUTztnozPdrshNvSGbXIGnckVO0Z8mct52GLxUqXoxmua84E
         5ZpqwnJ5XwnQD64InAYCSnYB06bN1UCqOn0VJacJRPatbYBWugEqOMa+Av11wocj+OsX
         h/KmS28HXbXOIipksROVro2kjIDNv8cspihYiLg/y2ge+LMo1M2PNhB6JOpcciV2RQGZ
         DdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aQgLDXbifM0rqp5u4DrjFvn4pd5ZSxqJ7lQA2KzRsRM=;
        b=7zZdt876/8rgiEMQ39nK0zX4Yz19Z+pK2oOPTv7++rHcZOC4RLAgeUXa1btf8NLvSl
         kVeAqGHm4jFK2kSCwcoXa2j+XduEKwecyu4IrgtGz6P7a9xO3720t0dpJ2JbpKua7mwo
         +mBKJxS9zbPeXn+4OdddTAEqN0QBCHY4F6VDNO7dAEHPJgJakgEagQFPGCMaHrB4ts9K
         kDM+MbjfEtCE66DraCGBlIjPt3AQ2i2n5lfdd/L4QwaBpmL0ujT+tadmAn3veLdPdiR6
         Xsf0diynzAXoLlbiefzU1X8kKE+Nn+ig0IUuKMi3dizjYQGUESvrAhws3mlBbMp0kucR
         YbeA==
X-Gm-Message-State: ACrzQf0BKWpvOPO0gttW8pj62BajHjZfQ4PVDqhmBtC1HQ5k5Eeep7c+
        M3hTK77f9rBgVMfS9x4i4bIPqw==
X-Google-Smtp-Source: AMsMyM66BFjYxr3ivdx8GpkEc0toNMv635YO4cwYw2Vl8QNCfDoonAVvuantTB0QAWaMkiNDHKmZtw==
X-Received: by 2002:a2e:b046:0:b0:26e:2a8:df8 with SMTP id d6-20020a2eb046000000b0026e02a80df8mr661441ljl.241.1665043516344;
        Thu, 06 Oct 2022 01:05:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y13-20020a19750d000000b00497a1f92a72sm2614650lfe.221.2022.10.06.01.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:05:15 -0700 (PDT)
Message-ID: <ba4a2a81-b3fd-d000-48f4-ec2270e2810d@linaro.org>
Date:   Thu, 6 Oct 2022 10:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221006075125.1056605-1-dsankouski@gmail.com>
 <20221006075125.1056605-2-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006075125.1056605-2-dsankouski@gmail.com>
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

On 06/10/2022 09:51, Dzmitry Sankouski wrote:
> Add xiaomi,sagit board (Xiaomi Mi 6) binding.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

