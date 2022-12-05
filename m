Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8B7642E41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbiLERFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbiLERFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:05:35 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEA2186D5
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:05:33 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n188so7955953iof.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLIv5gleQ/glwEt6mrlIwumK9QCinCgjLM/5+DdV0ZI=;
        b=R0O1TVsTvyEbs0EGly7kWJjGVLn2qRyS6AUvoILoEdzgGv0sgocoPuRp2XMdNar+oh
         1XRSXPAiHVSaVawF7zyxQ/Ozedak9A/d4Dsk5J7YTtGCIDSM3npMpnu7Lqr0yGFIda/B
         ZIcZMRx16hl6b2YxZNDuLXVMZXVYXAbwN1sKsQfEoUijjWzK9Sk922hIUcjuBubipHy/
         pzSVza+bjif4DIS7y9F2nKUMoS56O7tUAHc8ZQXo3ZS+BpstdrKIzdTgDW5bi1y8/j/s
         csm2Xn7UgcdWQVnlR9HHntdjzU6miLgaMKHZz63UwUfs0QPsCoy9Ow6264HI1rR0snWt
         /61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLIv5gleQ/glwEt6mrlIwumK9QCinCgjLM/5+DdV0ZI=;
        b=sXvkm1ueu06qMql90JaNqFKib8MVQr+8DFGtIMJ3w3e34czUn59M+255e5F9soqTpP
         WAicqCDDg/ceXJ8ZhXuO6Vh11sSvvX/LZY3Mnrq+ZTv4jEunG31A1yjslRN95zuFka1G
         dPl2pANgNdGIUL20y/gKuOOnUWub8SWqejkkdWx0T9nmv0DdyW+PtTUkuwt/M6/cSXDc
         gK/Zenazbihy1VdZh8qn3+mdGVdCdGH7nV7JMDrJBiOIaz+DcUhCuHU/Eb2aLDqi67Lq
         E13ftpdnf3pgrwSOyG5QRVhidhRLorY8XlM5Z1QsR2t1NCljcgoy18NtU6HN1YiOsuPw
         ALcQ==
X-Gm-Message-State: ANoB5pm0+OFA19QhdplozXkYRtkVWcTu4+E3IIesNYJ76p2kTtbrVFR0
        A0VZFO+m68EoPKZ6Yq+F3FHuVg==
X-Google-Smtp-Source: AA0mqf5FohwaQ2KNVQb9sHWBo6y/2yCIkPUjiAczhrcsM0nJLzOwzds/maEno0KKC+AREG+am7LFew==
X-Received: by 2002:a6b:cd89:0:b0:6d6:d016:b607 with SMTP id d131-20020a6bcd89000000b006d6d016b607mr30066918iog.70.1670259932672;
        Mon, 05 Dec 2022 09:05:32 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id s5-20020a056602168500b006bbfb3856d6sm6023305iow.5.2022.12.05.09.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:05:32 -0800 (PST)
Message-ID: <a0070b53-3a83-1efc-ebfd-677f966c29bd@linaro.org>
Date:   Mon, 5 Dec 2022 11:05:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 15/16] clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-16-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> Add special macro for the clocks of QCOM_SMD_RPM_BUS_CLK type. Use it to
> insert the _bus_N part into the clock symbol name. The system (and
> userspace) name of these clocks remains intact.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Once again you're passing "empty" arguments to macros, which I
really don't like.  Can you please try to do two variants, one
which takes something in that "empty" spot and another that
doesn't?  For example, here you could just add a new macro,
__DEFINE_CLK_SMD_RPM_PREFIX() that takes the additional argument.

I suppose this could get messy (with duplication).  Another
alternative would be to have the existing macro call the new
"prefix" one, but have that be the *only* place an empty value
is passed as the argument.  And add a comment calling attention
to/explaining that.  Maybe even put /* empty */ there.

					-Alex

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 253 +++++++++++++++++----------------
>   1 file changed, 129 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index f407acb3c6d3..b37e5d883a10 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -25,13 +25,13 @@
>   #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>   #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>   
> -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
> -	static struct clk_smd_rpm _platform##_##_active;		      \
> -	static struct clk_smd_rpm _platform##_##_name = {		      \
> +#define __DEFINE_CLK_SMD_RPM(_platform, _prefix, _name, _active, type, r_id, key)      \
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
> @@ -43,12 +43,12 @@
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
> @@ -101,11 +101,16 @@
>   	}
>   
>   #define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk, _name##_a_clk, type, r_id,   \
> +		QCOM_RPM_SMD_KEY_RATE)
> +
> +#define DEFINE_CLK_SMD_RPM_BUS(_platform, _name, r_id)			      \
> +		__DEFINE_CLK_SMD_RPM(_platform, bus_##r_id##_,		      \
> +		_name##_clk, _name##_a_clk, QCOM_SMD_RPM_BUS_CLK, r_id,	      \
>   		QCOM_RPM_SMD_KEY_RATE)
>   
>   #define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk_src, _name##_a_clk_src, type, r_id,   \
> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk_src, _name##_a_clk_src, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_RATE)
>   
>   #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	      \
> @@ -117,7 +122,7 @@
>   		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>   
>   #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		      \
> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_id,   \
> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk, _name##_a_clk, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_STATE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
> @@ -435,15 +440,15 @@ DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
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
> @@ -493,10 +498,10 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
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
> @@ -527,10 +532,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
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
> @@ -559,14 +564,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
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
> @@ -593,14 +598,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
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
> @@ -645,14 +650,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
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
> @@ -679,18 +684,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
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
> @@ -709,8 +714,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
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
> @@ -737,18 +742,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
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
> @@ -767,8 +772,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
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
> @@ -795,12 +800,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
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
> @@ -849,10 +854,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
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
> @@ -879,12 +884,12 @@ static struct clk_smd_rpm *msm8998_clks[] = {
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
> @@ -937,12 +942,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
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
> @@ -983,8 +988,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
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
> @@ -1005,16 +1010,16 @@ static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
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
> @@ -1041,8 +1046,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8953 = {
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
> @@ -1051,8 +1056,8 @@ static struct clk_smd_rpm *sm6125_clks[] = {
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
> @@ -1069,10 +1074,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
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
> @@ -1084,8 +1089,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
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
> @@ -1094,8 +1099,8 @@ static struct clk_smd_rpm *sm6115_clks[] = {
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
> @@ -1106,10 +1111,10 @@ static struct clk_smd_rpm *sm6115_clks[] = {
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
> @@ -1124,14 +1129,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
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
> @@ -1140,10 +1145,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
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
> @@ -1161,8 +1166,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
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
> @@ -1171,8 +1176,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
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
> @@ -1181,10 +1186,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
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

