Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE195F6153
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 09:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiJFHDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 03:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiJFHDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 03:03:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8597D8C45A
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 00:03:28 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 25so1338045lft.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+uNNkKCc1cA6lGPoCWdLeqxWyZqnae8fKZ+HC/9/58o=;
        b=KuPuh6uzXJX4Fb6Qqz2U6S5jjcm4ihCJWMqj9PHZcRzfQp/w8xQ0BJAx+TAwsLTGyN
         knBe1uYpvcr8bev2nllDF8AcmCucVjrXWZY4g7i6X4CroYlT2476fsRK2hbKm1GmpoJI
         NyC1UnjQ/evFNS4+LKSiNdWvNh1JO6naGmTm3TTGdJ0S0dXkd7xn/SPHk/mmhnPljqre
         L5VG9xjhznVsD7oHYBtvCSPxMSfEGAd1bBcQp9CPla5VYAvnSwvC8CJeEp5BDU5CbPv+
         o3FebFMEOw0S/peLr4w+11f5fKNGFHQ4qdZuivUQ37Ui9sZZxImraTZ2QTX2gHdDEOvl
         3AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+uNNkKCc1cA6lGPoCWdLeqxWyZqnae8fKZ+HC/9/58o=;
        b=e2IPU4zwn4TqR6yEymICmq0IK4o8O0Dk7TSQ2sdq77Hq0uk6TVJSnMgjjmXW7M+xXR
         +UIX9vx5GCfPdAfUa2su8Cyvq+RI+PQGNgV0jdwI6DOIxQ94rv5+CXmJapdz32hBXuoD
         WQfFq32J8KHdW1cv4xt+bqfolMd39elvCcoF/hMvBOkh5oC6SfMpYt+IrqOGVNg28T/q
         +BP4pgvmnj7z6jy9ubBGoHu1HoX8jKlUES6JvHh03YSLsSEHwoAnicLrJC5IQuF67Wpd
         6ctvF0HLPR1O+33Gzn3wUpGIdfbdiSZO/jyFfdlxUR+FNXrJptDfPQMrnXISZn6auabm
         gE6Q==
X-Gm-Message-State: ACrzQf238otGrTvkGma3oG6G/Y7swXkOxKNfPGqFUVZL6bqWpSSqZ9s6
        dxIOkNCL8sNYX+W4bCzAYpL/Wg==
X-Google-Smtp-Source: AMsMyM5o/YOGP9nvJjrUfFpncClzKnj1ZsPZ/c/mmCMgtjVjq00XyQcD6SPIx6//fVTrqHZb16mIFQ==
X-Received: by 2002:ac2:5462:0:b0:49d:101:e1ce with SMTP id e2-20020ac25462000000b0049d0101e1cemr1163000lfn.289.1665039806866;
        Thu, 06 Oct 2022 00:03:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br16-20020a056512401000b00498fd423cc3sm2579796lfb.295.2022.10.06.00.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:03:26 -0700 (PDT)
Message-ID: <20e30206-3c82-b905-eae7-3638aa87ff29@linaro.org>
Date:   Thu, 6 Oct 2022 09:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
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
References: <20221005181528.1038629-1-dsankouski@gmail.com>
 <20221005181528.1038629-2-dsankouski@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005181528.1038629-2-dsankouski@gmail.com>
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

On 05/10/2022 20:15, Dzmitry Sankouski wrote:
> Add xiaomi,sagit board (Xiaomi Mi 6) binding.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

