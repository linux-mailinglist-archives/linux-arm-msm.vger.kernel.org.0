Return-Path: <linux-arm-msm+bounces-1409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3367F3843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 22:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143011C20A3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 21:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C09E584C6;
	Tue, 21 Nov 2023 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 337 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Nov 2023 13:26:16 PST
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB161AA;
	Tue, 21 Nov 2023 13:26:16 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F3F631F506;
	Tue, 21 Nov 2023 22:26:14 +0100 (CET)
Date: Tue, 21 Nov 2023 22:26:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH 5/6] arm64: dts: qcom: sm6125: add interrupts to DWC3
 USB controller
Message-ID: <pmkna4ckmm67kf6uuetwprbl4eiv4v7wluv4c7wosbsk557cnl@afkmfljmfloa>
References: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
 <20231111164229.63803-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111164229.63803-5-krzysztof.kozlowski@linaro.org>

Maybe this should CC the people that have most recently worked on SM6125 and
related hardware?

On 2023-11-11 17:42:28, Krzysztof Kozlowski wrote:
> Add interrupts to SM6125 DWC3 USB controller, based on downstream/vendor
> code of Trinket DTSI from Xiaomi Laurel device, to fix dtbs_check
> warnings:
> 
>   sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: 'interrupt-names' is a required property
>   sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: 'oneOf' conditional failed, one must be fixed:
>     'interrupts' is a required property
>     'interrupts-extended' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested on HW.

I have had an identical patch [1] on my tree for over one and a half years, but
recall not submitting it because of not being sure where to pull dm_hs_phy_irq /
dp_hs_phy_irq from.  I think you are right (in the dt-bindings fixup) that it is
not available on this platform.

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

(and obviously tested)

[1]: https://github.com/somainline/linux/commit/b57f7fa80cb3f5cd2db3db2d79548cbf063056d9

> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index eb07eca3a48d..1dd3a4056e26 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -1185,6 +1185,10 @@ usb3: usb@4ef8800 {
>  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>  			assigned-clock-rates = <19200000>, <66666667>;
>  
> +			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hs_phy_irq", "ss_phy_irq";
> +
>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>  			qcom,select-utmi-as-pipe-clk;
>  			status = "disabled";
> -- 
> 2.34.1
> 

