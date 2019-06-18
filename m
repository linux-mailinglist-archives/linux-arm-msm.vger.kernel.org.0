Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DFE49ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 09:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfFRHjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 03:39:09 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46634 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfFRHjJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 03:39:09 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0EE63215C6;
        Tue, 18 Jun 2019 09:39:08 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id EABDD20962;
        Tue, 18 Jun 2019 09:39:07 +0200 (CEST)
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Rename smmu nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20190618052441.32306-1-bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <fbe71878-a129-1b11-d978-48a99b292086@free.fr>
Date:   Tue, 18 Jun 2019 09:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618052441.32306-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jun 18 09:39:08 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/06/2019 07:24, Bjorn Andersson wrote:

> Node names shouldn't include "qcom," and should whenever possible use
> a generic identifier. Resolve this by renaming the smmu nodes "iommu".

You mention "qcom" here, but the prefix you changed is "arm"
/me confused ^_^


>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2ecd9d775d61..c934e00434c7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1163,7 +1163,7 @@
>  			};
>  		};
>  
> -		vfe_smmu: arm,smmu@da0000 {
> +		vfe_smmu: iommu@da0000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0xda0000 0x10000>;
>  
> @@ -1314,7 +1314,7 @@
>  			};
>  		};
>  
> -		adreno_smmu: arm,smmu@b40000 {
> +		adreno_smmu: iommu@b40000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0xb40000 0x10000>;
>  
> @@ -1331,7 +1331,7 @@
>  			power-domains = <&mmcc GPU_GDSC>;
>  		};
>  
> -		mdp_smmu: arm,smmu@d00000 {
> +		mdp_smmu: iommu@d00000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0xd00000 0x10000>;
>  
> @@ -1347,7 +1347,7 @@
>  			power-domains = <&mmcc MDSS_GDSC>;
>  		};
>  
> -		lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
> +		lpass_q6_smmu: iommu@1600000 {
>  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>  			reg = <0x1600000 0x20000>;
>  			#iommu-cells = <1>;
> 
