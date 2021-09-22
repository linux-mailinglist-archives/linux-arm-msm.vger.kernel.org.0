Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F4041536D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238270AbhIVW3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbhIVW3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:29:45 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEB4C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:28:14 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id a3so6825031oid.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ZRkBvdWF7yZwTSy1HdcrZR2c5qUNnFPnL0cFOvAzSk=;
        b=xBe6JgzgYjnhQMnisPIRHpkAieca/h10RVYK8ttmbzEFfVDXL1bDdNsdXUZtGV2U6J
         1h05EDaE7Y10i8PuBolq1Bj4qxyqGt/3zluyrEnZSOTHXE0T1aR7OgKmiefNc8J+kk8t
         P8OuMV64JjMS0feawJs/w0M6a4EBsQ2oMWlk1+tbon3DLE54ljzZtDUYxgYPslVVyQ5u
         8aJkJfu1x+ryga+XjK7ZEEa89cn5a4rjBBe2O7AKmEBgXeRiKJcE7UK7kP8l+IJS4H2w
         bkKwTP2+zxRVxvi2jc9sXpYZpKfE3c+F+A7eJ0S/eOI0nVflgb5tRyrTsCcKVvXlqwQ7
         1zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ZRkBvdWF7yZwTSy1HdcrZR2c5qUNnFPnL0cFOvAzSk=;
        b=lskhuS1uYqomHZsjZ7qU7xernUabZdp5ZWEj4p3n90aiuqtCGGzvQw7Apq8okeT0iu
         ghF4tqeQhes0nAl5xfQG83mBd78K7ZrB8L+vwtUlvuXOuJviqMCUzL7LnSY42JUmoYkq
         zkKuMLi2waxSrq8K5JnvzbstMC5/U/itSKkCjnxQBRr+RlCt+gVQgwA6bGeZQyHiUZGl
         Ht6YhT+/zFbw7X1eiAT17AYZAnXR1EjnwxYkXkEP5e8TiYF64U+Fr5gpLKalk08x8O9r
         vejEI1JF0CbNabMCKjgjQ7bvYaqZAot5ovRzKkz1q9R5dSUakzik/OiRn1ZR3oCV+UUx
         NxIQ==
X-Gm-Message-State: AOAM530IDcsoU3Wk9smLcgVgRZJOG28iU6ijhTdRlMXOlhNgJT4b8qDB
        RftOucPQQeU/hQ5puXfHD+D6cg==
X-Google-Smtp-Source: ABdhPJwbh0PcUbVLPvHF833PrupNxvgrdnDHKWdTYsHKVVBeL2hmWx5lzoLz1HQ6b+R65wzPeQ+4HA==
X-Received: by 2002:a54:4419:: with SMTP id k25mr10208120oiw.32.1632349694306;
        Wed, 22 Sep 2021 15:28:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z18sm888441oib.27.2021.09.22.15.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:28:13 -0700 (PDT)
Date:   Wed, 22 Sep 2021 17:28:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: smd-rpm: Add QCM2290 RPM clock support
Message-ID: <YUut/F2jTF20oh6f@builder.lan>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
 <20210917030434.19859-4-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917030434.19859-4-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Sep 22:04 CDT 2021, Shawn Guo wrote:

> Add support for RPM-managed clocks on the QCM2290 platform.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c         | 59 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h |  6 +++
>  include/linux/soc/qcom/smd-rpm.h       |  2 +
>  3 files changed, 67 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 8e16e4836424..0f896c7d4cfa 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1077,6 +1077,64 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>  	.num_clks = ARRAY_SIZE(sm6115_clks),
>  };
>  
> +/* QCM2290 */
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
> +
> +DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
> +DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
> +		   QCOM_SMD_RPM_MEM_CLK, 1);
> +DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
> +		   QCOM_SMD_RPM_MEM_CLK, 2);

Feels a little bit unnecessary to wrap these two lines.

That said, the patch looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +
> +static struct clk_smd_rpm *qcm2290_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
> +	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
> +	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
> +	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
> +	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
> +	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
> +	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
> +	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
> +	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
> +	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> +	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
> +	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
> +	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
> +	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
> +	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
> +	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
> +	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
> +	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
> +	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
> +	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> +	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
> +	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
> +	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> +	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
> +	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
> +	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
> +	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
> +	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
> +	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
> +	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
> +	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
> +	.clks = qcm2290_clks,
> +	.num_clks = ARRAY_SIZE(qcm2290_clks),
> +};
> +
>  static const struct of_device_id rpm_smd_clk_match_table[] = {
>  	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
>  	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
> @@ -1089,6 +1147,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
>  	{ .compatible = "qcom,rpmcc-msm8994", .data = &rpm_clk_msm8994 },
>  	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
>  	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
> +	{ .compatible = "qcom,rpmcc-qcm2290", .data = &rpm_clk_qcm2290 },
>  	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
>  	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
>  	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
> index aa834d516234..fb624ff39273 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -159,5 +159,11 @@
>  #define RPM_SMD_SNOC_PERIPH_A_CLK		113
>  #define RPM_SMD_SNOC_LPASS_CLK			114
>  #define RPM_SMD_SNOC_LPASS_A_CLK		115
> +#define RPM_SMD_HWKM_CLK			116
> +#define RPM_SMD_HWKM_A_CLK			117
> +#define RPM_SMD_PKA_CLK				118
> +#define RPM_SMD_PKA_A_CLK			119
> +#define RPM_SMD_CPUSS_GNOC_CLK			120
> +#define RPM_SMD_CPUSS_GNOC_A_CLK		121
>  
>  #endif
> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
> index 60e66fc9b6bf..860dd8cdf9f3 100644
> --- a/include/linux/soc/qcom/smd-rpm.h
> +++ b/include/linux/soc/qcom/smd-rpm.h
> @@ -38,6 +38,8 @@ struct qcom_smd_rpm;
>  #define QCOM_SMD_RPM_IPA_CLK	0x617069
>  #define QCOM_SMD_RPM_CE_CLK	0x6563
>  #define QCOM_SMD_RPM_AGGR_CLK	0x72676761
> +#define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
> +#define QCOM_SMD_RPM_PKA_CLK	0x616b70
>  
>  int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
>  		       int state,
> -- 
> 2.17.1
> 
