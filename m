Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8572868605D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 08:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbjBAHNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 02:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjBAHNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 02:13:06 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B36265BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 23:12:56 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q8so11910743wmo.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 23:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1ANA5jda8hFhcW4wnuhHBQ5QsoIx/N9i5+azSVQIkU=;
        b=M6OJJINqma4xgknx3I/nC4W9w151opMzVhdYx6xn7a3FJeWyXCJ2yazFr2n32Ukg3m
         XiZNLijbZOe+aM+QnPVgOxumcZMgbEz3yF6/ldMBw+K8g5NN8sBoZG6T661Kg7w/sw5S
         wDo/SQzg+mB3hStOoEU/G1AlKTOUUMQsv0IVcdPI+ShfFi51kPrRvBQ5j84dgMAWSkjR
         bOg6PVzjLAL9YjenFUXNNrVr7UCuF00jkttT0wKLPYrDhk0GM7UdCQGHNqe01axDp7r0
         c1gOx2bsvoH33tG4Szeo3C244Vqif9ZyOPNU3ijylK+HzPkQ7wX21AGgG2YCwjRcReY5
         PUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1ANA5jda8hFhcW4wnuhHBQ5QsoIx/N9i5+azSVQIkU=;
        b=lSwere86iyF8KypUuVOpYwBcyorqrtU8VdifsQo+eTKIPREHP/mPOj1xBXTp5l0gNC
         Iu/sQbDn8pObeip5E24Jkdjt5/tzAHI+YiB3Ev9vo+4s9tV5J58nYdx1DoThF4PAF1m1
         UKbEkuDPTDfmvrQeRv6vnIVWcHftj7k7e4L5XW892+Ie7ZGzxW64Z+dFxh1OXMgY+avi
         1dTlqvnafU4lSepYsy0n3cpWEtebgOIyHBiu7JLPtiaVJKbvn/NAf8JIYhME+HBOWj+Q
         xl4X4++nlS9bIvkUivIRZMlPa9RF+eYWsvQCJufvFGgovMLAj1WSDkwn3svtJ/3zAdX1
         Gaig==
X-Gm-Message-State: AO0yUKUy1lTxvYw0RcqRcF+IAJQU7i66ExThq1w5mGzJBCXGWdjyr5QM
        cX8qi5Zylv2iv/6WmHRUzlcFSA==
X-Google-Smtp-Source: AK7set+Bz41PE69KS57pMdkk25+IOxAaTcAgby/+xCIuMuMjNQAsuRVtWW4rTj8y7Kx5D5XLGP7gGw==
X-Received: by 2002:a05:600c:2b46:b0:3dc:4aa6:a8a9 with SMTP id e6-20020a05600c2b4600b003dc4aa6a8a9mr637330wmf.7.1675235575138;
        Tue, 31 Jan 2023 23:12:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b003db09692364sm849921wmq.11.2023.01.31.23.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:12:54 -0800 (PST)
Message-ID: <bced492e-08f3-90d9-4ca0-41ab0e4cca9d@linaro.org>
Date:   Wed, 1 Feb 2023 08:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <7ddf5c74de84c5dc291996423cb1eb46.sboyd@kernel.org>
 <febd59ed-ff7b-ffc4-5568-d856703c9123@linaro.org>
 <9367139a425dc7e4811c757b62f33a4e.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9367139a425dc7e4811c757b62f33a4e.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/01/2023 00:30, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-01-26 01:31:55)
>> On 25/01/2023 21:44, Stephen Boyd wrote:
>>> Quoting Krzysztof Kozlowski (2023-01-23 01:49:25)
>>>> There is no point to allow selecting pin-controller drivers for Qualcomm
>>>
>>> pin controllers?
>>
>> Copy-paste, I'll fix it.
>>
>>>
>>>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>>>> kernel configuration more difficult as many do not remember the Qualcomm
>>>> SoCs model names/numbers.  There won't be a single image for ARMv7 and
>>>> ARMv8/9 SoCs, so no features/options are lost.
>>>
>>> Are the drivers used in arm32 emulation mode on these SoCs? I recall
>>> there are some SoCs they run with the arm architecture.
>>
>> I did not add it to the few SoCs which have upstream DTS in ARM and
>> ARM64. I added only to the ones which are in one specific folder. Also
>> my patch does not affect defconfigs (qcom_defconfig and arm64/defconfig).
> 
> Cool, thanks for checking. Is it possible to take a dtb from arm64 dts
> directory and boot it on an armv8 CPU running in 32-bit mode? Just
> wondering if even having the dts file exist in the arm64 architecture
> really matters here.

If DTSI (and/or board DTS) is in arm64, you still need DTS or a link in
arm directory. If such one is added, then the restrictions here can be
removed. Have in mind that I did the same already for pinctrl.


Best regards,
Krzysztof

