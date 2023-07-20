Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11AC375AA79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 11:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjGTJTi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 05:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjGTJTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 05:19:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE3B5FC8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:59:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fdd7d09576so834930e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689843512; x=1692435512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLBhqc2CfVFX3pSGzYlz5mlevC+IfeuDoZjqLxaF6sM=;
        b=KNPLyQrJvIh/sWOTJAoMrs0avfHA91e15xSbiQ9HAlrYFOKBgAGQUDwawAPO+eR6br
         ZJ+oj9KKVVmgyDxAPmDbAQmnA48nDLXee1crnv2P88XTABHTx7W4w0R7Lb8A3d4xWlz+
         g7Tv81ZyBZsHBq8baC/ErcjsP8DRz6XoUDsDhUaw4FZRvu6JaaF/5TWBTxkCLO0TexL8
         dHxBrj85JN2XL54ulkW1knRuIazOWxdHygW4QUpm0kbVEbV0UzL+jrOiDYLFbvSehe5B
         cqVECx/hwSI7GsnrU6ymtEri2HnU5JpsMwAAf5mGjqwU0Lnnb08p/RhCNmSkMm8ecfG0
         gsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843512; x=1692435512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLBhqc2CfVFX3pSGzYlz5mlevC+IfeuDoZjqLxaF6sM=;
        b=MYzLQJ5QKdnkVenXeynQi9LvDeiVyEAKELBi6yxDZ6njrIHmlgb1t1claXhXMjoDwG
         S3nV0/6X1xVYW3RWFAFc4ghI5t6HC1N+akMYxjozAalLndw9bH441wDcuIH1iaGFdft+
         t4Rxtx/HyAnJMiuJE1BckDqezLTWBwH8ZmbIt86M3YQ5vhFziI9Mq1+FS0atSse5WAXM
         JKRZtvxXYKkisvJv38XUWwDC8R+hEhG7XmfjB3DFGfjnNoFFTjANs/QUBhfj914k0eS/
         qIpUk1wKxIgru+jhadodaWbGVKJ+R9hn4BI/tPHgAM+C84v40mn3HxzEg94PisXRLoGn
         eIRA==
X-Gm-Message-State: ABy/qLabAtb4TlOQgDpwuXtV1PvCcertK3S96HONyMWytBGwi/Da/aEM
        qiLVg0E3mQ/zax9DxOxeG+zWng==
X-Google-Smtp-Source: APBJJlFyqabXcBinhEE6qmbAkQmoFxuTmiSDb/e+O0iJKWJOq7quud5femdWEEDE1R6DbBh2mNZlTQ==
X-Received: by 2002:a05:6512:20c3:b0:4fb:92df:a27c with SMTP id u3-20020a05651220c300b004fb92dfa27cmr1553589lfr.25.1689843512334;
        Thu, 20 Jul 2023 01:58:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003fc16ee2864sm633408wmi.48.2023.07.20.01.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:58:31 -0700 (PDT)
Message-ID: <5fdfe7b2-0afb-f7a1-c29a-4a7884ff8f1c@linaro.org>
Date:   Thu, 20 Jul 2023 10:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Add initial support for RDP404 of IPQ5018 family
Content-Language: en-US
To:     Hariharan K <quic_harihk@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com
References: <20230720074302.13585-1-quic_harihk@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720074302.13585-1-quic_harihk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2023 09:43, Hariharan K wrote:
> Add the initial device tree support for the Reference Design
> Platform(RDP) 404 based on IPQ5018 family of SoC. This patch
> carries the support for Console UART and eMMC.
> 
> This series is based on the below series,
> https://lore.kernel.org/lkml/20230720072938.315
> 46-1-quic_harihk@quicinc.com/

Nope. You make it very difficult for us to review and follow your
submissions. Especially considering issues in the old ipq5018 submission.

Best regards,
Krzysztof

