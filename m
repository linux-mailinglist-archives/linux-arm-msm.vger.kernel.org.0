Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FB46F91CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 14:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbjEFMDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 08:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjEFMDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 08:03:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D153111563
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 05:03:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac80ed7f26so29868431fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683374586; x=1685966586;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqckTjKTfIM8bi9e0TYeW5j9DGnhHcptl3P/WnkXQ8g=;
        b=qP9WeiDqZYvqeBXaJ6sF23csHfH+xrYe3gSr1KeIid24zxAMGELBpts49yQ/DKvnAe
         tbeLxayrnT3Y4W7wk/NaMqocaRA4GtgGXwLU/1VGbMDeqVRWJOQUdkQKL/tnA50BGGm9
         RibfpyPV53YIL0zGC24y1kqjIFyrCOKWi6DBN3sIof6NOGhS9cOY9fU9dh4y2W9Mvywt
         NLCPlKw5BrXsF8mSGdAa5ZRRIXdy/+HlrBSyezyiAF6rmXtA5s7c4jJ1vnqWUSP0g83O
         p+ovKVdY2GIHvv89zj3IMI7hhk3SI/rljv1WZc6wZzqsTXA7LZO4V9ey7SoM/szcvUh4
         6XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683374586; x=1685966586;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqckTjKTfIM8bi9e0TYeW5j9DGnhHcptl3P/WnkXQ8g=;
        b=Lm7w7HDbZGZdY5oPli9YL5VsGyNDSJUhIjam/L9YdCkCnXziTWZ6pYTXoERqkeM+yH
         JeTYsYLXe3wr0KxWDYOdcMpxbASXaingrE9G34e2gR7wEyWrPpBOpmyMOOLSjGWjmgHU
         Ccl0bb//B0oQjXeHJaiWAjPi+hrQRBoOi17k+zqrLgsYkuNNsIdtUAfqKKl97bRu5yNF
         gZ10UnuJKRwmJhRgcG6U2q0WCgTozJzJeMLAFqQ0kFMy+66X64y3oKUvnADOk8ZD3qaG
         YU36KVVejGD3LNMujOJZEuWIDek0Stkt5eO0Gp8ws2dsK2OW3ZOMyM1anduYHTe+SSX0
         V8KQ==
X-Gm-Message-State: AC+VfDy3Ir5TOyexwDaoe/dAQD2FdVndNGqsgPKUF/NibxWVqkr4JCMP
        xX6BU7r/qPx3F4QHkrqeP4tn6Q==
X-Google-Smtp-Source: ACHHUZ5vuD9oicd6ZZ/GS97yQDfSo/yzWgXR5BzTzQNv4q9B9n9iZWDYdKmTPiPZGKSJZAMJWoseeA==
X-Received: by 2002:a2e:6e02:0:b0:2a7:f1e8:b08 with SMTP id j2-20020a2e6e02000000b002a7f1e80b08mr1229274ljc.19.1683374585927;
        Sat, 06 May 2023 05:03:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e8558000000b002a7746800d0sm359066ljj.130.2023.05.06.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:03:05 -0700 (PDT)
Message-ID: <b204875e-3122-6af1-d9a4-6f57e96e5016@linaro.org>
Date:   Sat, 6 May 2023 15:03:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/8] PCI: qcom: Disable write access to read only
 registers for IP v2.9.0
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
 <20230506073139.8789-3-manivannan.sadhasivam@linaro.org>
 <56da1bb2-86ea-e31e-15f3-5eb50e3000e1@linaro.org>
In-Reply-To: <56da1bb2-86ea-e31e-15f3-5eb50e3000e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2023 14:44, Dmitry Baryshkov wrote:
> On 06/05/2023 10:31, Manivannan Sadhasivam wrote:
>> In the post init sequence of v2.9.0, write access to read only registers
>> are not disabled after updating the registers. Fix it by disabling the
>> access after register update.
>>
>> Fixes: 0cf7c2efe8ac ("PCI: qcom: Add IPQ60xx support")
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
> 

Of course:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

