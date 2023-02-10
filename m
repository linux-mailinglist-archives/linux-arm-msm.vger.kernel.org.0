Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5AF691DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjBJLNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjBJLNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:13:36 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F05A5FA
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:13:04 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u21so4478387edv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0F5V8u32FkjZ6JTMcQQ2ae07GfQcwmVc4zZnvRqmXRs=;
        b=S21+MFb+tXtaWrsM+rK9N7Bzg92fDQf4ErvwKLcuouOry/H3Y+PDE9IJU3W8+XIVQV
         JtiY7ioCJmg0eWG67ecjPXMzGDo3+n2sdxImCN8CBh7+fkIjMctLzI/ZGaJHHn5VeePm
         QCAG0dNotPZ2cG4PU7hu6GYqi/gXzkwG5ZTeqf479SwpdBQpquuyPVhu0gIXEyi9dPrL
         cGKIf47XxG1qQkeo42pswqSCx2uTmEj7dEjNR4AW+OvXaaTlQjpi8bCZnhC7Zd57kuzS
         KsVY9t55fG7UnNdKANALQmbbaiL6GBFEECd6V7gFwGKkGeI9IMFZ/kPwg2ATCmv6Ci19
         nfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0F5V8u32FkjZ6JTMcQQ2ae07GfQcwmVc4zZnvRqmXRs=;
        b=g1FbjNImOVLtpWmxfWw7LRcVsechIhnSgcchbWwmukbFCy1AH31yFjMZ+EVrICYwaF
         RbZGuyiluuc2wEP0INKBnihJTW3WjVeSZUv8S6waY6CSF++ztjod/+N4og8iJcgldkFH
         MIcFpNFMfsR7TKbdBHhmNgzMKP/OO8x9j6x2v9+yaXOJPn9OXlnff1NCoHSqJcF0aP4S
         jynDwTETIcI+yjMNPH9v/HOxmHHLMnbxEtdXfxWhbMGVp1PSOL5v3k1o65Ep1SN0+83p
         EnlMGD+F5vmAQBxp5wri5/3+VpD93iPR8G6Be+BBtiVd++zFaSABj8yq/f0GHpL5/2M0
         tVtg==
X-Gm-Message-State: AO0yUKWZeiWF4H4hCohX2Inxl3njpjNZJv3mJVO8joisqRP6xH/Yu9bY
        wQj41KI/yFoInsV+r86ba3VoNw==
X-Google-Smtp-Source: AK7set9RvWvTSPxyoIeX9cMUXBUxTpSjONcNj5Cfqc1SMbCe6hopnlaOSNUMiM8c6e8TIB6ZJJITCA==
X-Received: by 2002:a05:6402:5252:b0:4ac:373e:9d18 with SMTP id t18-20020a056402525200b004ac373e9d18mr339003edd.0.1676027577497;
        Fri, 10 Feb 2023 03:12:57 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r12-20020a50c00c000000b0049dd7eec977sm2063655edb.41.2023.02.10.03.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:12:56 -0800 (PST)
Message-ID: <4dd74e75-9412-b6e6-4077-719ef28d4b35@linaro.org>
Date:   Fri, 10 Feb 2023 13:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <4fdd5618-fc35-00a8-7a6b-2dd231700686@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4fdd5618-fc35-00a8-7a6b-2dd231700686@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/7/23 01:45, Dmitry Baryshkov wrote:
> On 02/02/2023 18:16, Vladimir Zapolskiy wrote:
>> On 2/2/23 16:21, Neil Armstrong wrote:
>>> On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>
>>>>>> On certain Snapdragon processors, the crypto engine clocks are
>>>>>> enabled by
>>>>>> default by security firmware.
>>>>>
>>>>> Then probably we should not require them only on these variants.
>>>>
>>>> I don't have the exact list of the affected SoCs, I believe Neil can
>>>> provide
>>>> such a list, if you find it crucial.
>>>
>>> It's the case for SM8350, SM8450 & SM8550.
>>>
>>
>> On SM8250 there is no QCE clocks also, so I'll add it to the list, and I
>> hope
>> that now the list is complete.
>>
>> It could be that the relevant platforms are the ones with
>> 'qcom,no-clock-support'
>> property of QCE in the downstream.
>>
> 
> Then, sc7180, sc8180x, sdx55, sm6150, sm7150, sm8150 also have this
> property in QCE device. And, I think, it should also be applicable to
> sc7280 and sc8280xp.

So maybe do you have a better candidate among the SoCs for a QCE IP family
name than SM8150 based? Likely it could be the first released SoC among
mentioned above.

--
Best wishes,
Vladimir
