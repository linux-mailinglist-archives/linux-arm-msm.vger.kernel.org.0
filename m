Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033FF50CCB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 19:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236663AbiDWRrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 13:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236657AbiDWRrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 13:47:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6921C82E6
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:44:16 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id f17so13963924edt.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4fquSciTRZOlg7b0ispu5BbxKa3Jubv+kFz0d5oG+RA=;
        b=XeqM1sSDRBXJVVH/y59yu5LlAqVCgdD5OMyeN1kMzPSpTZcMR5eiWrFjLQ1tBC+Frz
         RG5I1D78vKYlSU1+vx5UC+aMi5PyRHSNo+4QK7zgFY4nuG7AfuGPDlBXJPS2Y62mnLo1
         zDsvSeIY8lL7hquqbqIwl8zck1GO9iEC01KIF2toX5hsc2xqrqtx0x0bVjKNrVYWENJV
         AJZvLiB03clErs9QDOvUL0McN4Vidpe5AM7izLl+FVUZF1m+ii67SH8MGCSnyd0O9uE8
         4EdRGkpt/ZBZxfEej8M4cSUwxcv+XuBu3nJ/tbLt/aEmpYaPEBPVOrLSCUnDMn+7yeMh
         YNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4fquSciTRZOlg7b0ispu5BbxKa3Jubv+kFz0d5oG+RA=;
        b=bDn7tfZgdGXeQfihUYYAzwWqYFB0cNeFJ+HG2fhMaNnHl2P5V7qwYmODH6ulcmamHt
         q9H6wHiVfq2pFsceeMTx11pw/O6jC1qrLWn1lWrPlupZWL6ZEMP6PKCg8ZDNCd0zn4wF
         yqNQgFkxVaeOD25ZJkklI9c4+Ous8HPFHKhZwXsyvHkSv1OVg0qh19GfRI0xX46qjOHJ
         KkByd42iZhTXwP7WNsh1/EN5dysIY/faaEuQ8Q7J/o9f0DuiaWbYKqCjjJV5S1w8sX8y
         dpcDJRdBkkC0H1UksUfFJy8+Jh08AkSOBfLy0Tw7DiCUFF58lIk9fGUbWTLhL4ejsq83
         wa3Q==
X-Gm-Message-State: AOAM533cg6Ha/K/VTk4+b/uooWJ338qtBP5//L4qbxts+sr7YhaBod8O
        kMmGq3GvwS/h45H0ax8kk/kTresBLchDDg==
X-Google-Smtp-Source: ABdhPJw9MSnrDdf/ChTisUZhN5ibreso33tvScS+inGk5HTszlnDE/ThJWmSa8zK3qNf9DSrGzxdKg==
X-Received: by 2002:a05:6402:4407:b0:423:9a59:16f3 with SMTP id y7-20020a056402440700b004239a5916f3mr10957770eda.74.1650735855115;
        Sat, 23 Apr 2022 10:44:15 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jt24-20020a170906ca1800b006ef606fe5f2sm1864294ejb.61.2022.04.23.10.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:44:14 -0700 (PDT)
Message-ID: <2e925dbd-0766-576d-7a94-80a8dcc8d9ab@linaro.org>
Date:   Sat, 23 Apr 2022 19:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 6/7] arm: dts: qcom-*: replace deprecated perst-gpio
 with perst-gpios
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220422211002.2012070-1-dmitry.baryshkov@linaro.org>
 <20220422211002.2012070-7-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422211002.2012070-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 23:10, Dmitry Baryshkov wrote:
> Replace deprecated perst-gpio properties with up-to-date perst-gpios
> in the arm32 Qualcomm Snapdragon device trees.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
