Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2AD5C8FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 08:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfGBGEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 02:04:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55048 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfGBGEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 02:04:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C3697607B9; Tue,  2 Jul 2019 06:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562047482;
        bh=6egelyxaOENhWqkABkuxokX15l80QAY+EJJSX+pde9Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lwreq1qP1s2nycYlrZhffH/Zj+nV+QsHGWS3U8a9k84wGbFHE3zcW+XZdXAo15LyZ
         eHVLCrfpAu5WbkMAjSGtvrN9iC4Hzy+DhMOEjR9cfWoCwOOWecT0AMMS78OvF1kfV5
         qu/W2xdr8F9vQZr2xaYbhn2P9SkLMfcBXLcg8cvQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C735B602F8;
        Tue,  2 Jul 2019 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562047482;
        bh=6egelyxaOENhWqkABkuxokX15l80QAY+EJJSX+pde9Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lwreq1qP1s2nycYlrZhffH/Zj+nV+QsHGWS3U8a9k84wGbFHE3zcW+XZdXAo15LyZ
         eHVLCrfpAu5WbkMAjSGtvrN9iC4Hzy+DhMOEjR9cfWoCwOOWecT0AMMS78OvF1kfV5
         qu/W2xdr8F9vQZr2xaYbhn2P9SkLMfcBXLcg8cvQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C735B602F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add video nodes
To:     Aniket Masule <amasule@codeaurora.org>, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Malathi Gottam <mgottam@codeaurora.org>
References: <1561620334-17642-1-git-send-email-amasule@codeaurora.org>
 <1561620334-17642-2-git-send-email-amasule@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a0a10c45-b366-a30e-6162-efcc7a435085@codeaurora.org>
Date:   Tue, 2 Jul 2019 11:34:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561620334-17642-2-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/27/2019 12:55 PM, Aniket Masule wrote:
> From: Malathi Gottam <mgottam@codeaurora.org>
> 
> This adds video nodes to sdm845 based on the examples
> in the bindings.
> 
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> Co-developed-by: Aniket Masule <amasule@codeaurora.org>
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..94813a9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1893,6 +1893,36 @@
>   			};
>   		};
>   
> +		video-codec@aa00000 {
> +			compatible = "qcom,sdm845-venus";
> +			reg = <0x0aa00000 0xff000>;

this should be
	reg = <0 0x0aa00000 0 0xff000>;

> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>;
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +			clock-names = "core", "iface", "bus";
> +			iommus = <&apps_smmu 0x10a0 0x8>,
> +				 <&apps_smmu 0x10b0 0x0>;
> +			memory-region = <&venus_region>;

this is venus_mem and not venus_region.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
