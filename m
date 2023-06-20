Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BB9737601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjFTUWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFTUWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:22:05 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40D01729
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:22:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b479d53d48so38736371fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687292522; x=1689884522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brvTYEiXPJ6JbFad0mlS62wouK50ROblulI2Mz30d9w=;
        b=JnfPFJVoKCljflPiFLquzHNW7v4pztEb5OAjigeUD0Za7w+PyuDMntHNWa0DnVoNeE
         ZlHjqtNGvlv+Ag2BouOTLHMNidKZDl9TQzhbcOBIOCzsWf5VZletim6lLnNcj1ufy4tx
         jO32Ew3EOsNljMpSPl/iXbnnu9ApkwhJFvOxWy2uwwIbI8AK7W4I56PuFRuzgPvrlYP6
         IC8WIh+BnbECm5Bd3fRGtdG+dty5n/DG3IyedweC0J105vKUzzEbFFF+MwbB/cwPW1BB
         ICcCXyuNhrK2RtM/tP6+FIKYP+3ksA2oOGX2f6vthTHSZbR3aYQNOg2puUj69KwfNqyE
         7sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687292522; x=1689884522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brvTYEiXPJ6JbFad0mlS62wouK50ROblulI2Mz30d9w=;
        b=KU7LrusHyDvPLsxZhex7X/Cg4bFyjRVMzkMYi21SPptC1Y7XrT8DhRroAxte8/ouH0
         2Ah5hDncI4CqgKJ2l3ggwEjnCAcChvv6oC/hYlC71qrOlLwGr0QZmSyb9srUtx2JsoWV
         bqvZOrK5EOV4iEVicTWD3vY42a/c7LVeMGD/lAVN9naJFEnm1dgkXc8/5hyHTTtOcdEQ
         zxQ2dS8tjEYZ9MS5mTUSFyy5TMqmCpE3p92Vm+1tpclvm+YSaDKOmFgxvoxQ22shYRpc
         HSkbHoehEBkG8drASvTZtXXhLLx7quFXNOisFTTPNsm/WtK1VeRTvmpTccKRyApCP/cr
         +eNg==
X-Gm-Message-State: AC+VfDwQKPcRKDzzjBBwoBhwo/2GkuqUZI7ZmoRZObfoN41jisSRqScw
        I5NMUKk7IwBiBsOZq48yEnJjTg==
X-Google-Smtp-Source: ACHHUZ7gUm9IaGzAulvTdD0XnFh7FeULZtuvTqxWis9FENgHr2oBdS73IV5/honrgxmne8qXOvc9XA==
X-Received: by 2002:a2e:894f:0:b0:2b4:7c90:c7c1 with SMTP id b15-20020a2e894f000000b002b47c90c7c1mr4386876ljk.9.1687292521792;
        Tue, 20 Jun 2023 13:22:01 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id e22-20020a2e8ed6000000b002adc2fe3fc8sm565791ljl.4.2023.06.20.13.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 13:22:01 -0700 (PDT)
Message-ID: <843e26a0-85df-2cf4-a6b4-279b3676451d@linaro.org>
Date:   Tue, 20 Jun 2023 22:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SC8280XP GPUCC
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230620202114.83797-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620202114.83797-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20.06.2023 22:21, Bjorn Andersson wrote:
> Enable the Qualcomm SC8280XP GPU clock controller, to allow the GPU
> drivers to probe.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

SC7[12]80 probably deserve the same

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 57c6b7bb88d4..22406cb88268 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1193,6 +1193,7 @@ CONFIG_SC_GCC_7180=y
>  CONFIG_SC_GCC_7280=y
>  CONFIG_SC_GCC_8180X=y
>  CONFIG_SC_GCC_8280XP=y
> +CONFIG_SC_GPUCC_8280XP=m
>  CONFIG_SC_LPASSCC_8280XP=m
>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GPUCC_845=y
