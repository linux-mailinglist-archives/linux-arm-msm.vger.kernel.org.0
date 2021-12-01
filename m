Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B844651B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351004AbhLAPeF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:34:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhLAPeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:34:01 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAA1C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:30:40 -0800 (PST)
Received: from [192.168.1.101] (83.6.166.111.neoplus.adsl.tpnet.pl [83.6.166.111])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A53BA3F75A;
        Wed,  1 Dec 2021 16:30:38 +0100 (CET)
Message-ID: <ee38afe9-0e9e-cae1-c4c5-70db9f166a38@somainline.org>
Date:   Wed, 1 Dec 2021 16:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/15] arm64: dts: qcom: sm8450: add i2c13 and i2c14
 device nodes
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-16-vkoul@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211201072915.3969178-16-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 01.12.2021 08:29, Vinod Koul wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Add device tree nodes for two i2c blocks: i2c13 and i2c14.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 64 ++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
[...]


>  		config_noc: interconnect@1500000 {
>  			compatible = "qcom,sm8450-config-noc";
>  			reg = <0 0x01500000 0 0x1c000>;
> @@ -687,6 +725,32 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges = <&tlmm 0 0 211>;
>  			wakeup-parent = <&pdc>;
>  
> +			qup_i2c13_default_state: qup-i2c13-default-state {
> +				mux {
> +					pins = "gpio48", "gpio49";
> +					function = "qup13";
> +				};
> +
> +				config {
> +					pins = "gpio48", "gpio49";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +

This should be collapsed into:


qup_i2c13_default_state: qup-i2c13-default-state {

        pins = "..."

        function = "..."

        drive-strength = <2>

        bias-pull-up;

};


And the same goes for the rest of the pins.


[...]


Konrad

