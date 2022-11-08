Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6AD621BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 19:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiKHS1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 13:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiKHS1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 13:27:38 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2851A3B3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 10:27:37 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id p184so12119803iof.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 10:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jf9WajsSrjJ+WBtuoM/CpRnwctyi+9OwrkPgKP+pwEs=;
        b=TQ6GCM2ZX3ATNDOT1a3PVgvZMVBdxJafFMx8wGqde06tEytrAox7rS8LG5d092Pe44
         p1C4VNGKKKeNwC3dvgOUUFSy67+N8PBrntcWv6hZwEfll8Esox+En7rKccC88K0NkbqH
         Jpwdv+MDM3k/WuztnZnjCOONej93KjlplrZWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf9WajsSrjJ+WBtuoM/CpRnwctyi+9OwrkPgKP+pwEs=;
        b=w6eQZW8ATYNGFwClxnfBr0R6SaNae5RJkbfND/UAMVQr8/E2emPKh6SfXRGelfREV5
         7+lQnYlrZ4nVuBA0rGuJM2LC3cTE9KfuXE8IDl1R/Qphl9NkPqRWq7YJMuzjxwaP7WIi
         NMePp5WtMy0McV6K7La2DAgIVADW3wmwn42kitZv62mUtgBr030E1/VS2t5vl1Gk2o1y
         zwHZ/YTYEbTTSoVLa3qik72zBYn7wod2iJfjfFuFMnJ5j38rAlPm6TFICyHdELw/qU0k
         v0hJzR35j9/cFJVjS5sNafnt4F24WaCleuVu3zAcr2qoQ0xgPQrRH9FmWi1TP3YChNSo
         rQHw==
X-Gm-Message-State: ACrzQf3kPN4BPCmhWBnGtwjOzxH5d5NEBNXIwVMa3wNdHW+p/m366q/5
        82a3yaKwF3uk1yFDdVTxFN5Yed35lSdq7g==
X-Google-Smtp-Source: AMsMyM4wQ+H9Ug7agqUznRjmIm264rk28jmElmlQ86/RFNioHxizEbgv6+UCugSdMK5ZPgNbYj0cAA==
X-Received: by 2002:a02:cc71:0:b0:373:1604:274d with SMTP id j17-20020a02cc71000000b003731604274dmr32211390jaq.119.1667932057170;
        Tue, 08 Nov 2022 10:27:37 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id f24-20020a056638113800b0036371872137sm4022229jar.11.2022.11.08.10.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:27:36 -0800 (PST)
Date:   Tue, 8 Nov 2022 18:27:36 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org, johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] cpufreq: qcom-hw: Add CPU clock provider support
Message-ID: <Y2qfmFVK665b1Nbw@google.com>
References: <20221108154037.111794-1-manivannan.sadhasivam@linaro.org>
 <20221108154037.111794-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221108154037.111794-4-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 08, 2022 at 09:10:37PM +0530, Manivannan Sadhasivam wrote:
> Qcom CPUFreq hardware (EPSS/OSM) controls clock and voltage to the CPU
> cores. But this relationship is not represented with the clk framework
> so far.
> 
> So, let's make the qcom-cpufreq-hw driver a clock provider. This makes the
> clock producer/consumer relationship cleaner and is also useful for CPU
> related frameworks like OPP to know the frequency at which the CPUs are
> running.
> 
> The clock frequency provided by the driver is for each frequency domain.
> We cannot get the frequency of each CPU core because, not all platforms
> support per-core DCVS feature.
> 
> Also the frequency supplied by the driver is the actual frequency that
> comes out of the EPSS/OSM block after the DCVS operation. This frequency is
> not same as what the CPUFreq framework has set but it is the one that gets
> supplied to the CPUs after throttling by LMh.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 43 +++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 5e0598730a04..86bb11de347f 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
>  #include <linux/cpufreq.h>
>  #include <linux/init.h>
>  #include <linux/interconnect.h>
> @@ -54,6 +55,7 @@ struct qcom_cpufreq_data {
>  	bool cancel_throttle;
>  	struct delayed_work throttle_work;
>  	struct cpufreq_policy *policy;
> +	struct clk_hw cpu_clk;
>  
>  	bool per_core_dcvs;
>  
> @@ -615,8 +617,20 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
>  	.ready		= qcom_cpufreq_ready,
>  };
>  
> +static unsigned long qcom_cpufreq_hw_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct qcom_cpufreq_data *data = container_of(hw, struct qcom_cpufreq_data, cpu_clk);
> +
> +	return qcom_lmh_get_throttle_freq(data);
> +}
> +
> +static const struct clk_ops qcom_cpufreq_hw_clk_ops = {
> +	.recalc_rate = qcom_cpufreq_hw_recalc_rate,
> +};
> +
>  static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>  {
> +	struct clk_hw_onecell_data *clk_data;
>  	struct device *dev = &pdev->dev;
>  	struct device *cpu_dev;
>  	struct clk *clk;
> @@ -659,8 +673,16 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>  
>  	qcom_cpufreq.soc_data = of_device_get_match_data(dev);
>  
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_domains), GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = num_domains;
> +
>  	for (i = 0; i < num_domains; i++) {
>  		struct qcom_cpufreq_data *data = &qcom_cpufreq.data[i];
> +		struct clk_init_data init = {};
> +		const char *clk_name;
>  		struct resource *res;
>  		void __iomem *base;
>  
> @@ -672,6 +694,27 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>  
>  		data->base = base;
>  		data->res = res;
> +
> +		/* Register CPU clock for each frequency domain */
> +		clk_name = devm_kasprintf(dev, GFP_KERNEL, "qcom_cpufreq%d", i);
> +		init.name = clk_name;

nit: 'clk_name' isn't really needed, the result of devm_kasprintf() could be
assigned directly to 'init.name'. 'init' could be renamed to 'clk_init' if
the purpose of using 'clk_name' is to make clear that this is the name of a
clock.

> +		init.flags = CLK_GET_RATE_NOCACHE;
> +		init.ops = &qcom_cpufreq_hw_clk_ops;
> +		data->cpu_clk.init = &init;
> +
> +		ret = devm_clk_hw_register(dev, &data->cpu_clk);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to register Qcom CPUFreq clock\n");
> +			return ret;
> +		}
> +
> +		clk_data->hws[i] = &data->cpu_clk;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to add Qcom CPUFreq clock provider\n");
> +		return ret;
>  	}
>  
>  	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
> -- 
> 2.25.1
> 
