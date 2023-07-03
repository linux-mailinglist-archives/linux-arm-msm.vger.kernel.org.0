Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB6F745B54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjGCLi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjGCLi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:38:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7433510C1
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:38:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso6695071e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384319; x=1690976319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BO8GW8PeYymSXJGNiPjR8cSXwNY+2rR/6KhP5/MPo+o=;
        b=fxFXcpeC8LRGxAPMz6QoEUha2hXlbQjVDMIh+e8+vE+r3UlWD49J8OjJdOuHrQ68Wi
         PWQTHlnTHsV7BEkII7vt7tPcjaVjO0hQl4vtaAOgtpsit3mEh+90wrHaPOkoglep6JM+
         7+AnCstLdZ1qNsE5KH/g+Q1VSekZKPW6y44v3GqIe7XUdx2hkn02AdyU2fC7jQ8j8A3B
         0iq2WYZjdAf7xPgU/MDAvIifIZNU8pTXWX7/UcRmXoJ0u1mrlgZj6qxl4rlhMmilV78O
         TdxdWunJh27w0XAswIDudIyXd8wSNRB++qzdlswTBgO4obsJSCxdU3h7tij1NjPu2t1/
         APFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384319; x=1690976319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BO8GW8PeYymSXJGNiPjR8cSXwNY+2rR/6KhP5/MPo+o=;
        b=CEcnf1mao2978r7fJ4XZ6ML9vzTyIYJ1NYNJHvZV7kTOf4Oad5kPAN466FH8iH3w6Y
         OTrYqKE4C+LyD082SBteoyf37A67fZv3XNvOJv0UCiLbvTk7IcrojZ6WiDw75hvmpQsv
         7T/ruY8LhqdO687Xa1swppi3ZBSyzzzWolU+AUXWwpiH9N/aKy9zTptSMn0kkjpfiSO+
         WmsKY7zitNIf/+boB7vTRup7t14rsucnRG1VwfPwW3vw+27Upo+aJ5mzpErvxYlla9n9
         KEx5xqcISxiGppDRY59Ynk0J2VpZEIe96iujw9n0eTAihOaD8sxrP2XQiqSqSLVxg8Ll
         7S2w==
X-Gm-Message-State: ABy/qLY37ZwJJ5M78jMm66owoq/ycrCMPKroOKG0ewc3owq4ArR+f6/B
        fuL/py/cv+d26N9T2fLP1Lm2PA==
X-Google-Smtp-Source: APBJJlHrYCVB+3i7lJ9HYb6fhELg1/YT98vWg8MshIY9zPGzBkRDNO9tqdVAydtuDp2A9Z4K+g7Dzg==
X-Received: by 2002:a05:6512:3691:b0:4f6:1b45:e8aa with SMTP id d17-20020a056512369100b004f61b45e8aamr6330115lfs.50.1688384318648;
        Mon, 03 Jul 2023 04:38:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id f9-20020a19ae09000000b004fbb3e91a3fsm498698lfc.114.2023.07.03.04.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:38:38 -0700 (PDT)
Message-ID: <1c3b0363-f222-7b90-4583-a12261c19a52@linaro.org>
Date:   Mon, 3 Jul 2023 13:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/8] cpufreq: qcom-nvmem: provide vmin constraint for
 early Kraits
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
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
 <20230702175045.122041-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702175045.122041-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 2.07.2023 19:50, Dmitry Baryshkov wrote:
> Early Krait CPUs required that core voltage was not below 1.15 V.
> Implement this requirement by adding separate config_regulators
> callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
"early krait" as in msm8960, or "early krait" as in "pre-production"?

Konrad
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 67 +++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 113f35668048..9312c8ab62a8 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -30,6 +30,8 @@
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/smem.h>
>  
> +#include <asm/cputype.h>
> +
>  #include <dt-bindings/arm/qcom,ids.h>
>  
>  struct qcom_cpufreq_drv;
> @@ -257,6 +259,66 @@ static const struct qcom_cpufreq_match_data match_data_apq8064 = {
>  	.regulator_names = apq8064_regulator_names,
>  };
>  
> +static const int krait_needs_vmin(void)
> +{
> +	switch (read_cpuid_id()) {
> +	case 0x511F04D0: /* KR28M2A20 */
> +	case 0x511F04D1: /* KR28M2A21 */
> +	case 0x510F06F0: /* KR28M4A10 */
> +		return 1;
> +	default:
> +		return 0;
> +	};
> +}
> +
> +#define KRAIT_VMIN	1150000
> +#define KRAIT_VMIN_MAX	(KRAIT_VMIN + 25000)
> +static int krait_config_regulator_vmin(struct device *dev,
> +				       struct dev_pm_opp *old_opp, struct dev_pm_opp *new_opp,
> +				       struct regulator **regulators, unsigned int count)
> +{
> +	struct regulator *reg = regulators[0];
> +	struct dev_pm_opp_supply supply;
> +	int ret;
> +
> +	/* This function only supports single regulator per device */
> +	if (WARN_ON(count > 1)) {
> +		dev_err(dev, "multiple regulators are not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (IS_ERR(reg)) {
> +		dev_dbg(dev, "%s: regulator not available: %ld\n", __func__,
> +			PTR_ERR(reg));
> +		return 0;
> +	}
> +
> +	ret = dev_pm_opp_get_supplies(new_opp, &supply);
> +	if (WARN_ON(ret))
> +		return ret;
> +
> +	if (supply.u_volt_min < KRAIT_VMIN) {
> +		supply.u_volt_min = KRAIT_VMIN;
> +		supply.u_volt = KRAIT_VMIN;
> +		supply.u_volt_max = KRAIT_VMIN_MAX;
> +	}
> +
> +	dev_dbg(dev, "%s: voltages (mV): %lu %lu %lu\n", __func__,
> +		supply.u_volt_min, supply.u_volt, supply.u_volt_max);
> +
> +	ret = regulator_set_voltage_triplet(reg,
> +					    supply.u_volt_min,
> +					    supply.u_volt,
> +					    supply.u_volt_max);
> +	if (ret)
> +		dev_err(dev, "%s: failed to set voltage (%lu %lu %lu mV): %d\n",
> +			__func__, supply.u_volt_min, supply.u_volt,
> +			supply.u_volt_max, ret);
> +
> +	return ret;
> +}
> +
> +
>  static int qcom_cpufreq_probe(struct platform_device *pdev)
>  {
>  	struct qcom_cpufreq_drv *drv;
> @@ -344,8 +406,11 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>  			config.virt_devs = NULL;
>  		}
>  
> -		if (drv->data->regulator_names)
> +		if (drv->data->regulator_names) {
>  			config.regulator_names = drv->data->regulator_names;
> +			if (krait_needs_vmin())
> +				config.config_regulators = krait_config_regulator_vmin;
> +		}
>  
>  		if (config.supported_hw ||
>  		    config.genpd_names ||
