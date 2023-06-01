Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF6F71A0F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbjFAOv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjFAOvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:51:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A56D1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:51:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af1e290921so12821481fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631082; x=1688223082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlQa6nyYkrP42ALPoHQesic/eQ0yRPGYPn5Y7l5zRIo=;
        b=UZFxKojURWoFiXbFXlx8hnvi1gjYaMIsNB26Cgzw7733KuPIHLTGRLzq4W8EHDUvc3
         Ckhi3atFrAVPVH1F/hHiHGBKwxns0e7CJhUTKY0AZNZockvTZRfx7A5uIo0355Cf6ReN
         r0oLDRJYYvTn8UvN64VJ2MyGCLgkSpJjNj+b6cH3pRcqbCj5rFXuNde7vngHGtJ/mcBa
         N5EkbqfaBJ6b0PHfvtW6N/P3uDgsffLO/L8EiTi5vWO2sI9E7TBWB3oYE11Nrvu22i8n
         Rn5QHjJvH43nmXuSm4YeFV3yAV6T55AA/vjlbDhKuzgjc2QxO9+4vrigY9EnsHh0Wo8L
         e4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631082; x=1688223082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlQa6nyYkrP42ALPoHQesic/eQ0yRPGYPn5Y7l5zRIo=;
        b=j2t+pmZnUzRJBtkP2uyM/K3fDaS5Gin/6BQg6EjPqty684Vki5N7X8IDhVyDZESYgW
         gvXoqDdR8nrhQbNtUM1tCCpeE00/Zl4qu1ZkZiy9XHG0jWriwiD1dJb0BgEjcUI8svdB
         AkK4hbiAkQ7lb2KIOY4KrTE2x5TtKroA5q2gZDhDoRwEvfeby8bEKNlWcgf4Znf/L+7J
         wEomt84ML8rJSLSzj23R6Dx7p5yiqAkVcrQko+evnmg5RuljDP4MxDyaziuMDE90m7X0
         5JvJsPO0E1ywFEpo1NrTOpFx4sZG5qiDh+o2LIK1KNTBPrIh/eRg/+jcJRW7DlAJVPRR
         WHKA==
X-Gm-Message-State: AC+VfDyOr6WUc9a2YjHULt58xJaFR1v0Xf86gS2AQhp04I2Q/x8Ts5eL
        wiwH8YROezGc01ZZf8ps0leX0w==
X-Google-Smtp-Source: ACHHUZ4KzlhybJYdOtJZ4v16Y42fWzlTmzhvxjOxmHjAorYRhNaHxhyJjsaIC0k9tINOcNMy7Qeq3A==
X-Received: by 2002:a05:651c:10b:b0:2af:d2ef:49d4 with SMTP id a11-20020a05651c010b00b002afd2ef49d4mr4673473ljb.1.1685631082608;
        Thu, 01 Jun 2023 07:51:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e11-20020a2e984b000000b002a9ebff8431sm3803994ljj.94.2023.06.01.07.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:51:22 -0700 (PDT)
Message-ID: <95bd4c66-08c6-15f3-db6c-97f820fe5517@linaro.org>
Date:   Thu, 1 Jun 2023 17:51:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 3/5] clk: qcom: camcc-sm8550: Add camera clock
 controller driver for SM8550
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-4-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601143430.5595-4-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 17:34, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to be
> able to request for camcc clocks on SM8550 platform.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since V2:
>   - No changes
> Changes since V1:
>   - Sorted the PLL names in proper order
>   - Updated all PLL configurations to lower case hex
>   - Reused evo ops instead of adding new ops for ole pll
>   - Moved few clocks to separate patch to fix patch too long error
> 
>   drivers/clk/qcom/Kconfig        |    7 +
>   drivers/clk/qcom/Makefile       |    1 +
>   drivers/clk/qcom/camcc-sm8550.c | 3405 +++++++++++++++++++++++++++++++
>   3 files changed, 3413 insertions(+)
>   create mode 100644 drivers/clk/qcom/camcc-sm8550.c
> 

[skipped]

> +
> +static struct platform_driver cam_cc_sm8550_driver = {
> +	.probe = cam_cc_sm8550_probe,
> +	.driver = {
> +		.name = "cam_cc-sm8550",
> +		.of_match_table = cam_cc_sm8550_match_table,
> +	},
> +};
> +
> +static int __init cam_cc_sm8550_init(void)
> +{
> +	return platform_driver_register(&cam_cc_sm8550_driver);
> +}
> +subsys_initcall(cam_cc_sm8550_init);
> +
> +static void __exit cam_cc_sm8550_exit(void)
> +{
> +	platform_driver_unregister(&cam_cc_sm8550_driver);
> +}
> +module_exit(cam_cc_sm8550_exit);

Please convert this to use module_platform_driver

> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8550 Driver");
> +MODULE_LICENSE("GPL");

-- 
With best wishes
Dmitry

