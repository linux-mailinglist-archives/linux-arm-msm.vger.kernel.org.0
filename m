Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9333A55C4A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbiF0O6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237791AbiF0Oxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:53:49 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF57C15728
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:53:47 -0700 (PDT)
Received: from [192.168.1.101] (abxi223.neoplus.adsl.tpnet.pl [83.9.2.223])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 81EDA3F81F;
        Mon, 27 Jun 2022 16:53:40 +0200 (CEST)
Message-ID: <9a94cd11-f355-100e-698e-973c71ae1724@somainline.org>
Date:   Mon, 27 Jun 2022 16:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20220627135938.2901871-1-stephan.gerhold@kernkonzept.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220627135938.2901871-1-stephan.gerhold@kernkonzept.com>
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



On 27.06.2022 15:59, Stephan Gerhold wrote:
> "make dtbs_check" complains about the missing "-supply" suffix for
> vdd_lvs1_2 which is clearly a typo, originally introduced in the
> msm8994-smd-rpm.dtsi file and apparently later copied to
> msm8992-xiaomi-libra.dts:
> 
> msm8992-lg-bullhead-rev-10/101.dtb: pm8994-regulators: 'vdd_lvs1_2'
> does not match any of the regexes:
>   '.*-supply$', '^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$', 'pinctrl-[0-9]+'
> From schema: regulator/qcom,smd-rpm-regulator.yaml
> 
> msm8992-xiaomi-libra.dtb: pm8994-regulators: 'vdd_lvs1_2'
> does not match any of the regexes:
>   '.*-supply$', '^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$', 'pinctrl-[0-9]+'
> From schema: regulator/qcom,smd-rpm-regulator.yaml
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Fixes: f3b2c99e73be ("arm64: dts: Enable onboard SDHCI on msm8992")
> Fixes: 0f5cdb31e850 ("arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
> This fixes the dtbs_check failure reported by Rob in my unrelated patch:
> https://lore.kernel.org/linux-arm-msm/1656091594.427255.146351.nullmailer@robh.at.kernel.org/
> ---
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index 3b0cc85d6674..71e373b11de9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -74,7 +74,7 @@ pm8994_regulators: pm8994-regulators {
>  		vdd_l17_29-supply = <&vph_pwr>;
>  		vdd_l20_21-supply = <&vph_pwr>;
>  		vdd_l25-supply = <&pm8994_s5>;
> -		vdd_lvs1_2 = <&pm8994_s4>;
> +		vdd_lvs1_2-supply = <&pm8994_s4>;
>  
>  		/* S1, S2, S6 and S12 are managed by RPMPD */
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> index 7748b745a5df..afa91ca9a3dc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
> @@ -171,7 +171,7 @@ pm8994-regulators {
>  		vdd_l17_29-supply = <&vph_pwr>;
>  		vdd_l20_21-supply = <&vph_pwr>;
>  		vdd_l25-supply = <&pm8994_s5>;
> -		vdd_lvs1_2 = <&pm8994_s4>;
> +		vdd_lvs1_2-supply = <&pm8994_s4>;
>  
>  		/* S1, S2, S6 and S12 are managed by RPMPD */
>  
