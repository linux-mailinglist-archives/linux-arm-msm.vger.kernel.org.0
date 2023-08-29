Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234F378CDCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 22:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240343AbjH2Uqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 16:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240612AbjH2Uq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 16:46:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080C71BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:46:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5008faf4456so7702675e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693341984; x=1693946784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dRS7HdHyI2+gvAfWGzRLz3CQwFxpkJeq8X4pv6H5dc=;
        b=HSiQHIjsYf0nksCsAzW+Tpckrgb5aWxoUBdPTG2fGs9IEMxEd+iU5KXBUgcLf23ZU7
         TbtOWis6mwnQXJIxlwvOlWPdAxvQveP2ksfEFtsNhrBt8rejrVnuVn/5ObLBJJ7HVRDm
         lFo7EY/AzKMJvLRew+eXBW7AtFVCfH/HYHC2kc55XVKxyA5yWCsRe4JXSuQeKHELxEsE
         lmy/5Jkn6RP2eDNo5y9OQGC63mXcW3wDiNb17RPABa9f2rRi3fjN8w4XIU2kmLNqiUcM
         We4xKL9jIKS7yF5J0zUuunsp9pVXrpVxUfvm/k9i9JEKvOWwopog7zaX7yVFEZVwpLlb
         klYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693341984; x=1693946784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dRS7HdHyI2+gvAfWGzRLz3CQwFxpkJeq8X4pv6H5dc=;
        b=WNCWrJFfvYQZcgHcEffH3dAz6+u2OPwZOihOVRqyDIEjKReT22wMU39ylUi3u4S0jA
         ffxR91nfaDeWP6dxXi65/6v+sG4g45zIqEBah2BOHoonN8WUR4Z7h2zO9AdBoryyIHWW
         IJ1u1aSDTNAg/fOHSUNzfWq+Td/RbgWJ/EWEtbDQbVcODbURQuWdn98P0XFXZaZ/Re9V
         Fx0dJ7DCuLDiMrt5GGWl/v5yEnE7FvZ8CT3rlJ84XfRBfSBOXmLk0JhzJziFxtUZMHdf
         x9YkxG5TYVZ362AAr6xz3RePdom5QBfC4O9MGb4Abn1hK5oLjp2LXBKLffFS9DaYVMmR
         m58g==
X-Gm-Message-State: AOJu0YyraQo85n6YDo9tnI2GEtlKVgCbKtKp0Axwif5XqLSilknEBv0O
        hMgiTezxbNor/mwZE5bYkFpohfC5eybL7Kg+jFckOA==
X-Google-Smtp-Source: AGHT+IFcYug55Tp0lNJopJnaL5nAbs+IH/2y7/m18QZbjvouGbRIdQ9I1qTMA+dls8AEqSYUh6LjHQ==
X-Received: by 2002:a05:6512:452:b0:4f8:714e:27a8 with SMTP id y18-20020a056512045200b004f8714e27a8mr79540lfk.0.1693341984183;
        Tue, 29 Aug 2023 13:46:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id q3-20020ac25a03000000b004edc72be17csm2098876lfn.2.2023.08.29.13.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 13:46:23 -0700 (PDT)
Message-ID: <8fbcce8b-4286-44c5-9593-6e4ae959cfd2@linaro.org>
Date:   Tue, 29 Aug 2023 22:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix SM_GPUCC_8450 dependencies
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>, agross@kernel.org,
        andersson@kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev
References: <20230829-fix-sm_gpucc_8550-deps-v1-1-d751f6cd35b2@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230829-fix-sm_gpucc_8550-deps-v1-1-d751f6cd35b2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29.08.2023 16:08, Nathan Chancellor wrote:
> CONFIG_SM_GCC_8450 depends on ARM64 but it is selected by
> CONFIG_SM_GPUCC_8450, which can be selected on ARM, resulting in a
> Kconfig warning.
> 
> WARNING: unmet direct dependencies detected for SM_GCC_8450
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SM_GPUCC_8450 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
> 
> Add the same dependencies to CONFIG_SM_GPUCC_8450 to resolve the
> warning.
> 
> Fixes: 728692d49edc ("clk: qcom: Add support for SM8450 GPUCC")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I think this is more of a silent conflict between commit ab7f00379fe9
> ("clk: qcom: restrict drivers per ARM/ARM64") and commit 728692d49edc
> ("clk: qcom: Add support for SM8450 GPUCC"), rather than just a fault of
> 728692d49edc but ab7f00379fe9 was merged first so I just chose
> 728692d49edc as the problematic commit for the message, feel free to
> adjust it as necessary.
Yep, looks like

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
