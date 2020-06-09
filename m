Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC691F4766
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730251AbgFITp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728958AbgFITp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:45:56 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A15C03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:45:56 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c185so22063256qke.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ZrCSzAkb7wfDLigc14LiL0kxxMcKFIrPg1xhm0sVbw=;
        b=mudOolJSrL0i8n8Uu53mjbPsOjmwOnd+F1Mzz+H6lPXswNAymQI/IDcaisRnOCaAV4
         AZlfucE/XT5vZI9p6GhTqHngOWPIbOIupP96RU9c/jQDfgXCs5FAfpkqJF9zEPcoGEA+
         itqaf3eh+FRXLW4ACy+Bl+175M+YJp2A3UtAiIK1aD01uiZNa6RuBkZb/sYPjziUYCc8
         kRA7ehQLaxixelCveNTEj5VzMrSefAINRGcZ0MCzsK82z3Huicrr5t5nQak8EyGlywQq
         a0Gj+B/IpDiP3tjbUHLry4RoZC6EjURyuAaCOC2Ys02T1sw37agLIW9e6ftu7/8jFUQ1
         f8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ZrCSzAkb7wfDLigc14LiL0kxxMcKFIrPg1xhm0sVbw=;
        b=hx5X+h2iHiSH/HIUd9CXvb5WR8iMrfEa+6fuy2OH77S08vO4z5JOZzHarTW8YEs4Oe
         OHPyobSCDwDyEw6fXNvPkXDmLxcW9ieqCRoThYonCqVYJMYJJFaA8E+f6Ae6FTfZZ8El
         Q+7suVSPBjJxhnRQT7ZSM58DDBIgzRFoOlCAB/TQiFHhP84TjDkmA17D6Me7Tw3iMlCO
         DAPlttfauRmZfOO0jsTt9DUbjJFypbhV3VkH6w9X2zfBEzaJ0Yoj1AbgL6zhFHNusQ79
         AixXtnbalMH5I0RSU6jyh8m5uwfIKmI3n6VQEBScyT7Nn99rmwPsEn9kS9b6DxgjyW1p
         350Q==
X-Gm-Message-State: AOAM533hyFuaoT6SFWCK0f9NqBXLRFIFRzUXG2N51LqZR40a8UwztqYj
        duMm3buB7x1OcO5KbahDFoSrsw==
X-Google-Smtp-Source: ABdhPJypggtDy4HDTW7EfQMcvJsTYtg7F/Gh9/LHK+ErfBIBRRg4/fEpTSQRZVqLlHPq3bVEYPzl1g==
X-Received: by 2002:a05:620a:64f:: with SMTP id a15mr29544126qka.10.1591731955295;
        Tue, 09 Jun 2020 12:45:55 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 137sm10785999qkf.44.2020.06.09.12.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 12:45:54 -0700 (PDT)
Subject: Re: [PATCH 5/6] arm64: dts: qcom: add sm8150 hdk dts
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-6-jonathan@marek.ca>
 <20200529030126.GW279327@builder.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <d7c4336f-a2a4-41b1-c481-4d11e57ae6de@marek.ca>
Date:   Tue, 9 Jun 2020 15:46:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200529030126.GW279327@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/28/20 11:01 PM, Bjorn Andersson wrote:
> On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:
> 
>> Add initial HDK855 dts, based on sm8150-mtp, with a few changes.
>>
> 
> Happy to see this on the list Jonathan, just some minor things on the
> remoteproc nodes below.
> 
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile       |   1 +
>>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
>>   2 files changed, 462 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index cc103f7020fd..e5dbd8b63951 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> [..]
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SM8150 HDK";
>> +	compatible = "qcom,sm8150-hdk";
>> +
>> +	aliases {
>> +		serial0 = &uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +	};
>> +
>> +	/*
>> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
>> +	 * is always-on; model it as a fixed regulator.
>> +	 */
> 
> One day we should stop being surprised by this and drop the "Apparently"
> from this comment ;)
> 

Had this copied from sm8150-mtp, dropped the comment entirely (to match 
sm8250-mtp dts).

>> +	vreg_s4a_1p8: pm8150-s4 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_s4a_1p8";
>> +
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
> [..]
>> +&remoteproc_adsp {
>> +	status = "okay";
> 
> It would be nice to see a
> 	firmware-name = "qcom/sm8150/adsp.mbn";
> 
> here. Because if we ever end up pushing firmware to linux-firmware this
> DTB would continue to work.
> 
> Use https://github.com/andersson/pil-squasher to get mbn files out of
> the mdt+bXX files for your testing (or just rename/symlink the mdt to
> mbn for now).
> 

Added the firmware-name fields as you suggested. One thing to note (it 
shouldn't matter for HDK), these firmwares can be modified by the device 
maker, so not all sm8150 will have the same adsp/cdsp/slpi firmware.

>> +};
>> +
>> +&remoteproc_cdsp {
>> +	status = "okay";
> 
> 	firmware-name = "qcom/sm8150/cdsp.mbn";
> 
>> +};
>> +
>> +&remoteproc_slpi {
>> +	status = "okay";
> 
> 	firmware-name = "qcom/sm8150/slpi.mbn";
> 
> Regards,
> Bjorn
> 
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <0 4>, <126 4>;
>> +};
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
>> +	status = "okay";
>> +
>> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply = <&vreg_l10a_2p5>;
>> +	vcc-max-microamp = <750000>;
>> +	vccq-supply = <&vreg_l9a_1p2>;
>> +	vccq-max-microamp = <700000>;
>> +	vccq2-supply = <&vreg_s4a_1p8>;
>> +	vccq2-max-microamp = <750000>;
>> +};
>> +
>> +&ufs_mem_phy {
>> +	status = "okay";
>> +
>> +	vdda-phy-supply = <&vdda_ufs_2ln_core_1>;
>> +	vdda-max-microamp = <90200>;
>> +	vdda-pll-supply = <&vreg_l3c_1p2>;
>> +	vdda-pll-max-microamp = <19000>;
>> +};
>> +
>> +&usb_1_hsphy {
>> +	status = "okay";
>> +	vdda-pll-supply = <&vdd_usb_hs_core>;
>> +	vdda33-supply = <&vdda_usb_hs_3p1>;
>> +	vdda18-supply = <&vdda_usb_hs_1p8>;
>> +};
>> +
>> +&usb_2_hsphy {
>> +	status = "okay";
>> +	vdda-pll-supply = <&vdd_usb_hs_core>;
>> +	vdda33-supply = <&vdda_usb_hs_3p1>;
>> +	vdda18-supply = <&vdda_usb_hs_1p8>;
>> +};
>> +
>> +&usb_1_qmpphy {
>> +	status = "okay";
>> +	vdda-phy-supply = <&vreg_l3c_1p2>;
>> +	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
>> +};
>> +
>> +&usb_2_qmpphy {
>> +	status = "okay";
>> +	vdda-phy-supply = <&vreg_l3c_1p2>;
>> +	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_2 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +};
>> +
>> +&usb_2_dwc3 {
>> +	dr_mode = "host";
>> +};
>> -- 
>> 2.26.1
>>
