Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDA864FB6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 18:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiLQR4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 12:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLQR4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 12:56:36 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DDA63EE
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 09:56:32 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id q6so8050585lfm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i5PzEOEFrn21mIlaHF+YorMjoBQ1X+gfj5AC/zxGfNM=;
        b=itH2NoiNksA5WB8AaRvuVcblH/V4W19R5qTSBqyL+0dGHWlG/pF6S580pWuJRzZ7WV
         8Y+PKAvEUiwDApAj8oAz2W6PoV2xQjsMwm+JGqZOW9xjRK/CCu9YHp6QAVw1phCe8tuu
         /gDQcM3N9QuPsdVw+ZcsklEisbzET9bGLe3fwnbsThBc5lR2elyVUg8hmRuq5rm8lLDL
         CKi4vWrw1rGFmGIo1VPgoj8XFt7mXRHa4+hCCdwYB0l7+TlRsrKpYqsY8ugLCFlsHRGH
         xkIRK9Gau/YWyEkO1bEwl3xaSi0cVLI1fKbUESHOuC3+pC2H+dwCi8Nkr5Rvxk8TvTMK
         Vcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5PzEOEFrn21mIlaHF+YorMjoBQ1X+gfj5AC/zxGfNM=;
        b=QFq1zFJdltWEqUWE4Ng3EFnCDrAgDc8VQ3hhGEcDeXT5vJM2c+7CCjxWwFE2Hr4eCF
         Wju0U5AZANL4kIEQZIVhpdqWtvFZhSBMwglRzoHqICoZj6M9iJkJXFQ5pASzcph6t1ot
         MhXqvuJN9lbRWbxG2j9nZu8X6lsMb4FXTyIATYZpa1HWjxzZ2BVoW1UwlKBr90hTH89C
         y/IMCk6juooM+Btgz+ugP9xDgzl/yQitkcCZUhgqeR0FhRpVTUVpwUQ4GDdKnUIVhYpF
         Fhk9L1YtZlOaZVgXABsXC1mCu12UnDx+g7zCe/sfzAAjUW0RDu7nGCCqBmNmbEINFVO+
         Pihw==
X-Gm-Message-State: ANoB5pmXA/Yxf9u2leAW77Owds5bKLK//IA/3JjyHOzDVL10oqJNcLyT
        GknIsEHDlefC61DYNhPoqBWtyg==
X-Google-Smtp-Source: AA0mqf7HwjYX4LyxS8Kd+I/zFVBNhpDErFs83KGGp9hAc57sOxOOmUgIsQTpAY70Ph8IB/eDqWGLbw==
X-Received: by 2002:ac2:4f07:0:b0:4a4:68b7:deab with SMTP id k7-20020ac24f07000000b004a468b7deabmr10399580lfr.7.1671299791108;
        Sat, 17 Dec 2022 09:56:31 -0800 (PST)
Received: from [127.0.0.1] (85-76-70-163-nat.elisa-mobile.fi. [85.76.70.163])
        by smtp.gmail.com with ESMTPSA id i25-20020ac25239000000b004b0b2212315sm570184lfl.121.2022.12.17.09.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 09:56:30 -0800 (PST)
Date:   Sat, 17 Dec 2022 19:56:30 +0200
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_10/15=5D_clk=3A_qcom=3A_gcc-qcs404=3A_u?= =?US-ASCII?Q?se_parent=5Fhws/=5Fdata_instead_of_parent=5Fnames?=
User-Agent: K-9 Mail for Android
In-Reply-To: <524350cf-fed4-6c59-6f35-9bd319947adc@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org> <20221217001730.540502-11-dmitry.baryshkov@linaro.org> <313ed5b8-41c5-df38-f97a-f17d282ee21d@linaro.org> <524350cf-fed4-6c59-6f35-9bd319947adc@linaro.org>
Message-ID: <3EF28EAB-CEDD-4472-A4DA-FADC69E0A8DF@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

17 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2022 =D0=B3=2E 17:14:36 GMT+0=
2:00, Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>
>
>On 17=2E12=2E2022 16:13, Konrad Dybcio wrote:
>>=20
>>=20
>> On 17=2E12=2E2022 01:17, Dmitry Baryshkov wrote:
>>> Convert the clock driver to specify parent data rather than parent
>>> names, to actually bind using 'clock-names' specified in the DTS rathe=
r
>>> than global clock names=2E Use parent_hws where possible to refer pare=
nt
>>> clocks directly, skipping the lookup=2E
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>>> ---
>> Reviewed-by: Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg>
>>=20
>> Konrad
>Actually, on a second thought - why not switch to =2Eindex
>like on the newer clk drivers?

I thought we should use clock-names with old drivers for the sake of keepi=
ng compatibility with partial clocks specifications=2E In this case we do n=
ot have one=2E Let me check if it we can live without =2Efw_name=2E

>
>Konrad
>>>  drivers/clk/qcom/gcc-qcs404=2Ec | 515 ++++++++++++++++++-------------=
---
>>>  1 file changed, 266 insertions(+), 249 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-qcs404=2Ec b/drivers/clk/qcom/gcc-qc=
s404=2Ec
>>> index 5ae7a6b2a326=2E=2E3941175d73a5 100644
>>> --- a/drivers/clk/qcom/gcc-qcs404=2Ec
>>> +++ b/drivers/clk/qcom/gcc-qcs404=2Ec
>>> @@ -42,7 +42,9 @@ static struct clk_fixed_factor cxo =3D {
>>>  	=2Ediv =3D 1,
>>>  	=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "cxo",
>>> -		=2Eparent_names =3D (const char *[]){ "xo-board" },
>>> +		=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +			=2Ename =3D "xo-board",
>>> +		},
>>>  		=2Enum_parents =3D 1,
>>>  		=2Eops =3D &clk_fixed_factor_ops,
>>>  	},
>>> @@ -57,7 +59,9 @@ static struct clk_alpha_pll gpll0_sleep_clk_src =3D =
{
>>>  		=2Eenable_is_inverted =3D true,
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll0_sleep_clk_src",
>>> -			=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eops =3D &clk_alpha_pll_ops,
>>>  		},
>>> @@ -73,8 +77,9 @@ static struct clk_alpha_pll gpll0_out_main =3D {
>>>  		=2Eenable_mask =3D BIT(0),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll0_out_main",
>>> -			=2Eparent_names =3D (const char *[])
>>> -					{ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eops =3D &clk_alpha_pll_ops,
>>>  		},
>>> @@ -90,7 +95,9 @@ static struct clk_alpha_pll gpll0_ao_out_main =3D {
>>>  		=2Eenable_mask =3D BIT(0),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll0_ao_out_main",
>>> -			=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eflags =3D CLK_IS_CRITICAL,
>>>  			=2Eops =3D &clk_alpha_pll_fixed_ops,
>>> @@ -106,7 +113,9 @@ static struct clk_alpha_pll gpll1_out_main =3D {
>>>  		=2Eenable_mask =3D BIT(1),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll1_out_main",
>>> -			=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eops =3D &clk_alpha_pll_ops,
>>>  		},
>>> @@ -137,7 +146,9 @@ static struct clk_alpha_pll gpll3_out_main =3D {
>>>  	=2Eclkr =3D {
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll3_out_main",
>>> -			=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eops =3D &clk_alpha_pll_ops,
>>>  		},
>>> @@ -152,7 +163,9 @@ static struct clk_alpha_pll gpll4_out_main =3D {
>>>  		=2Eenable_mask =3D BIT(5),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gpll4_out_main",
>>> -			=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +			=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +				=2Ehw =3D &cxo=2Ehw,
>>> +			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eops =3D &clk_alpha_pll_ops,
>>>  		},
>>> @@ -169,7 +182,9 @@ static struct clk_pll gpll6 =3D {
>>>  	=2Estatus_bit =3D 17,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gpll6",
>>> -		=2Eparent_names =3D (const char *[]){ "cxo" },
>>> +		=2Eparent_data =3D &(const struct clk_parent_data) {
>>> +			=2Ehw =3D &cxo=2Ehw,
>>> +		},
>>>  		=2Enum_parents =3D 1,
>>>  		=2Eops =3D &clk_pll_ops,
>>>  	},
>>> @@ -180,7 +195,9 @@ static struct clk_regmap gpll6_out_aux =3D {
>>>  	=2Eenable_mask =3D BIT(7),
>>>  	=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gpll6_out_aux",
>>> -		=2Eparent_names =3D (const char *[]){ "gpll6" },
>>> +		=2Eparent_hws =3D (const struct clk_hw*[]) {
>>> +			&gpll6=2Eclkr=2Ehw,
>>> +		},
>>>  		=2Enum_parents =3D 1,
>>>  		=2Eops =3D &clk_pll_vote_ops,
>>>  	},
>>> @@ -191,22 +208,22 @@ static const struct parent_map gcc_parent_map_0[=
] =3D {
>>>  	{ P_GPLL0_OUT_MAIN, 1 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_0[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> +static const struct clk_parent_data gcc_parent_data_0[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_ao_0[] =3D {
>>> -	"cxo",
>>> -	"gpll0_ao_out_main",
>>> +static const struct clk_parent_data gcc_parent_data_ao_0[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_ao_out_main=2Eclkr=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_1[] =3D {
>>>  	{ P_XO, 0 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_1[] =3D {
>>> -	"cxo",
>>> +static const struct clk_parent_data gcc_parent_data_1[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_2[] =3D {
>>> @@ -216,11 +233,11 @@ static const struct parent_map gcc_parent_map_2[=
] =3D {
>>>  	{ P_SLEEP_CLK, 6 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_2[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> -	"gpll6_out_aux",
>>> -	"sleep_clk",
>>> +static const struct clk_parent_data gcc_parent_data_2[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll6_out_aux=2Ehw },
>>> +	{ =2Efw_name =3D "sleep_clk", =2Ename =3D "sleep_clk" },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_3[] =3D {
>>> @@ -229,10 +246,10 @@ static const struct parent_map gcc_parent_map_3[=
] =3D {
>>>  	{ P_GPLL6_OUT_AUX, 2 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_3[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> -	"gpll6_out_aux",
>>> +static const struct clk_parent_data gcc_parent_data_3[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll6_out_aux=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_4[] =3D {
>>> @@ -240,9 +257,9 @@ static const struct parent_map gcc_parent_map_4[] =
=3D {
>>>  	{ P_GPLL1_OUT_MAIN, 1 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_4[] =3D {
>>> -	"cxo",
>>> -	"gpll1_out_main",
>>> +static const struct clk_parent_data gcc_parent_data_4[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll1_out_main=2Eclkr=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_5[] =3D {
>>> @@ -251,9 +268,9 @@ static const struct parent_map gcc_parent_map_5[] =
=3D {
>>>  	/* { P_GPLL0_OUT_AUX, 2 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_5[] =3D {
>>> -	"cxo",
>>> -	"dsi0pllbyte",
>>> +static const struct clk_parent_data gcc_parent_data_5[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "dsi0pllbyte", =2Ename =3D "dsi0pllbyte" },
>>>  	/* "gpll0_out_aux", */
>>>  };
>>> =20
>>> @@ -263,9 +280,9 @@ static const struct parent_map gcc_parent_map_6[] =
=3D {
>>>  	/* { P_GPLL0_OUT_AUX, 3 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_6[] =3D {
>>> -	"cxo",
>>> -	"dsi0pllbyte",
>>> +static const struct clk_parent_data gcc_parent_data_6[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "dsi0pllbyte", =2Ename =3D "dsi0pllbyte" },
>>>  	/* "gpll0_out_aux", */
>>>  };
>>> =20
>>> @@ -277,11 +294,11 @@ static const struct parent_map gcc_parent_map_7[=
] =3D {
>>>  	/* { P_GPLL4_OUT_AUX, 4 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_7[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> -	"gpll3_out_main",
>>> -	"gpll6_out_aux",
>>> +static const struct clk_parent_data gcc_parent_data_7[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll3_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll6_out_aux=2Ehw },
>>>  	/* "gpll4_out_aux", */
>>>  };
>>> =20
>>> @@ -290,9 +307,9 @@ static const struct parent_map gcc_parent_map_8[] =
=3D {
>>>  	{ P_HDMI_PHY_PLL_CLK, 1 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_8[] =3D {
>>> -	"cxo",
>>> -	"hdmi_pll",
>>> +static const struct clk_parent_data gcc_parent_data_8[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "hdmi_pll", =2Ename =3D "hdmi_pll" },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_9[] =3D {
>>> @@ -302,11 +319,11 @@ static const struct parent_map gcc_parent_map_9[=
] =3D {
>>>  	{ P_GPLL6_OUT_AUX, 3 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_9[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> -	"dsi0pll",
>>> -	"gpll6_out_aux",
>>> +static const struct clk_parent_data gcc_parent_data_9[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>> +	{ =2Efw_name =3D "dsi0pll", =2Ename =3D "dsi0pll" },
>>> +	{ =2Ehw =3D &gpll6_out_aux=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_10[] =3D {
>>> @@ -314,9 +331,9 @@ static const struct parent_map gcc_parent_map_10[]=
 =3D {
>>>  	{ P_SLEEP_CLK, 1 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_10[] =3D {
>>> -	"cxo",
>>> -	"sleep_clk",
>>> +static const struct clk_parent_data gcc_parent_data_10[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "sleep_clk", =2Ename =3D "sleep_clk" },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_11[] =3D {
>>> @@ -324,9 +341,9 @@ static const struct parent_map gcc_parent_map_11[]=
 =3D {
>>>  	{ P_PCIE_0_PIPE_CLK, 1 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_11[] =3D {
>>> -	"cxo",
>>> -	"pcie_0_pipe_clk",
>>> +static const struct clk_parent_data gcc_parent_data_11[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "pcie_0_pipe_clk", =2Ename =3D "pcie_0_pipe_clk" },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_12[] =3D {
>>> @@ -335,9 +352,9 @@ static const struct parent_map gcc_parent_map_12[]=
 =3D {
>>>  	/* { P_GPLL0_OUT_AUX, 2 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_12[] =3D {
>>> -	"cxo",
>>> -	"dsi0pll",
>>> +static const struct clk_parent_data gcc_parent_data_12[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Efw_name =3D "dsi0pll", =2Ename =3D "dsi0pll" },
>>>  	/* "gpll0_out_aux", */
>>>  };
>>> =20
>>> @@ -348,11 +365,11 @@ static const struct parent_map gcc_parent_map_13=
[] =3D {
>>>  	{ P_GPLL6_OUT_AUX, 3 },
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_13[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> -	"gpll4_out_main",
>>> -	"gpll6_out_aux",
>>> +static const struct clk_parent_data gcc_parent_data_13[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll4_out_main=2Eclkr=2Ehw },
>>> +	{ =2Ehw =3D &gpll6_out_aux=2Ehw },
>>>  };
>>> =20
>>>  static const struct parent_map gcc_parent_map_14[] =3D {
>>> @@ -361,9 +378,9 @@ static const struct parent_map gcc_parent_map_14[]=
 =3D {
>>>  	/* { P_GPLL4_OUT_AUX, 2 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_14[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> +static const struct clk_parent_data gcc_parent_data_14[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>>  	/* "gpll4_out_aux", */
>>>  };
>>> =20
>>> @@ -372,8 +389,8 @@ static const struct parent_map gcc_parent_map_15[]=
 =3D {
>>>  	/* { P_GPLL0_OUT_AUX, 2 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_15[] =3D {
>>> -	"cxo",
>>> +static const struct clk_parent_data gcc_parent_data_15[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>>  	/* "gpll0_out_aux", */
>>>  };
>>> =20
>>> @@ -383,9 +400,9 @@ static const struct parent_map gcc_parent_map_16[]=
 =3D {
>>>  	/* { P_GPLL0_OUT_AUX, 2 }, */
>>>  };
>>> =20
>>> -static const char * const gcc_parent_names_16[] =3D {
>>> -	"cxo",
>>> -	"gpll0_out_main",
>>> +static const struct clk_parent_data gcc_parent_data_16[] =3D {
>>> +	{ =2Ehw =3D &cxo=2Ehw },
>>> +	{ =2Ehw =3D &gpll0_out_main=2Eclkr=2Ehw },
>>>  	/* "gpll0_out_aux", */
>>>  };
>>> =20
>>> @@ -405,8 +422,8 @@ static struct clk_rcg2 apss_ahb_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_apss_ahb_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "apss_ahb_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_ao_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_ao_0),
>>> +		=2Eparent_data =3D gcc_parent_data_ao_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_ao_0),
>>>  		=2Eflags =3D CLK_IS_CRITICAL,
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>> @@ -426,8 +443,8 @@ static struct clk_rcg2 blsp1_qup0_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup0_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -451,8 +468,8 @@ static struct clk_rcg2 blsp1_qup0_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup0_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -465,8 +482,8 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup1_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -490,8 +507,8 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup1_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup1_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -504,8 +521,8 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup2_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -530,8 +547,8 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup2_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup2_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -544,8 +561,8 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup3_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -558,8 +575,8 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup3_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -572,8 +589,8 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup4_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -586,8 +603,8 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_qup4_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -620,8 +637,8 @@ static struct clk_rcg2 blsp1_uart0_apps_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_uart0_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -634,8 +651,8 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_uart1_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -648,8 +665,8 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_uart2_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -663,8 +680,8 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp1_uart3_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -677,8 +694,8 @@ static struct clk_rcg2 blsp2_qup0_i2c_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_i2c_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp2_qup0_i2c_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -691,8 +708,8 @@ static struct clk_rcg2 blsp2_qup0_spi_apps_clk_src=
 =3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_qup0_spi_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp2_qup0_spi_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -705,8 +722,8 @@ static struct clk_rcg2 blsp2_uart0_apps_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "blsp2_uart0_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -718,8 +735,8 @@ static struct clk_rcg2 byte0_clk_src =3D {
>>>  	=2Eparent_map =3D gcc_parent_map_5,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "byte0_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_5,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_5),
>>> +		=2Eparent_data =3D gcc_parent_data_5,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_5),
>>>  		=2Eflags =3D CLK_SET_RATE_PARENT,
>>>  		=2Eops =3D &clk_byte2_ops,
>>>  	},
>>> @@ -741,8 +758,8 @@ static struct clk_rcg2 emac_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_emac_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "emac_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_4,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_4),
>>> +		=2Eparent_data =3D gcc_parent_data_4,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_4),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -762,8 +779,8 @@ static struct clk_rcg2 emac_ptp_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_emac_ptp_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "emac_ptp_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_4,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_4),
>>> +		=2Eparent_data =3D gcc_parent_data_4,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_4),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -781,8 +798,8 @@ static struct clk_rcg2 esc0_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "esc0_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_6,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_6),
>>> +		=2Eparent_data =3D gcc_parent_data_6,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_6),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -815,8 +832,8 @@ static struct clk_rcg2 gfx3d_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_gfx3d_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gfx3d_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_7,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_7),
>>> +		=2Eparent_data =3D gcc_parent_data_7,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_7),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -836,8 +853,8 @@ static struct clk_rcg2 gp1_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gp1_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_2,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_2),
>>> +		=2Eparent_data =3D gcc_parent_data_2,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_2),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -850,8 +867,8 @@ static struct clk_rcg2 gp2_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gp2_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_2,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_2),
>>> +		=2Eparent_data =3D gcc_parent_data_2,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_2),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -864,8 +881,8 @@ static struct clk_rcg2 gp3_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_gp1_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "gp3_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_2,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_2),
>>> +		=2Eparent_data =3D gcc_parent_data_2,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_2),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -878,8 +895,8 @@ static struct clk_rcg2 hdmi_app_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "hdmi_app_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_1,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_1),
>>> +		=2Eparent_data =3D gcc_parent_data_1,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_1),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -892,8 +909,8 @@ static struct clk_rcg2 hdmi_pclk_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "hdmi_pclk_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_8,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_8),
>>> +		=2Eparent_data =3D gcc_parent_data_8,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_8),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -919,8 +936,8 @@ static struct clk_rcg2 mdp_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_mdp_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "mdp_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_9,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_9),
>>> +		=2Eparent_data =3D gcc_parent_data_9,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_9),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -938,8 +955,8 @@ static struct clk_rcg2 pcie_0_aux_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_pcie_0_aux_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "pcie_0_aux_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_10,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_10),
>>> +		=2Eparent_data =3D gcc_parent_data_10,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_10),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -959,8 +976,8 @@ static struct clk_rcg2 pcie_0_pipe_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_pcie_0_pipe_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "pcie_0_pipe_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_11,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_11),
>>> +		=2Eparent_data =3D gcc_parent_data_11,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_11),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -972,8 +989,8 @@ static struct clk_rcg2 pclk0_clk_src =3D {
>>>  	=2Eparent_map =3D gcc_parent_map_12,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "pclk0_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_12,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_12),
>>> +		=2Eparent_data =3D gcc_parent_data_12,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_12),
>>>  		=2Eflags =3D CLK_SET_RATE_PARENT,
>>>  		=2Eops =3D &clk_pixel_ops,
>>>  	},
>>> @@ -993,8 +1010,8 @@ static struct clk_rcg2 pdm2_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_pdm2_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "pdm2_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1021,8 +1038,8 @@ static struct clk_rcg2 sdcc1_apps_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_sdcc1_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "sdcc1_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_13,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_13),
>>> +		=2Eparent_data =3D gcc_parent_data_13,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_13),
>>>  		=2Eops =3D &clk_rcg2_floor_ops,
>>>  	},
>>>  };
>>> @@ -1041,8 +1058,8 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_sdcc1_ice_core_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "sdcc1_ice_core_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_3,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_3),
>>> +		=2Eparent_data =3D gcc_parent_data_3,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_3),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1067,8 +1084,8 @@ static struct clk_rcg2 sdcc2_apps_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_sdcc2_apps_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "sdcc2_apps_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_14,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_14),
>>> +		=2Eparent_data =3D gcc_parent_data_14,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_14),
>>>  		=2Eops =3D &clk_rcg2_floor_ops,
>>>  	},
>>>  };
>>> @@ -1081,8 +1098,8 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "usb20_mock_utmi_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_1,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_1),
>>> +		=2Eparent_data =3D gcc_parent_data_1,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_1),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1103,8 +1120,8 @@ static struct clk_rcg2 usb30_master_clk_src =3D =
{
>>>  	=2Efreq_tbl =3D ftbl_usb30_master_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "usb30_master_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_0,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_0),
>>> +		=2Eparent_data =3D gcc_parent_data_0,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_0),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1117,8 +1134,8 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src =
=3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "usb30_mock_utmi_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_1,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_1),
>>> +		=2Eparent_data =3D gcc_parent_data_1,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_1),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1131,8 +1148,8 @@ static struct clk_rcg2 usb3_phy_aux_clk_src =3D =
{
>>>  	=2Efreq_tbl =3D ftbl_pcie_0_aux_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "usb3_phy_aux_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_1,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_1),
>>> +		=2Eparent_data =3D gcc_parent_data_1,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_1),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1154,8 +1171,8 @@ static struct clk_rcg2 usb_hs_system_clk_src =3D=
 {
>>>  	=2Efreq_tbl =3D ftbl_usb_hs_system_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "usb_hs_system_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_3,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_3),
>>> +		=2Eparent_data =3D gcc_parent_data_3,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_3),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1168,8 +1185,8 @@ static struct clk_rcg2 vsync_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_esc0_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  		=2Ename =3D "vsync_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_15,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_15),
>>> +		=2Eparent_data =3D gcc_parent_data_15,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_15),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1190,8 +1207,8 @@ static struct clk_rcg2 cdsp_bimc_clk_src =3D {
>>>  	=2Efreq_tbl =3D ftbl_cdsp_bimc_clk_src,
>>>  	=2Eclkr=2Ehw=2Einit =3D &(struct clk_init_data) {
>>>  		=2Ename =3D "cdsp_bimc_clk_src",
>>> -		=2Eparent_names =3D gcc_parent_names_16,
>>> -		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_names_16),
>>> +		=2Eparent_data =3D gcc_parent_data_16,
>>> +		=2Enum_parents =3D ARRAY_SIZE(gcc_parent_data_16),
>>>  		=2Eops =3D &clk_rcg2_ops,
>>>  	},
>>>  };
>>> @@ -1204,8 +1221,8 @@ static struct clk_branch gcc_apss_ahb_clk =3D {
>>>  		=2Eenable_mask =3D BIT(14),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gcc_apss_ahb_clk",
>>> -			=2Eparent_names =3D (const char *[]){
>>> -				"apss_ahb_clk_src",
>>> +			=2Eparent_hws =3D (const struct clk_hw*[]) {
>>> +				&apss_ahb_clk_src=2Eclkr=2Ehw,
>>>  			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eflags =3D CLK_SET_RATE_PARENT,
>>> @@ -1236,8 +1253,8 @@ static struct clk_branch gcc_bimc_gfx_clk =3D {
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gcc_bimc_gfx_clk",
>>>  			=2Eops =3D &clk_branch2_ops,
>>> -			=2Eparent_names =3D (const char *[]){
>>> -				"gcc_apss_tcu_clk",
>>> +			=2Eparent_hws =3D (const struct clk_hw*[]) {
>>> +				&gcc_apss_tcu_clk=2Eclkr=2Ehw,
>>>  			},
>>> =20
>>>  		},
>>> @@ -1265,8 +1282,8 @@ static struct clk_branch gcc_bimc_cdsp_clk =3D {
>>>  		=2Eenable_mask =3D BIT(0),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data) {
>>>  			=2Ename =3D "gcc_bimc_cdsp_clk",
>>> -			=2Eparent_names =3D (const char *[]) {
>>> -				"cdsp_bimc_clk_src",
>>> +			=2Eparent_hws =3D (const struct clk_hw*[]) {
>>> +				&cdsp_bimc_clk_src=2Eclkr=2Ehw
>>>  			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eflags =3D CLK_SET_RATE_PARENT,
>>> @@ -1335,8 +1352,8 @@ static struct clk_branch gcc_blsp1_qup0_i2c_apps=
_clk =3D {
>>>  		=2Eenable_mask =3D BIT(0),
>>>  		=2Ehw=2Einit =3D &(struct clk_init_data){
>>>  			=2Ename =3D "gcc_blsp1_qup0_i2c_apps_clk",
>>> -			=2Eparent_names =3D (const char *[]){
>>> -				"blsp1_qup0_i2c_apps_clk_src",
>>> +			=2Eparent_hws =3D (const struct clk_hw*[]) {
>>> +				&blsp1_qup0_i2c_apps_clk_src=2Eclkr=2Ehw,
>>>  			},
>>>  			=2Enum_parents =3D 1,
>>>  			=2Eflags=20
