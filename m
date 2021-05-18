Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA35F3881C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 22:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352300AbhERU7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 16:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352289AbhERU7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 16:59:10 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7910C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 13:57:51 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.104.neoplus.adsl.tpnet.pl [83.6.168.104])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 81A5B1F94B;
        Tue, 18 May 2021 22:57:46 +0200 (CEST)
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
References: <20210510120547.1315536-1-balbi@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <397b7def-99fb-1084-f0bd-6da81066af17@somainline.org>
Date:   Tue, 18 May 2021 22:57:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510120547.1315536-1-balbi@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!


> +/ {
> +	model = "Microsoft Surface Duo";
> +	compatible = "microsoft,surface-duo", "qcom,sm8150-mtp";
> +
Please remove the -mtp compatible, as the phone is not 1:1 compatible with the MTP design and replace it with the platform-generic "qcom,sm8150" (otherwise things like CPUFreq won't work!).


> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +

Is the serial port exposed and enabled on production hardware?


> +
> +	bq27742@55 {
> +		compatible = "ti,bq27742";
> +		reg = <0x55>;
> +	};
> +
> +	da7280@4a {
> +		compatible = "dlg,da7280";
> +		reg = <0x4a>;
> +		interrupts-extended = <&tlmm 42 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "da7280_default";
> +		pinctrl-0 = <&da7280_intr_default>;
> +
> +		dlg,actuator-type = "LRA";
> +		dlg,dlg,const-op-mode = <1>;
> +		dlg,dlg,periodic-op-mode = <1>;
> +		dlg,nom-microvolt = <2000000>;
> +		dlg,abs-max-microvolt = <2000000>;
> +		dlg,imax-microamp = <129000>;
> +		dlg,resonant-freq-hz = <180>;
> +		dlg,impd-micro-ohms = <14300000>;
> +		dlg,freq-track-enable;
> +		dlg,bemf-sens-enable;
> +		dlg,mem-array = <
> +		  0x06 0x08 0x10 0x11 0x12 0x13 0x14 0x15 0x1c 0x2a
> +		  0x33 0x3c 0x42 0x4b 0x4c 0x4e 0x17 0x19 0x27 0x29
> +		  0x17 0x19 0x03 0x84 0x5e 0x04 0x08 0x84 0x5d 0x01
> +		  0x84 0x5e 0x02 0x00 0xa4 0x5d 0x03 0x84 0x5e 0x06
> +		  0x08 0x84 0x5d 0x05 0x84 0x5d 0x06 0x84 0x5e 0x08
> +		  0x84 0x5e 0x05 0x8c 0x5e 0x24 0x84 0x5f 0x10 0x84
> +		  0x5e 0x05 0x84 0x5e 0x08 0x84 0x5f 0x01 0x8c 0x5e
> +		  0x04 0x84 0x5e 0x08 0x84 0x5f 0x11 0x19 0x88 0x00
> +		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
> +		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
> +		>;
> +	};
> +
> +	/* SMB1381 @ 0x44 */
> +	/* MAX34417 @ 0x1c */
> +};

Please add generic labels to these peripherals, such as "vibrator: " or so.


> +&i2c17 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	bq27742@55 {
> +		compatible = "ti,bq27742";
> +		reg = <0x55>;
> +	};
> +};

Are there actually two of these TI ICs, presumably for the dual-batteries? If that's the case, could you add a comment specifying which one is in charge (pun intended) of which cell?


Aside from that, it generally looks good :)


Konrad

