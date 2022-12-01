Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A238263F2A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiLAOVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiLAOVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:21:34 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF10AFCE1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:21:27 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d6so2700568lfs.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QayC88wUqwsw2iqi2IOXZrL6t5JP2hXiPUA9QtpdHcs=;
        b=DXHRvX0VZaXDwbpjeIJgmFqakqFFgbl34ZQES9dxdvaIangsk0jsRJIFx+xkWqZ+Hk
         vjU7EVmBCGvc8XA+U/ldR17XBtEVsiaIiJ8qll37ldNFQdXeYztxzdDbOS8GqOV0B6TY
         Wk5ACoI7VqF44LOCchzbTGgdtHxGuwqP0Ptstfx8M2YEIszjy3Zm7sMggcqSF8tBhtzT
         0sGN8hIk1nIyKs1i573i5so/Sgqmuz0BowKkNYLR5BMDcoXrDAdJ/mWj0W9vjqKl5tNY
         qsqrfk9LniVSu/7adASUxhpKia3es6SF+aAvCyYCne2tIMY5yF3SR+2BctFvBP/UJzdz
         Yb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QayC88wUqwsw2iqi2IOXZrL6t5JP2hXiPUA9QtpdHcs=;
        b=IX16dLWdLiCRrqt5f5V7dSz0x2T+lCeiUOmwmkg95BZfsUbGkQA3XWy/dfGnIIlGIP
         /U/pP3Wzh32mG4PjxaRKyUuIUZzjwLShu1s6OulmB7O7seW3UKUBmBOS9xmsHdimyvKV
         /Sh4hVXzVx03pfEjkUrqwJLXsrSNBHnC7YiVoUlZupglVYL9U02lIOJMHQGt9meloHa5
         Fcmm/WusMbuUcwf5ODW0mJDywLIx1U+uEQZIcjloKQh0eD4xmD8vHiFjE8NyuAiAsuCx
         zTouhovzTblyLvNnJcIzcMjQtYTlTUC65VwsN3JSRh0gA7STOvn4J6Bvh4JRoULVXUWm
         YGAw==
X-Gm-Message-State: ANoB5pk/haqjQVxCvQB+zri6bPX0vqsMthSncsowFE9SAqDlh3F08EfT
        Uwl2M5TfJBbw/cuAmMXbhOkp3w==
X-Google-Smtp-Source: AA0mqf5ZvTB7vDjVJ4NmJRjR+eA74H+19Kpc80n/TYFKPrOiTH2+sahR/ckHtxS3Rp5e8AJZIPazEw==
X-Received: by 2002:a05:6512:74d:b0:494:7551:b764 with SMTP id c13-20020a056512074d00b004947551b764mr17426635lfs.574.1669904486334;
        Thu, 01 Dec 2022 06:21:26 -0800 (PST)
Received: from [192.168.1.101] (95.49.124.14.neoplus.adsl.tpnet.pl. [95.49.124.14])
        by smtp.gmail.com with ESMTPSA id d11-20020ac2544b000000b004946bb30469sm661877lfn.82.2022.12.01.06.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 06:21:25 -0800 (PST)
Message-ID: <a849ab57-3a1d-49f6-eba5-2b706220f064@linaro.org>
Date:   Thu, 1 Dec 2022 15:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/4] soc: qcom: socinfo: Add SM6115 / SM4250 SoC IDs to
 the soc_id table
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, andersson@kernel.org,
        a39.skl@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
 <20221201141619.2462705-5-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221201141619.2462705-5-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.12.2022 15:16, Bhupesh Sharma wrote:
> Add SoC ID table entries for the SM6115 / SM4250 and variants.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/socinfo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 92b27db60840..8f9e3d0e0526 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -328,11 +328,13 @@ static const struct soc_id soc_id[] = {
>  	{ qcom_board_id(IPQ8071A) },
>  	{ qcom_board_id(IPQ6018) },
>  	{ qcom_board_id(IPQ6028) },
> +	{ qcom_board_id(SM4250) },
>  	{ qcom_board_id(IPQ6000) },
>  	{ qcom_board_id(IPQ6010) },
>  	{ qcom_board_id(SC7180) },
>  	{ qcom_board_id(SM6350) },
>  	{ qcom_board_id(SM8350) },
> +	{ qcom_board_id(SM6115) },
>  	{ qcom_board_id(SC8280XP) },
>  	{ qcom_board_id(IPQ6005) },
>  	{ qcom_board_id(QRB5165) },
> @@ -340,6 +342,8 @@ static const struct soc_id soc_id[] = {
>  	{ qcom_board_id(SM7225) },
>  	{ qcom_board_id(SA8295P) },
>  	{ qcom_board_id(SA8540P) },
> +	{ qcom_board_id(QCM4290) },
> +	{ qcom_board_id(QCS4290) },
>  	{ qcom_board_id_named(SM8450_2, "SM8450") },
>  	{ qcom_board_id_named(SM8450_3, "SM8450") },
>  	{ qcom_board_id(SC7280) },
