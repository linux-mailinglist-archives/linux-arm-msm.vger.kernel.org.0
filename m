Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F245689B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiGFNjo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiGFNjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:39:44 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66365248E1
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 06:39:43 -0700 (PDT)
Received: from [192.168.1.101] (abxi46.neoplus.adsl.tpnet.pl [83.9.2.46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 67DFE3F672;
        Wed,  6 Jul 2022 15:39:41 +0200 (CEST)
Message-ID: <42c4fa2b-8ae8-6189-4f00-d44ba0668077@somainline.org>
Date:   Wed, 6 Jul 2022 15:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] ARM: mach-qcom: Add support for MSM8909
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
 <20220705143523.3390944-9-stephan.gerhold@kernkonzept.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220705143523.3390944-9-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.07.2022 16:35, Stephan Gerhold wrote:
> Add a Kconfig entry for MSM8909 and the "qcom,msm8909-smp" CPU
> enable-method. The ARM Cortex-A7 cores are booted just like on MSM8226.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/mach-qcom/Kconfig   | 4 ++++
>  arch/arm/mach-qcom/platsmp.c | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
> index 109e126f7271..12a812e61c16 100644
> --- a/arch/arm/mach-qcom/Kconfig
> +++ b/arch/arm/mach-qcom/Kconfig
> @@ -20,6 +20,10 @@ config ARCH_MSM8X60
>  	bool "Enable support for MSM8X60"
>  	select CLKSRC_QCOM
>  
> +config ARCH_MSM8909
> +	bool "Enable support for MSM8909"
> +	select HAVE_ARM_ARCH_TIMER
> +
>  config ARCH_MSM8916
>  	bool "Enable support for MSM8916"
>  	select HAVE_ARM_ARCH_TIMER
> diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
> index 65a0d5ce2bb3..5d2f386a46d8 100644
> --- a/arch/arm/mach-qcom/platsmp.c
> +++ b/arch/arm/mach-qcom/platsmp.c
> @@ -384,6 +384,7 @@ static const struct smp_operations qcom_smp_cortex_a7_ops __initconst = {
>  #endif
>  };
>  CPU_METHOD_OF_DECLARE(qcom_smp_msm8226, "qcom,msm8226-smp", &qcom_smp_cortex_a7_ops);
> +CPU_METHOD_OF_DECLARE(qcom_smp_msm8909, "qcom,msm8909-smp", &qcom_smp_cortex_a7_ops);
>  CPU_METHOD_OF_DECLARE(qcom_smp_msm8916, "qcom,msm8916-smp", &qcom_smp_cortex_a7_ops);
>  
>  static const struct smp_operations qcom_smp_kpssv1_ops __initconst = {
> 
