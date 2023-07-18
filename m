Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E0A757996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 12:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjGRKv4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 06:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjGRKvz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 06:51:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E30CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 03:51:53 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fdbfda94c4so3239729e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689677512; x=1692269512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5nLJMm6saFLlL+Ge11MSzI9uVMi3G0/N3KISKeEvm00=;
        b=X+L4TZlNrTXJOde1cLGusZ9SOolO7Yh+XQQQemmAkvE4UyBbyInbV4epTLiukcbJI4
         rXAvLxxd+EvCRLzSw0ZEmgOSm73YiUGRnGGVR3Wk0NWSxD/4tOTE0sFg+N6+MLFpoTt0
         clSIvnnPbgKZTdWMb1ss+CNOavieC8GnEWd5Y+aurzX84WZOGio5mg5FnZaAoprdcqpb
         jh65JFZH5juwkQ2sz0kSzVRDc0v92vBfRaXOGKIGEeExap/Vx+BRFHo3EVqD6gr8Ysy5
         MdoGNp8Anl9e9fQz9GCgBnqA/4s4uQmPW6NTuLmAOBOdrU2U8WcvRlcAeTfIxeuS5GhA
         DkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689677512; x=1692269512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5nLJMm6saFLlL+Ge11MSzI9uVMi3G0/N3KISKeEvm00=;
        b=CuNOkfQ/lcHxsTlS2oau+Ug2+wZ22gjcUGUQryHu+34sbWjGPt9XV/y1btWxdUOObh
         rHWV9FTnFMzU7HpBTISzp3z5kFr9/cI7Sxy83TTJdl6CVgfOH9XSmji+swZz2vtVwBgt
         tU10Xh1arJ3ztHycovS223gqC6w3e6lyKfh1bds4/7ZUdEsR7w9iTuj/Pf3zhBnFG05i
         9F8ojO57MDm5uKXpjUtnZ7qdjGtpCrYUiyft9gjJy2cr2ws1D/6vup3gWxlY7jWQu1qc
         JHoZYGrtsjHE51WzBtnYFhFNcAjfyri9uLJFQEZrckjZ9tClwnwIUlrTqrEyol4QXXd3
         jNtA==
X-Gm-Message-State: ABy/qLZPNIZZgP29TswpQ59o0Ee/bRYA4mEOXXZGIKFEQUiWblw6i5rv
        udySS91jrANwX8/GaMTLAAv7Tg==
X-Google-Smtp-Source: APBJJlH+Egn7YtR5IaNXT7JWh8CdFi270dMCDR0T8bgvon9AHi9F4msUsQuTQxb7V4T4XaATJsKC1Q==
X-Received: by 2002:ac2:5f79:0:b0:4ef:ed49:fcc2 with SMTP id c25-20020ac25f79000000b004efed49fcc2mr12776783lfc.26.1689677512068;
        Tue, 18 Jul 2023 03:51:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id i2-20020a056512006200b004fb9d32719fsm385579lfo.36.2023.07.18.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 03:51:51 -0700 (PDT)
Message-ID: <1bf484c6-b648-a14a-8bac-4b95b3776294@linaro.org>
Date:   Tue, 18 Jul 2023 12:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: qcom,pm8xxx-vib: add more PMIC
 support
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230718062639.2339589-1-quic_fenglinw@quicinc.com>
 <20230718062639.2339589-2-quic_fenglinw@quicinc.com>
 <cb534cdb-508e-b03e-4e39-50cd6654377a@linaro.org>
 <4cb9f443-bdea-695a-f1b7-3963747e9a17@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4cb9f443-bdea-695a-f1b7-3963747e9a17@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18.07.2023 08:38, Fenglin Wu wrote:
> 
> 
> On 7/18/2023 2:33 PM, Krzysztof Kozlowski wrote:
>> On 18/07/2023 08:26, Fenglin Wu wrote:
>>> Add support for vibrator module inside Qualcomm PMI632, PM7250B, PM7325B
>>> PMICs.
>>>
>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>>> ---
>>
>> I don't see changelog. No changes then?
>>
> Sorry, I updated the change log in the cover letter which didn't seems to be sent to a wider audience, I will resend it by adding more receivers in the to list
Please consider using the b4 tool which takes care of all that

https://b4.docs.kernel.org/en/latest/index.html

Konrad
