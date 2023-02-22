Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C05AB69FAF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 19:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbjBVS1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 13:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjBVS1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 13:27:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBCF3C794
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 10:27:46 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f41so11208316lfv.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 10:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677090464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhC/1G7/U4NfbpQ099CYTdbkKgQWiiedngLMds7AUj4=;
        b=gg3rmKkXYFo4OccDD+m9aZehc77Awfn85YOU0zE/MKaNhpLx74aRaQRua9M1lbctiF
         KfZV/GSaCa2ZFH0DBuoHOgWGuxGL/kM+f8AkqT9rc8lBHQO5BG4/wKR7SfF7f8kV8+Mk
         jmWc59GyyLEA/PnX4Eaxbw+FYHpF/mkCh5nrVGJuBpGH9jcSzo8TatnNTJxedM3YzAtV
         vRxQXqEdkb37eJ3OeJ+6bPvFuZgzSb/sjaLl29FdEwl6/g9Qb2Ld+Hj1s1v4+YtVwJEo
         8sMc1w2V/1JpZX4zZPJtBJxmMj6IHpvtb/W9/fBmaiCKTYie64qa+Y8Yy95JP7/Wy+qR
         yyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677090464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhC/1G7/U4NfbpQ099CYTdbkKgQWiiedngLMds7AUj4=;
        b=FslMI0V4uaMw0r3ZqBIvSd+c933T4bOXElACwMnz1xD4pXa2UaaTwJLQz3eyTag6Bj
         /efKhSQB1FbKN0/LLN5liJXrMGQnm0cSI2HKnKN7tW4nYuZXJgLSFRKNqhF7mWXk7W6X
         7toQS2ZPfUAjIhnki4ja58ztSGC/emIgP+iQLuZ3iN/iaQpulN6dpKGMMJYITatIzqVy
         euO1+9/ZvPHYGR/acWQlxyXO9LUXoxzaOmEJReB2k4XhnncVQydiUyKWF0Si5iXLm4xP
         6znUmUIIwxRByygC5FsXP1I9t2wo7tOQFjsLG6xqgR2cGkKNYeOvqEYr7qy+TgwXhf71
         m6WA==
X-Gm-Message-State: AO0yUKV22tuNMx6zY7R41wh1djO8GOETg7/oUGnbw2u6kCX22+8bPuUr
        JuPEO4u0bONt4sYgrBXfJxwKQg==
X-Google-Smtp-Source: AK7set8v+KInbVZqzQunon5Tq0Q6FaxLc4fVXlo31GQDC4NWbpBpKJh6gQPUSKGLWKKiRkdITPJGjw==
X-Received: by 2002:a19:f00e:0:b0:4a4:68b9:26c with SMTP id p14-20020a19f00e000000b004a468b9026cmr2817622lfc.6.1677090464484;
        Wed, 22 Feb 2023 10:27:44 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id m6-20020ac24ac6000000b004cafe65883dsm40789lfp.122.2023.02.22.10.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 10:27:43 -0800 (PST)
Message-ID: <44f99635-69b0-4ab1-aa58-417824aae8d6@linaro.org>
Date:   Wed, 22 Feb 2023 20:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v11 09/10] crypto: qce: core: Make clocks optional
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Jordan Crouse <jorcrous@amazon.com>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
 <20230222172240.3235972-10-vladimir.zapolskiy@linaro.org>
 <cdc87c95-a845-904b-1a57-0895b9f93d9f@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <cdc87c95-a845-904b-1a57-0895b9f93d9f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On 2/22/23 19:33, Konrad Dybcio wrote:
> 
> 
> On 22.02.2023 18:22, Vladimir Zapolskiy wrote:
>> From: Thara Gopinath <thara.gopinath@gmail.com>
>>
>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>> default by security firmware and the driver should not handle the clocks.
>> Make acquiring of all the clocks optional in crypto engine driver, so that
>> the driver initializes properly even if no clocks are specified in the dt.
>>
>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>> Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> [Bhupesh: Massage the commit log]
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> I'm not sure which is the preferred approach, but generally I'd
> stick with keeping them non-optional for the SoCs that need them..
> So perhaps introducing a flag in of_match_data for qcom,sm8150-qce
> (which was created solely to take care of the no-HLOS-clocks cases)
> and then skipping the clock operations based on that would be a
> good idea.

thank you for review. As you can get it from 06/10 the task to distinguish
IPs with clocks and without clocks is offloaded to dtb. I believe a better
support of two cases should be added to the driver on the basis of QCE IP
versions obtained in runtime, or, alternatively and like you propose, it
can be taken from a compatible. IMHO the latter one is a weak improvement,
since it can be considered as a workaround in the driver to a known to be
broken device tree node.

--
Best wishes,
Vladimir
