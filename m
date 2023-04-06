Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4405D6D9AF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 16:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239455AbjDFOpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 10:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239274AbjDFOpa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 10:45:30 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12955AF18
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 07:44:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id k18so2382235lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680792272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEzI51ciZrgIncfhw5bsm8CrnZlchCYmEqfodjJXk5A=;
        b=MHGsl5pAsYot9e+osKLnMyXGsWxprs2n2YzElSZZv1aoMVEJcw+5DmKy264jhyL0w9
         iGMyTkBGY/7zmg5i+l8jGz/O8k86LUS1iqtzTermHmOOaWocancJZj9Wk/ev1vbzosmD
         lUM4+Re/DHufKHQJXpxJOgrs38hLD8jwTDlp/4ND/0GjqsmraWIBJ/LSCF+QomJllpl2
         ZuJ2Du2FMBRCMqkawg21IaCYMTWFHfO83AlTtqnfmhlB25ickb5ziN/oHDXUZOJjJMVS
         pj7cPkun6F+3bKbsmLyfxP26IxYRU/D8sVaWDCplTUiHFtAcryZArkMlOql/0piopdqF
         ICwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680792272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEzI51ciZrgIncfhw5bsm8CrnZlchCYmEqfodjJXk5A=;
        b=7Q8w/gY0qKYsSfVFdYLRs4OKWda/gKygeNgcqrsnLsPzXeFVdTWmo1ldCn4XzoNKvP
         qkkFaq4dTQGmsdW8LmMc9kt+WFXBRTqQT/FUrpySCDqFivjN1Q4wfMlfnfStzS/0XEK9
         fHwJXZa2tmmwMchyeqgxHyJ9URw6S7aaf50femovcARQf/JkiO2cwQtqjCZ9c6s+X0jH
         Q5F3qJPZLye35Vnun821WSjk6UjPgGZMxZrQX1D5AMS4hyG8pQAdUUO4o9ukcJQfO+Ie
         RGKvIy38u7NT3nSLMoGNn2BcWWNRwqRYQG14NfK7CPQ4LuchTBTpjmguI6IsYQip3rXO
         zZ7Q==
X-Gm-Message-State: AAQBX9diXitw+SNhHvF8o4ZTZMgAmnIFMk7jcVkhsGyuENR4ojorAThv
        G+kZGirLX04s+ZUu/9oWXa5Ycw==
X-Google-Smtp-Source: AKy350bgBhHXkKVdgwxsnJCnlU8McRMzVeEfNKkTmL+OwJoS3L2ugnZcDbPKs2h/5yE6WPVb752TEA==
X-Received: by 2002:ac2:5dd1:0:b0:4eb:79:fa5 with SMTP id x17-20020ac25dd1000000b004eb00790fa5mr2839908lfq.25.1680792271873;
        Thu, 06 Apr 2023 07:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id d7-20020ac25447000000b004eb4357122bsm287925lfn.259.2023.04.06.07.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:44:31 -0700 (PDT)
Message-ID: <2a379401-fe87-9e30-5449-513dd23c52f5@linaro.org>
Date:   Thu, 6 Apr 2023 16:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 01/14] dt-bindings: clock: qcom,rpmcc: Add a way to
 enable unused clock cleanup
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-1-ae80a325fe94@linaro.org>
 <20230316225803.GA4036689-robh@kernel.org>
 <62533d5a-f39a-0806-b4d9-932e2af6beef@linaro.org>
 <5601e0edc19dc03d0fc516f9ffe4d1aa.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5601e0edc19dc03d0fc516f9ffe4d1aa.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.03.2023 19:20, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-03-16 17:31:34)
>>
>> On 16.03.2023 23:58, Rob Herring wrote:
>>> On Wed, Mar 08, 2023 at 10:35:17PM +0100, Konrad Dybcio wrote:
>>>>  
>>>> +  qcom,clk-disable-unused:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Indicates whether unused RPM clocks can be shut down with the common
>>>> +      unused clock cleanup. Requires a functional interconnect driver.
>>>
>>> I don't think this should be QCom specific. Come up with something 
>>> common (which will probably have some debate). 
>> Generally the opposite (ignoring unused clocks during the cleanup) is
>> the thing you need to opt into.
>>
>> I can however see how (especially with the focus on not breaking things
>> for older DTs) somebody else may also decide to only allow them to be
>> cleaned up conditionally (by marking the clocks that were enabled earlier
>> as enabled in Linux OR not addding clk.flags |= CLK_IGNORE_UNUSED) as we
>> do here.
>>
>> Stephen, Rob, would `clk-disable-unused` be a fitting generic property
>> name for that? Should we also think about `clk-ignore-unused` as a
>> clock-controller-specific alternative to the CCF-wide clk_ignore_unused
>> cmdline?
>>
> 
> There are multiple threads on the list about disabling unused clks.
> Moving the decision to disable unused clks to a DT property is yet
> another approach. I'd rather not do that, because it really isn't
> describing the hardware configuration. If anything, I'd expect the
> property to be describing which clks are enabled by the firmware and
> then leave the decision to disable them because they're unused up to the
> software.
After some more thinking, I realized that this could be made opt-in
simply with driver_data..

WDYT?

Konrad
