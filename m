Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A026669E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 11:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfGLJZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 05:25:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41992 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfGLJZz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 05:25:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 218AA60A97; Fri, 12 Jul 2019 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562923554;
        bh=lfw/i17VNza47JF8I9sz0hN3tbZXkPak5SrFyt8d4CU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ATRurzyaYPBVFWHGYY1tGUvtd/0NV01+D4DFnnmvQTNJZ6LO4tnpYl1vvuxt2m/EU
         4UPQLyrjehdy/2Zcvb9HMGOIswqu2mBJ7d5U2zLSy2sIbinuD480ftmEF4uZEgG46V
         YGN2gry5oarAm+DB9OyB54HpiWqKvEWslUpwiMCU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.43.141] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F03CD60A97;
        Fri, 12 Jul 2019 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562923553;
        bh=lfw/i17VNza47JF8I9sz0hN3tbZXkPak5SrFyt8d4CU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dngCM7R9t8x14Twx4Pe1hOnBGa9Cl4J+RTmDwx1WaYs4lqF4eWb3ZmJ2Qdw4FL7fN
         Zxmsf5vBGSVwxA5Xq+J+AQh+FAVL1g47KDGb9Ha1VPNJHSNuSa8FHq8Wkk+JyA1hXT
         eKtxRaL5Zpa0bsnW16TPYNIedsnb5WXHUmV14xmE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F03CD60A97
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3] arm64: dts: sdm845: Add video nodes
To:     Aniket Masule <amasule@codeaurora.org>, andy.gross@linaro.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        Malathi Gottam <mgottam@codeaurora.org>
References: <1562069549-25384-1-git-send-email-amasule@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <81590b01-e9e7-dbc7-c2c8-0d6093db7ce0@codeaurora.org>
Date:   Fri, 12 Jul 2019 14:55:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562069549-25384-1-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/2/2019 5:42 PM, Aniket Masule wrote:
> From: Malathi Gottam <mgottam@codeaurora.org>
> 
> This adds video nodes to sdm845 based on the examples
> in the bindings.
> 
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> Co-developed-by: Aniket Masule <amasule@codeaurora.org>
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..f3cd94f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1893,6 +1893,36 @@
>   			};
>   		};
>   
> +		video-codec@aa00000 {
> +			compatible = "qcom,sdm845-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>;
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_smmu 0x10a0 0x8>,
> +				 <&apps_smmu 0x10b0 0x0>;
> +			memory-region = <&venus_mem>;
> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +				clock-names = "core", "bus";
> +				power-domains = <&videocc VCODEC0_GDSC>;
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
> +					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
> +				clock-names = "core", "bus";
> +				power-domains = <&videocc VCODEC1_GDSC>;
> +			};
> +		};
> +
>   		videocc: clock-controller@ab00000 {
>   			compatible = "qcom,sdm845-videocc";
>   			reg = <0 0x0ab00000 0 0x10000>;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
