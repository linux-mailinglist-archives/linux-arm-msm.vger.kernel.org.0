Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5802F78DBF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjH3Sbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244103AbjH3MdO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 08:33:14 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69EBCCF
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:33:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so84218041fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693398789; x=1694003589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oAFVjZYKZNRPwsay3rIoLdzOEL0KLN9k47XMSZxKLB8=;
        b=Fk41yDB8NbKWSvM/2IPbAm82r+RcSFuLkUxAbooic2ots2mZ7HYqJh8XWhBFTDDltF
         qln6x9PHBn9XrYpf9cfXvGndOOj8h92SdvJ6ZIkrYczSBV1YMpB+f3ayP6kQ9AoGHX+g
         FubI5Snqm/40lh6YfMiJ70zZkKgxGXrl4+VjEkHPdE4W0TR+I6a99ibiC02yzBqK46Fd
         F8doSoiTNOtNDjLwA/0JnIlkSW+zdrqXj7Rd2mYO1BWj42I12KELaqSyABsFVxUjADp+
         xGuT/BTbL+ABBgfGRjAWedmnIoW2Ajewjluzb6DWce1vsUUpdI9kLXqEkTM7GrOrTyXC
         hBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693398789; x=1694003589;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAFVjZYKZNRPwsay3rIoLdzOEL0KLN9k47XMSZxKLB8=;
        b=N+OliAd6ZVOBoO1hrt+vJh3p3e2Z6OTFf59jLVbPkAqwAL3qXSjeksmm5uLPKOjWYq
         K8ePuPLOHIYQyg/YsSddvqOTVR0jh6+mM5yLC8eQrtwk072vbvILO5iLAwbN5fCzaj95
         YWcY7LKabz9bchivwRz1chsMUo1wDBwfJMPKz2woitonZS6Ob1dsZUViRur366uu3AHp
         feCBB8FyQ4XsV9uLkjorXjA51VA9yQqJBRd/dKp5SWm/zpSxw0FH/BovAyZ5NcIdt5KM
         urKx7HXgmY0fe7qzKvuxifd6DLUSkWjPkG2mB59lEQbC3+KoWgTXy6nPLTLhdbbIJ8La
         RgFQ==
X-Gm-Message-State: AOJu0Yymry6WY766LhC1PxxHr3n1jTg0lv4lFmHjQB+VZ14ptPHw2L7d
        xARZj3trN7iJwVpHA9f/GE2rpg==
X-Google-Smtp-Source: AGHT+IFB55m00NU6ptvOtwfZRKP4sKIyzJ8HQbx/wwgnu4WlbSbWPmVlUbC7tXKDNTT0fOZpMN29BQ==
X-Received: by 2002:a19:4f15:0:b0:4ff:7f7f:22e7 with SMTP id d21-20020a194f15000000b004ff7f7f22e7mr1476266lfb.17.1693398789255;
        Wed, 30 Aug 2023 05:33:09 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25614000000b004fbc82dd1a5sm2366788lfd.13.2023.08.30.05.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 05:33:08 -0700 (PDT)
Message-ID: <50c2777f-de2e-4f57-9a94-ae25c8ee759a@linaro.org>
Date:   Wed, 30 Aug 2023 14:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] soc: qcom: Add LLCC support for multi channel DDR
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230830105654.28057-1-quic_kbajaj@quicinc.com>
 <20230830105654.28057-5-quic_kbajaj@quicinc.com>
 <cec9318c-9a70-4392-89b7-048d30b7b790@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <cec9318c-9a70-4392-89b7-048d30b7b790@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.08.2023 14:32, Konrad Dybcio wrote:
> On 30.08.2023 12:56, Komal Bajaj wrote:
>> Add LLCC support for multi channel DDR configuration
>> based on a feature register.
>>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
> [...]
> 
> global pointer to a error code to avoid referencing it */
>> @@ -1031,6 +1050,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	const struct qcom_llcc_config *cfg;
>>  	const struct llcc_slice_config *llcc_cfg;
>>  	u32 sz;
>> +	u8 cfg_index;
>>  	u32 version;
>>  	struct regmap *regmap;
>>
>> @@ -1052,7 +1072,10 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  		ret = -EINVAL;
>>  		goto err;
>>  	}
>> -	cfg = &cfgs->llcc_config[0];
> This is unnecessary, get_cfg_index returns 0 when no nvmem cell is
> present.
Sorry this is a minus and not a plus

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
