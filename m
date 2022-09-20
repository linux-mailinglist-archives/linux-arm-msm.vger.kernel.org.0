Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E712F5BF082
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiITWub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiITWua (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:50:30 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6860B3ED78
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 15:50:28 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DE7253F5CD;
        Wed, 21 Sep 2022 00:50:25 +0200 (CEST)
Message-ID: <8749e98f-4323-556e-c590-85bf0a84197b@somainline.org>
Date:   Wed, 21 Sep 2022 00:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] soc: qcom: rpmhpd: add sdm670 power domains
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20220920021927.2489-1-mailingradian@gmail.com>
 <20220920021927.2489-3-mailingradian@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220920021927.2489-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.09.2022 04:19, Richard Acayan wrote:
> The Snapdragon 670 has similar power domains to SDM845 but no EBI power
> domain. Add a new array for them to avoid requesting a power domain which
> is unsupported by the hardware.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

>  drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 092f6ab09acf..319a2cf7e694 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -210,6 +210,23 @@ static const struct rpmhpd_desc sa8540p_desc = {
>  	.num_pds = ARRAY_SIZE(sa8540p_rpmhpds),
>  };
>  
> +/* SDM670 RPMH powerdomains */
> +static struct rpmhpd *sdm670_rpmhpds[] = {
> +	[SDM670_CX] = &cx_w_mx_parent,
> +	[SDM670_CX_AO] = &cx_ao_w_mx_parent,
> +	[SDM670_GFX] = &gfx,
> +	[SDM670_LCX] = &lcx,
> +	[SDM670_LMX] = &lmx,
> +	[SDM670_MSS] = &mss,
> +	[SDM670_MX] = &mx,
> +	[SDM670_MX_AO] = &mx_ao,
> +};
> +
> +static const struct rpmhpd_desc sdm670_desc = {
> +	.rpmhpds = sdm670_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sdm670_rpmhpds),
> +};
> +
>  /* SDM845 RPMH powerdomains */
>  static struct rpmhpd *sdm845_rpmhpds[] = {
>  	[SDM845_CX] = &cx_w_mx_parent,
> @@ -435,6 +452,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
>  	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
>  	{ .compatible = "qcom,sc8180x-rpmhpd", .data = &sc8180x_desc },
>  	{ .compatible = "qcom,sc8280xp-rpmhpd", .data = &sc8280xp_desc },
> +	{ .compatible = "qcom,sdm670-rpmhpd", .data = &sdm670_desc },
>  	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
>  	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
>  	{ .compatible = "qcom,sdx65-rpmhpd", .data = &sdx65_desc},
