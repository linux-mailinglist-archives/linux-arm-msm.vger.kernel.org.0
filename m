Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D468164E37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 19:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgBSS6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 13:58:41 -0500
Received: from nbd.name ([46.4.11.11]:57748 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbgBSS6l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 13:58:41 -0500
Received: from [2a04:4540:1400:dd00:2cb7:e0af:5551:a051]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1j4UYQ-00057x-UZ; Wed, 19 Feb 2020 19:58:39 +0100
Subject: Re: [PATCH] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200219185226.1236-1-ansuelsmth@gmail.com>
From:   John Crispin <john@phrozen.org>
Message-ID: <3c2bdeaf-c54b-142b-367e-6573de700803@phrozen.org>
Date:   Wed, 19 Feb 2020 19:58:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200219185226.1236-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/02/2020 19:52, Ansuel Smith wrote:
> Add missing definition of rpm clk for ipq806x soc
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Thanks for sending this upstream,
Acked-by: John Crispin <john@phrozen.org>

> ---
>   .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
>   drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
>   include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
>   3 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index 944719bd586f..dd0def465c79 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -16,6 +16,7 @@ Required properties :
>   			"qcom,rpmcc-msm8974", "qcom,rpmcc"
>   			"qcom,rpmcc-apq8064", "qcom,rpmcc"
>   			"qcom,rpmcc-msm8996", "qcom,rpmcc"
> +			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
>   			"qcom,rpmcc-msm8998", "qcom,rpmcc"
>   			"qcom,rpmcc-qcs404", "qcom,rpmcc"
>   
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> index 9e3110a71f12..f71d228fd6bd 100644
> --- a/drivers/clk/qcom/clk-rpm.c
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -543,10 +543,45 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
>   	.num_clks = ARRAY_SIZE(apq8064_clks),
>   };
>   
> +/* ipq806x */
> +DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> +DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> +DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> +DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> +DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> +DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> +DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> +DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> +
> +static struct clk_rpm *ipq806x_clks[] = {
> +	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
> +	[RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
> +	[RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
> +	[RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
> +	[RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
> +	[RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
> +	[RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
> +	[RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
> +	[RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
> +	[RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
> +	[RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
> +	[RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
> +	[RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
> +	[RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
> +	[RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
> +	[RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
> +};
> +
> +static const struct rpm_clk_desc rpm_clk_ipq806x = {
> +	.clks = ipq806x_clks,
> +	.num_clks = ARRAY_SIZE(ipq806x_clks),
> +};
> +
>   static const struct of_device_id rpm_clk_match_table[] = {
>   	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
>   	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
>   	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
> +	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, rpm_clk_match_table);
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
> index 8e3095720552..ae74c43c485d 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -37,6 +37,10 @@
>   #define RPM_XO_A0				27
>   #define RPM_XO_A1				28
>   #define RPM_XO_A2				29
> +#define RPM_NSS_FABRIC_0_CLK			30
> +#define RPM_NSS_FABRIC_0_A_CLK			31
> +#define RPM_NSS_FABRIC_1_CLK			32
> +#define RPM_NSS_FABRIC_1_A_CLK			33
>   
>   /* SMD RPM clocks */
>   #define RPM_SMD_XO_CLK_SRC				0
> 

