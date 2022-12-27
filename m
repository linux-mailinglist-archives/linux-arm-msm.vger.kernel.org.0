Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053B8656A65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 13:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbiL0MD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 07:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbiL0MDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 07:03:05 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB8FBC8F
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:00:51 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bt23so2673101lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQaxUFqQfcRYZzo66Nn53Va7dFR298ha/1KX1Q82TkI=;
        b=SLU/iRIVKuFZ3cKAkhMO52tk4gtf9HtkG0YorcMJhwk42GMk7k4Mr3rsxXrINrVTJc
         N/u04m0HCS8e0tMTOdsnE/J4gTuTFbnFm25HKLnCZCAzYNgkyraXw2yqSUAdk5fBMoTP
         kZdOTurhjywcbC6f60zcRPC5QeVNnyCEIpSQhiHtgM+Ozf1hkt3hm8NCywp/QOSvRFo+
         VmimlMu3bLklFndeptatBPgjJehOU3J96AW6RTSK32D3O0y77NeHs6XdBvWYwUS3tmxk
         Kokf65UF3qaaJiUUALmYacJmSgd2EGt62Z8XJHPHNaAC8tPU8cD6oIXlaeKirx0vbpwG
         A9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQaxUFqQfcRYZzo66Nn53Va7dFR298ha/1KX1Q82TkI=;
        b=KyW+HL9CI9Bb32EfNkFtCHW291wOJEo9gVHCRsYXwwzbaaUFob7mcqmN9iPDTfl/ao
         UxCCKsMFSzvg2MrHA00xUyERrbiwQ9bbU3/JPXj8Uo2LbQPHLjHvBpU+GbdgjKwzGPE/
         3KvyKjXZEqV9I2w37O1+qHZ+VtmUvAkgGe/OPgnE8vADjNcNbmvVcsj7QHZyuCa/xj2+
         mlYQd2XODFfgfCyk3ub61PLqiY8n6W24vA7lBBLSryfKOpn9fEaygLswYpgqKDMQqtaY
         w7vg+IDJCeFiFMTm3s84/KKTxNLVJ7GnGw2w+H8I+mu86YAPZs58iBctoXsy/KCKmF3f
         Pd3A==
X-Gm-Message-State: AFqh2kqYjGtMJ5PtMGGEciMV5z2SQa6HLCLJcgACQbYFe6T2AOpR1LvH
        jnqtAV5uhlw2Dc5kAdagtDy66A==
X-Google-Smtp-Source: AMrXdXtzR41wxaNP1gCRTC2OzWxwt/YzMOwws3amAY5x+g6NHVqazx1pxeXH86EwGD2C7xPTz2FHxQ==
X-Received: by 2002:a05:6512:3fa7:b0:4bd:de32:b782 with SMTP id x39-20020a0565123fa700b004bdde32b782mr7847167lfa.52.1672142426588;
        Tue, 27 Dec 2022 04:00:26 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id d18-20020ac241d2000000b004b4cbc942a3sm2234970lfi.127.2022.12.27.04.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 04:00:26 -0800 (PST)
Message-ID: <beaebfaa-f1d3-6576-59d1-212825060eec@linaro.org>
Date:   Tue, 27 Dec 2022 13:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 08/12] clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead
 of specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227013225.2847382-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 02:32, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/mmcc-apq8084.c | 88 ++++++++++++++++-----------------
>  1 file changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
> index e9f971359155..4acbcb43927f 100644
> --- a/drivers/clk/qcom/mmcc-apq8084.c
> +++ b/drivers/clk/qcom/mmcc-apq8084.c
> @@ -319,7 +319,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mmss_ahb_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -344,7 +344,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mmss_axi_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -368,7 +368,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "ocmemnoc_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -387,7 +387,7 @@ static struct clk_rcg2 csi0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -400,7 +400,7 @@ static struct clk_rcg2 csi1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -413,7 +413,7 @@ static struct clk_rcg2 csi2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -426,7 +426,7 @@ static struct clk_rcg2 csi3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi3_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -456,7 +456,7 @@ static struct clk_rcg2 vfe0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vfe0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -469,7 +469,7 @@ static struct clk_rcg2 vfe1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vfe1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -497,7 +497,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mdp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -509,7 +509,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gfx3d_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_2_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -532,7 +532,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -545,7 +545,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -558,7 +558,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "jpeg2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -571,7 +571,7 @@ static struct clk_rcg2 pclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk0_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_pixel_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -585,7 +585,7 @@ static struct clk_rcg2 pclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "pclk1_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_pixel_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -610,7 +610,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vcodec0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -629,7 +629,7 @@ static struct clk_rcg2 vp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -648,7 +648,7 @@ static struct clk_rcg2 cci_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cci_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -672,7 +672,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
> -		.num_parents = 7,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -686,7 +686,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "camss_gp1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
> -		.num_parents = 7,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -714,7 +714,7 @@ static struct clk_rcg2 mclk0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk0_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -728,7 +728,7 @@ static struct clk_rcg2 mclk1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk1_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -742,7 +742,7 @@ static struct clk_rcg2 mclk2_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk2_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -756,7 +756,7 @@ static struct clk_rcg2 mclk3_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "mclk3_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -775,7 +775,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi0phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -788,7 +788,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi1phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -801,7 +801,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "csi2phytimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -824,7 +824,7 @@ static struct clk_rcg2 cpp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "cpp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
> -		.num_parents = 5,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -836,7 +836,7 @@ static struct clk_rcg2 byte0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte0_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_byte2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -849,7 +849,7 @@ static struct clk_rcg2 byte1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "byte1_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_byte2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -868,7 +868,7 @@ static struct clk_rcg2 edpaux_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edpaux_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -887,7 +887,7 @@ static struct clk_rcg2 edplink_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edplink_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -907,7 +907,7 @@ static struct clk_rcg2 edppixel_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "edppixel_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
>  		.ops = &clk_edp_pixel_ops,
>  	},
>  };
> @@ -925,7 +925,7 @@ static struct clk_rcg2 esc0_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc0_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -938,7 +938,7 @@ static struct clk_rcg2 esc1_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "esc1_clk_src",
>  		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -956,7 +956,7 @@ static struct clk_rcg2 extpclk_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "extpclk_clk_src",
>  		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
> -		.num_parents = 6,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
>  		.ops = &clk_byte_ops,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
> @@ -975,7 +975,7 @@ static struct clk_rcg2 hdmi_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "hdmi_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -993,7 +993,7 @@ static struct clk_rcg2 vsync_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vsync_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1011,7 +1011,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "rbcpr_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1029,7 +1029,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "rbbmtimer_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1052,7 +1052,7 @@ static struct clk_rcg2 maple_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "maple_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1074,7 +1074,7 @@ static struct clk_rcg2 vdp_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vdp_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
> @@ -1093,7 +1093,7 @@ static struct clk_rcg2 vpu_bus_clk_src = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "vpu_bus_clk_src",
>  		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
> -		.num_parents = 4,
> +		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
>  		.ops = &clk_rcg2_ops,
>  	},
>  };
