Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 020D1F0C42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 03:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbfKFCxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 21:53:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57454 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfKFCxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 21:53:48 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C6C2D60B19; Wed,  6 Nov 2019 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573008818;
        bh=ZNbrx0OoFfiIYzKe6eKZHH36QNhXSTZh2FwseYgbt4M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MoPwdOu1ivkyZetaCQ39eey6Jd2uj1heZNg3A2h9MO5mztTLwdV6xi5/lhP8oUVIF
         kJt4mMvQU9gY1zUzcoXYctFv9OWFqv9yvFDXNbrQknlTwKBBNCItDYuaZSU17Lo1xt
         3ucMaWQiE3sVI8aigWjp1TFwS/OLI55aHnO7ebCY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5090D602C8;
        Wed,  6 Nov 2019 02:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573008817;
        bh=ZNbrx0OoFfiIYzKe6eKZHH36QNhXSTZh2FwseYgbt4M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ETazk69pnq7abNzDoeg0EogzI2m+gTq5jYfrTaWEUzdu/q6SqeWL+g+P+IwWMKxPh
         2f1Bxt8U5DV9mGI1VAliM188DpdZkxFf9+gqALKS9OfUwuYdDze6IVtzR9xNMlRIMu
         sYwPwiIFDi3WUwTZ3lz6EgqrxLjLxBuTBhkd/x/k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5090D602C8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/1] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
To:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     mgautam@codeaurora.org, akashast@codeaurora.org,
        msavaliy@codeaurora.org, sanm@codeaurora.org,
        skakit@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191031074500.28523-1-rojay@codeaurora.org>
 <20191031074500.28523-2-rojay@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <13ad90c0-ff46-f85c-df5f-55e4985af76b@codeaurora.org>
Date:   Wed, 6 Nov 2019 08:23:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031074500.28523-2-rojay@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/31/2019 1:15 PM, Roja Rani Yarubandi wrote:
> Add QUP SE instances configuration for sc7180.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 152 +++++-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 683 +++++++++++++++++++++++-
>   2 files changed, 828 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index e0724ef3317d..189254f5ae95 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
[]..

>   
>   		tlmm: pinctrl@3500000 {
> @@ -230,12 +623,294 @@
[]..
> +
> +			qup_i2c0_default: qup-i2c0-default {
> +				pinmux {
> +					pins = "gpio34", "gpio35";
> +					function = "qup00";
> +				};
> +			};
> +
> +			qup_i2c1_default: qup-i2c1-default {
> +				pinmux {
> +					pins = "gpio0", "gpio1";
> +					function = "qup01";
> +				};
> +			};
> +
> +			qup_i2c2_default: qup-i2c2-default {
> +				pinmux {
> +					pins = "gpio15", "gpio16";
> +					function = "qup02";
> +				};
> +			};
> +
> +			qup_i2c3_default: qup-i2c3-default {
> +				pinmux {
> +					pins = "gpio38", "gpio39";
> +					function = "qup03";
> +				};
> +			};
> +
> +			qup_i2c4_default: qup-i2c4-default {
> +				pinmux {
> +					pins = "gpio115", "gpio116";
> +					function = "qup04";
> +				};
> +			};
> +
> +			qup_i2c5_default: qup-i2c5-default {
> +				pinmux {
> +					pins = "gpio25", "gpio26";
> +					function = "qup05";
> +				};
> +			};
> +
> +			qup_i2c6_default: qup-i2c6-default {
> +				pinmux {
> +					pins = "gpio59", "gpio60";
> +					function = "qup06";

The pinctrl driver has no functions named qup06/07/08/09
These are the qup functions listed

         FUNCTION(qup00),
         FUNCTION(qup01),
         FUNCTION(qup02),
         FUNCTION(qup03),
         FUNCTION(qup04),
         FUNCTION(qup05),
         FUNCTION(qup10),
         FUNCTION(qup11),
         FUNCTION(qup12),
         FUNCTION(qup13),
         FUNCTION(qup14),
         FUNCTION(qup15),

> +				};
> +			};
> +
> +			qup_i2c7_default: qup-i2c7-default {
> +				pinmux {
> +					pins = "gpio6", "gpio7";
> +					function = "qup07";
> +				};
> +			};
> +
> +			qup_i2c8_default: qup-i2c8-default {
> +				pinmux {
> +					pins = "gpio42", "gpio43";
> +					function = "qup08";
> +				};
> +			};
> +
> +			qup_i2c9_default: qup-i2c9-default {
> +				pinmux {
> +					pins = "gpio46", "gpio47";
> +					function = "qup09";
> +				};
> +			};
> +
> +			qup_i2c10_default: qup-i2c10-default {
> +				pinmux {
> +					pins = "gpio86", "gpio87";
> +					function = "qup10";
> +				};
> +			};
> +
> +			qup_i2c11_default: qup-i2c11-default {
> +				pinmux {
> +					pins = "gpio53", "gpio54";
> +					function = "qup11";
> +				};
> +			};
> +
> +			qup_spi0_default: qup-spi0-default {
> +				pinmux {
> +					pins = "gpio34", "gpio35",
> +					       "gpio36", "gpio37";
> +					function = "qup00";
> +				};
> +			};
> +
> +			qup_spi1_default: qup-spi1-default {
> +				pinmux {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3",
> +					       "gpio12", "gpio94";
> +					function = "qup01";
> +				};
> +			};
> +
> +			qup_spi3_default: qup-spi3-default {
> +				pinmux {
> +					pins = "gpio38", "gpio39",
> +					       "gpio40", "gpio41";
> +					function = "qup03";
> +				};
> +			};
> +
> +			qup_spi5_default: qup-spi5-default {
> +				pinmux {
> +					pins = "gpio25", "gpio26",
> +					       "gpio27", "gpio28";
> +					function = "qup05";
> +				};
> +			};
> +
> +			qup_spi6_default: qup-spi6-default {
> +				pinmux {
> +					pins = "gpio59", "gpio60",
> +					       "gpio61", "gpio62",
> +					       "gpio68", "gpio72";
> +					function = "qup06";
> +				};
> +			};
> +
> +			qup_spi8_default: qup-spi8-default {
> +				pinmux {
> +					pins = "gpio42", "gpio43",
> +					       "gpio44", "gpio45";
> +					function = "qup08";
> +				};
> +			};
> +
> +			qup_spi10_default: qup-spi10-default {
> +				pinmux {
> +					pins = "gpio86", "gpio87",
> +					       "gpio88", "gpio89",
> +					       "gpio90", "gpio91";
> +					function = "qup10";
> +				};
> +			};
> +
> +			qup_spi11_default: qup-spi11-default {
> +				pinmux {
> +					pins = "gpio53", "gpio54",
> +					       "gpio55", "gpio56";
> +					function = "qup11";
> +				};
> +			};
> +
> +			qup_uart0_default: qup-uart0-default {
> +				pinmux {
> +					pins = "gpio34", "gpio35",
> +					       "gpio36", "gpio37";
> +					function = "qup00";
> +				};
> +			};
> +
> +			qup_uart1_default: qup-uart1-default {
> +				pinmux {
> +					pins = "gpio0", "gpio1",
> +					       "gpio2", "gpio3";
> +					function = "qup01";
> +				};
> +			};
> +
> +			qup_uart2_default: qup-uart2-default {
> +				pinmux {
> +					pins = "gpio15", "gpio16";
> +					function = "qup02";
> +				};
> +			};
> +
> +			qup_uart3_default: qup-uart3-default {
> +				pinmux {
> +					pins = "gpio38", "gpio39",
> +					       "gpio40", "gpio41";
> +					function = "qup03";
> +				};
> +			};
> +
> +			qup_uart4_default: qup-uart4-default {
> +				pinmux {
> +					pins = "gpio115", "gpio116";
> +					function = "qup04";
> +				};
> +			};
> +
> +			qup_uart5_default: qup-uart5-default {
> +				pinmux {
> +					pins = "gpio25", "gpio26",
> +					       "gpio27", "gpio28";
> +					function = "qup05";
> +				};
> +			};
> +
> +			qup_uart6_default: qup-uart6-default {
> +				pinmux {
> +					pins = "gpio59", "gpio60",
> +					       "gpio61", "gpio62";
> +					function = "qup06";
> +				};
> +			};
> +
> +			qup_uart7_default: qup-uart7-default {
> +				pinmux {
> +					pins = "gpio6", "gpio7";
> +					function = "qup07";
> +				};
> +			};
> +
> +			qup_uart8_default: qup-uart8-default {
>   				pinmux {
>   					pins = "gpio44", "gpio45";
> -					function = "qup12";
> +					function = "qup08";
> +				};
> +			};
> +
> +			qup_uart9_default: qup-uart9-default {
> +				pinmux {
> +					pins = "gpio46", "gpio47";
> +					function = "qup09";
>   				};
>   			};
> +
> +			qup_uart10_default: qup-uart10-default {
> +				pinmux {
> +					pins = "gpio86", "gpio87",
> +					       "gpio88", "gpio89";
> +					function = "qup10";
> +				};
> +			};
> +
> +			qup_uart11_default: qup-uart11-default {
> +				pinmux {
> +					pins = "gpio53", "gpio54",
> +					       "gpio55", "gpio56";
> +					function = "qup11";
> +				};
> +			};
> +		};
> +
> +		qspi: spi@88dc000 {
> +			compatible = "qcom,qspi-v1";
> +			reg = <0 0x088dc000 0 0x600>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +				 <&gcc GCC_QSPI_CORE_CLK>;
> +			clock-names = "iface", "core";
> +			status = "disabled";
>   		};
>   
>   		spmi_bus: spmi@c440000 {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
