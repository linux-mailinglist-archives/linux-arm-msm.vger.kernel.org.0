Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE909572099
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbiGLQR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbiGLQR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:17:57 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58371CA6DA
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:17:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 53B653F652;
        Tue, 12 Jul 2022 18:17:49 +0200 (CEST)
Message-ID: <573bcd42-7f4f-6212-3f70-b2cffac48b03@somainline.org>
Date:   Tue, 12 Jul 2022 18:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] clk: qcom: gcc-msm8939: Add missing MDSS MDP clock
 frequencies
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
 <20220712125922.3461675-6-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220712125922.3461675-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.07.2022 14:59, Bryan O'Donoghue wrote:
> Again the msm8936/msm8939 supports a wider range of operating frequencies
> to the antecedent msm8916 from which the msm8939.c driver is derived.
> 
> static struct clk_freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
>         F(  50000000,      gpll0_out_aux,  16,    0,    0),
>         F(  80000000,      gpll0_out_aux,  10,    0,    0),
>         F( 100000000,      gpll0_out_aux,   8,    0,    0),
>         F( 145500000,      gpll0_out_aux,  5.5,   0,    0),
>         F( 153600000,      gpll1_out_main,      4,      0,      0),
>         F( 160000000,      gpll0_out_aux,   5,    0,    0),
>         F( 177780000,      gpll0_out_aux, 4.5,    0,    0),
>         F( 200000000,      gpll0_out_aux,   4,    0,    0),
>         F( 266670000,      gpll0_out_aux,   3,    0,    0),
>         F( 307200000,      gpll1_out_main,      2,      0,      0),
>         F( 366670000,      gpll3_out_aux,   3,        0,    0),
>         F_END
> };
> 
> We are missing 145.5 MHz and 153.6 MHz.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8939.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 6b265b68524f2..7f71491d52c4b 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -1294,6 +1294,8 @@ static const struct freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
>  	F(50000000, P_GPLL0_AUX, 16, 0, 0),
>  	F(80000000, P_GPLL0_AUX, 10, 0, 0),
>  	F(100000000, P_GPLL0_AUX, 8, 0, 0),
> +	F(145500000, P_GPLL0_AUX, 5.5, 0, 0),
> +	F(153600000, P_GPLL0, 4, 0, 0),
>  	F(160000000, P_GPLL0_AUX, 5, 0, 0),
>  	F(177780000, P_GPLL0_AUX, 4.5, 0, 0),
>  	F(200000000, P_GPLL0_AUX, 4, 0, 0),
