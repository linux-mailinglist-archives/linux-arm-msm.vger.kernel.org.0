Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611D2561B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 15:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiF3NfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 09:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbiF3Ne7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 09:34:59 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E9A28720
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 06:34:54 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id b23so23121081ljh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Cs0qaK6bESbp2DFdkuLn3sAtIu+NiQn2SQSD9VgJFpI=;
        b=wx6eI1NSAdoeV0j8dNWEEiceAeuA8jMZOLSZ+CwRcN2U0KxSgnqdufycWwKZJ2S7dR
         Lq+VQPVPv0+hubv4MABp6tREvsCcovpEHpyj7wHsN46wENGYEJTPwTzT1xpu6cVwR75i
         2QLItxQwRVXHzcv482DASalbOYhZxPKVsTdmEhD5KVxi/m1l/9XHNdYEHPW+OzVPjXLI
         FAn84pmM/a0Sa9WtInGvRbRsx11n4qKdymbdJt+Qn3cuJ48NYrPZ9knozJT4ZZNMCC3x
         MD6Tihx6dM7axGRn9NLNP8zM2iEHiMCMDg45U5ELuM1tq/2XwQlmYQgMPUPyj4I9jcgg
         kCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Cs0qaK6bESbp2DFdkuLn3sAtIu+NiQn2SQSD9VgJFpI=;
        b=XiDOYZjiTaMwoHgbw4PTNKpz2Rn9aw/ET0myOWqW4y98HM+zhsSOGYk3MiADN4giCk
         9yDlfwhavJ9TNOKokJJq3NhUJ/CElwkwT7bfbg2wGBoT93XB6wymsz8mm5bCuO/qTSiy
         wUXFYuhTxfA4LI+EtyIHPMQvr3oCB6w7hIQm0MTZOQOiVQZKhODl2hrwv8WNWhkYd4eX
         euMzmnUqfOhUQFLT5LTSnJznBfMXcTed1Y5osvlLfqatBjphRrUj/PNNTCbTISYxvtJz
         Zju12ersAM9agb87l10+xOUhywVePBYDKQz7yd94tCZciSl6OtOgu4NVfvvJV/7RNvz4
         vB8A==
X-Gm-Message-State: AJIora8AwctRur6sAtTwjohXHw6mB1GP3CL0PSJ0JMK3M9b2IIt7MtIy
        x3ivWlYdWdZ5nD3gFTNotaCyhw==
X-Google-Smtp-Source: AGRyM1tb35ZQuDsFSQ4qqgwkA6YUl7UROEuTommfMO7KDPyAcEPquNXQrTpl+3AcOW8skHiYe6j0/w==
X-Received: by 2002:a05:651c:11d0:b0:25a:978e:4892 with SMTP id z16-20020a05651c11d000b0025a978e4892mr5411337ljo.517.1656596092401;
        Thu, 30 Jun 2022 06:34:52 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id z9-20020a0565120c0900b004793240041esm3101067lfu.277.2022.06.30.06.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 06:34:51 -0700 (PDT)
Message-ID: <6c6dddb7-a2d1-e93c-7448-6edb8ae3e665@linaro.org>
Date:   Thu, 30 Jun 2022 16:34:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL
 configuration interfaces
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081825.2554069-1-vladimir.zapolskiy@linaro.org>
 <Yr2TitZR3Yv8z/V1@matsya>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <Yr2TitZR3Yv8z/V1@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On 6/30/22 15:14, Vinod Koul wrote:
> On 30-06-22, 11:18, Vladimir Zapolskiy wrote:
>> Add controls for Lucid EVO PLL configuration and export control functions
>> to clock controller drivers.
> 
> This sound fine but maybe add why we are adding this (to be used in
> dispcc driver)... motivation helps :)
> 

sure, and please note, that it's used by camcc as well, basically it's a reason
why this change is found in the series :)

> Other than this nit, lgtm:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 

Thanks you for review!

--
Best wishes,
Vladimir
