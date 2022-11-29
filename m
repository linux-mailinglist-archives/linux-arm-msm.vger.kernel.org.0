Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4887763CAF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 23:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbiK2WHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 17:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236430AbiK2WHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 17:07:34 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB570200
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:31 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id z9so7314398ilu.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1oGMGCIchoe5JSEvwMdeOz96WqUSjhi32niPv2kD4o=;
        b=PH2XxXJnHeiHHbr+aOmwYbT0sICDBIZIVWULnXT7zqqY80Ric4eRmZ+2fbBlx7Cbot
         Jqa2CPMBrD5KUYP83IJm6Q1dSx15kLAvTbKJ/I5u4z5gDCWEhe6wIVAlGbEfy1WHAQXg
         DDOLLA0C9Q0/0a7j/Y7VGbYwyBKJadPPZymMB+D1C3W39HQYpQMZPA8biP/q7xNo4Mnj
         Y5HftRLCbHZRo2mk6L7ZDlLBPzbdockvEGfhlSfBT2DkFAnHomqsvMz2lrg3mrUta+gY
         pRp2WWdRnkD5oT/K5DOrX1zgmJxmjc2AF2ittec7GC/uYBgoV6/MrRyBCqtYZUz3UxJJ
         MA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1oGMGCIchoe5JSEvwMdeOz96WqUSjhi32niPv2kD4o=;
        b=r4AlBk98oYCDnVWkvzJ3p4alw6HJTk682oXO5sMLzYB2DUb1DVLDk2U69RvX26Pa02
         vtBZZMuGo9F6jAdcETp6YG9N0idu6khxU/XR6juNhPnsaZkHbwa/Y8P7UfsiKGrpfPeG
         TdBelJR3D5jb2T+os2tZNn54JsTX4iikRAUI8hPYXnLrs9bF7nEYTfQ/nJgTzrxCI8nw
         1V5fy8D6ROI3bpEHlYrqEnvwrTxLm/jGz/SOnlhUa5zDKO4ADdhrfZPB1s/MJVLXA1Pc
         ZisdfKDHDQFtqGoXuNsIPs28sV8suD6LF7dvRDScy+hMhUSZk+wY5u5DkWZ/IKdDrjJH
         +Qig==
X-Gm-Message-State: ANoB5pmo6Ep/LGUcui0bHLnqVLAfh+phfdtvOPryD0pESTz/ovr/35Kn
        twem2yMkqpyanJ8cPGDZ1g4/hw==
X-Google-Smtp-Source: AA0mqf4GeI5lApFFz3tYwIWT0frzWKbqJrEPO6ZBbpUj0oeQdpsHg2p/Nemkx0ywKE8+rMj5xNybFQ==
X-Received: by 2002:a05:6e02:521:b0:302:6b23:79a2 with SMTP id h1-20020a056e02052100b003026b2379a2mr18002522ils.138.1669759651175;
        Tue, 29 Nov 2022 14:07:31 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id z62-20020a0293c4000000b003739e4d381esm5650879jah.141.2022.11.29.14.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 14:07:30 -0800 (PST)
Message-ID: <7aeedf55-5cce-7cca-e0c9-1faff6be3fee@linaro.org>
Date:   Tue, 29 Nov 2022 16:07:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] clk: qcom: rpmh: drop the platform from clock
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
 <20221129101025.960110-4-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221129101025.960110-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/29/22 4:10 AM, Dmitry Baryshkov wrote:
> A single clock definition can be used on different platforms. Thus the
> platform part of the clock name is not correct (and can be misleading).
> 
> Remove the platform-specific part of the defined clock. To keep the name
> visible to the userspace add an extra optional 'suffix' argument which
> is used to distinguish similar clocks in the code.

OK, I like what you're doing here, but I think it could use
some more thought.

I very much dislike the "empty" parameters passed to the macros.
I.e., the consecutive commas in the calls

Instead, please find a reasonable way to have a different version
of the macro that omits the missing/empty argument.

Second, I observe that (with the exception of the missing parameters)
the suffix always seems to encode the divider value.  Can you find
a way to have that be leveraged in the macro definition?

I have a few white space comments below but I'm going to leave it
at that.

					-Alex

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 396 ++++++++++++++++++------------------
>   1 file changed, 198 insertions(+), 198 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c4852bbd00bf..513c3a025f4b 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define __DEFINE_CLK_RPMH(_name, _name_active, _suffix,	_res_name,	\

Replace the tab in the line above with space.  (If you have anything
similar elsewhere, please fix.)

>   			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_name_active;		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix;	\
> +	static struct clk_rpmh clk_rpmh_##_name ## _suffix = {		\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name_active,			\
> +		.peer = &clk_rpmh_##_name_active ## _suffix,		\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   			.num_parents = 1,				\
>   		},							\
>   	};								\
> -	static struct clk_rpmh _platform##_##_name_active = {		\
> +	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix = {	\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name,				\
> +		.peer = &clk_rpmh_##_name ## _suffix,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>   		.hw.init = &(struct clk_init_data){			\
> @@ -111,18 +111,18 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   		},							\
>   	}
>   
> -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_ARC(_name, _name_active, _suffix, _res_name,	\
>   			    _res_on, _div)				\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +	__DEFINE_CLK_RPMH(_name, _name_active,_suffix, _res_name,	\

Add a space before _suffix above.  (If you have anything similar
elsewhere, please fix.)

>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
> -				_div)					\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_VRM(_name, _name_active, _suffix, _res_name,	\
> +			    _div)					\
> +	__DEFINE_CLK_RPMH(_name, _name_active, _suffix, _res_name,	\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
> -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
> +	static struct clk_rpmh clk_rpmh_##_name = {			\
>   		.res_name = _res_name,					\
>   		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
>   		.div = 1,						\
> @@ -342,55 +342,55 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>   };
>   
>   /* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div1, "xo.lvl", 0x3, 1);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div2, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div4,  "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(qlink, qlink_ao,, "qphy.lvl", 0x1, 4);
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
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> @@ -399,18 +399,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   };
>   
>   static struct clk_hw *sdm670_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> @@ -419,14 +419,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   };
>   
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> @@ -435,18 +435,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>   };
>   
>   static struct clk_hw *sm8150_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> @@ -455,17 +455,17 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>   };
>   
>   static struct clk_hw *sc7180_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> @@ -474,18 +474,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>   };
>   
>   static struct clk_hw *sc8180x_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
> @@ -494,18 +494,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>   };
>   
>   static struct clk_hw *sm8250_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
> @@ -514,25 +514,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   };
>   
>   static struct clk_hw *sm8350_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> @@ -541,13 +541,13 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   };
>   
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> @@ -556,21 +556,21 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>   };
>   
>   static struct clk_hw *sm8450_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> @@ -579,19 +579,19 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>   };
>   
>   static struct clk_hw *sc7280_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> @@ -600,14 +600,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>   };
>   
>   static struct clk_hw *sm6350_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> @@ -616,20 +616,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   };
>   
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
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
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> @@ -638,8 +638,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>   };
>   
>   static struct clk_hw *qdu1000_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div1.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {

