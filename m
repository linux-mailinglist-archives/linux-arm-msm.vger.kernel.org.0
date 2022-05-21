Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197F852F6F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 02:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbiEUAit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 20:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbiEUAiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 20:38:17 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5972C1ACF93
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 17:38:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a23so11239825ljd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 17:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sY05XeQBUKvBodoi2Ts7IOsg7MaiAgbTu0UYhoI+qo4=;
        b=T/9sGn/wMERZsyQp0Pl0Jb/zXOmsE5EmzGyGyG55iCNTHjCaiCXwliN18O+/bcXjBC
         sXWcaCOlho7ETeDTCTfmHJiSGgy46kaLQPfmwL709jgjTZPMfdOHsKswmmNYuMfHTSnj
         h229EtmtoCkdYskyABoeBko4q7UrJfIe5/3uGNzIDbcrAJt4ACqVHsHr8vWMllLNi53T
         DqYvY7wRy/EvQH+BFZSCJnYai/svTVvKOz9eNhqtdnafSZq3esL3kMEgG07vz+o5J/GV
         KVtKhdIL5uutwWhED78sHznkq1TKHxZcA2OLhLmUG+e3hRSyU1Qn+Rrv/4bO8wQwqMbq
         /XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sY05XeQBUKvBodoi2Ts7IOsg7MaiAgbTu0UYhoI+qo4=;
        b=Gv07pwde4bgzcHIIvCRFBrlBDlnW/N3MGFVZL2StY8WPSPTn3iH4Umoz9Rfw9/JlRK
         MTZEUBcqg/RJL29RyQk4VS/O7drjgS3mI5oulmUI31U9iPNIVRLJ/GvO5zJu43U6gveI
         x1FizVtl0/pOtlEEk7cwbTWXYx6Etijm+75ok3K4hZYwpzx5hFHKaxMyPRVMdxuOiKuU
         CHUhYAHjEZqYr7gW5nTKKIMCemtrWr9ZfHemfsjusxiHi1cpaZFMXWdd9yLXNcLTsVzo
         4HtY8aA1IcpFIMUPJLhStXzFujfT4fyqGcDYEixAkHv4wiNQq90SfzNaii6oPt2eMnlT
         krcw==
X-Gm-Message-State: AOAM530e4rCUedQAjHAZKvip6CuRCGswf5jnmJV3T6dB5T+JVwILw1rr
        yvBhP1nAWVgTgxlxHRmM1ZQCbtHXyPvLMA==
X-Google-Smtp-Source: ABdhPJxqggudcpc5cSsFYvW5UEYCuyajHF2zHMowwZvAlZJ2RkyOXgz2BE00aI7qAjSY+Bhf88dRLQ==
X-Received: by 2002:a2e:aa94:0:b0:253:b262:6026 with SMTP id bj20-20020a2eaa94000000b00253b2626026mr6779845ljb.343.1653093494690;
        Fri, 20 May 2022 17:38:14 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id p26-20020a2e9a9a000000b00250a7bce0fdsm487245lji.95.2022.05.20.17.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 17:38:13 -0700 (PDT)
Message-ID: <7893eb9d-a4ff-ae08-2996-f5a5adf6f53d@linaro.org>
Date:   Sat, 21 May 2022 03:38:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/5] clk: qcom: regmap: add PHY clock source
 implementation
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220513175339.2981959-1-dmitry.baryshkov@linaro.org>
 <20220513175339.2981959-3-dmitry.baryshkov@linaro.org>
 <20220518175808.EC29AC385A5@smtp.kernel.org>
 <fa94b8f3-a88d-5d9c-9d8a-7c0316f15cfa@linaro.org>
 <20220520224916.56AA5C385A9@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220520224916.56AA5C385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 01:49, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-19 04:16:19)
>> On 18/05/2022 20:58, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-05-13 10:53:36)
>>>> diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.c b/drivers/clk/qcom/clk-regmap-phy-mux.c
>>>> new file mode 100644
>>>> index 000000000000..d7a45f7fa1aa
>>>> --- /dev/null
>>>> +++ b/drivers/clk/qcom/clk-regmap-phy-mux.c
> [...]
>>>> +
>>>> +#include "clk-regmap-phy-mux.h"
>>>
>>> Same for clk-regmap.h, avoid include hell.
>>
>> I couldn't catch this comment. I think we need clk-regmap.h in
>> clk-regmap-phy-mux.h as clk_regmap is a part of defined structure.
>>
> 
> Don't rely on implicit includes. It makes changing header files error
> prone. Also, please trim replies.

Ack. Will change this in v8.


-- 
With best wishes
Dmitry
