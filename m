Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170A970E3DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbjEWRaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238347AbjEWRaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 13:30:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD060CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:30:03 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso132178e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684863002; x=1687455002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ue2gX8osR6uj91hQMuRvUydAVjcu4s/WagpjeWc1Jwo=;
        b=jrSDUBErkkZbUYLFEYqcnnoDbpw59kM2Wrr+6yx8qmyPeCPuY6QIx/lgaL5DaEZ55a
         75djmMn71FfYiVoW2KJrjMvCF/tKy+8Bz/PRKYrYuji+khtT7H0Temeloilq5kNIFFow
         4C+WGhSc7GhZjwT3cing8KEe7Rqg7O4y8IL7qLaQlUViLthMwVgkYzC4VdzwVhskX7Fq
         YTjwcD7fFAU54LiSoGxOTyb+B0OA/kkWHvkbg3Ub27lfqBCV3clLas1z9wbjGEch0gB5
         z847hYJksrRbOgSXXJI7ETW30Oum+je5cRgLWXDJW7GsXZFBFF9yuPfBpSqkgw6RY8Mv
         MpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863002; x=1687455002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ue2gX8osR6uj91hQMuRvUydAVjcu4s/WagpjeWc1Jwo=;
        b=A2J3y9/9XOD1/GqJpAvsGc9x7FWttWyI0NzeGwXkEHlzSPTtR9wqcPjHvqtvvMm9O+
         3clzN+IEbeao9Ywtwt1OuZFB0E7W9cQxc6wCpoSzUM8BY/wBu+hoY5FSuC14C5Y+wKr0
         wsURYIMIjikECobuGgwAmm5RP6q2iee5PGnk61GlWduQA6YZ0tWQ9GFOKy0drvOUVYTJ
         NVWrFEVH4iqxhOYdLtHWl4vRqsVnzjWNKYjhPPXAaX4U7eCg7K/64cO3k26WYnuYeyLQ
         cPckKzU5YBr4aauwxrYLhRfHM0y/7+ZxYARGc8Ek0sQcvzmzgu4aeb89YZdMhqfoz1ha
         FX3A==
X-Gm-Message-State: AC+VfDwo7M4R2OxQn3TgbH3LIWLKOqlf0tyEvP+TtdG7BBIO75y5ldTE
        Wk+B6ItiZ4Cr22VnaiNxRK1TWg==
X-Google-Smtp-Source: ACHHUZ4x7vYqaddvWXC3PSev1Bl/CqyP4UshXmjjGqUP2MJ7yznZBU1+pkxTitBtDAlC31ym8khCiw==
X-Received: by 2002:a05:6512:11e7:b0:4dd:af29:92c1 with SMTP id p7-20020a05651211e700b004ddaf2992c1mr4375272lfs.44.1684863001963;
        Tue, 23 May 2023 10:30:01 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id c28-20020ac2531c000000b004f38411f148sm1402989lfh.84.2023.05.23.10.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:30:01 -0700 (PDT)
Message-ID: <2e1b38b6-8087-01f3-6414-0e1c89a59660@linaro.org>
Date:   Tue, 23 May 2023 19:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] arm64: defconfig: Build Global Clock Controller
 driver for QCM2290
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-3-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523165411.1136102-3-vladimir.zapolskiy@linaro.org>
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
> Build Qualcomm QCM2290 GCC driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 40100b9dd6e0..e2f6a352a0ad 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1163,6 +1163,7 @@ CONFIG_MSM_MMCC_8994=m
>  CONFIG_MSM_MMCC_8996=m
>  CONFIG_MSM_MMCC_8998=m
>  CONFIG_MSM_GCC_8998=y
> +CONFIG_QCM_GCC_2290=y
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SA_GCC_8775P=y
>  CONFIG_SC_DISPCC_8280XP=m
