Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA38860461F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiJSM75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 08:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbiJSM6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 08:58:49 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BEF13D3D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 05:42:18 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o2so10538692qkk.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APY6XkBoiH+8MYx94R2gCE5tsyBBjocoJUqhpNcG1uo=;
        b=t0jva4wVew3s5XSwsmG9/vKT92stEy73Mz1sWf3wiZStx2UYRLlL+2Ue1tYnQID5Qm
         FB272FCC/NGWhCI7C4XfeKTRYdFEaVGCI7MtWoYoacYNprbMXX0MTZNpbzEAn2j2Nha0
         jCz+tqfS6oNV1e1ELhtj/YUlwJ03+DjRsJakr2AirJJHw93lXnKErJh0nQodWQwP0kB9
         gVH4UJsXrMmeAVaX89fRORuta/K3zrt+niaVSaDqY7KOl9wH9CJADKSNSU78yNRzsk9t
         sg9gG2NNMfC4oCxff1qbWIGj1imxFQf129rR5HfMwuhlb3wBihKWdrIGbDSa6d++OrvO
         c/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APY6XkBoiH+8MYx94R2gCE5tsyBBjocoJUqhpNcG1uo=;
        b=cSJhR2c47Ig43unu2KTSCvCvknI+nd42RJayBCu53mLKNIRrpCW6W9efgeCSMBwV7h
         orZpJ1pDjQBQfUArKkesOZZEquH2MGBhY3eHNNeZOhoXnEbrPacscKV2GD/ND2UlnGwL
         DeoXt/6jdJ6M/0DFUppVSqn0mXkNLwdmF8oIgE24+5oxEUs1rzo8VJMzCvk9pJ+uHf73
         vfHgczwB9JMy882U+dCFl9WDUy6t7wg2dtDnHR+3v8uMmrTPCv9ewc0EPNT/T9FBuxry
         bp9P24GYimd7J05WMmXA4MBHgQ+G42CfhfqICWNw5NKNJvTjG/GVFKPgw6Gloo+k2Nuc
         q4tA==
X-Gm-Message-State: ACrzQf0CLrkq/PZx7yZW6hxP5xe6/lNDiZG7udLj/x7tf+cj7Y473/NX
        UhuoUrLYN6lVCjfCh4hO2MX9ww==
X-Google-Smtp-Source: AMsMyM4mg+k/dzvcqomBH9qc5f5xm21maADpMizbJY1M4DfSbN0jD6paa3IvF7n7dlHO8kOeeH6YfA==
X-Received: by 2002:a05:620a:2809:b0:6bc:5e0d:d7b1 with SMTP id f9-20020a05620a280900b006bc5e0dd7b1mr5230359qkp.545.1666183277044;
        Wed, 19 Oct 2022 05:41:17 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y2-20020a05620a0e0200b006ee8874f5d8sm4708919qkm.28.2022.10.19.05.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 05:41:16 -0700 (PDT)
Message-ID: <1847fa0b-7b1b-13f2-6667-0b9003ae58ac@linaro.org>
Date:   Wed, 19 Oct 2022 08:41:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 10/15] dt-bindings: phy: qcom,qmp-pcie: add sc8280xp
 bindings
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019113552.22353-1-johan+linaro@kernel.org>
 <20221019113552.22353-11-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019113552.22353-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/10/2022 07:35, Johan Hovold wrote:
> Add bindings for the PCIe QMP PHYs found on SC8280XP.
> 
> The PCIe2 and PCIe3 controllers and PHYs on SC8280XP can be used in
> 4-lane mode or as separate controllers and PHYs in 2-lane mode (e.g. as
> PCIe2A and PCIe2B).
> 
> The configuration for a specific system can be read from a TCSR register.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

But please wait with applying this patch for Rob's bot:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221019113552.22353-11-johan+linaro@kernel.org/

Best regards,
Krzysztof

