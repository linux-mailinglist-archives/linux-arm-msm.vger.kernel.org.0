Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6B957209F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbiGLQSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbiGLQSl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:18:41 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF671B7BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:18:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8B05E3F686;
        Tue, 12 Jul 2022 18:18:33 +0200 (CEST)
Message-ID: <72dd6541-a14f-d1d4-97cf-6c05bd4b14c5@somainline.org>
Date:   Tue, 12 Jul 2022 18:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] clk: qcom: gcc-msm8939: Add missing USB HS system
 clock frequencies
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
 <20220712125922.3461675-7-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220712125922.3461675-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.07.2022 14:59, Bryan O'Donoghue wrote:
> The shipped qcom driver defines:
> static struct clk_freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
>         F(  57140000,      gpll0_out_main,  14,    0,    0),
>         F(  80000000,      gpll0_out_main,  10,   0,    0),
>         F( 100000000,      gpll0_out_main,   8,   0,    0),
>         F_END
> };
> In the upstream code we omit 57.14 MHz and 100 MHz.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8939.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 7f71491d52c4b..754d5573b1df5 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -1468,7 +1468,9 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
> +	F(57140000, P_GPLL0, 14, 0, 0),
>  	F(80000000, P_GPLL0, 10, 0, 0),
> +	F(100000000, P_GPLL0, 8, 0, 0),
>  	{ }
>  };
>  
