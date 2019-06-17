Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA3D487CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfFQPsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:48:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37130 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQPsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:48:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id n65so1590070pga.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DjrSOfTvDLkGf6iVBEOXJC3VEAO5WnRtp67QcJ8Nncw=;
        b=jMR0NWkBB5rJ7tngeQ5upW/0VTi6DqFN1abkWnF7Xa1dbYwLNr7dzLjTQfC/leYfBQ
         zEdif1npDIyZd9T9GQm5MizGXdVFO2P5xnxD4/BaZkX7/9Iutd3bFrjgPe9fBAk24JxP
         QUtGtkt3uBWDMfjXokSEIO61vwxM5SdF3sX7vxL5QtKyqhddT+7n93khhKzaEfwoViEn
         cZXQzi/D9jNTphtuHf+ra5LPcZfqGBrTLOEa3HBSoXAfdk899KmJTTeCAxU5cdjqNqZb
         6AGvg6/9FALBIZy34vBdUkE20rhLR4L8sLdVQddtp+lEB6nTDK3lYBsRYaW8Myny1HtL
         Tz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DjrSOfTvDLkGf6iVBEOXJC3VEAO5WnRtp67QcJ8Nncw=;
        b=MLpvRHZhZV4m/J7Qr9Un9tf8+Y5YSQbd4Lmdem2jJEZ4ecxEZJQBJsedTCIpPw5UKL
         b6yGPXmkHg/juhdxvJKSW+VmLM6al2wV118cRs87CFZa34igIAuo5CWuuufX/ShIMiM2
         /Mm7/iif0y9hF9OjxI81xy6MkapqIIrbmYVh41x5+FWdfclrtF9quIXsbrPxPS9qNvh4
         J/NY8lbR/saZZDUXIfwYR9wAXuNuWzvqqXuiCObk3PsOIzWLxwiqczsTjzhAxn736r80
         vtStPRiPZZ+eGxMWEdsXGQGrxT1/t3hKKJnuMq63wejP8tvVW4tvNwkIn21zcrqFhCdQ
         AH0w==
X-Gm-Message-State: APjAAAW7nhUqvjmdactrPcIu+B7XemQ9ZlA8lZchHv5AbjPXNBOGmgTu
        93qC9erUTA4vAJI8fLYDwn8p8w==
X-Google-Smtp-Source: APXvYqwskv991mM7mCyvgK6hOG+rzwh1Zp3Tf/txWE+/te2Gh3S7So3gTqhDDcsp0QZ4hgMhliXUnA==
X-Received: by 2002:a17:90a:f498:: with SMTP id bx24mr27315789pjb.91.1560786511899;
        Mon, 17 Jun 2019 08:48:31 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v5sm13376988pfm.22.2019.06.17.08.48.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 08:48:31 -0700 (PDT)
Date:   Mon, 17 Jun 2019 08:49:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8998: Add ANOC1 SMMU node
Message-ID: <20190617154921.GF31088@tuxbook-pro>
References: <edade219-aa77-e7f0-af68-1c192632b2ca@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edade219-aa77-e7f0-af68-1c192632b2ca@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Apr 08:40 PDT 2019, Marc Gonzalez wrote:

> The MSM8998 ANOC1(*) SMMU services BLSP2, PCIe, UFS, and USB.
> (*) Aggregate Network-on-Chip #1
> 
> Based on the following DTS downstream:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm-arm-smmu-8998.dtsi?h=LE.UM.1.3.r3.25#n18
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Patch 1 applied

Thanks,
Bjorn

> ---
> Changes from v1:
> 	Split off from "PCIe and AR8151 on APQ8098/MSM8998" series
> 	Change compatible string to use qcom,msm8998-smmu-v2
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index ef71e8f1d102..f807ea3e2c6e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -606,6 +606,21 @@
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> +		anoc1_smmu: arm,smmu@1680000 {
> +			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> +			reg = <0x01680000 0x10000>;
> +			#iommu-cells = <1>;
> +
> +			#global-interrupts = <0>;
> +			interrupts =
> +				<GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +				<GIC_SPI 369 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
>  		tcsr_mutex_regs: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0x1f40000 0x20000>;
> -- 
> 2.17.1
