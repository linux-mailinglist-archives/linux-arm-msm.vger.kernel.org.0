Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DB87C5094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjJKKwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbjJKKv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:51:58 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2B9EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:51:50 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3232be274a0so483620f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1697021508; x=1697626308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bny78665V17OWbVlYtTUucY4CjMUX8/p2hEc32QGazo=;
        b=MfRbSX50k5eJR9aDVyZ1kUICPOAWDIx7r0KtgEYucqJO4H/pvoioYoCW/wErTNWKUK
         KGlS2xDpNc5yUlpK7/aJIDOnimIk272EJFaPxwLPhXUAa0Ct7y3oGoflUeBNybuwqSwE
         +idhwXWYHrCQnvfbrsk0Z70q5H9u3GrE5Z6B46x3KkDXoWts5zJQkLunzEcFT1fh4RVX
         0+pE3NuxH0xfFALlkQdnu1cHvlJSeWXYdnQWl32LtyH9uaBns3Ppjz+24dfP1nmrBrad
         X1UyW0ZAQ/E/DvHbtRcuUQZ7Kfp0oKFfIlJCehgUjTuNqx9HB9GiAI5pY1fsprcEglhf
         mqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021508; x=1697626308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bny78665V17OWbVlYtTUucY4CjMUX8/p2hEc32QGazo=;
        b=H0Wizb/C/ee5bj8TIK2/vCsCIi5s1gqEYKgXS4u7ImkdnOw7bbrADhwx50AcI66zRK
         FxZwvJMGG75F2S11IlAPbT2kODBQQcyZ+d8HLA+BONax2UaADTg3blyrCPMiBw8UPgIS
         CE16y29Envi9QgGa5ydaUq0bIplE3rgdBBGwBQqxfWKF5Q4pa6BYoXzH9aXaOyeCaxxo
         OoLBSMSqPx0QYxb5obmlCLifY//xVAeGXOwJS1rWOuztErOf+G1kNAHfYIWv84D+fKP1
         Uyo6TcMM57JpQuSVZg/rnJn9WOA/rjeuoueABFXwmaEVEJ41jq5SfhSzZPfmeERsMtcT
         lCfw==
X-Gm-Message-State: AOJu0Yw4Cviy0/VhwnIaszAlsJSvJtF4AsEv8XZMJS3sPNA7FSKb9cON
        BGkt7jx/8bE349JbqmM8WrZ4fw==
X-Google-Smtp-Source: AGHT+IEZEgMduDCp/+2XiQQ72xlJ/5XGbB1w+Gc+i5+V1E4qZdetHAwjJkm0BibHXalzZUSw1anCKw==
X-Received: by 2002:adf:da50:0:b0:31f:afeb:4e7d with SMTP id r16-20020adfda50000000b0031fafeb4e7dmr15228027wrl.18.1697021508410;
        Wed, 11 Oct 2023 03:51:48 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm15312339wry.75.2023.10.11.03.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:51:47 -0700 (PDT)
Message-ID: <6c556353-ec0a-42f0-b89a-ab0093c09976@nexus-software.ie>
Date:   Wed, 11 Oct 2023 11:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2023 11:32, Dmitry Baryshkov wrote:
> Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
> devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 07011114eef8..9509a73db774 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1042,6 +1042,7 @@ CONFIG_TYPEC_TCPCI=m
>   CONFIG_TYPEC_FUSB302=m
>   CONFIG_TYPEC_TPS6598X=m
>   CONFIG_TYPEC_HD3SS3220=m
> +CONFIG_TYPEC_QCOM_PMIC=m
>   CONFIG_TYPEC_UCSI=m
>   CONFIG_TYPEC_MUX_FSA4480=m
>   CONFIG_TYPEC_MUX_NB7VPQ904M=m
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
