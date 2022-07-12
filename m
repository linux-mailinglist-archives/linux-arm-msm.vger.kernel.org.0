Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB501572096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbiGLQRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiGLQRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:17:17 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0E3CA6D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:17:15 -0700 (PDT)
Received: from [192.168.1.101] (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CA8B23EED0;
        Tue, 12 Jul 2022 18:17:11 +0200 (CEST)
Message-ID: <d4b34c4a-51d3-b76c-6ce6-555b32e65bb6@somainline.org>
Date:   Tue, 12 Jul 2022 18:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock
 frequencies
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
 <20220712125922.3461675-5-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220712125922.3461675-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.07.2022 14:59, Bryan O'Donoghue wrote:
> Reviewing the qcom msm8936.c clock frequency tables we see
> 
> static struct clk_freq_tbl ftbl_gcc_camss_cpp_clk[] = {
>         F( 160000000,      gpll0_out_main,   5,   0,    0),
>         F( 200000000,      gpll0_out_main,   4,   0,    0),
>         F( 228570000,      gpll0_out_main, 3.5,   0,    0),
>         F( 266670000,      gpll0_out_main,   3,   0,    0),
>         F( 320000000,      gpll0_out_main, 2.5,   0,    0),
>         F( 465000000,      gpll2_out_main,   2,   0,    0),
>         F_END
> };
> which is a super-set of the msm8916 original definitions.
> Add in the missing frequency definitions now.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8939.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 2aad40dbef8e6..6b265b68524f2 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -1143,6 +1143,9 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
>  
>  static const struct freq_tbl ftbl_gcc_camss_cpp_clk[] = {
>  	F(160000000, P_GPLL0, 5, 0, 0),
> +	F(200000000, P_GPLL0, 4, 0, 0),
> +	F(228570000, P_GPLL0, 3.5, 0, 0),
> +	F(266670000, P_GPLL0, 3, 0, 0),
>  	F(320000000, P_GPLL0, 2.5, 0, 0),
>  	F(465000000, P_GPLL2, 2, 0, 0),
>  	{ }
