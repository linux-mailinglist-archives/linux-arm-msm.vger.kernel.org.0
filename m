Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97F657207D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbiGLQNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbiGLQNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:13:10 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2052CA6CA
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:13:09 -0700 (PDT)
Received: from [192.168.1.101] (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B02993F6A4;
        Tue, 12 Jul 2022 18:13:04 +0200 (CEST)
Message-ID: <6acfc783-149d-dcdb-a033-ca5b2c1ee81f@somainline.org>
Date:   Tue, 12 Jul 2022 18:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk
 frequency definitions
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
 <20220712125922.3461675-4-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220712125922.3461675-4-bryan.odonoghue@linaro.org>
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
> The Venus clock frequencies are a copy/paste error from msm8916. Looking
> at the original clock-gcc-8936.c ftbl_gcc_venus0_vcodec0_clk defines we
> have:
> 
> - 133 MHz
> - 200 MHz
> - 266 MHz
> 
> These values are born out by the relevant qualcomm documentation for the
> msm8936/msm8939 Venus core performance levels.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/clk/qcom/gcc-msm8939.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 6a3e2326c72a3..2aad40dbef8e6 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -1824,9 +1824,9 @@ static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_venus0_vcodec0_clk[] = {
> -	F(100000000, P_GPLL0, 8, 0, 0),
> -	F(160000000, P_GPLL0, 5, 0, 0),
> -	F(228570000, P_GPLL0, 3.5, 0, 0),
> +	F(133330000, P_GPLL0, 6, 0, 0),
> +	F(200000000, P_GPLL0, 4, 0, 0),
> +	F(266670000, P_GPLL0, 3, 0, 0),
>  	{ }
>  };
>  
