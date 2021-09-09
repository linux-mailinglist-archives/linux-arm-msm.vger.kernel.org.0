Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9A040489E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 12:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234378AbhIIKlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 06:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbhIIKlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 06:41:18 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47917C061575;
        Thu,  9 Sep 2021 03:40:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 017B33F219;
        Thu,  9 Sep 2021 12:40:04 +0200 (CEST)
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Introduce support for MSM8998 Sony
 Yoshino platform
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <YTdjX2/XGZYQQRDW@ripper>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <2e9270dd-759e-9ebf-71dd-a15fecd611ca@somainline.org>
Date:   Thu, 9 Sep 2021 12:40:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YTdjX2/XGZYQQRDW@ripper>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 07/09/21 15:04, Bjorn Andersson ha scritto:
> On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> This commit introduces support for the Sony Yoshino platform, using
>> the MSM8998 SoC, including:
>> - Sony Xperia XZ1 (codename Poplar),
>> - Sony Xperia XZ1 Compact (codename Lilac),
>> - Sony Xperia XZ Premium (codename Maple).
>>
> 
> Nice!
> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> [..]
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	gpio_keys {
> 
> Please don't use '_' in node names.
> 

Sorry, all of that is fixed.

>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		hyp_mem: memory@85800000 {
>> +			reg = <0x0 0x85800000 0x0 0x3700000>;
>> +			no-map;
>> +		};
>> +
>> +		cont_splash_mem: cont-splash-region@9d400000 {
> 
> Is there any reason for not just naming this "memory"?
> 

No, there's no reason. Changed to 'memory'.

>> +			compatible = "shared-dma-pool";
>> +			reg = <0x0 0xf6400000 0x0 0x2000>;
>> +			no-map;
>> +		};
>> +
> [..]
>> +&rpm_requests {
>> +	pm8998-regulators {
>> +		compatible = "qcom,rpm-pm8998-regulators";
>> +
> [..]
>> +		vreg_lvs1a_1p8: lvs1 { };
>> +		vreg_lvs2a_1p8: lvs2 { };
>> +
> 
> Blank line.
> 

Done.

Also, we had a better internal review of the 8998 dt patches, so in the
next version there will be even more cleanups.

>> +	};
>> +
>> +	pmi8998-regulators {
>> +		compatible = "qcom,rpm-pmi8998-regulators";
>> +
>> +		vdd_bob-supply = <&vph_pwr>;
>> +
>> +		vreg_bob: bob {
>> +			regulator-min-microvolt = <3312000>;
>> +			regulator-max-microvolt = <3600000>;
>> +		};
>> +	};
>> +};
>> +
>> +&sdhc2 {
>> +	status = "okay";
>> +	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
>> +
>> +	vmmc-supply = <&vreg_l21a_2p95>;
>> +	vqmmc-supply = <&vreg_l13a_2p95>;
>> +
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
>> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> 
> How about grouping these various pins as "sdc2_default_state" and
> "sdc2_sleep_state"?
> 

I agree with you on the fact that groping these pins would look way better,
but I'm inheriting the sdc2 pinctrl from msm8998.dtsi and... all of the msm8998
boards, including msm8998-mtp and msm8998-clamshell (and whatever else inherits
these) are doing the same as what I am doing here.

That said, are you proposing to change 'em all?

Cheers,
- Angelo

>> +};
>> +
> Regards,
> Bjorn
> 

