Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B8063C0FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbiK2N1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiK2N1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:27:14 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3163E627D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:27:11 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z24so16939288ljn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0/4GldyIkyXC8BPndNpKFb+Jlf3+4uttKpd2qBXCWU=;
        b=gL6AcRDeA53DKqjJWhBuVEBabSSFNhDckXgSaNf8mLUTXqJBkOtRW7KUIhwFJTzW7U
         yn48mQ8s/+hyIhB3dHnsMB1ycgCCFUWnnGfT5pys2nLANurjXfXFznpnpDvm6j0QKAKM
         yF4dhoySiXbf5H9M9bw//eTn5HbrScQTkk5HBMgr8XUed2pWOKfrqIeSqbWpzxa6ZE3n
         PDb76ipODrDfJkEUGDbFrOXusgwMjhosNGbXRIR0oiPd31RvKodxpGjEUR0dK4HiDPxe
         ZHByGHgGMTp35Dgc7PDqWwdJ/KjheSw/D2KhN1EB/ynWqbZxXMyEGC28eKgZ291tH5fl
         zv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0/4GldyIkyXC8BPndNpKFb+Jlf3+4uttKpd2qBXCWU=;
        b=kGdTyOb4leovYb93YNB8CcvpThd+qNU8MzqJz0foaiOg/ST2ju8BmbKFPCaC3e4D7y
         IKo1HFvif43j26YV3IyXQl5xce2vOD/sTKGI9yU/IaOPuFvFfltwoeB8yxjBlIqX9WSU
         M3qRKDHxmSBkK2ZN/vSdAGF69sGQRXJsrlJXFVD6h6cxQBYakHUAr4olxCB+JUYsIKie
         5U5F7ztPiZEwtNamJ2TiNrx0w9KYEHg+D3bd8UYwSbyXaip0NSRgRXvFfOKJmdxQ/8vP
         HK8G6hqLE7Lu5wxYYdYyqHah2j6Gx9joWiKlCzxMzWbhsrDbRloZnES8OaICfkZo6O4q
         3YGA==
X-Gm-Message-State: ANoB5pn9/Mlt3pq0kUXWH3sneB/0dtg7gXx9iFJW5LdsurdALfwW71aL
        SHpVucjLMbzThZqQ7aGLzanSFw==
X-Google-Smtp-Source: AA0mqf513KxZoSpJY8P2yLcVjNwwX9LPYlpTeyow8fOhJv+AfePPj7x/5cUEulkaV/B1IZ20cy4sDw==
X-Received: by 2002:ac2:4209:0:b0:499:f8e4:6dd0 with SMTP id y9-20020ac24209000000b00499f8e46dd0mr19896075lfh.162.1669728429357;
        Tue, 29 Nov 2022 05:27:09 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id u8-20020a05651220c800b004a62ff61b3dsm2210767lfr.252.2022.11.29.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:27:08 -0800 (PST)
Message-ID: <2f9ffe88-7234-8eb4-a421-3135882e38d1@linaro.org>
Date:   Tue, 29 Nov 2022 14:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] clk: qcom: rpmh: drop the platform from clock
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129101025.960110-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 29.11.2022 11:10, Dmitry Baryshkov wrote:
> A single clock definition can be used on different platforms. Thus the
> platform part of the clock name is not correct (and can be misleading).
> 
> Remove the platform-specific part of the defined clock. To keep the name
> visible to the userspace add an extra optional 'suffix' argument which
> is used to distinguish similar clocks in the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 396 ++++++++++++++++++------------------
>  1 file changed, 198 insertions(+), 198 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c4852bbd00bf..513c3a025f4b 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>  
>  static DEFINE_MUTEX(rpmh_clk_lock);
>  
> -#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define __DEFINE_CLK_RPMH(_name, _name_active, _suffix,	_res_name,	\
>  			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_name_active;		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix;	\
> +	static struct clk_rpmh clk_rpmh_##_name ## _suffix = {		\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
>  		.div = _div,						\
> -		.peer = &_platform##_##_name_active,			\
> +		.peer = &clk_rpmh_##_name_active ## _suffix,		\
>  		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>  				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>  				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> -	static struct clk_rpmh _platform##_##_name_active = {		\
> +	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix = {	\
>  		.res_name = _res_name,					\
>  		.res_addr = _res_en_offset,				\
>  		.res_on_val = _res_on,					\
>  		.div = _div,						\
> -		.peer = &_platform##_##_name,				\
> +		.peer = &clk_rpmh_##_name ## _suffix,			\
>  		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>  					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>  		.hw.init = &(struct clk_init_data){			\
> @@ -111,18 +111,18 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		},							\
>  	}
>  
> -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_ARC(_name, _name_active, _suffix, _res_name,	\
>  			    _res_on, _div)				\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +	__DEFINE_CLK_RPMH(_name, _name_active,_suffix, _res_name,	\
>  			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>  
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
> -				_div)					\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_VRM(_name, _name_active, _suffix, _res_name,	\
> +			    _div)					\
> +	__DEFINE_CLK_RPMH(_name, _name_active, _suffix, _res_name,	\
>  			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>  
> -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> +	static struct clk_rpmh clk_rpmh_##_name = {			\
>  		.res_name = _res_name,					\
>  		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>  		.div = 1,						\
> @@ -342,55 +342,55 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>  };
>  
>  /* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div1, "xo.lvl", 0x3, 1);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div2, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div4,  "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(qlink, qlink_ao,, "qphy.lvl", 0x1, 4);
',,' looks very "eeeh", maybe a "" would be more fitting?

Konrad

>  
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, , "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, , "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, , "lnbclka3", 2);
>  
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, _a4, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _a4, "lnbclka2", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _g4, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, _g4, "lnbclkg3", 4);
>  
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao,, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao,, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao,, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao,, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk5, rf_clk5_ao,, "rfclka5", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao, _d, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao, _d, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao, _d, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao, _d, "rfclkd4", 1);
>  
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(div_clk1, div_clk1_ao,, "divclka1", 2);
>  
> -DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> -DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> +DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> +DEFINE_CLK_RPMH_BCM(ce, "CE0");
> +DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> +DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  
>  static struct clk_hw *sdm845_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> @@ -399,18 +399,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>  };
>  
>  static struct clk_hw *sdm670_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_CE_CLK]		= &sdm845_ce.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> @@ -419,14 +419,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>  };
>  
>  static struct clk_hw *sdx55_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao_d.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao_d.hw,
> +	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -435,18 +435,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>  };
>  
>  static struct clk_hw *sm8150_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -455,17 +455,17 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>  };
>  
>  static struct clk_hw *sc7180_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> @@ -474,18 +474,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>  };
>  
>  static struct clk_hw *sc8180x_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao_d.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao_d.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao_d.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -494,18 +494,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>  };
>  
>  static struct clk_hw *sm8250_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -514,25 +514,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>  };
>  
>  static struct clk_hw *sm8350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
> -	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
> -	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1.hw,
> +	[RPMH_DIV_CLK1_A]	= &clk_rpmh_div_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_ao.hw,
> +	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> @@ -541,13 +541,13 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>  };
>  
>  static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
> +	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
> +	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> @@ -556,21 +556,21 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>  };
>  
>  static struct clk_hw *sm8450_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div4.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao_a4.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao_a4.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> @@ -579,19 +579,19 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>  };
>  
>  static struct clk_hw *sc7280_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
> -	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> -	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
> -	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> +	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div4.hw,
> +	[RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2.hw,
> +	[RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_ao.hw,
> +	[RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_ao.hw,
> +	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> +	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> +	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> @@ -600,14 +600,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>  };
>  
>  static struct clk_hw *sm6350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
> -	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
> -	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
> -	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div4.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao_g4.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao_g4.hw,
> +	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink.hw,
> +	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_ao.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> @@ -616,20 +616,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>  };
>  
>  static struct clk_hw *sdx65_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> -	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
> -	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
> -	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> -	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> -	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> -	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> -	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> -	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> -	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> -	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> -	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> -	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div4.hw,
> +	[RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao_a4.hw,
> +	[RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_ao.hw,
> +	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> @@ -638,8 +638,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>  };
>  
>  static struct clk_hw *qdu1000_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div1.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
