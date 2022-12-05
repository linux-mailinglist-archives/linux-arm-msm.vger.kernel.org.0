Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701F8643741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiLEVp4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbiLEVpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:45:38 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B90023BD1
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:43:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j4so20728304lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VC/4yS8pZdoSsuCJiNW3H3M7l87/7+3qFGG6zghOOWA=;
        b=hlFkId0Q7jamO6i8T2gIdKlFyH3iYYC6blxVkAcK2i7rfrzz+oqQWW52Ul2PrmCUYK
         3aBLq7bOh8fDuzvgZ1WtND9tgCGhR6BrPOQejddEh0ZVfW+vWvOBoCg7e59i6VM6mWNm
         Xp+nd1uUt7yD9y6GR1gGPiLEw2nL3rrfDF8XLrqIBQPIsWMwbpbKmYeGGQ9/qoGeXua6
         KAkNeTIAptLiZoI5VjlBa1DbR8Vdos1VIjOUy/YzP44H/yD4jo+rCPJXdIJH8Gf6FXxc
         sagjvATUl2QMtQ4NZjx8EtZGQ9S5uSBSlkF/KLvePj+wmi0D8BrqCAKOG2YWSfEuyj4N
         gseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VC/4yS8pZdoSsuCJiNW3H3M7l87/7+3qFGG6zghOOWA=;
        b=fpyzD6Q232G+zQMYf57f4ZhgY1Qejzh2iE18AanwWiIkGE1f6d2uWjmLz4ndKXcSnq
         OKBPHLYVWwU37LLgA32OGJwRGMuyyRRg2EUcXW3QH5Lzsi188mGQ7CiaEYWIHiT8572t
         41T88ldVvUvJOsjes4Ol7Ec6FA2/d6m76OZNgHbEczQywLF+duH8H3Pj4vcC3K6WKNSe
         g6dq6DIZ+QuEOiZMS0HhXBVTuXe50yZ7vsVbe0p+gQNrMq76gbKTxKFbE8DBJZZmObq7
         ugMjZX/NjH1YhMyAVtD65kfEJnKiLcOA+7eCmiDv2m3Fvi40dxkJrEU3T5pEIvu3YNUd
         LI4Q==
X-Gm-Message-State: ANoB5pkbWzttT/csyEFSYyf3yveuHjziJdol76YW2+jE40G/GAwx3LHx
        TJ0kz6aehhcej5yllpreMoFIsw==
X-Google-Smtp-Source: AA0mqf7jkMFiMlA5g+4BeO5FKKTC0w1eZ6cAqYt3QrssDc047jYG9oOeAdlypzlgHOJWmQMF8Fs+EA==
X-Received: by 2002:a19:6717:0:b0:4b4:e13f:6a17 with SMTP id b23-20020a196717000000b004b4e13f6a17mr23923143lfc.372.1670276584849;
        Mon, 05 Dec 2022 13:43:04 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id s20-20020a056512315400b004b564e1a4e0sm963555lfi.76.2022.12.05.13.43.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:43:04 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:42:40 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
CC:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 15/16] clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
User-Agent: K-9 Mail for Android
In-Reply-To: <a0070b53-3a83-1efc-ebfd-677f966c29bd@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org> <20221203175808.859067-16-dmitry.baryshkov@linaro.org> <a0070b53-3a83-1efc-ebfd-677f966c29bd@linaro.org>
Message-ID: <025B6DE8-889B-4882-839B-000B8739871D@linaro.org>
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



On 5 December 2022 20:05:31 GMT+03:00, Alex Elder <elder@linaro=2Eorg> wro=
te:
>On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
>> Add special macro for the clocks of QCOM_SMD_RPM_BUS_CLK type=2E Use it=
 to
>> insert the _bus_N part into the clock symbol name=2E The system (and
>> userspace) name of these clocks remains intact=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>Once again you're passing "empty" arguments to macros, which I
>really don't like=2E  Can you please try to do two variants, one
>which takes something in that "empty" spot and another that
>doesn't?  For example, here you could just add a new macro,
>__DEFINE_CLK_SMD_RPM_PREFIX() that takes the additional argument=2E
>
>I suppose this could get messy (with duplication)=2E  Another
>alternative would be to have the existing macro call the new
>"prefix" one, but have that be the *only* place an empty value
>is passed as the argument=2E  And add a comment calling attention
>to/explaining that=2E  Maybe even put /* empty */ there=2E

This looks like a nice suggestion! Thanks, I'll try to implement this for =
v2=2E


>
>					-Alex
>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm=2Ec | 253 +++++++++++++++++-------------=
---
>>   1 file changed, 129 insertions(+), 124 deletions(-)
>>=20
>> diff --git a/drivers/clk/qcom/clk-smd-rpm=2Ec b/drivers/clk/qcom/clk-sm=
d-rpm=2Ec
>> index f407acb3c6d3=2E=2Eb37e5d883a10 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm=2Ec
>> +++ b/drivers/clk/qcom/clk-smd-rpm=2Ec
>> @@ -25,13 +25,13 @@
>>   #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>>   #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>>   -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, =
key)      \
>> -	static struct clk_smd_rpm _platform##_##_active;		      \
>> -	static struct clk_smd_rpm _platform##_##_name =3D {		      \
>> +#define __DEFINE_CLK_SMD_RPM(_platform, _prefix, _name, _active, type,=
 r_id, key)      \
>> +	static struct clk_smd_rpm _platform##_##_prefix##_active;	      \
>> +	static struct clk_smd_rpm _platform##_##_prefix##_name =3D {	      \
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>>   		=2Erpm_key =3D (key),					      \
>> -		=2Epeer =3D &_platform##_##_active,				      \
>> +		=2Epeer =3D &_platform##_##_prefix##_active,		      \
>>   		=2Erate =3D INT_MAX,					      \
>>   		=2Ehw=2Einit =3D &(struct clk_init_data){			      \
>>   			=2Eops =3D &clk_smd_rpm_ops,			      \
>> @@ -43,12 +43,12 @@
>>   			=2Enum_parents =3D 1,				      \
>>   		},							      \
>>   	};								      \
>> -	static struct clk_smd_rpm _platform##_##_active =3D {		      \
>> +	static struct clk_smd_rpm _platform##_##_prefix##_active =3D {	      =
\
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>>   		=2Eactive_only =3D true,					      \
>>   		=2Erpm_key =3D (key),					      \
>> -		=2Epeer =3D &_platform##_##_name,				      \
>> +		=2Epeer =3D &_platform##_##_prefix##_name,			      \
>>   		=2Erate =3D INT_MAX,					      \
>>   		=2Ehw=2Einit =3D &(struct clk_init_data){			      \
>>   			=2Eops =3D &clk_smd_rpm_ops,			      \
>> @@ -101,11 +101,16 @@
>>   	}
>>     #define DEFINE_CLK_SMD_RPM(_platform, _name, type, r_id)		      \
>> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_=
id,   \
>> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk, _name##_a_clk, type, =
r_id,   \
>> +		QCOM_RPM_SMD_KEY_RATE)
>> +
>> +#define DEFINE_CLK_SMD_RPM_BUS(_platform, _name, r_id)			      \
>> +		__DEFINE_CLK_SMD_RPM(_platform, bus_##r_id##_,		      \
>> +		_name##_clk, _name##_a_clk, QCOM_SMD_RPM_BUS_CLK, r_id,	      \
>>   		QCOM_RPM_SMD_KEY_RATE)
>>     #define DEFINE_CLK_SMD_RPM_CLK_SRC(_platform, _name, type, r_id)	  =
    \
>> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk_src, _name##_a_clk_src, =
type, r_id,   \
>> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk_src, _name##_a_clk_src=
, type, r_id,   \
>>   		QCOM_RPM_SMD_KEY_RATE)
>>     #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, type, r_id, r)	=
      \
>> @@ -117,7 +122,7 @@
>>   		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>>     #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, type, r_id)		    =
  \
>> -		__DEFINE_CLK_SMD_RPM(_platform, _name##_clk, _name##_a_clk, type, r_=
id,   \
>> +		__DEFINE_CLK_SMD_RPM(_platform, , _name##_clk, _name##_a_clk, type, =
r_id,   \
>>   		QCOM_RPM_SMD_KEY_STATE)
>>     #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		  =
    \
>> @@ -435,15 +440,15 @@ DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc, QC=
OM_SMD_RPM_AGGR_CLK, 2, 1000);
>>   DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc, QCOM_SMD_RPM_AGGR_CLK, 1);
>>   DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc, QCOM_SMD_RPM_AGGR_CLK, 2);
>>   -DEFINE_CLK_SMD_RPM(msm8916, pcnoc, QCOM_SMD_RPM_BUS_CLK, 0);
>> -DEFINE_CLK_SMD_RPM(msm8916, snoc, QCOM_SMD_RPM_BUS_CLK, 1);
>> -DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc, QCOM_SMD_RPM_BUS_CLK, 2);
>> -DEFINE_CLK_SMD_RPM(msm8974, cnoc, QCOM_SMD_RPM_BUS_CLK, 2);
>> -DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb, QCOM_SMD_RPM_BUS_CLK, 3);
>> -DEFINE_CLK_SMD_RPM(sm6125, snoc_periph, QCOM_SMD_RPM_BUS_CLK, 0);
>> -DEFINE_CLK_SMD_RPM(sm6125, cnoc, QCOM_SMD_RPM_BUS_CLK, 1);
>> -DEFINE_CLK_SMD_RPM(sm6125, snoc, QCOM_SMD_RPM_BUS_CLK, 2);
>> -DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass, QCOM_SMD_RPM_BUS_CLK, 5);
>> +DEFINE_CLK_SMD_RPM_BUS(msm8916, pcnoc, 0);
>> +DEFINE_CLK_SMD_RPM_BUS(msm8916, snoc, 1);
>> +DEFINE_CLK_SMD_RPM_BUS(msm8936, sysmmnoc, 2);
>> +DEFINE_CLK_SMD_RPM_BUS(msm8974, cnoc, 2);
>> +DEFINE_CLK_SMD_RPM_BUS(msm8974, mmssnoc_ahb, 3);
>> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_periph, 0);
>> +DEFINE_CLK_SMD_RPM_BUS(sm6125, cnoc, 1);
>> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc, 2);
>> +DEFINE_CLK_SMD_RPM_BUS(sm6125, snoc_lpass, 5);
>>     DEFINE_CLK_SMD_RPM(msm8916, bimc, QCOM_SMD_RPM_MEM_CLK, 0);
>>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc, QCOM_SMD_RPM_MEM_CLK, 1);
>> @@ -493,10 +498,10 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 1=
2, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
>>     static struct clk_smd_rpm *msm8909_clks[] =3D {
>> -	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK]		=3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK]		=3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QPIC_CLK]		=3D &qcs404_qpic_clk,
>> @@ -527,10 +532,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
909 =3D {
>>   };
>>     static struct clk_smd_rpm *msm8916_clks[] =3D {
>> -	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK]		=3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK]		=3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QDSS_CLK]		=3D &msm8916_qdss_clk,
>> @@ -559,14 +564,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
916 =3D {
>>   };
>>     static struct clk_smd_rpm *msm8936_clks[] =3D {
>> -	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK]		=3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK]		=3D &msm8916_bimc_a_clk,
>> -	[RPM_SMD_SYSMMNOC_CLK]		=3D &msm8936_sysmmnoc_clk,
>> -	[RPM_SMD_SYSMMNOC_A_CLK]	=3D &msm8936_sysmmnoc_a_clk,
>> +	[RPM_SMD_SYSMMNOC_CLK]		=3D &msm8936_bus_2_sysmmnoc_clk,
>> +	[RPM_SMD_SYSMMNOC_A_CLK]	=3D &msm8936_bus_2_sysmmnoc_a_clk,
>>   	[RPM_SMD_QDSS_CLK]		=3D &msm8916_qdss_clk,
>>   	[RPM_SMD_QDSS_A_CLK]		=3D &msm8916_qdss_a_clk,
>>   	[RPM_SMD_BB_CLK1]		=3D &msm8916_bb_clk1,
>> @@ -593,14 +598,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
936 =3D {
>>   };
>>     static struct clk_smd_rpm *msm8974_clks[] =3D {
>> -	[RPM_SMD_PNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_snoc_a_clk,
>> -	[RPM_SMD_CNOC_CLK]		=3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK]		=3D &msm8974_cnoc_a_clk,
>> -	[RPM_SMD_MMSSNOC_AHB_CLK]	=3D &msm8974_mmssnoc_ahb_clk,
>> -	[RPM_SMD_MMSSNOC_AHB_A_CLK]	=3D &msm8974_mmssnoc_ahb_a_clk,
>> +	[RPM_SMD_PNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK]		=3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_bus_1_snoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK]		=3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK]		=3D &msm8974_bus_2_cnoc_a_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_CLK]	=3D &msm8974_bus_3_mmssnoc_ahb_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_A_CLK]	=3D &msm8974_bus_3_mmssnoc_ahb_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_GFX3D_CLK_SRC]		=3D &msm8974_gfx3d_clk_src,
>>   	[RPM_SMD_GFX3D_A_CLK_SRC]	=3D &msm8974_gfx3d_a_clk_src,
>> @@ -645,14 +650,14 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
974 =3D {
>>   static struct clk_smd_rpm *msm8976_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_PCNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>> -	[RPM_SMD_SYSMMNOC_CLK]	=3D &msm8936_sysmmnoc_clk,
>> -	[RPM_SMD_SYSMMNOC_A_CLK] =3D &msm8936_sysmmnoc_a_clk,
>> +	[RPM_SMD_SYSMMNOC_CLK]	=3D &msm8936_bus_2_sysmmnoc_clk,
>> +	[RPM_SMD_SYSMMNOC_A_CLK] =3D &msm8936_bus_2_sysmmnoc_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &msm8916_qdss_clk,
>>   	[RPM_SMD_QDSS_A_CLK] =3D &msm8916_qdss_a_clk,
>>   	[RPM_SMD_BB_CLK1] =3D &msm8916_bb_clk1,
>> @@ -679,18 +684,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
976 =3D {
>>   static struct clk_smd_rpm *msm8992_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_PNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> +	[RPM_SMD_PNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>>   	[RPM_SMD_OCMEMGX_CLK] =3D &msm8974_ocmemgx_clk,
>>   	[RPM_SMD_OCMEMGX_A_CLK] =3D &msm8974_ocmemgx_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_bus_2_cnoc_a_clk,
>>   	[RPM_SMD_GFX3D_CLK_SRC] =3D &msm8974_gfx3d_clk_src,
>>   	[RPM_SMD_GFX3D_A_CLK_SRC] =3D &msm8974_gfx3d_a_clk_src,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BB_CLK1] =3D &msm8916_bb_clk1,
>>   	[RPM_SMD_BB_CLK1_A] =3D &msm8916_bb_clk1_a,
>>   	[RPM_SMD_BB_CLK1_PIN] =3D &msm8916_bb_clk1_pin,
>> @@ -709,8 +714,8 @@ static struct clk_smd_rpm *msm8992_clks[] =3D {
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_LN_BB_CLK] =3D &qcs404_ln_bb_clk,
>>   	[RPM_SMD_LN_BB_A_CLK] =3D &qcs404_ln_bb_clk_a,
>> -	[RPM_SMD_MMSSNOC_AHB_CLK] =3D &msm8974_mmssnoc_ahb_clk,
>> -	[RPM_SMD_MMSSNOC_AHB_A_CLK] =3D &msm8974_mmssnoc_ahb_a_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_CLK] =3D &msm8974_bus_3_mmssnoc_ahb_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_A_CLK] =3D &msm8974_bus_3_mmssnoc_ahb_a_clk,
>>   	[RPM_SMD_MSS_CFG_AHB_CLK] =3D &msm8992_branch_mss_cfg_ahb_clk,
>>   	[RPM_SMD_MSS_CFG_AHB_A_CLK] =3D &msm8992_branch_mss_cfg_ahb_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &msm8916_qdss_clk,
>> @@ -737,18 +742,18 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
992 =3D {
>>   static struct clk_smd_rpm *msm8994_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_PNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> +	[RPM_SMD_PNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>>   	[RPM_SMD_OCMEMGX_CLK] =3D &msm8974_ocmemgx_clk,
>>   	[RPM_SMD_OCMEMGX_A_CLK] =3D &msm8974_ocmemgx_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_bus_2_cnoc_a_clk,
>>   	[RPM_SMD_GFX3D_CLK_SRC] =3D &msm8974_gfx3d_clk_src,
>>   	[RPM_SMD_GFX3D_A_CLK_SRC] =3D &msm8974_gfx3d_a_clk_src,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BB_CLK1] =3D &msm8916_bb_clk1,
>>   	[RPM_SMD_BB_CLK1_A] =3D &msm8916_bb_clk1_a,
>>   	[RPM_SMD_BB_CLK1_PIN] =3D &msm8916_bb_clk1_pin,
>> @@ -767,8 +772,8 @@ static struct clk_smd_rpm *msm8994_clks[] =3D {
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_LN_BB_CLK] =3D &qcs404_ln_bb_clk,
>>   	[RPM_SMD_LN_BB_A_CLK] =3D &qcs404_ln_bb_clk_a,
>> -	[RPM_SMD_MMSSNOC_AHB_CLK] =3D &msm8974_mmssnoc_ahb_clk,
>> -	[RPM_SMD_MMSSNOC_AHB_A_CLK] =3D &msm8974_mmssnoc_ahb_a_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_CLK] =3D &msm8974_bus_3_mmssnoc_ahb_clk,
>> +	[RPM_SMD_MMSSNOC_AHB_A_CLK] =3D &msm8974_bus_3_mmssnoc_ahb_a_clk,
>>   	[RPM_SMD_MSS_CFG_AHB_CLK] =3D &msm8992_branch_mss_cfg_ahb_clk,
>>   	[RPM_SMD_MSS_CFG_AHB_A_CLK] =3D &msm8992_branch_mss_cfg_ahb_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &msm8916_qdss_clk,
>> @@ -795,12 +800,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
994 =3D {
>>   };
>>     static struct clk_smd_rpm *msm8996_clks[] =3D {
>> -	[RPM_SMD_PCNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_cnoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_bus_2_cnoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_MMAXI_CLK] =3D &msm8996_mmssnoc_axi_rpm_clk,
>> @@ -849,10 +854,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
996 =3D {
>>   static struct clk_smd_rpm *qcs404_clks[] =3D {
>>   	[RPM_SMD_QDSS_CLK] =3D &msm8916_qdss_clk,
>>   	[RPM_SMD_QDSS_A_CLK] =3D &msm8916_qdss_a_clk,
>> -	[RPM_SMD_PNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_BIMC_GPU_CLK] =3D &qcs404_bimc_gpu_clk,
>> @@ -879,12 +884,12 @@ static struct clk_smd_rpm *msm8998_clks[] =3D {
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>> -	[RPM_SMD_PCNOC_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_cnoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_bus_2_cnoc_a_clk,
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>>   	[RPM_SMD_CE1_A_CLK] =3D &msm8992_ce1_a_clk,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> @@ -937,12 +942,12 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
998 =3D {
>>   static struct clk_smd_rpm *sdm660_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_SNOC_CLK] =3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_snoc_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &msm8974_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_cnoc_a_clk,
>> -	[RPM_SMD_CNOC_PERIPH_CLK] =3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_CNOC_PERIPH_A_CLK] =3D &msm8916_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &msm8916_bus_1_snoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &msm8974_bus_2_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &msm8974_bus_2_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_PERIPH_CLK] =3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_CNOC_PERIPH_A_CLK] =3D &msm8916_bus_0_pcnoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_MMSSNOC_AXI_CLK] =3D &msm8996_mmssnoc_axi_rpm_clk,
>> @@ -983,8 +988,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660=
 =3D {
>>   static struct clk_smd_rpm *mdm9607_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC]		=3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC]		=3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK]		=3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QPIC_CLK]		=3D &qcs404_qpic_clk,
>> @@ -1005,16 +1010,16 @@ static const struct rpm_smd_clk_desc rpm_clk_md=
m9607 =3D {
>>   static struct clk_smd_rpm *msm8953_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC]		=3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC]		=3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_pcnoc_clk,
>> -	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_pcnoc_a_clk,
>> -	[RPM_SMD_SNOC_CLK]		=3D &msm8916_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_snoc_a_clk,
>> +	[RPM_SMD_PCNOC_CLK]		=3D &msm8916_bus_0_pcnoc_clk,
>> +	[RPM_SMD_PCNOC_A_CLK]		=3D &msm8916_bus_0_pcnoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK]		=3D &msm8916_bus_1_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK]		=3D &msm8916_bus_1_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK]		=3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK]		=3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_IPA_CLK]		=3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK]		=3D &msm8976_ipa_a_clk,
>> -	[RPM_SMD_SYSMMNOC_CLK]		=3D &msm8936_sysmmnoc_clk,
>> -	[RPM_SMD_SYSMMNOC_A_CLK]	=3D &msm8936_sysmmnoc_a_clk,
>> +	[RPM_SMD_SYSMMNOC_CLK]		=3D &msm8936_bus_2_sysmmnoc_clk,
>> +	[RPM_SMD_SYSMMNOC_A_CLK]	=3D &msm8936_bus_2_sysmmnoc_a_clk,
>>   	[RPM_SMD_QDSS_CLK]		=3D &msm8916_qdss_clk,
>>   	[RPM_SMD_QDSS_A_CLK]		=3D &msm8916_qdss_a_clk,
>>   	[RPM_SMD_BB_CLK1]		=3D &msm8916_bb_clk1,
>> @@ -1041,8 +1046,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8=
953 =3D {
>>   static struct clk_smd_rpm *sm6125_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_SNOC_CLK] =3D &sm6125_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &sm6125_bus_2_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_bus_2_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &sm6125_branch_qdss_clk,
>> @@ -1051,8 +1056,8 @@ static struct clk_smd_rpm *sm6125_clks[] =3D {
>>   	[RPM_SMD_RF_CLK1_A] =3D &msm8916_rf_clk1_a,
>>   	[RPM_SMD_RF_CLK2] =3D &msm8916_rf_clk2,
>>   	[RPM_SMD_RF_CLK2_A] =3D &msm8916_rf_clk2_a,
>> -	[RPM_SMD_CNOC_CLK] =3D &sm6125_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &sm6125_bus_1_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_bus_1_cnoc_a_clk,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>> @@ -1069,10 +1074,10 @@ static struct clk_smd_rpm *sm6125_clks[] =3D {
>>   	[RPM_SMD_MMRT_A_CLK] =3D &sm6125_mmrt_a_clk,
>>   	[RPM_SMD_MMNRT_CLK] =3D &sm6125_mmnrt_clk,
>>   	[RPM_SMD_MMNRT_A_CLK] =3D &sm6125_mmnrt_a_clk,
>> -	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_snoc_periph_clk,
>> -	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_snoc_periph_a_clk,
>> -	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_snoc_lpass_clk,
>> -	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_snoc_lpass_a_clk,
>> +	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_bus_0_snoc_periph_clk,
>> +	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_bus_0_snoc_periph_a_clk,
>> +	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_bus_5_snoc_lpass_clk,
>> +	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_bus_5_snoc_lpass_a_clk,
>>   };
>>     static const struct rpm_smd_clk_desc rpm_clk_sm6125 =3D {
>> @@ -1084,8 +1089,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm61=
25 =3D {
>>   static struct clk_smd_rpm *sm6115_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_SNOC_CLK] =3D &sm6125_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &sm6125_bus_2_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_bus_2_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &sm6125_branch_qdss_clk,
>> @@ -1094,8 +1099,8 @@ static struct clk_smd_rpm *sm6115_clks[] =3D {
>>   	[RPM_SMD_RF_CLK1_A] =3D &msm8916_rf_clk1_a,
>>   	[RPM_SMD_RF_CLK2] =3D &msm8916_rf_clk2,
>>   	[RPM_SMD_RF_CLK2_A] =3D &msm8916_rf_clk2_a,
>> -	[RPM_SMD_CNOC_CLK] =3D &sm6125_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &sm6125_bus_1_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_bus_1_cnoc_a_clk,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>> @@ -1106,10 +1111,10 @@ static struct clk_smd_rpm *sm6115_clks[] =3D {
>>   	[RPM_SMD_MMRT_A_CLK] =3D &sm6125_mmrt_a_clk,
>>   	[RPM_SMD_MMNRT_CLK] =3D &sm6125_mmnrt_clk,
>>   	[RPM_SMD_MMNRT_A_CLK] =3D &sm6125_mmnrt_a_clk,
>> -	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_snoc_periph_clk,
>> -	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_snoc_periph_a_clk,
>> -	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_snoc_lpass_clk,
>> -	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_snoc_lpass_a_clk,
>> +	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_bus_0_snoc_periph_clk,
>> +	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_bus_0_snoc_periph_a_clk,
>> +	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_bus_5_snoc_lpass_clk,
>> +	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_bus_5_snoc_lpass_a_clk,
>>   	[RPM_SMD_RF_CLK1_PIN] =3D &msm8916_rf_clk1_pin,
>>   	[RPM_SMD_RF_CLK1_A_PIN] =3D &msm8916_rf_clk1_a_pin,
>>   	[RPM_SMD_RF_CLK2_PIN] =3D &msm8916_rf_clk2_pin,
>> @@ -1124,14 +1129,14 @@ static const struct rpm_smd_clk_desc rpm_clk_sm=
6115 =3D {
>>   static struct clk_smd_rpm *sm6375_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_SNOC_CLK] =3D &sm6125_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &sm6125_bus_2_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_bus_2_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &sm6125_branch_qdss_clk,
>>   	[RPM_SMD_QDSS_A_CLK] =3D &sm6125_branch_qdss_a_clk,
>> -	[RPM_SMD_CNOC_CLK] =3D &sm6125_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &sm6125_bus_1_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_bus_1_cnoc_a_clk,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_QUP_CLK] =3D &sm6125_qup_clk,
>> @@ -1140,10 +1145,10 @@ static struct clk_smd_rpm *sm6375_clks[] =3D {
>>   	[RPM_SMD_MMRT_A_CLK] =3D &sm6125_mmrt_a_clk,
>>   	[RPM_SMD_MMNRT_CLK] =3D &sm6125_mmnrt_clk,
>>   	[RPM_SMD_MMNRT_A_CLK] =3D &sm6125_mmnrt_a_clk,
>> -	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_snoc_periph_clk,
>> -	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_snoc_periph_a_clk,
>> -	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_snoc_lpass_clk,
>> -	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_snoc_lpass_a_clk,
>> +	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_bus_0_snoc_periph_clk,
>> +	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_bus_0_snoc_periph_a_clk,
>> +	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_bus_5_snoc_lpass_clk,
>> +	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_bus_5_snoc_lpass_a_clk,
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>>   	[RPM_SMD_CE1_A_CLK] =3D &msm8992_ce1_a_clk,
>>   	[RPM_SMD_HWKM_CLK] =3D &qcm2290_hwkm_clk,
>> @@ -1161,8 +1166,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm63=
75 =3D {
>>   static struct clk_smd_rpm *qcm2290_clks[] =3D {
>>   	[RPM_SMD_XO_CLK_SRC] =3D &sdm660_branch_bi_tcxo,
>>   	[RPM_SMD_XO_A_CLK_SRC] =3D &sdm660_branch_bi_tcxo_a,
>> -	[RPM_SMD_SNOC_CLK] =3D &sm6125_snoc_clk,
>> -	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_snoc_a_clk,
>> +	[RPM_SMD_SNOC_CLK] =3D &sm6125_bus_2_snoc_clk,
>> +	[RPM_SMD_SNOC_A_CLK] =3D &sm6125_bus_2_snoc_a_clk,
>>   	[RPM_SMD_BIMC_CLK] =3D &msm8916_bimc_clk,
>>   	[RPM_SMD_BIMC_A_CLK] =3D &msm8916_bimc_a_clk,
>>   	[RPM_SMD_QDSS_CLK] =3D &sm6125_branch_qdss_clk,
>> @@ -1171,8 +1176,8 @@ static struct clk_smd_rpm *qcm2290_clks[] =3D {
>>   	[RPM_SMD_LN_BB_CLK2_A] =3D &msm8998_ln_bb_clk2_a,
>>   	[RPM_SMD_RF_CLK3] =3D &qcm2290_38m4_rf_clk3,
>>   	[RPM_SMD_RF_CLK3_A] =3D &qcm2290_38m4_rf_clk3_a,
>> -	[RPM_SMD_CNOC_CLK] =3D &sm6125_cnoc_clk,
>> -	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_cnoc_a_clk,
>> +	[RPM_SMD_CNOC_CLK] =3D &sm6125_bus_1_cnoc_clk,
>> +	[RPM_SMD_CNOC_A_CLK] =3D &sm6125_bus_1_cnoc_a_clk,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   	[RPM_SMD_QUP_CLK] =3D &sm6125_qup_clk,
>> @@ -1181,10 +1186,10 @@ static struct clk_smd_rpm *qcm2290_clks[] =3D {
>>   	[RPM_SMD_MMRT_A_CLK] =3D &sm6125_mmrt_a_clk,
>>   	[RPM_SMD_MMNRT_CLK] =3D &sm6125_mmnrt_clk,
>>   	[RPM_SMD_MMNRT_A_CLK] =3D &sm6125_mmnrt_a_clk,
>> -	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_snoc_periph_clk,
>> -	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_snoc_periph_a_clk,
>> -	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_snoc_lpass_clk,
>> -	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_snoc_lpass_a_clk,
>> +	[RPM_SMD_SNOC_PERIPH_CLK] =3D &sm6125_bus_0_snoc_periph_clk,
>> +	[RPM_SMD_SNOC_PERIPH_A_CLK] =3D &sm6125_bus_0_snoc_periph_a_clk,
>> +	[RPM_SMD_SNOC_LPASS_CLK] =3D &sm6125_bus_5_snoc_lpass_clk,
>> +	[RPM_SMD_SNOC_LPASS_A_CLK] =3D &sm6125_bus_5_snoc_lpass_a_clk,
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>>   	[RPM_SMD_CE1_A_CLK] =3D &msm8992_ce1_a_clk,
>>   	[RPM_SMD_QPIC_CLK] =3D &qcs404_qpic_clk,
>

--=20
With best wishes
Dmitry
