Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B82364F999
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiLQPFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiLQPF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:05:29 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D89E0F4
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:28 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bf43so7722595lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vjpMg4F+5sSFT9iHpiQZJCFX0WC+6KyI8B0Tn+fBi0=;
        b=r7//6v+Ede2TPT3icZJwBqRDC57JiyTHK67AEGTTAjJf4CzbHF7BOPL7Ywkp5QQTQH
         E4j9kCGgn8dKdKKyWvK5XE50tpREkN+XC1nrBxfas/r+aQThp6v1KQzZuELAMkt1ws7L
         ysWEztX+llkdMVx/XPyKhGlpwQzKz20Z7FNQReeUZrxn5mVQlypK26pO1ElOztFKD7IK
         xvqpDhlO443EhkFsf/lADbd122qVJG9RHvPOmhobpb4EX1WP0bTq3r+FNbqldfEhuXsU
         ldGHYHKOMFgVJgbP9DzVRYPYOH3l/FBGUY0ns5LyXJn1Z5aZOK5mtqPNsCseUVkWSzuC
         1Q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vjpMg4F+5sSFT9iHpiQZJCFX0WC+6KyI8B0Tn+fBi0=;
        b=Ca9uliWi5gLgAI153frQ16D1XnTkJFsEPObv3vc9+n3CeZTp2FC29qKLk7Zw9EpX1+
         3Ups7X7enwgrGlKqM8B9dMPHyZi9YWqjVX3vbQEqcwY87J6awoYaV3gSlE/rxbcMpTE6
         U54RyxoAp4v8RNNCWtFkb2iblGrjmda4JqTzh6u1nvZx/JYXm/uLOWO/Y7aGsEdY3vsX
         cqQzbzfPaJ80FkKSP2d/+TXrPm3EVZMZk3J+MKhk7mhYIF0hk6LfnGrr9G+AABbuKZT/
         t0zMFf7vvGB0XAEG/rlBmENAnYmR8isSM1j+q5xTYln4TDrcI7CvMM8zpkrisjpn0oDs
         dlhQ==
X-Gm-Message-State: ANoB5plMTft/UenT5/EL4xiWB3frbBbytgAMFjguyhDh/I/lWzxHTAgT
        hIZRLQTz5704ELaC2O09zL7Dzw==
X-Google-Smtp-Source: AA0mqf7lDrpDAQV1zXeIb5pay96XnHERNqi7MmVOBPJHXZ97dNnpui3V/qHXGPGDhMJl+BDwv5awQw==
X-Received: by 2002:ac2:5310:0:b0:4b5:b46d:e52 with SMTP id c16-20020ac25310000000b004b5b46d0e52mr8106596lfh.50.1671289526568;
        Sat, 17 Dec 2022 07:05:26 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id s7-20020a056512214700b004a91df49508sm531122lfr.177.2022.12.17.07.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:05:26 -0800 (PST)
Message-ID: <35453ab0-4fc8-d510-3087-125a9585ceb7@linaro.org>
Date:   Sat, 17 Dec 2022 16:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8450-qrd: add missing PMIC
 includes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
 <20221217003349.546852-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217003349.546852-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 01:33, Dmitry Baryshkov wrote:
> Add includes for PMICs used on the SM8450-HDK. This makes GPIO blocks
> and thermal sensors available to the user of the platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index e24bb77b2410..134ffdfc2c63 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -9,6 +9,10 @@
>  #include "sm8450.dtsi"
>  #include "pm8350.dtsi"
>  #include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pm8450.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
>  #include "pmr735b.dtsi"
>  
>  / {
