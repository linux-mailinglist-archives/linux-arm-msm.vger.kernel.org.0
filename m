Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353C570E3F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbjEWRbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 13:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238247AbjEWRbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 13:31:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94641A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:30:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so158975e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684863047; x=1687455047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2MPDFSobTrJjwV2maHhGuz88MkNYnQyJ6TWPaLN0WA=;
        b=df1E3aRgzE8v52R+MmUNDGrrD0UHqqfS2l4ctlGhzpiqI310irwQn3Eq0YyOYoQ0Yd
         qx5FoyHw8RBiquq6sKfaV9TKQyfbUUvyh1q/q0Tz1MV8uOS6YZ0dM+QBBqnCEhzmNqez
         fJY/sGT2IPufVUD8Ig97dvaJ6kBWniRT+ppe16/O7Gs1KY6oYCAF4j5tru/IwU9W3KWP
         Bwx+7aXx+2E/CGbw9j3pE1anq6gkpFnnzldNbWmBohtyAQMt/gcFea3Hlt/VuEbsZcbo
         kZM3FymcUiLYlIp3TE5QfBv34X9S4ekQYWKAba/RUc/VnENBidxaw/76p43PCjq+xC4d
         08IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863047; x=1687455047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2MPDFSobTrJjwV2maHhGuz88MkNYnQyJ6TWPaLN0WA=;
        b=A824P8xho3/iaSI4EQkzU1yq0bhruYh44ryQTqyCR/T1hKTE1m0L+4sP4arVd4Ifdw
         1cQaW0Jil60Cfgyd1yIZjntRNX2leAnje2Tqc2S7KC2hZJ+QCAeKccfMXX+TURvXeVaX
         9L1VEjUunsABS9SIvZGwF6SdfSPak5Ot22LxgzVSsIuq/70dvnOi4YHtpVcjH9ThEOXK
         J3mFXByX2P25IIEz6asDcDQb/ix7sNnciC2mkfoHbTpUhJWNccLVFJj4nrQlwdFinzs9
         xDpyLxDSe+QdlG5XO+uHKoztaC2KJ9wEMhc0CAc1Ay4PbKdczmEX2I0lCriYHgVR76Hq
         lH5g==
X-Gm-Message-State: AC+VfDzRQwpU/7pBTAA7H+1lbtQGuUX8kfV9c4ERlolbhB2NxF7jGkVO
        i9HwY9Xhz3EGHFd7kzGvcDgq4zowopCF4wmAI2Y=
X-Google-Smtp-Source: ACHHUZ4uVr5IXDzpp0GHvjdfp60Wi1n/q7OuxRP90gnURRa70qFiax+59FE99U9109FCjiN2/wd7YQ==
X-Received: by 2002:a19:f00a:0:b0:4f0:2ce:34ea with SMTP id p10-20020a19f00a000000b004f002ce34eamr4673000lfc.44.1684863047608;
        Tue, 23 May 2023 10:30:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id v9-20020ac25929000000b004eff0bcb276sm1415101lfi.7.2023.05.23.10.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:30:47 -0700 (PDT)
Message-ID: <21baf481-347f-d4b1-87df-833ed16cb729@linaro.org>
Date:   Tue, 23 May 2023 19:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] arm64: defconfig: Build interconnect driver for
 QCM2290
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
> Build Qualcomm QCM2290 interconnect driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
Do we know why some are =y and some are =m?

I'm for =y either way, if we can.

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e2f6a352a0ad..ec9b828b14e2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1415,6 +1415,7 @@ CONFIG_INTERCONNECT_QCOM=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=m
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_QCM2290=y
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
