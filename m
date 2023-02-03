Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF987689030
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjBCHKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjBCHKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:10:36 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DA32E82C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:10:35 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bk16so3762613wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJ8Gf80CWUYHo8pgwGSarJleRRx0Faz3RtumkT/DIPU=;
        b=p9UHLVpI6+WjggtIxjLt00M/ofG3tympPQyaCFDbhiwRJztc0MxTLwbLMYGHmYsaU9
         Mfh19f4QBKsPH8UJGV4lT5+RCobv1NSuQCixc8SIFxCFzq6Ok79cmnIaSRrj9J7KjptM
         KPOfIdx//9u4EPQNrBeI1iJBcPLYWuzL90u2DdrebiEx0coFQjN5SsO/JweeUEUURvEw
         YZddWPEtmH2YCo9s9KlkFfa/Gnc6ntNzsHvIib8cwIJauoK2Xm/07r6JIS7cMcOumf6R
         i+dUsFfXaracnGBbNZ/P32I5ZN0B4aFwEBCxZnbEWyq2l+ZY7SIcEo6YwjKs8bu50y0j
         WbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ8Gf80CWUYHo8pgwGSarJleRRx0Faz3RtumkT/DIPU=;
        b=XVTCEza9/QvMytIQnedIKgJVb/4/T1C0ps88EZ1X+UM8J1cOpJPHTcUiBe1opckZ6C
         Vuu1fMW4NhDT0L/r4c3yKUclKmxJOf2vJ1dgiUKn54Z7H4xWIDkYRIFyPfrA2xsVkWJU
         NDfhvX0+NeScjBciru7DzoPaoe45wEMhC6aPmAG+YE4WoFPkiWs7Nnp22ywOXh9EWQbT
         aXD/7xv5/TwyFnLKFrVpuNvYze0PqvwWkNvyHM8dgv8WWrbdm2qwFBZbYpMf1c9xHuLw
         dw8a4G5iAzgT6/oa/zdb4yQuM5+i4dQs17dE5zUYR06XKtp4cHrmgC427r/a5Cfm8hCZ
         TF3w==
X-Gm-Message-State: AO0yUKVfcmIzAGq9h6d2QcRSRwsB0pI9VOTs+LtW0gVW/yWhDC6jlIdb
        giHnniZaBrBX4ZUIBJ0WZAq3mw==
X-Google-Smtp-Source: AK7set8kL5SMVr6eq6eIoqChBiL4VBPyvYeDcIXX4WXFY8mArGdb0FbNRvZ4ohplZEpfh0Rb1xn+HQ==
X-Received: by 2002:adf:a202:0:b0:2bd:f5bd:5482 with SMTP id p2-20020adfa202000000b002bdf5bd5482mr7173996wra.28.1675408233673;
        Thu, 02 Feb 2023 23:10:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s14-20020adfa28e000000b002c3be49ef94sm1257168wra.52.2023.02.02.23.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:10:33 -0800 (PST)
Message-ID: <96b2dc11-c9e2-58c9-ba95-7e7ee7218d16@linaro.org>
Date:   Fri, 3 Feb 2023 08:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFT PATCH 05/14] arm64: dts: qcom: sc8280xp: correct TLMM
 gpio-ranges
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <bmasney@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
 <20230201155105.282708-6-krzysztof.kozlowski@linaro.org>
 <Y9xAEoc0QXe222D0@x1> <25f5a750-b51c-7d7b-0d50-5b2f78de8512@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25f5a750-b51c-7d7b-0d50-5b2f78de8512@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/02/2023 00:45, Konrad Dybcio wrote:
> 
> 
> On 2.02.2023 23:58, Brian Masney wrote:
>> On Wed, Feb 01, 2023 at 04:50:56PM +0100, Krzysztof Kozlowski wrote:
>>> Correct the number of GPIOs in TLMM pin controller.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> index fa2d0d7d1367..17e8c26a9ae6 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> @@ -3533,7 +3533,7 @@ tlmm: pinctrl@f100000 {
>>>  			#gpio-cells = <2>;
>>>  			interrupt-controller;
>>>  			#interrupt-cells = <2>;
>>> -			gpio-ranges = <&tlmm 0 0 230>;
>>> +			gpio-ranges = <&tlmm 0 0 228>;
> Won't that kill the UFS pins?

This patchset is obsolete and replaced with v2. I alerady replied here
that this was not good approach...

Best regards,
Krzysztof

