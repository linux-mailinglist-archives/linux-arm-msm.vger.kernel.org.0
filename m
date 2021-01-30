Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2D9309650
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 16:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhA3Plf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 10:41:35 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:35269 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhA3Pld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 10:41:33 -0500
Received: from [192.168.1.101] (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 70A783EBBD;
        Sat, 30 Jan 2021 16:40:23 +0100 (CET)
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Disable MDSS by default for
 8916/8016 devices
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        allen <allen.chen@ite.com.tw>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
 <20210130105717.2628781-4-vincent.knecht@mailoo.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <9eeeb463-0437-8989-373f-721575e74e4f@somainline.org>
Date:   Sat, 30 Jan 2021 16:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210130105717.2628781-4-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 30.01.2021 11:57, Vincent Knecht wrote:
> Disable MDSS (Mobile Display Subsystem) by default in msm8916.dtsi
> and only explicitly enable it in devices' DT which actually use it.
>
> This leads to faster boot and cleaner logs for other devices,
> which also won't have to explicitly disable MDSS to use framebuffer.
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 4 ++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                      | 1 +
>  3 files changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 3a9538e1ec97..6aef0c2e4f0a 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -301,6 +301,10 @@ &lpass {
>  	status = "okay";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
>  &pm8916_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> index f1af798abd74..230ba3ce3277 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
> @@ -132,6 +132,10 @@ &dsi0 {
>  	pinctrl-1 = <&mdss_sleep>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
>  &pm8916_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 402e891a84ab..8f9a651d3827 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -913,6 +913,7 @@ tcsr: syscon@1937000 {
>  		};
>  
>  		mdss: mdss@1a00000 {
> +			status = "disabled";
>  			compatible = "qcom,mdss";
>  			reg = <0x01a00000 0x1000>,
>  			      <0x01ac8000 0x3000>;
>

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

