Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FC273DE29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 13:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjFZLux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 07:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFZLuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 07:50:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6061AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:50:50 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6a5fd1f46so6532961fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 04:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687780249; x=1690372249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEMURCLF3tQbRxt4gBqiVFVUpF3p7VboWxLcm/W6LZ4=;
        b=dmzpjJFiWavLAnKLGZzfSP2saN+6Y+oZhp9gInGqASoCOvFISEG3YsB8V+UCqq/a6H
         KlC0paOCoZywEjJI+jDMOuf1A9FG8HIgXMD2ensRauubWhJt+7HiTJFnsY7cQEGcjgJs
         u0RaxspdImK2K3N2UO72cGPnFO4AxgkpbuatoujdzCKf8TDkIr4jDJlgUSEt8srvjl3q
         jWRfoq2Xrx0xq4nBJSkHdhhmF9wqGz8eV3oioN8zUU6tGMmdlKGde9B5huuLlNHkysAf
         Fb0r5p1s1g3DAZBRRrUlRf08qWvoQ2ulg+qmeqSXcThZzCiC5PuZ/QHtrj69a7B/PUxG
         nYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687780249; x=1690372249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEMURCLF3tQbRxt4gBqiVFVUpF3p7VboWxLcm/W6LZ4=;
        b=l01xfHsIOfsBAOqww9pQ4TYkfCD4A8usd+JEJqaVInXPDoDatwGGsJaJvYtMyiPF1u
         ZPtgUjokrMDUeGQNEWk6IApAdccx/jlgvZ5y5oSAwYStVrK7ONLHMDHLVLEsEcJ4/XAR
         C3AYivIALg3W7jS5bW/3M1JrABTcbmL5aN0OA0GUm6HTCPHmDYoV6WWzi7QG0rEcAXkw
         fPDX+u1GZ5jzAlIslakHQB1PVbVCHwLx+7muM++G84sEO67S1Xk913wdXiJ/DI4p2QTx
         U0eUr+u23v1WqeFpZKTK/s5yzaAIry8gqEcWsmaOWDwUKHJA0vEdT013yPWbb8Pczq6X
         +rhA==
X-Gm-Message-State: AC+VfDxMtiR9HCN7GavRQrx/iBlKnHmipRdNyzd7ljNyhqoXdQfhdojE
        ZtBLs2ed80lI86ND2qo+bpUBYg==
X-Google-Smtp-Source: ACHHUZ7yY79x1qqb+kiCD8FwbO2hKs4TEuCpuJGp3mPKQkIrzzJzrgFn2BB040n6AXmm3RW6X6n8nA==
X-Received: by 2002:a2e:854f:0:b0:2b6:a05e:f1bb with SMTP id u15-20020a2e854f000000b002b6a05ef1bbmr1998267ljj.51.1687780248977;
        Mon, 26 Jun 2023 04:50:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm984416ljj.101.2023.06.26.04.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 04:50:48 -0700 (PDT)
Message-ID: <a1fb306f-6a68-43c6-dfab-abe9a656e7f0@linaro.org>
Date:   Mon, 26 Jun 2023 13:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/26] cpufreq: qcom-nvmem: also accept
 operating-points-v2-krait-cpu
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> the qcom-cpufreq-nvmem driver attempts to support both Qualcomm Kryo
> (newer 64-bit ARMv8 cores) and Krait (older 32-bit ARMv7 cores). It
> makes no sense to use 'operating-points-v2-kryo-cpu' compatibility node
compatible string*

> for the Krait cores. Add support for 'operating-points-v2-krait-cpu'
> compatibility string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index ab78ef1531d0..3bb552f498da 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -238,7 +238,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  	if (!np)
>  		return -ENOENT;
>  
> -	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
> +	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu") ||
> +	      of_device_is_compatible(np, "operating-points-v2-krait-cpu");
>  	if (!ret) {
>  		of_node_put(np);
>  		return -ENOENT;
