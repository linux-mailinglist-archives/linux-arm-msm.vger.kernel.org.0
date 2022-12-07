Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B19645B56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLGNtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiLGNtD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:49:03 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF89B5B5A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:49:00 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id g7so4816419qts.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEqa8uF4ZaOX6jBLDsUWgIz3mGNsoPVMaTKikJAl5O4=;
        b=clQhNwvMLLENJhf81QvYxFDSzemD8aG09xqPaj/0/JD73jp9IpShkNiPT0WlUWDv7F
         eKPqjGn45vH9FwrOAYEtHm+ccKb1IFk/QfCXc0yxPEPY9otYfQfXOk/6A3L3lrwBOxyK
         RWc6kCFuv7wicNeZVy+q+1bSbhtdhbape5U4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEqa8uF4ZaOX6jBLDsUWgIz3mGNsoPVMaTKikJAl5O4=;
        b=i77pBGa72y/4wGpMtxIQ8I2pA+sFEaNjELkjKiBg9jSr5VwYFQRTvsVXe2ZL6PNJvx
         kfBr7lyFYitCSLmlLWiReL+PSXTZ32CtJnkZVsoOKWrsDjq1EUqO5Z7Jn4zZj6bMt2H1
         uxJ3rADokMzwwIQoem0Cxrwcq7h9xBKLxcmZtpvZaXSUZcO7bT8SSlve1Ia6dIs4uSjC
         +WqhJQ6Jw5ujXoutlpV2J2cerM7VXdK5WhTA14TcR6mC4EuKIBSmgcmbKfP7K+Nab7UX
         RwTcb3zXntw/355OtzlDOjLK7WUVtzh9pfPjdcMFy6xOt5Yv9jNX3KkrePBGA+gIP+/h
         n/lA==
X-Gm-Message-State: ANoB5plpKJSzoNdcK13drXknHQ8UsDXmhSLBP0njqa2TbUluNnOlCISL
        OzdVANuO0BpLd+tyGlu0/eivMA==
X-Google-Smtp-Source: AA0mqf4zUKY9/HRjQX/gDaNBZCf6+JT11KFZljiTdX/zsWK6JyzYB3cpkzGWEoL4q/cyQN1r95R1iA==
X-Received: by 2002:a05:622a:250a:b0:3a5:eb38:ab59 with SMTP id cm10-20020a05622a250a00b003a5eb38ab59mr67859052qtb.246.1670420940211;
        Wed, 07 Dec 2022 05:49:00 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v15-20020a05620a440f00b006fc2b672950sm17906260qkp.37.2022.12.07.05.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:59 -0800 (PST)
Message-ID: <ae8ae70c-5bfe-d296-e7ba-25ac3714a486@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 17/18] clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-18-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-18-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/6/22 6:15 PM, Dmitry Baryshkov wrote:
> Add special macro for the clocks of QCOM_SMD_RPM_BUS_CLK type. Use it to
> insert the _bus_N part into the clock symbol name. The system (and
> userspace) name of these clocks remains intact.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

I believe this means I've marked the entire series reviewed.
If I've missed something, please point it out and I'll look
again.

Thank you for implementing this cleanup series, I think it
improves the readability and maintainability of this code.

					-Alex

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 252 +++++++++++++++++----------------
>   1 file changed, 131 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 4db92d2d91b8..b8e649a6a76c 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -25,13 +25,14 @@
>   #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>   #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>   
> -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
> -	static struct clk_smd_rpm _platform##_##_active;		      \
> -	static struct clk_smd_rpm _platform##_##_name = {		      \
> +#define __DEFINE_CLK_SMD_RPM_PREFIX(_platform, _prefix, _name, _active,	      \
> +				    type, r_id, key)			      \
> +	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
> +	static struct clk_smd_rpm _platform##_##_prefix##_name = {	      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
>   		.rpm_key = (key),					      \
> -		.peer = &_platform##_##_active,				      \
> +		.peer = &_platform##_##_prefix##_active,		      \
>   		.rate = INT_MAX,					      \
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
> @@ -43,12 +44,12 @@
>   			.num_parents = 1,				      \
>   		},							      \
>   	};								      \
> -	static struct clk_smd_rpm _platform##_##_active = {		      \
> +	static struct clk_smd_rpm _platform##_##_prefix##_active = {	      \
>   		.rpm_res_type = (type),					      \
>   		.rpm_clk_id = (r_id),					      \
>   		.active_only = true,					      \
>   		.rpm_key = (key),					      \
> -		.peer = &_platform##_##_name,				      \
> +		.peer = &_platform##_##_prefix##_name,			      \
>   		.rate = INT_MAX,					      \
>   		.hw.init = &(struct clk_init_data){			      \
>   			.ops = &clk_smd_rpm_ops,			      \
> @@ -61,6 +62,10 @@
>   		},							      \
>   	}
>   
> +#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
> +	__DEFINE_CLK_SMD_RPM_PREFIX(_platform, /* empty */, _name, _active,   \
> +				    type, r_id, key)
> +
>   #define __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix, _name, _active,\
>   					   type, r_id, r, key)		      \
>   	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
> @@ -109,6 +114,11 @@
>   		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk,   \
>   		type, r_id, QCOM_RPM_SMD_KEY_RATE)
>   
> +#define DEFINE_CLK_SMD_RPM_BUS(_platform, _name, r_id)			      \
> +		__DEFINE_CLK_SMD_RPM_PREFIX(_platform, bus_##r_id##_,	      \
> +		_name##_clk, _name##_a_clk, QCOM_SMD_RPM_BUS_CLK, r_id,	      \
> +		QCOM_RPM_SMD_KEY_RATE)
> +
>   #define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
>   		__DEFINE_CLK_SMD_RPM(_platform,				      \
>   		_name##_clk_src, _name##_a_clk_src,			      \
> @@ -442,15 +452,15 @@ DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
>   DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
>   
> -DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
> -DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
> +DEFINE_CLK_SMD_RPM_BUS(msm8916, pcnoc, 0);
> +DEFINE_CLK_SMD_RPM_BUS(msm8916, snoc, 1);
> +DEFINE_CLK_SMD_RPM_BUS(msm8936, sysmmnoc, 2);
> +DEFINE_CLK_SMD_RPM_BUS(msm8974, cnoc, 2);
> +DEFINE_CLK_SMD_RPM_BUS(msm8974, mmssnoc_ahb, 3);
> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_periph, 0);
> +DEFINE_CLK_SMD_RPM_BUS(sm6125, cnoc, 1);
> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc, 2);
> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_lpass, 5);
>   
>   DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
> @@ -500,10 +510,10 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
>   
>   static struct clk_smd_rpm *msm8909_clks[] = {
> -	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
>   	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
> @@ -534,10 +544,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
>   };
>   
>   static struct clk_smd_rpm *msm8916_clks[] = {
> -	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
> @@ -566,14 +576,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
>   };
>   
>   static struct clk_smd_rpm *msm8936_clks[] = {
> -	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
> -	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
> -	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
>   	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
>   	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
> @@ -600,14 +610,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
>   };
>   
>   static struct clk_smd_rpm *msm8974_clks[] = {
> -	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> -	[RPM_SMD_CNOC_CLK]		= &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK]		= &msm8974_cnoc_a_clk,
> -	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
> -	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
> +	[RPM_SMD_PNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
> +	[RPM_SMD_CNOC_CLK]		= &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK]		= &msm8974_bus_2_cnoc_a_clk,
> +	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_bus_3_mmssnoc_ahb_clk,
> +	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_bus_3_mmssnoc_ahb_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
>   	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
> @@ -652,14 +662,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
>   static struct clk_smd_rpm *msm8976_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
> -	[RPM_SMD_SYSMMNOC_CLK]	= &msm8936_sysmmnoc_clk,
> -	[RPM_SMD_SYSMMNOC_A_CLK] = &msm8936_sysmmnoc_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]	= &msm8936_bus_2_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK] = &msm8936_bus_2_sysmmnoc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
>   	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
> @@ -686,18 +696,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
>   static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
>   	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
>   	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
>   	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
>   	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
>   	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
>   	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> @@ -716,8 +726,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>   	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
> -	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
> -	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
> +	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
> +	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
>   	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
>   	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
> @@ -744,18 +754,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
>   static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
>   	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
>   	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
>   	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
>   	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
>   	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
>   	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> @@ -774,8 +784,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>   	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
> -	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
> -	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
> +	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_bus_3_mmssnoc_ahb_clk,
> +	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_bus_3_mmssnoc_ahb_a_clk,
>   	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_branch_mss_cfg_ahb_clk,
>   	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_branch_mss_cfg_ahb_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
> @@ -802,12 +812,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
>   };
>   
>   static struct clk_smd_rpm *msm8996_clks[] = {
> -	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
> @@ -856,10 +866,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
>   static struct clk_smd_rpm *qcs404_clks[] = {
>   	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
> -	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> +	[RPM_SMD_PNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
> @@ -886,12 +896,12 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
> -	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> @@ -944,12 +954,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
>   static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
> -	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_pcnoc_clk,
> -	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &msm8916_bus_1_snoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &msm8974_bus_2_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &msm8974_bus_2_cnoc_a_clk,
> +	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_bus_0_pcnoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_MMSSNOC_AXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
> @@ -990,8 +1000,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
>   static struct clk_smd_rpm *mdm9607_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
>   	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
> @@ -1012,16 +1022,16 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
>   static struct clk_smd_rpm *msm8953_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC]		= &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> -	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> -	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_bus_0_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_bus_0_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_bus_1_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_bus_1_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
>   	[RPM_SMD_IPA_CLK]		= &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK]		= &msm8976_ipa_a_clk,
> -	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
> -	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_bus_2_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_bus_2_sysmmnoc_a_clk,
>   	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
>   	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
> @@ -1048,8 +1058,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
>   static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
> @@ -1058,8 +1068,8 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
>   	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
> -	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
> @@ -1076,10 +1086,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
>   	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
>   	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
>   	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
> -	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
> -	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
> -	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> -	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
> +	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
> +	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
> +	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
> +	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
>   };
>   
>   static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
> @@ -1091,8 +1101,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
>   static struct clk_smd_rpm *sm6115_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
> @@ -1101,8 +1111,8 @@ static struct clk_smd_rpm *sm6115_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
>   	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
> -	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
> @@ -1113,10 +1123,10 @@ static struct clk_smd_rpm *sm6115_clks[] = {
>   	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
>   	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
>   	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
> -	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
> -	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
> -	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> -	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
> +	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
> +	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
> +	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
> +	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
>   	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
>   	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
>   	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
> @@ -1131,14 +1141,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   static struct clk_smd_rpm *sm6375_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
> -	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
> @@ -1147,10 +1157,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
>   	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
>   	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
>   	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
> -	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
> -	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
> -	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> -	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
> +	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
> +	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
> +	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
> +	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
> @@ -1168,8 +1178,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_XO_CLK_SRC] = &sdm660_branch_bi_tcxo,
>   	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_branch_bi_tcxo_a,
> -	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
> -	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
> +	[RPM_SMD_SNOC_CLK] = &sm6125_bus_2_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK] = &sm6125_bus_2_snoc_a_clk,
>   	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_branch_qdss_clk,
> @@ -1178,8 +1188,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
>   	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
> -	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
> -	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
> +	[RPM_SMD_CNOC_CLK] = &sm6125_bus_1_cnoc_clk,
> +	[RPM_SMD_CNOC_A_CLK] = &sm6125_bus_1_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
> @@ -1188,10 +1198,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
>   	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
>   	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
> -	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
> -	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
> -	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> -	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
> +	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_bus_0_snoc_periph_clk,
> +	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_bus_0_snoc_periph_a_clk,
> +	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_bus_5_snoc_lpass_clk,
> +	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_bus_5_snoc_lpass_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,

