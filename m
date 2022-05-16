Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB13F527DE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240485AbiEPGxX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240469AbiEPGxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:53:22 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F7B18E10
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:53:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a23so8835126ljd.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iQVgADZLBM+Tk36v5DqK8z3h8gSiVKkXU+KLhBynY50=;
        b=Fzdn7ZrUVnjI5ix1Xz7ZS9MSvzDp2IVmHZmOuf8Qoxg+Me7w091JRcNTY1ez5PMdJN
         spLkgs3IrcQeDKDwLcIRio5b24ahnWCAEMAn7sdanmMQs3DX5sB87JymWfBY2WQMEJYF
         pOJ12nidG+j/ctVfXBS7iR8F0LA6Z5jcdb/ETqW//Rgb2Ol24l4fIXRN+CCHfdo9D1MV
         Nfb0ypKBH0tIIxpHiNi6p8movBZVs9c8LoYy9M0DohYi8F3ApobiduFbkGRD78CA2GBB
         pxs7JW9jXQZ8x1LyucIOvNUac3yfF4rAvx/zlnYye4K/GirDDTw83omfLqnlcbhlAdjs
         GKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iQVgADZLBM+Tk36v5DqK8z3h8gSiVKkXU+KLhBynY50=;
        b=aYPmL1+DvPdQGwXFmYcUc8lF9TCe3Uxhlg9cGofmcq5+gqMdm4bgVLDkxzNIAfbl+s
         HakOJmt6vwQp4EYL/h55RKetv5mg5S27iFXxPxBb5ks2rMs3WZN+B+O6s6oyFEbWgnnd
         1AdhOxfIqErJJX2y8Km93zgZe290C9kOQ/yah3b/ykQfAn60dQ/TmmVqukd52HPAbhLt
         oororMj9kQDTedFnCTWYRTG23PKzS0dh2FHOhufdSHs3SubQvhiBYkz2o1zw+FL5/0fq
         0X6Ly/CUMCum7MT3Bp9Ua1K/aQnookUpB/ljicuxn9P308CR0/oyyaaBjWGF/a6Tg/sV
         3JRA==
X-Gm-Message-State: AOAM533jX0itqLOnooZTR3FlZYJqjpIOXAPt41KdHzbnRNdF5rxUfGqj
        H1enTbWE4sYKDKxAKOSSz0GavwOL4scPWa9o
X-Google-Smtp-Source: ABdhPJygTudLr5l66SdYw3/EqfYLPutQCfyXT97Lr18S0gtaYEZy7Q7U8/8QfJq9gd/Khh3H+Tj6dA==
X-Received: by 2002:a2e:a7c8:0:b0:24f:700a:4df5 with SMTP id x8-20020a2ea7c8000000b0024f700a4df5mr10360083ljp.472.1652683999492;
        Sun, 15 May 2022 23:53:19 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x5-20020ac24885000000b0047255d21184sm1211671lfc.179.2022.05.15.23.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 23:53:19 -0700 (PDT)
Message-ID: <792697a1-7385-9bcc-e3ad-ddcef80e3b35@linaro.org>
Date:   Mon, 16 May 2022 08:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 12/12] dt-bindings: arm: qcom: document sda660 SoC and
 ifc6560 board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
 <20220514190138.3179964-13-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220514190138.3179964-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2022 21:01, Dmitry Baryshkov wrote:
> Add binding documentation for the Inforce IFC6560 board which uses
> Snapdragon SDA660.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
