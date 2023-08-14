Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B5E77B5E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjHNKCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbjHNKCU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:02:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8721BD4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:02:04 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52564f3faf7so1083928a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007323; x=1692612123;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ik4gXzePMNDVXoA4qrXdz513andF8ufeDJrefrHPgs=;
        b=v9A7Fyc4fgYhcmsIrSU4+EMEYcBYHT4PV23+X6QAWju7xRKv6KCspzwy5IEi3/O+cA
         HZhWZsggviIEhYnj63kpo+FXGFxhRZ8jhrZPxfyOJUKgc0gFGg55h88OaZpSOoZRw+Jp
         /OT4KckbAvu/hkzbJ7kjPFAzfPDkITbuwAmqoUghYkWfUAoW4AnagH1MvQqBvrXCI1wr
         5KrD67vVZY8gKMyxdlr8sAJpU50BMATcN0S6otYoh8Df6E/o9ROFYQiv7ZVcbYpboCL1
         R3R9lGQpAE8PulpXqaMxFF4zopWX4ayQICU2IyehGoJnALxSU/MNjoaLOGeg9Hw4nvDN
         kBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007323; x=1692612123;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ik4gXzePMNDVXoA4qrXdz513andF8ufeDJrefrHPgs=;
        b=XTsm8dApFXTCD50Q5ty5xcWG6C/h4xiV2YU7MrF70m2IJmau7gcrhzZvq7/xeeGSzy
         YbSR+qM3h/7DEcIQ7LWyrCA9fAsTv7cd/UfDOrtwnE0v6mwJpuPzX6KlhOWLR3RCjIVt
         kGtaK2BusL4tcK4nN5uG5AGe6jiM6SybPBbjtjmujmYSHLhsu97ec1Y4bZ0Mn3g3MOHs
         FF1zxFAqt39VenH8Qn7bFzH8gDR4qGq+KbjW4GHprRNlOdYEN3w9C/c41iqjugn5ZrM+
         0absUitropYrZefoo/J5418ATO5KolP3qtNkVjfvXEvHzdJBNoaAPWaCbEBowMJiSq/+
         MyKg==
X-Gm-Message-State: AOJu0Yxz7VOqukP6JI4w2t6PlHR6712l4nXyt0NgNYccsrZlF43stx5A
        b5yyTjnFrTnhj9cx578NEbkj3A==
X-Google-Smtp-Source: AGHT+IGLzRRf7XnAWVvQR/vfWi0vMp1OCBzNr5Xn0bY7guPVzQfzodJcNpciW9fx89Nxo1T/CwxBrA==
X-Received: by 2002:aa7:c557:0:b0:522:cef7:83c3 with SMTP id s23-20020aa7c557000000b00522cef783c3mr7646463edr.8.1692007323433;
        Mon, 14 Aug 2023 03:02:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id y18-20020aa7ccd2000000b005227e53cec2sm5403411edt.50.2023.08.14.03.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:02:03 -0700 (PDT)
Message-ID: <7c05f889-acee-4ef7-7fce-c30baa760138@linaro.org>
Date:   Mon, 14 Aug 2023 12:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: ipq5332: Add USB related nodes
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1691660905.git.quic_varada@quicinc.com>
 <066299506138ffcf1a3135b6f1a4609eee46ddf9.1691660905.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <066299506138ffcf1a3135b6f1a4609eee46ddf9.1691660905.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 11:56, Varadarajan Narayanan wrote:
> Add USB phy and controller nodes.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v6:
> 	Remove clock names
> 	Move the nodes to address sorted location
> v5:
> 	Use generic phy instead of usb-phy
> 	'make CHECK_DTBS=y DT_SCHEMA_FILES=qcom dtbs_check' passed
> 	'DT_CHECKER_FLAGS='-v -m' DT_SCHEMA_FILES=qcom dt_binding_check' passed
> v4:
> 	Change node name
> 	Remove blank line
> 	'make CHECK_DTBS=y DT_SCHEMA_FILES=qcom qcom/ipq5332-rdp441.dtb' passed
> v1:
> 	Rename phy node
> 	Change compatible from m31,ipq5332-usb-hsphy -> qcom,ipq5332-usb-hsphy
> 	Remove 'qscratch' from phy node
> 	Fix alignment and upper-case hex no.s
> 	Add clock definition for the phy
> 	Remove snps,ref-clock-period-ns as it is not used. dwc3_ref_clk_period()
> 	in dwc3/core.c takes the frequency from ref clock and calculates fladj
> 	as appropriate.
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 55 +++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 8bfc2db..c45d9d4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -145,6 +145,19 @@
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
>  
> +		usbphy0: phy@7b000 {
> +			compatible = "qcom,ipq5332-usb-hsphy";
> +			reg = <0x0007b000 0x12c>;
> +
> +			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
> +
> +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		qfprom: efuse@a4000 {
>  			compatible = "qcom,ipq5332-qfprom", "qcom,qfprom";
>  			reg = <0x000a4000 0x721>;
> @@ -290,6 +303,48 @@
>  			status = "disabled";
>  		};
>  
> +		usb: usb2@8a00000 {

usb@

Node names must be generic.

> +			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
> +			reg = <0x08af8800 0x400>;

OK, so this was not really checked for any warnings.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).


Best regards,
Krzysztof

