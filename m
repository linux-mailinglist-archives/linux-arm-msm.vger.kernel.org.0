Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BED8416783
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243291AbhIWVfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:35:33 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:55055 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243292AbhIWVfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:35:32 -0400
X-Greylist: delayed 568 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 Sep 2021 17:35:32 EDT
Received: from [192.168.1.222] (adsl-d113.84-47-90.t-com.sk [84.47.90.113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5B0161F8A3;
        Thu, 23 Sep 2021 23:24:29 +0200 (CEST)
Date:   Thu, 23 Sep 2021 23:24:23 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH] arm64: dts: sm6125: Remove leading zeroes
To:     Fabio Estevam <festevam@gmail.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Message-Id: <NSOWZQ.JJOVDV7CG9LR2@somainline.org>
In-Reply-To: <20210922195208.1734936-1-festevam@gmail.com>
References: <20210922195208.1734936-1-festevam@gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Martin Botka <martin.botka@somainline.org>

On Wed, Sep 22 2021 at 04:52:08 PM -0300, Fabio Estevam 
<festevam@gmail.com> wrote:
> dtc complains about the leading zeroes:
> 
> arch/arm64/boot/dts/qcom/sm6125.dtsi:497.19-503.6: Warning 
> (unit_address_format): /soc/timer@f120000/frame@0f121000: unit name 
> should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:505.19-510.6: Warning 
> (unit_address_format): /soc/timer@f120000/frame@0f123000: unit name 
> should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:512.19-517.6: Warning 
> (unit_address_format): /soc/timer@f120000/frame@0f124000: unit name 
> should not have leading 0
> 
> Remove them.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi 
> b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 2b37ce6a9f9c..0c1057456597 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -494,7 +494,7 @@ timer@f120000 {
>  			reg = <0x0f120000 0x1000>;
>  			clock-frequency = <19200000>;
> 
> -			frame@0f121000 {
> +			frame@f121000 {
>  				frame-number = <0>;
>  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>  						<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> @@ -502,14 +502,14 @@ frame@0f121000 {
>  				      <0x0f122000 0x1000>;
>  			};
> 
> -			frame@0f123000 {
> +			frame@f123000 {
>  				frame-number = <1>;
>  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x0f123000 0x1000>;
>  				status = "disabled";
>  			};
> 
> -			frame@0f124000 {
> +			frame@f124000 {
>  				frame-number = <2>;
>  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x0f124000 0x1000>;
> --
> 2.25.1


