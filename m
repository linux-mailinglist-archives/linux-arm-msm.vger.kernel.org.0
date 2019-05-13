Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA821AF91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 06:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfEMEyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 00:54:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfEMEyG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 00:54:06 -0400
Received: from localhost (unknown [106.200.210.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30B0720862;
        Mon, 13 May 2019 04:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557723245;
        bh=kg5Sb4lx5oluSFBl+OqDQTg9mOuwKBnt6PVVLQ5bqjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=abIKUmBMyEAqbWr+SIwvqkZ3FEYCkflDYGytWwgEgc08BkXcy8CImrUN3yuTa4RR6
         yu7mVogmvYcqDpBgbb6juu66alrIRkk0nomRvpdkBUmaWCjJ7yEjClEZq032gR0kmj
         qaIy4w/zaN7OMqzSMcTO0r9oP0YcJZaV3B3K0b74=
Date:   Mon, 13 May 2019 10:24:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: qcs404: Define APPS IOMMU
Message-ID: <20190513045402.GA2707@vkoul-mobl>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
 <20190510043421.31393-8-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510043421.31393-8-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09-05-19, 21:34, Bjorn Andersson wrote:
> The APPS IOMMU provides contexts for FastRPC, MDP and WLAN, among other
> things.  Define these. We use the qcom_iommu binding because the
        ^^^
Double spaces crept in..

> firmware restrictions in incompatible with the arm-smmu.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 85 ++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index b213f6acad76..fcde4f0334c2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -378,6 +378,91 @@
>  			reg = <0x01937000 0x25000>;
>  		};
>  
> +		apps_iommu: iommu@1e20000 {
> +			compatible = "qcom,qcs404-iommu", "qcom,msm-iommu-v1";

Did we define qcom,qcs404-iommu in bindings, It does not seem to be
there in this patch, next or integration one

-- 
~Vinod
