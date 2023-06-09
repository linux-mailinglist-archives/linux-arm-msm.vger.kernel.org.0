Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79D1729A35
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 14:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238438AbjFIMoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 08:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjFIMoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 08:44:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782242720
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 05:44:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so18603941fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686314645; x=1688906645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSxaUXxA3v6MfdCS97GJnnnNUnfVhHSbVUVcWDve3k8=;
        b=vy2vU1HTzFwFufF7h/CIoAsybtmqfBgDGxdQ9Mpwws5NBsO+6dMmuBGTvouGE8rpKC
         ISzjhZ7eS7qXEaypOi1SO4/oKIWG175WT4oVZoXloUPnRXY57aUh0CnGzUnKvmr/CYhA
         xzztK6uDYtYKS71FFI2Q326ZNxFBdyOMh+gvlGeJYACI1k4PWe0LdscAYlXAQt+fm0+d
         wmjHwjw3S+nWZ6eOaU+LlkfmIiPBLqhXmz/ZG3YQZd+e4IAWjp9ZBOJI/Oieki4PrUBA
         pYH7DbW0Ep07l+oJ1nSuAuNKfk/5KsP4hFATSwHBo3/CTE4ER1YQtIXQe1FddBvF1mmn
         p2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686314645; x=1688906645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSxaUXxA3v6MfdCS97GJnnnNUnfVhHSbVUVcWDve3k8=;
        b=GZwQgegev6KqK5rBqK9bgFCteIypFn6R0YkEnjNJ/LzkqzO4oQZ3ye7E+wXQZDZOee
         B6WiGFFP+lMGIpJf3gXrB6TJEjp5fwLT2OZFCi2MGAXGQmJGzintaiVdTlXECkNAfARr
         Rh8S11eQVwrEnhcknYG70xZYcnaLiOJJ4sGeZhQz9lPIBsm+i6p0Op9JrV2RzCz/k88Q
         JSG3/3PnvdmZ+4SX43N/AxTbA8ZXuBYLTt6QnyLsbPiKINNfwc7lOOWOlsLHPAmWXgbP
         XtvfwJXlLwPkk7k3r1nc+8jHhUvDs/H2bonzuE3jrAgkHJZ4YuE61BIvsx4vijHn2nau
         x9Gw==
X-Gm-Message-State: AC+VfDwiXAy87DcQgfDvxGYhVJ+juWsM+Ab09I/QqMep91BHTvCMOqGV
        w6DrpRFlT+34xlyG5uXOYo8M2Q==
X-Google-Smtp-Source: ACHHUZ5r9nHEVEUyM8k1U2LrMpaQODEgErzJkwTgFw4Q8Gxu08FLt2WMKm0+f5gvel+hQdGiS9wz7g==
X-Received: by 2002:a2e:7217:0:b0:2b1:b095:c5cd with SMTP id n23-20020a2e7217000000b002b1b095c5cdmr1017784ljc.0.1686314644659;
        Fri, 09 Jun 2023 05:44:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d21-20020a2eb055000000b002aeee2a093csm381661ljl.59.2023.06.09.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:44:04 -0700 (PDT)
Message-ID: <6d99ffb5-a72a-168f-858f-8fa01f7593f3@linaro.org>
Date:   Fri, 9 Jun 2023 14:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V3 3/5] clk: qcom: camcc-sm8550: Add camera clock
 controller driver for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-4-quic_jkona@quicinc.com>
 <95bd4c66-08c6-15f3-db6c-97f820fe5517@linaro.org>
 <cf60ea04-057b-7856-3a30-775051cefa26@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cf60ea04-057b-7856-3a30-775051cefa26@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.06.2023 13:49, Jagadeesh Kona wrote:
> Hi Dmitry,
> 
> Thanks for your review!
> 
> On 6/1/2023 8:21 PM, Dmitry Baryshkov wrote:
>> On 01/06/2023 17:34, Jagadeesh Kona wrote:
>>> Add support for the camera clock controller for camera clients to be
>>> able to request for camcc clocks on SM8550 platform.
>>>
>>> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>> Changes since V2:
>>>   - No changes
>>> Changes since V1:
>>>   - Sorted the PLL names in proper order
>>>   - Updated all PLL configurations to lower case hex
>>>   - Reused evo ops instead of adding new ops for ole pll
>>>   - Moved few clocks to separate patch to fix patch too long error
>>>
>>>   drivers/clk/qcom/Kconfig        |    7 +
>>>   drivers/clk/qcom/Makefile       |    1 +
>>>   drivers/clk/qcom/camcc-sm8550.c | 3405 +++++++++++++++++++++++++++++++
>>>   3 files changed, 3413 insertions(+)
>>>   create mode 100644 drivers/clk/qcom/camcc-sm8550.c
>>>
>>
>> [skipped]
>>
>>> +
>>> +static struct platform_driver cam_cc_sm8550_driver = {
>>> +    .probe = cam_cc_sm8550_probe,
>>> +    .driver = {
>>> +        .name = "cam_cc-sm8550",
>>> +        .of_match_table = cam_cc_sm8550_match_table,
>>> +    },
>>> +};
>>> +
>>> +static int __init cam_cc_sm8550_init(void)
>>> +{
>>> +    return platform_driver_register(&cam_cc_sm8550_driver);
>>> +}
>>> +subsys_initcall(cam_cc_sm8550_init);
>>> +
>>> +static void __exit cam_cc_sm8550_exit(void)
>>> +{
>>> +    platform_driver_unregister(&cam_cc_sm8550_driver);
>>> +}
>>> +module_exit(cam_cc_sm8550_exit);
>>
>> Please convert this to use module_platform_driver
>>
> 
> We still have to evaluate if module_platform_driver() works for us in all scenarios. We will post a cleanup patch once we conclude on module_platform_driver().
With the arm64 defconfig, CCI and CAMSS are compiled in as modules. Since
they are not boot-critical components, this will likely not change.

Konrad
> 
>>> +
>>> +MODULE_DESCRIPTION("QTI CAMCC SM8550 Driver");
>>> +MODULE_LICENSE("GPL");
>>
> 
> Thanks & Regards,
> Jagadeesh
