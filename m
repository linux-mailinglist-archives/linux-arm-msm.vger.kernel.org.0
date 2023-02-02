Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9DF688293
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 16:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbjBBPd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 10:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbjBBPcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 10:32:35 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A47993CA
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 07:31:29 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q10so2059651wrm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 07:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sC/wHKFUWrBlFVfg/39DddKx7F/2jVJHWCKKjw4Tk6Q=;
        b=A1fBqfKtRLNefZgiDi29pQOiCeE92HPv9hxBq0iFMFuZzvddgJcP62KI+X4eL2Qexq
         X1rBGy9NdmUwjZhxW3eGaP9PIPVoZTeV/uF20me6MBAqPjNwSnJkxI4iZkF137XpuvHI
         5CKr0hl1luqBCvNQZkjZsejXn+iDqIrLMBUe7936d7lfFZ/2sBjXLI3XAl+wC4ySQNop
         HFY7DLFP/8s5aWyvkinQ/dWYUUEveNT+ZbsyxTDJFgpspQqtVP6ww1LHQqknlS8lEoAM
         t0dczhrKguVqgdUIfe6wKrJQZYPYf4MlRwLgzh9s96Rn88VEpXzRDeDRaL4prRp/hqAx
         qBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sC/wHKFUWrBlFVfg/39DddKx7F/2jVJHWCKKjw4Tk6Q=;
        b=Yzp4KO+wC8ZwN2o/Z+pGmEIRBlp+ylJM548sM0a886NdwV5UM7kAANoRxSWSag2QpV
         dr6h0BkOTjHy2Lngw9ni28N06PbrhqXYTrs44hqZV3RIJ7gjmjQ5uhfvUMSxbbIOKwDJ
         GmHEDZQk2Dm3amKUbVt9FjynDvT5A7XegzmjxKT+hXE/3kOZYiwGN7xTP41NBMAz+2qz
         kp60uddMCs9aEpOYh7nlIzxTyVhAdwhbToLXLctmpIg9uJzXBJ3aIhfG2liRdo/93fpX
         9B3ycs/+Wo/N9/UTlnGoVJAvDPUmP6zsi0SUfyiyUYlyV5kDPTXMFwaOP7sNvw7bWjiI
         BPbA==
X-Gm-Message-State: AO0yUKX9lbmyn6c6O7bbjO0zrCFCorOdkTJGxlZ9wMEbqtFZAv7HdiUA
        aqq223WyPjU6FhUn4AluRgWySw==
X-Google-Smtp-Source: AK7set9dyLQ6/5ZzLauX+F+KTRoN6G57y2bDleM43oc92kGmTRl7MTADUwhvVdbR2ZtAOexuonjtDw==
X-Received: by 2002:a5d:6481:0:b0:2bf:e895:3839 with SMTP id o1-20020a5d6481000000b002bfe8953839mr7755289wri.39.1675351816973;
        Thu, 02 Feb 2023 07:30:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p12-20020a056000018c00b002bfe08c566fsm14821183wrx.106.2023.02.02.07.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 07:30:16 -0800 (PST)
Message-ID: <1b75ab1a-44c9-c4a8-7fa4-d601fc710d2a@linaro.org>
Date:   Thu, 2 Feb 2023 16:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/6] mailbox: qcom-apcs-ipc: add IPQ5332 APSS clock
 support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-6-quic_kathirav@quicinc.com>
 <2433c2c7-664d-0d1f-12ae-374cbd093dc0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2433c2c7-664d-0d1f-12ae-374cbd093dc0@linaro.org>
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

On 02/02/2023 16:16, Konrad Dybcio wrote:
> 
> 
> On 2.02.2023 15:52, Kathiravan T wrote:
>> IPQ5332 has the APSS clock controller utilizing the same register space
>> as the APCS, so provide access to the APSS utilizing a child device like
>> other IPQ chipsets.
>>
>> Like IPQ6018, the same controller and driver is used, so utilize IPQ6018
>> match data for IPQ5332.
>>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

While this is not the fault of this patch, but we keep adding
compatibles with same driver data. I think this should start using
fallbacks at some point...

Best regards,
Krzysztof

