Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53365793AAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238755AbjIFLHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238424AbjIFLHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:07:08 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6CDE43
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:07:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c1c66876aso519033766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693998423; x=1694603223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L01rxpdoFWeSDC4f+JXaM7rFKbw9+duxbeO3vQU9rek=;
        b=awLdXguue3zHJ8TQtpCa7E7VhnObhpTQOPC5vm/URXbZAz94kFFO3DT+8+aksokp2u
         OTfDAwb1WjdXhVOlYH3kQKjY+6XSRKKokhV/dyy+Fk6qVQANORlAvx4W+yj2wEjtAbAS
         AcbPPVyXd+07jBLv3UPErCK2cOl4vBw2We5Rf9uo+PM28vFKf8V0mOwMOu4/w5glNrNz
         TukXUMqVPY6l19KtUxoVTY5UjBrs07Q9sqLFQu/NkLiEsZlKSuLsmBetLFkpcBUUoyWj
         NN5rM0z+/OZjsZ9xJfySfsVv4Dhe4zndCengngvaCUuXpttwZYeztFUPzZY6/SJrGb+u
         q9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693998423; x=1694603223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L01rxpdoFWeSDC4f+JXaM7rFKbw9+duxbeO3vQU9rek=;
        b=LgH3ZWz3nvDH4tXirkmP40dwQn1UWIIEPxh9JOVKKyt3mEdwfc0fBaqO0JpJhLYAOb
         WEqteokSej5lw3w/rCISwCww/B1M0MKX8bGpFogM9KZAZ9ikVml3vPtk7WnnnPFAG5VX
         aO3kZEF8hWcMKm9q5bldIXStztNoOmWbbJis1dCJsVgZdxjiWY0w3dNfN5gVM8jJUSIb
         v/y017jsgtA6DyXNqnvM7fz1YVDlj86VsN6kUY0DcWQNQWADje/qML1EWP888EW+KmFz
         29qGOuW3lix+UuQ9D75L9TOfayE9PnspH1ig5AVyWdcVdohkV8oMRaywP51r6Uqc47xe
         1/bw==
X-Gm-Message-State: AOJu0YyiC1Amk4+G7XvHRGReUThQluXiD1oJsHmth0E6s8Dx2TzKLHJJ
        ux4L/b8dSzbsfR0OJi6dizIrFA==
X-Google-Smtp-Source: AGHT+IF9g5MPBXUOZoJDv/BRu6CzvaGAVMd78ACQRxnbsx4Hv87sEJVQzdF+n3fVHKSnKVIGYzA0KA==
X-Received: by 2002:a17:906:30cd:b0:9a1:d25c:55e3 with SMTP id b13-20020a17090630cd00b009a1d25c55e3mr2053262ejb.16.1693998422903;
        Wed, 06 Sep 2023 04:07:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b0099bd5d28dc4sm8775909ejc.195.2023.09.06.04.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:07:02 -0700 (PDT)
Message-ID: <2e6e6c6b-07cc-4cc9-a5e8-47e25fb30f7f@linaro.org>
Date:   Wed, 6 Sep 2023 14:07:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb2210-rb1: Enable remote
 processors
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
 <20230906-topic-rb1_features_sans_icc-v1-3-e92ce6fbde16@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-3-e92ce6fbde16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06/09/2023 12:24, Konrad Dybcio wrote:
> Enable the ADSP, MPSS and Wi-Fi. Tighten up the Wi-Fi regulators to
> make them compliant with that the chip expects.
> 
> The Wi-Fi reports:
> qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

