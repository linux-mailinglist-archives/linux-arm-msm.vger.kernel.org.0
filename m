Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A657439889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 16:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbhJYO3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 10:29:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55068 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbhJYO3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 10:29:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aferraris)
        with ESMTPSA id 753FB1F42E8E
Subject: Re: [PATCH] arm64: dts: qcom: Add missing 'chassis-type's
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Luca Weiss <luca@z3ntu.xyz>
References: <20211025102224.23746-1-stephan@gerhold.net>
From:   Arnaud Ferraris <arnaud.ferraris@collabora.com>
Message-ID: <9a07a859-af14-def2-c1f4-da4be803e637@collabora.com>
Date:   Mon, 25 Oct 2021 16:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025102224.23746-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le 25/10/2021 à 12:22, Stephan Gerhold a écrit :
> Add the "chassis-type" to msm8916-samsung-serranove and
> sm7225-fairphone-fp4 that were posted before the patch that added the
> chassis-type to existing device trees, but merged after it.
> 
> Also, looks like sdm636-sony-xperia-ganges-mermaid was missing in
> commit eaa744b1c101 ("arm64: dts: qcom: add 'chassis-type' property")
> so add it there as well.
> 
> Cc: Luca Weiss <luca@z3ntu.xyz>
> Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts         | 1 +
>  arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts | 1 +
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts              | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> index a78f87a5bf4f..58dfbfff4c7d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> @@ -23,6 +23,7 @@
>  / {
>  	model = "Samsung Galaxy S4 Mini Value Edition";
>  	compatible = "samsung,serranove", "qcom,msm8916";
> +	chassis-type = "handset";
>  
>  	aliases {
>  		serial0 = &blsp1_uart2;
> diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> index bba1c2bce213..b96da53f2f1e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> @@ -11,6 +11,7 @@
>  / {
>  	model = "Sony Xperia 10 Plus";
>  	compatible = "sony,mermaid-row", "qcom,sdm636";
> +	chassis-type = "handset";
>  
>  	/* SDM636 v1 */
>  	qcom,msm-id = <345 0>;
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 8d6fd22873e0..a6937642736e 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -15,6 +15,7 @@
>  / {
>  	model = "Fairphone 4";
>  	compatible = "fairphone,fp4", "qcom,sm7225";
> +	chassis-type = "handset";
>  
>  	/* required for bootloader to select correct board */
>  	qcom,msm-id = <434 0x10000>, <459 0x10000>;
> 

Reviewed-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
