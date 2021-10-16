Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98ABC43028B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbhJPMSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 08:18:46 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:9000 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbhJPMSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 08:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634386534;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FUfmuNlYDkfLlY4FpNd9yLg46kksRppBVzaePpjIQL8=;
    b=oWOlFdOcdV5JBy2m8+oaiX1xjaeRqb2ZLH3x8YQhlSkx8dkCBpPfCXqXBe1ZU8cAp6
    8I07K9jJiKRVP7R+xo4/BgJWtX6t43a1Lo5BgbxmeSRMkmYoUilTaV1HIyKUWe7zpB+b
    h/RfH5cuqmSvwISnkfI4+EPdcnv/LCCh9itNnGn9nrATAIl/JaacTeTM+O9qVcWkMGMs
    tQGiHUXi6QWT+TMVDRL3fv/E1e0/z1S0itqaHP7/fufwCmeU4sW0lvDlp77gYucjTfJf
    KXqOW6vhVVqicTjONVuCPmUbrsmw+L1Szd8UHg1AVdL2kXKrlmCh5FQxG5j0jJRgWOo1
    wa2w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK85/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9GCFWNO7
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 16 Oct 2021 14:15:32 +0200 (CEST)
Date:   Sat, 16 Oct 2021 14:15:26 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lucas Stach <dev@lynxeye.de>, Angus Ainslie <angus@akkea.ca>,
        Guido Gunther <agx@sigxcpu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Brian Norris <briannorris@chromium.org>,
        Dan Johansen <strit@manjaro.org>,
        Simon South <simon@simonsouth.net>,
        Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: add 'chassis-type' property
Message-ID: <YWrCXnQ3XNocqXhz@gerhold.net>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
 <20211016102025.23346-4-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016102025.23346-4-arnaud.ferraris@collabora.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 12:20:24PM +0200, Arnaud Ferraris wrote:
> A new 'chassis-type' root node property has recently been approved for
> the device-tree specification, in order to provide a simple way for
> userspace to detect the device form factor and adjust their behavior
> accordingly.
> 
> This patch fills in this property for end-user devices (such as laptops,
> smartphones and tablets) based on Qualcomm ARM64 processors.
> 
> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts            | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts                  | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts                  | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts            | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts            | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts            | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts            | 1 +
>  arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts           | 1 +
> [...]
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> index 670bd1bebd73..265e539e7e99 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -9,6 +9,7 @@
>  / {
>  	model = "Alcatel OneTouch Idol 3 (4.7)";
>  	compatible = "alcatel,idol347", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> index cee451e59385..6bc0a29d4b4f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> @@ -8,6 +8,7 @@
>  / {
>  	model = "Asus Zenfone 2 Laser";
>  	compatible = "asus,z00l", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> index e0075b574190..42d93d3fba36 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> @@ -25,6 +25,7 @@
>  / {
>  	model = "Huawei Ascend G7";
>  	compatible = "huawei,g7", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index 30716eb8fb2d..9c83c96d2c8a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -11,6 +11,7 @@
>  / {
>  	model = "Longcheer L8150";
>  	compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> index 27845189ac2b..f9ce123471d4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> @@ -10,6 +10,7 @@
>  / {
>  	model = "BQ Aquaris X5 (Longcheer L8910)";
>  	compatible = "longcheer,l8910", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> index 6cc2eaeb1d33..4ba11b020f9b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
> @@ -7,6 +7,7 @@
>  / {
>  	model = "Samsung Galaxy A3U (EUR)";
>  	compatible = "samsung,a3u-eur", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	reg_panel_vdd3: regulator-panel-vdd3 {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
> index c2eff5aebf85..d978c9ac179d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
> @@ -7,6 +7,7 @@
>  / {
>  	model = "Samsung Galaxy A5U (EUR)";
>  	compatible = "samsung,a5u-eur", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	reg_touch_key: regulator-touch-key {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> index 4e20cc0008f7..69a44c6f57fc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> @@ -11,6 +11,7 @@
>  / {
>  	model = "Xiaomi Redmi 2 (Wingtech WT88047)";
>  	compatible = "wingtech,wt88047", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;

FWIW:
Reviewed-by: Stephan Gerhold <stephan@gerhold.net> # msm8916

Thanks for going through the work to add it to so many devices! :)
Stephan
