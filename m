Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BEB11A386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 05:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfLKEhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 23:37:16 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:40336
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfLKEhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 23:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576039035;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=XBlKGXNm8X0mvnGcvnyLjSZ1TkV3wOXo6tKrf/zs3cs=;
        b=Wkqy4db4EF3rwobGZP2qFIfHM16T5V7eeGVMDd87xXw6/1IbUvYJLCBx29aZWFkt
        ojRRxamsUcNvIITi1xl+bfF2E8qUSXXHvNWfipugd5Gx6RA7ys8N17P7c/QxlVvE16f
        VSmJq+PaQSXrzKkhirJPOogJT1VHZETuQO4Dh5tw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576039035;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=XBlKGXNm8X0mvnGcvnyLjSZ1TkV3wOXo6tKrf/zs3cs=;
        b=X+unRLMPXi2RbDwlWFoOEctbPdE4WcBT5UKZmNwkjtirIhoMtqDHB3JWQENGo9uT
        NkVs2W9TiWWq3rsmpxgSUKXshtINCoky5FSaOrYMFC1GOWx7ba0TeHkeis9LKgEYyju
        bbM3x+yiKzp6DyoeRvilCVvY8Mzuqpxg6G7A+NB4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CCC6C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/2] arm64: dts: sc7180: Fix indentation/ordering of qspi
 nodes in sc7180-idp
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mka@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016ef33f329c-c59e3efc-1ccc-4d6a-965e-f44daab82310-000000@us-west-2.amazonses.com>
Date:   Wed, 11 Dec 2019 04:37:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.12.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/11/2019 6:05 AM, Douglas Anderson wrote:
> The qspi pinctrl nodes had the wrong intentation and sort ordering and

s/intentation/indentation

> the main qspi node was placed down in the pinctrl section.  Fix.
> 
> Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 73 +++++++++++++------------
>   1 file changed, 37 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f5ae95..5eab3a282eba 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -232,6 +232,20 @@ vreg_bob: bob {
>   	};
>   };
>   
> +&qspi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <25000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> @@ -250,6 +264,29 @@ &uart8 {
>   
>   /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>   
> +&qspi_clk {
> +	pinconf {
> +		pins = "gpio63";
> +		bias-disable;
> +	};
> +};
> +
> +&qspi_cs0 {
> +	pinconf {
> +		pins = "gpio68";
> +		bias-disable;
> +	};
> +};
> +
> +&qspi_data01 {
> +	pinconf {
> +		pins = "gpio64", "gpio65";
> +
> +		/* High-Z when no transfers; nice to park the lines */
> +		bias-pull-up;
> +	};
> +};
> +
>   &qup_i2c2_default {
>   	pinconf {
>   		pins = "gpio15", "gpio16";
> @@ -364,39 +401,3 @@ pinconf {
>   	};
>   };
>   
> -&qspi {
> -	status = "okay";
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
> -
> -	flash@0 {
> -		compatible = "jedec,spi-nor";
> -		reg = <0>;
> -		spi-max-frequency = <25000000>;
> -		spi-tx-bus-width = <2>;
> -		spi-rx-bus-width = <2>;
> -	};
> -};
> -
> -&qspi_cs0 {
> -		pinconf {
> -			pins = "gpio68";
> -			bias-disable;
> -		};
> -};
> -
> -&qspi_clk {
> -		pinconf {
> -			pins = "gpio63";
> -			bias-disable;
> -		};
> -};
> -
> -&qspi_data01 {
> -		pinconf {
> -			pins = "gpio64", "gpio65";
> -
> -			/* High-Z when no transfers; nice to park the lines */
> -			bias-pull-up;
> -		};
> -};
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
