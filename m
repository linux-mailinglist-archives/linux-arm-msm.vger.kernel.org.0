Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298423DBF5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 22:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhG3UHn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 16:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhG3UHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 16:07:42 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652EFC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 13:07:37 -0700 (PDT)
Received: from [192.168.1.59] (bband-dyn19.178-41-181.t-com.sk [178.41.181.19])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6498E3EBD7;
        Fri, 30 Jul 2021 22:07:26 +0200 (CEST)
Date:   Fri, 30 Jul 2021 22:07:20 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 3/3] rpmcc: Add support for SM6125
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <8KQ2XQ.EMFL3KIC3SJX1@somainline.org>
In-Reply-To: <162742239972.2368309.5551349117052770211@swboyd.mtv.corp.google.com>
References: <20210629102624.194378-1-martin.botka@somainline.org>
        <20210629102624.194378-4-martin.botka@somainline.org>
        <162742239972.2368309.5551349117052770211@swboyd.mtv.corp.google.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Tue, Jul 27 2021 at 02:46:39 PM -0700, Stephen Boyd 
<sboyd@kernel.org> wrote:
> Quoting Martin Botka (2021-06-29 03:26:23)
>>  diff --git a/drivers/clk/qcom/clk-smd-rpm.c 
>> b/drivers/clk/qcom/clk-smd-rpm.c
>>  index 8200c26b968c..51458f740ba0 100644
>>  --- a/drivers/clk/qcom/clk-smd-rpm.c
>>  +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>  @@ -1059,6 +1059,61 @@ static const struct rpm_smd_clk_desc 
>> rpm_clk_sdm660 = {
>>          .num_clks = ARRAY_SIZE(sdm660_clks),
>>   };
>> 
>>  +/* SM6125 */
>>  +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, bi_tcxo, bi_tcxo_ao,
>>  +                                       QCOM_SMD_RPM_MISC_CLK, 0, 
>> 19200000);
>>  +DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, 
>> QCOM_SMD_RPM_BUS_CLK, 1);
>>  +DEFINE_CLK_SMD_RPM(sm6125, bimc_clk, bimc_a_clk, 
>> QCOM_SMD_RPM_MEM_CLK, 0);
> 
> Can we use msm8916_bimc_clk?
> 
>>  +DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, 
>> QCOM_SMD_RPM_BUS_CLK, 2);
>>  +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
>>  +                                       QCOM_SMD_RPM_MISC_CLK, 1, 
>> 19200000);
>>  +DEFINE_CLK_SMD_RPM(sm6125, ce1_clk, ce1_a_clk, 
>> QCOM_SMD_RPM_CE_CLK, 0);
> 
> Can we use msm8992_ce1_clk?
> 
>>  +DEFINE_CLK_SMD_RPM(sm6125, ipa_clk, ipa_a_clk, 
>> QCOM_SMD_RPM_IPA_CLK, 0);
> 
> Can we use msm8976_ipa_clk?
> 
>>  +DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, 
>> QCOM_SMD_RPM_QUP_CLK, 0);
>>  +DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, 
>> QCOM_SMD_RPM_MMAXI_CLK, 0);
>>  +DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, 
>> QCOM_SMD_RPM_MMAXI_CLK, 1);
>>  +DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
>>  +                                               
>> QCOM_SMD_RPM_BUS_CLK, 0);
>>  +DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
>>  +                                               
>> QCOM_SMD_RPM_BUS_CLK, 5);
>>  +
>>  +/* SMD_XO_BUFFER */
>>  +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk1, ln_bb_clk1_a, 1);
> 
> msm8916?
> 
>>  +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk2, ln_bb_clk2_a, 2);
> 
> msm8916?
> 
>>  +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk3, ln_bb_clk3_a, 3);
> 
> sdm660?
> 
>>  +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk1, rf_clk1_a, 4);
> 
> msm8916?
> 
>>  +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk2, rf_clk2_a, 5);
> 
> msm8916?
> 

Will do to all.

>>  +
>>  +static struct clk_smd_rpm *sm6125_clks[] = {
>>  +       [RPM_SMD_XO_CLK_SRC] = &sm6125_bi_tcxo,
>>  +       [RPM_SMD_XO_A_CLK_SRC] = &sm6125_bi_tcxo_ao,
>>  +       [RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
>>  +       [RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
>>  +       [RPM_SMD_BIMC_CLK] = &sm6125_bimc_clk,
>>  +       [RPM_SMD_BIMC_A_CLK] = &sm6125_bimc_a_clk,
>>  +       [RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
>>  +       [RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
>>  +       [RPM_SMD_RF_CLK1] = &sm6125_rf_clk1,
>>  +       [RPM_SMD_RF_CLK1_A] = &sm6125_rf_clk1_a,
>>  +       [RPM_SMD_RF_CLK2] = &sm6125_rf_clk2,
>>  +       [RPM_SMD_RF_CLK2_A] = &sm6125_rf_clk2_a,
>>  +       [RPM_SMD_LN_BB_CLK1] = &sm6125_ln_bb_clk1,
>>  +       [RPM_SMD_LN_BB_CLK1_A] = &sm6125_ln_bb_clk1_a,
>>  +       [RPM_SMD_LN_BB_CLK2] = &sm6125_ln_bb_clk2,
>>  +       [RPM_SMD_LN_BB_CLK2_A] = &sm6125_ln_bb_clk2_a,
>>  +       [RPM_SMD_LN_BB_CLK3] = &sm6125_ln_bb_clk3,
>>  +       [RPM_SMD_LN_BB_CLK3_A] = &sm6125_ln_bb_clk3_a,
>>  +       [RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
>>  +       [RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
>>  +       [RPM_SMD_CE1_CLK] = &sm6125_ce1_clk,
>>  +       [RPM_SMD_CE1_A_CLK] = &sm6125_ce1_a_clk,
>>  +};
>>  +
>>  +static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
>>  +       .clks = sm6125_clks,
>>  +       .num_clks = ARRAY_SIZE(sm6125_clks),
>>  +};
>>  +
>>   static const struct of_device_id rpm_smd_clk_match_table[] = {
>>          { .compatible = "qcom,rpmcc-msm8916", .data = 
>> &rpm_clk_msm8916 },
>>          { .compatible = "qcom,rpmcc-msm8936", .data = 
>> &rpm_clk_msm8936 },
>>  diff --git a/include/linux/soc/qcom/smd-rpm.h 
>> b/include/linux/soc/qcom/smd-rpm.h
>>  index f2645ec52520..b737d7e456e4 100644
>>  --- a/include/linux/soc/qcom/smd-rpm.h
>>  +++ b/include/linux/soc/qcom/smd-rpm.h
>>  @@ -28,6 +28,7 @@ struct qcom_smd_rpm;
>>   #define QCOM_SMD_RPM_NCPA      0x6170636E
>>   #define QCOM_SMD_RPM_NCPB      0x6270636E
>>   #define QCOM_SMD_RPM_OCMEM_PWR 0x706d636f
>>  +#define QCOM_SMD_RPM_QUP_CLK   0x00707571
>>   #define QCOM_SMD_RPM_QPIC_CLK  0x63697071
>>   #define QCOM_SMD_RPM_SMPA      0x61706d73
>>   #define QCOM_SMD_RPM_SMPB      0x62706d73
> 
> Two patches are adding this in different places.

Im aware. I will argue tho that adding it
in alphabetical order is the correct way to go here.
Thats how the rest is done except the last 4 defines
in that block which probably should be moved into
their alphabetical order as well
(They do not follow address ordering).





