Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB67774D4F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 14:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjGJMKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 08:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjGJMKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 08:10:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A1D120
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 05:10:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so6861217e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688991050; x=1691583050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUyQk17MJT3ao4v6RmDakeDvMlU54/RUOborqwgq2Pc=;
        b=sJ5CdSxBaK4ZxFXLdKAkIUfHbc/Iqtb8Fb8kcXrvw0q91MvnOiJKJ7qxDJKN/n3sAD
         eRonNevW7IMf/P7rCDxwTlWH4M8hVMAqZh9ljVb7jUu1DI5pdgfT9szg1uGmVEq9rHov
         YiMtH2bx5xinaxNoq0t/E8LfjaD7X6PfvP8tgZDMPZVBjZvObkB2QXu0NfpljU9gvjMt
         2iaVlAlxjshhLtH7U8yYmje/WERSD6R6zWWVcsJx2PUgdQe8wrbE2QhBG33rQ77Ro9+u
         /3MvPvZZBnnew1TRQV8H3HU7sv0yBWv7OLi/5F/UmBxzl/yMfkLUbfexnirfmRiOWRjf
         kq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688991050; x=1691583050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUyQk17MJT3ao4v6RmDakeDvMlU54/RUOborqwgq2Pc=;
        b=h6ySRgokHO9oRVA+2e9nZnY+sSMYISAEY1Wor5P2/YWc+IwU3s0imcK9f73paFIp8q
         85JMJhtyvmqsXB0pWoJTv3F7nO6OITTbYM3f0eVq/BqaddGNjUyYOp/u4vVbT3k2q1C0
         fL8qRo1nMGfvfXBDlR+FQYgkeRDXCbSxFMjoFndm6oi+bFjqi2kbG9aLUcGKo4HF9MCo
         y7isjtfVJJouJ0aIk/P+cGyS66FbmJo4cNB8HjytU0gceMS+5kyxSYIAEXnqUU08Z3Ta
         tj9OlYkrWkM5C9n7m9lkCNIG6b++Lqoc7xmKn6rmwl/72p8iZAARP9kMaeffkIKQzCkt
         XT2Q==
X-Gm-Message-State: ABy/qLYUhtUNQVQaSxg7+f62uwL/iWIS0loHEABPoxecoBOYgJwGmYM1
        1b7VUjI4QzpeRHvaxYNtxOYuIWDd0ilP/KFM5q4fFw==
X-Google-Smtp-Source: APBJJlGYFJBq0+fUXFgKsXuZtDpS7DQMojOgepm6/ZPiqpLZRz1nLPokxoLdXqkSf/XQediGcStaiw==
X-Received: by 2002:a05:6512:1108:b0:4fb:893a:d322 with SMTP id l8-20020a056512110800b004fb893ad322mr10580256lfg.68.1688991049671;
        Mon, 10 Jul 2023 05:10:49 -0700 (PDT)
Received: from [192.168.1.101] (abxj141.neoplus.adsl.tpnet.pl. [83.9.3.141])
        by smtp.gmail.com with ESMTPSA id d5-20020ac24c85000000b004fa35167729sm1666246lfl.159.2023.07.10.05.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 05:10:49 -0700 (PDT)
Message-ID: <55e55042-5189-15cb-5b0f-4c7f321a4f61@linaro.org>
Date:   Mon, 10 Jul 2023 14:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: drop the IPQ5019 SoC ID
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_anusha@quicinc.com, quic_saahtoma@quicinc.com
References: <20230710105419.1228966-1-quic_kathirav@quicinc.com>
 <20230710105419.1228966-2-quic_kathirav@quicinc.com>
 <d752e5e0-3c34-02ad-6768-42eb2c66e582@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d752e5e0-3c34-02ad-6768-42eb2c66e582@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10.07.2023 13:37, Krzysztof Kozlowski wrote:
> On 10/07/2023 12:54, Kathiravan T wrote:
>> IPQ5019 SoC is not available in production. Lets drop it.
>>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>>  include/dt-bindings/arm/qcom,ids.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
>> index bcbe9ee2cdaf..179dd56b2d95 100644
>> --- a/include/dt-bindings/arm/qcom,ids.h
>> +++ b/include/dt-bindings/arm/qcom,ids.h
>> @@ -250,7 +250,6 @@
>>  #define QCOM_ID_QRU1000			539
>>  #define QCOM_ID_QDU1000			545
>>  #define QCOM_ID_QDU1010			587
>> -#define QCOM_ID_IPQ5019			569
> 
> What about users of this binding? What's the impact on them? When did
> the SoC become obsolete and unsupported by Qualcomm? Remember that
> ceasing a production does not mean that magically all users of a product
> disappear...
This + from my experience, SOCID entries are set in stone and freed
indices are never reclaimed

Konrad
> 
> 
> Best regards,
> Krzysztof
> 
