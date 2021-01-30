Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE2D3094E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 12:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhA3Lbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 06:31:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:19181 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhA3Lbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 06:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612006123;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
        From:Subject:Sender;
        bh=Hz2RfQlTwbQJbFjbuznooGtZkfflXXOwIhLHe5UW440=;
        b=W+OQxYfN3npRZQVIh34Y4PyXSVdFqlOlM1qY+lUxcQ/EpRGSk5zzupYQDIJ+JRaZVV
        x7rqhQ3QwZOL3Vwn/466qCGXAxRNy9mMqTHhHIAOvrhuvYvFahI9XcTzBxgA6AJ5gUZw
        1PcKrISTifAiNRgW0S1lCBMFyy3urqZNBkhjOiOjETCqSxsVCntG69pgFFcJgGUVaAbC
        1/LmSjbWN3boCasoPrclPGMZRUMqh1ZBQSdCN6+CsKoO7u3fB1nNzr2aq7YSs04V76Wp
        dJZ5XPY7vqnGeXsdOjsHTPU0BGkRi3j+DROqiN6GCuD/N0hoveQWGfcK3zd4dzOkj5q9
        9AVg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczGbYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
        with ESMTPSA id j0a9bax0UBSQ81F
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 30 Jan 2021 12:28:26 +0100 (CET)
Date:   Sat, 30 Jan 2021 12:28:24 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Disable MDSS by default for
 8916/8016 devices
Message-ID: <YBVC2KfT4pLJ5/XX@gerhold.net>
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
 <20210130105717.2628781-4-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130105717.2628781-4-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 30, 2021 at 11:57:12AM +0100, Vincent Knecht wrote:
> Disable MDSS (Mobile Display Subsystem) by default in msm8916.dtsi
> and only explicitly enable it in devices' DT which actually use it.
> 
> This leads to faster boot and cleaner logs for other devices,
> which also won't have to explicitly disable MDSS to use framebuffer.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Thanks for the patch! I think this is a good thing because normally most
things are disabled by default in msm8916.dtsi (e.g. eMMC, SD card,
WCNSS, ....). Also, there are actually some devices that don't have a
display (e.g. the 4IoT board [1]). Having to disable it specifically is
kind of weird. So:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

[1]: https://www.96boards.org/product/4iot/

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
> -- 
> 2.29.2
> 
> 
> 
