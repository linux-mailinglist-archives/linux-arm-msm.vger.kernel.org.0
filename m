Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B00F3572F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 19:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354758AbhDGRTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 13:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347857AbhDGRTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 13:19:11 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0424AC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 10:19:00 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so18787115ote.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6bG6MXnNzHqKt7V9NvZUmgRlrh8FQWobqYuvxCIbdks=;
        b=xNrWlng/vtSHN9+SsGSY/mE7PrdLnSx9Xv9HkriKgCjV1GW33KD1KxnhEuc9gFR/86
         JUj9eGtjhKMRYRnQb4H8O2zaMEeYDIngSC3ivbyv+DB8s7QULKXPztpKRXcI2g5Q9ctG
         tYzQaoQNC5+CnycY7L8LizQA8xs+DQlvnLXi9I6n1+Zjdu9A7SEDjhkswvBBiSs2LbzA
         1rUUeIxDMa1sQwBBrkshsgq/zQqO2wRnoQRcuSyAsSGednzSRYSvTLSuEX3nX1f48QmN
         +Zoe67OGQDib3y8ZoerPRhOnXHUSmUbnEsU8Ha/XSPnQvhgR+jBzKwquv7qs/PSWgTSd
         jvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bG6MXnNzHqKt7V9NvZUmgRlrh8FQWobqYuvxCIbdks=;
        b=YIVZSh12/mKmO6UAbaJxR/SL0+1FuF46f55lOA03Uneteyiar21gsziHlpUjda+YOE
         nT+8qwporA/Th1b+EgaaOOzkCa+X5B8cu6E1t94Xw6At864aX+apu4U8w/vMO0ksi+/V
         Tk4KEVOrB6kBsK1JsbAeGxtn+V+6WfkcW4rPtkG8H4CSxE9W+693/+kPhewybpegPf4B
         kD7R3/4UPhrIaq5yYm+Re1cbxpmPZxytbj/8GJE/3r4u89olDmgWkB938jeXuaagSnfB
         0jnIpyKmmf48n8oPo3ej65pyXVJPu+tZ/ZeHwIVSW7HtHsYY4DcP440dF+OUaco3/uW0
         Jjjw==
X-Gm-Message-State: AOAM530oXDYe9lcdaHvhkcTkoK0cwYFjDjDb6I6autzX2i4Xr4mNiQvd
        R22+z85QjMgkT3wLZSNKb1Fsug==
X-Google-Smtp-Source: ABdhPJxQuNKLwGTdnpNpuWw34jdyS6QS32WXkWaWVsk/ollNf+28qh0obvL+DO5ZPMD20gI5MvljPQ==
X-Received: by 2002:a05:6830:309c:: with SMTP id f28mr3780392ots.204.1617815939323;
        Wed, 07 Apr 2021 10:18:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h9sm4905704ooi.22.2021.04.07.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 10:18:58 -0700 (PDT)
Date:   Wed, 7 Apr 2021 12:18:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Add GICv2 hypervisor
 registers/interrupt
Message-ID: <YG3pgYLxnxGf5/X2@builder.lan>
References: <20210407163648.4708-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407163648.4708-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Apr 11:36 CDT 2021, Stephan Gerhold wrote:

> The ARM Cortex-A53 CPU cores and QGIC2 interrupt controller
> (an implementation of the ARM GIC 2.0 specification) used in MSM8916
> support virtualization, e.g. for KVM on Linux. However, so far it was
> not possible to make use of this functionality, because Qualcomm's
> proprietary "hyp" firmware blocks the EL2 mode of the CPU and only
> allows booting Linux in EL1.
> 
> However, on devices without (firmware) secure boot there is no need
> to rely on all of Qualcomm's firmware. The "hyp" firmware on MSM8916
> seems simple enough that it can be replaced with an open-source
> alternative created only based on trial and error - with some similar
> EL2/EL1 initialization code adapted from Linux and U-Boot.
> 
> qhypstub [1] is such an open-source firmware for MSM8916 that
> can be used as drop-in replacement for Qualcomm's "hyp" firmware.
> It does not implement any hypervisor functionality.
> Instead, it allows booting Linux/KVM (or other hypervisors) in EL2.
> 
> With Linux booting in EL2, KVM seems to be working just fine on MSM8916.
> However, so far it is not possible to make use of the virtualization
> features in the GICv2. To use KVM's VGICv2 code, the QGIC2 device tree
> node needs additional resources (according to binding documentation):
> 
>   - The CPU interface region (second reg) must be at least 8 KiB large
>     to access the GICC_DIR register (mapped at 0x1000 offset)
>   - Virtual control/CPU interface register base and size
>   - Hypervisor maintenance interrupt
> 
> Fortunately, the public APQ8016E TRM [2] provides the required information:
> 
>   - The CPU interface region (at 0x0B002000) actually has a size of 8 KiB
>   - Virtual control/CPU interface register is at 0x0B001000/0x0B004000
>   - Hypervisor maintenance interrupt is "PPI #0"
>       Note: This is a bit strange since almost all other ARM SoCs use
>             GIC_PPI 9 for this. However, I have verified that this is
>             indeed the interrupt that fires when bits are set in GICH_HCR.
> 
> Add the additional resources to the QGIC2 device tree node in msm8916.dtsi.
> There is no functional difference when Linux is started in EL1 since the
> additional resources are ignored in that case.
> 
> With these changes (and qhypstub), KVM seems to be fully working on
> the DragonBoard 410c (apq8016-sbc) and BQ Aquaris X5 (longcheer-l8910).
> 
> [1]: https://github.com/msm8916-mainline/qhypstub
> [2]: https://developer.qualcomm.com/download/sd410/snapdragon-410e-technical-reference-manual.pdf

This is awesome!

Thanks,
Bjorn

> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 4c155735fbc9..4f06c0a9c425 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1766,7 +1766,9 @@ intc: interrupt-controller@b000000 {
>  			compatible = "qcom,msm-qgic2";
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
> -			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
> +			reg = <0x0b000000 0x1000>, <0x0b002000 0x2000>,
> +			      <0x0b001000 0x1000>, <0x0b004000 0x2000>;
> +			interrupts = <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		};
>  
>  		apcs: mailbox@b011000 {
> -- 
> 2.31.1
> 
