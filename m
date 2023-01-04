Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC565DDBF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 21:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbjADUiS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 15:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbjADUiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 15:38:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF2D1A820
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 12:38:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j17so42692750lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 12:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSI6ERH4/Yqp6KxmuUAxEZiVgqcat3iuDxIuYqWqdKI=;
        b=EUrL1a0g/Z4M8DJK8gyPCoRHCYUJdvMlKtlZ3vc/Udut+zURvRj+MLsdlSIJbLDFcY
         pqEc8bHBijmPjnZItz7toamQlk396Jht78uZMC5i9Jg/41R0dOBnCUocwcKbCruEVgIU
         UFL+CRdDiYDW4si0CAaT9+QGqbfwzZpCUlLK7ezBj6IVVI+QTthxrLfnEsiOTQwhT0oE
         fA+6iNmxW7NcJ2ZFrBfpCxObX+pv5ltxXkPgfw+HSDl0mKA+oU0tId7rjKMTY52aD9Wl
         2BgozyiECZGRRwVrf4N2G5YTcPXeIrBwOWOb9p0p8WZfApxO/LicEOPaFamcWzIx0Rin
         WdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSI6ERH4/Yqp6KxmuUAxEZiVgqcat3iuDxIuYqWqdKI=;
        b=GKTq1e5MBoaQUomGpubnlv8Znbz3eDd74FKk0ifAzPDifhjAOVGaXhr9H0ElP2KHfp
         OIac3/7vWRWQPDw6Zs0fFG2xbCkmhxXZTz1lQFZtbyRC7Quq5bxxRZVd/wwQ3d8t/qji
         IefwxJgTYaAf8dxTKk/gCVhZ8Z4WFA0ao+XSG+8HGYGhNCFWoAViob58bXhBnWeUTc6R
         vzTL0dxfCDGaFw3WpqRSyksiBomjpM4mwKsGMvsm5oS0Zx8w12VnYU7ThP6xv7R3pIz6
         F9DGFiou2LakgILTkaPcKMY7YgrZrDAYbdUplXTEWF+BkfFY4v9/m+impySEUjcCljZc
         zNoQ==
X-Gm-Message-State: AFqh2kpfapHUKFzU6uAtl7JVbdo8yaCBH3oxq3gy5wC3DEGd9Ygx8yhu
        NWydmDRuKyUZwxnhtnIOmHJXow==
X-Google-Smtp-Source: AMrXdXvAMHggpVW13iHfxturF/3y3Rg3rJrgB//nwaDeB+yJh3ItjD9Cpp9ahXwpcd2t4mm8E11X/A==
X-Received: by 2002:a05:6512:2393:b0:4a4:68b9:1a00 with SMTP id c19-20020a056512239300b004a468b91a00mr16575061lfv.40.1672864694111;
        Wed, 04 Jan 2023 12:38:14 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004cb0256116csm4196255lfl.26.2023.01.04.12.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:38:13 -0800 (PST)
Message-ID: <cfab116b-6032-401a-bf81-44365c878b38@linaro.org>
Date:   Wed, 4 Jan 2023 21:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next] net: ipa: correct IPA v4.7 IMEM offset
Content-Language: en-US
To:     Alex Elder <elder@linaro.org>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     luca.weiss@fairphone.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230104181017.2880916-1-elder@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230104181017.2880916-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.01.2023 19:10, Alex Elder wrote:
> Commit b310de784bacd ("net: ipa: add IPA v4.7 support") was merged
> despite an unresolved comment made by Konrad Dybcio.  Konrad
> observed that the IMEM region specified for IPA v4.7 did not match
> that used downstream for the SM7225 SoC.  In "lagoon.dtsi" present
> in a Sony Xperia source tree, a ipa_smmu_ap node was defined with a
> "qcom,additional-mapping" property that defined the IPA IMEM area
> starting at offset 0x146a8000 (not 0x146a9000 that was committed).
> 
> The IPA v4.7 target system used for testing uses the SM7225 SoC, so
> we'll adhere what the downstream code specifies is the address of
> the IMEM region used for IPA.
> 
> Link: https://lore.kernel.org/linux-arm-msm/20221208211529.757669-1-elder@linaro.org
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Note:  This fixes a commit that first landed in v6.2-rc1.
> 
>  drivers/net/ipa/data/ipa_data-v4.7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ipa_data-v4.7.c
> index 7552c400961eb..b83390c486158 100644
> --- a/drivers/net/ipa/data/ipa_data-v4.7.c
> +++ b/drivers/net/ipa/data/ipa_data-v4.7.c
> @@ -357,7 +357,7 @@ static const struct ipa_mem ipa_mem_local_data[] = {
>  static const struct ipa_mem_data ipa_mem_data = {
>  	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
>  	.local		= ipa_mem_local_data,
> -	.imem_addr	= 0x146a9000,
> +	.imem_addr	= 0x146a8000,
>  	.imem_size	= 0x00002000,
>  	.smem_id	= 497,
>  	.smem_size	= 0x00009000,
