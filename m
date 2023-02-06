Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68ABA68CAC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 00:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjBFXpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 18:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjBFXpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 18:45:33 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59AE23336
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 15:45:28 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id q19so13371430edd.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcTQxhiGskJS1QkEwQNPUf+jn+s2GnH19YjwilDkKaU=;
        b=whTkkMiYeV4wPrKHj4XIJOzxKzsJtigduH4vQ3gl3qi8JhOwT8C3YpvE8ysCVFbi3S
         9zfrk9emTNKh+akSp/aDFFdNdVXc7jTlsOgnxGnecQ8NySbrrm9oYskRHD2Ld/9EJBDc
         nKsmVRqm4KlmLO/qmjDzHJJR7jISB3G8fCmmh+sQd5+EgNN1d7NfCtvaMkhRb4g341CD
         jHW8vZmpCLfSyfSR3WoR4xOWdFnjH4D6TO7lvHF/uzzJXQthyviF/P17VtofTu6c5fw3
         j4NLLji0DpJ6bcTz2ZAMkB45PwJLt0FUZVps7CZHUSwC7rNNbHxJGHTJUD8RvpUeCBYT
         g9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcTQxhiGskJS1QkEwQNPUf+jn+s2GnH19YjwilDkKaU=;
        b=PZCHuwJzGCfdWCbHEfW1ljx36GkB+smLV/Inl37hwmQDZou9mBWZLKvFSgKtRIJcMK
         un5IzJS1et7J5xYqUu+9eMEu8qJKMKlKjbMhBQoa200VsUki3gggwW6OkFF0tv0vTL5V
         TSfvDVINC/xuHyGsojmn1t4AzC9wiSsP9+uOUdYnsxLkfxRHM0H52ouLEIsu3dUw6jiq
         vMWRp+6K8aMjY9h9+RKJV440dOXLLX/hFx3oH2SKz7SaMLyfirR3fd+8oj3YcA3jc1v1
         lxGQALk5r+2MjaeWbJp933aQIuN6C652GBW20U16HB0umGzuBWI9sQXT8y9CN9RW7kWc
         g+fA==
X-Gm-Message-State: AO0yUKWJE5uAx+csbQYoKq66Hn7UNRU7kKxCH0u/OXqLeUWKMY8xTxSY
        3OscbflZc9FaPlv7/Q4txtSbwg==
X-Google-Smtp-Source: AK7set+sZEUa8djrPEfTPNkVh3RtaFAVO83K9+DdX6m0rGGOo0L0/kLEyCh3XGnZaeulIt3Q5ShXmQ==
X-Received: by 2002:a50:9e0f:0:b0:4a2:1263:bbab with SMTP id z15-20020a509e0f000000b004a21263bbabmr1374013ede.17.1675727127389;
        Mon, 06 Feb 2023 15:45:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y89-20020a50bb62000000b004aab193b8dbsm2395279ede.80.2023.02.06.15.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 15:45:26 -0800 (PST)
Message-ID: <4fdd5618-fc35-00a8-7a6b-2dd231700686@linaro.org>
Date:   Tue, 7 Feb 2023 01:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-GB
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
 <a2e4dff0-af8f-dccb-9074-8244b054c448@linaro.org>
 <61eb2a01-762e-b83b-16b7-2c9b178407da@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <61eb2a01-762e-b83b-16b7-2c9b178407da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 18:16, Vladimir Zapolskiy wrote:
> On 2/2/23 16:21, Neil Armstrong wrote:
>> On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
>>> Hi Krzysztof,
>>>
>>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>
>>>>> On certain Snapdragon processors, the crypto engine clocks are 
>>>>> enabled by
>>>>> default by security firmware.
>>>>
>>>> Then probably we should not require them only on these variants.
>>>
>>> I don't have the exact list of the affected SoCs, I believe Neil can 
>>> provide
>>> such a list, if you find it crucial.
>>
>> It's the case for SM8350, SM8450 & SM8550.
>>
> 
> On SM8250 there is no QCE clocks also, so I'll add it to the list, and I 
> hope
> that now the list is complete.
> 
> It could be that the relevant platforms are the ones with 
> 'qcom,no-clock-support'
> property of QCE in the downstream.
> 

Then, sc7180, sc8180x, sdx55, sm6150, sm7150, sm8150 also have this 
property in QCE device. And, I think, it should also be applicable to 
sc7280 and sc8280xp.

-- 
With best wishes
Dmitry

