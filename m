Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45A477374DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjFTTDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 15:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjFTTDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 15:03:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E4E10FF
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 12:03:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f883420152so1997903e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287822; x=1689879822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhFl7csls6VbQpRJBHh5j2tQyC8b07HNJS4qfJGgohA=;
        b=iF4yTNc77O+N4+MMq+HnSFJ+btZOf3ve7xLf2SUYea8xR10c1zDtlhYSHqueI7hvRe
         ATX2a9A2xzy0AaWGiazqKlKzk2lstSUC7Miro+Le0oTgy/ZEGjdkfGRsU99ETnTrwVG9
         1nk5dAuyF3kh+Z6IcE3s5oIet1a8YlhiD32E3GdkaIAMjerBZJqa6U+XYws06GNsUvIX
         Iaqu/oyGpeN7NpBSF8rASuSaJ7saJgTwzH9JXgw2kDJpI49ILh3Ife+w8L4cn45MFqjd
         CyCkO+hiYI9KJlLpdih0eWnRpT22+dREjZo9upVBMeAxqrdI+2Q172HRBGyn/kgKBA9i
         bVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287822; x=1689879822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhFl7csls6VbQpRJBHh5j2tQyC8b07HNJS4qfJGgohA=;
        b=E36Tr+pIX+HlkyVk0fmbSjSEZ52YnZq8pzvEXb86/sEGcMdsxEkz2Jr81b7ZfF6y7j
         a8NyaTODXGyS8hYnrhjBIHPKljgiAZcHgendiZrTU4UGNUE/uHR9SfOlYfwDIZdoWGiV
         ubHau/j3vZ9jPz9698p8ShH0lWlmCUiUx4OBLClO28Hs33aKXRimXvj0TzyOuWJW+B5b
         fSy42b24OiyJvzLg+DToax/bhO9p8itWjKU42s5d7ByvHPLlAK+dk/HRBZInfGq86qKp
         UPmL1k1jHVqYRz9WzY94Xfsaln2sLqYthr8/9V7sUBbFJEehs7cGUsFGmt6ELyGzKwXm
         ozxg==
X-Gm-Message-State: AC+VfDyIP6npS76cDWL69qKSPknq2+c5rnaF6FBy1JrXoWPbu79uOMhZ
        eBggWRHvWa5pWA7t4Zqyou5PFg==
X-Google-Smtp-Source: ACHHUZ5JeTANAG/P0Z/5Ude0RuprBA3s6XiRGOPpGOLVemNka9J+vhmKajP+GrfY3D4g3b74f8GDww==
X-Received: by 2002:a05:6512:3288:b0:4f6:29b2:f92a with SMTP id p8-20020a056512328800b004f629b2f92amr7475693lfe.21.1687287822003;
        Tue, 20 Jun 2023 12:03:42 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id p2-20020a19f002000000b004f85885cff1sm456176lfc.134.2023.06.20.12.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:03:41 -0700 (PDT)
Message-ID: <72b34fea-70c1-8d80-ef3a-15e82678c757@linaro.org>
Date:   Tue, 20 Jun 2023 21:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: Enable GPU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230620-topic-gpu_tablet_disp-v1-0-7bb02bec8dc0@linaro.org>
 <20230620-topic-gpu_tablet_disp-v1-4-7bb02bec8dc0@linaro.org>
 <30cfddfb-fabb-a65e-6bb6-c0efdbd92fd7@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <30cfddfb-fabb-a65e-6bb6-c0efdbd92fd7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 17:47, Dmitry Baryshkov wrote:
> On 20/06/2023 16:17, Konrad Dybcio wrote:
>> Enable the A610 GPU and provide a firmware path to the ZAP blob.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> index e23a0406eacc..a7278a9472ed 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> @@ -179,6 +179,14 @@ &gpi_dma0 {
>>       status = "okay";
>>   };
>>   +&gpu {
>> +    status = "okay";
>> +
>> +    zap-shader {
>> +        firmware-name = "qcom/qrb4210/a610_zap.mbn";
> 
> Should this be qrb4210 or sm4250? Previously we did not use special subdirs for IOT versions. See qrb5165-rb5.dts.
https://lore.kernel.org/linux-arm-msm/CAH=2NtwVtLdE5hg8Qhd_MLCPJTqXvus8+qW_uj4O7hnOy7PVUA@mail.gmail.com/

Konrad
> 
>> +    };
>> +};
>> +
>>   &i2c2 {
>>       clock-frequency = <400000>;
>>       status = "okay";
>>
> 
