Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E94C63F80A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiLATUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiLATUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:20:52 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F729B8442
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 11:20:50 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id y15so2151999qtv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 11:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O6gMwtINLykfyqwwsHMxH5BJE1tY0k/NUWaScnO2AKA=;
        b=FCmlVQ5f2lRmyzleGisVfpkE5lnimOgJGRVhVkidO++PQi4goYIcTDwoNZb439GR06
         j3vE/k636c3yObPVTY0vmBchBjGmdy2Qw3KQ20/U9xV4YT+423CcxmwuQZgpX71y4a8R
         k6WHTSjHpS73sVCIgXDZ2+J/GetZv/AyjAMzJXjMDcnP3WQYn3LZK3+O7ZTGbFMUPRdg
         FTMrcGHhJKuFTepP2iu1iF9eWLs4Aqr6IlmLS2mGNMdtjxB2KLBSl2/pEvzVh15aVq4P
         MsMdMzCYrvc1GltmIbD0IOkkOdUD6QaYdHGez7324x9RXDuNxC7wWtHSaN50j3KNdMjg
         5BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6gMwtINLykfyqwwsHMxH5BJE1tY0k/NUWaScnO2AKA=;
        b=1Cdno223JbfZDeZTuQryL3aSTkTivaFGI81DtDDRtHCBMqinugMyDV8vyE9Atzp3gc
         7tVA6pZ2FWoROXicrcAdDZmguZPbc54DgaYReJ7+vRSVitsBd2ueVIV3Ay6gGvYuNnnn
         VtgcbohjnUsMVT93Wzu7n+MJ/ozB/FgWjpWgTsW2fqoNresgkOosI1yAFx9QzkCaUrDo
         SzDnrw8CPL6IqEi+gSoc/cvAo9GPrukzpOZHpiNZgr7GFgD71RluuV5p76irYW5W8xkx
         yj15ggrVnUT4onpFLRabzb2LUITO5SJvtlIxjJwgxkRzZy4Iox5fiB+U4CMsws4ev/X0
         i/PA==
X-Gm-Message-State: ANoB5pk+ql50GZCnn8CYgre0Cn0IwTR/ROMzfnqPh2fpzFqjMnb3COZ2
        x9Ivz45+RB/p7S9Fj9frZKmEKg==
X-Google-Smtp-Source: AA0mqf69GP+Um7d0r1VHKKT8Te31BjJMYbzCDhZKLTuL6HRa9Ia7pSXl9Uv+tObaj8DudRpO6oBXBw==
X-Received: by 2002:a05:620a:164e:b0:6ec:7654:63d5 with SMTP id c14-20020a05620a164e00b006ec765463d5mr51012079qko.425.1669922449687;
        Thu, 01 Dec 2022 11:20:49 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id o14-20020ac8698e000000b003a580cd979asm3020916qtq.58.2022.12.01.11.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 11:20:49 -0800 (PST)
Message-ID: <8f582c0f-2655-c566-f2c3-12915ce33ffa@linaro.org>
Date:   Thu, 1 Dec 2022 13:20:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] clk: qcom: rpmh: drop all _ao names
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221130131001.20912-4-dmitry.baryshkov@linaro.org>
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

On 11/30/22 7:09 AM, Dmitry Baryshkov wrote:
> In preparation for the further cleanup, remove the active only names,
> they can be easily generated from the standard ones.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I like this.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c4852bbd00bf..00c0c8f851bd 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>   			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_name_active;		\
> +	static struct clk_rpmh _platform##_##_name##_ao;		\
>   	static struct clk_rpmh _platform##_##_name = {			\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name_active,			\
> +		.peer = &_platform##_##_name##_ao,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,7 +92,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   			.num_parents = 1,				\
>   		},							\
>   	};								\
> -	static struct clk_rpmh _platform##_##_name_active = {		\
> +	static struct clk_rpmh _platform##_##_name##_ao= {		\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
> @@ -102,7 +102,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>   		.hw.init = &(struct clk_init_data){			\
>   			.ops = &clk_rpmh_ops,				\
> -			.name = #_name_active,				\
> +			.name = #_name "_ao",				\
>   			.parent_data =  &(const struct clk_parent_data){ \
>   					.fw_name = "xo",		\
>   					.name = "xo_board",		\
> @@ -111,14 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   		},							\
>   	}
>   
> -#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
> -			    _res_on, _div)				\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
> +	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
> -#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
> -				_div)					\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
> +#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> +	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
>   #define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
> @@ -342,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
>   };
>   
>   /* Resource name must match resource id present in cmd-db */
> -DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
> -DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
> -DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
> -DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
> +DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
> +DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
> +DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
> +DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
> -DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
> +DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
> +DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
>   
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> -DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
> -DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
> +DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
>   
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
> -DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
> -DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
> +DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
> +DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
> -DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
> +DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
>   
> -DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
> +DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
>   
>   DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
>   DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");

