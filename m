Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60EA31D7DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhBQLFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:05:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:34554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230310AbhBQLEP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:04:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B7AE64E79;
        Wed, 17 Feb 2021 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613559815;
        bh=W2wSXZnE/hZU/64CDnjmgs1s1Awe81Ke77Fy51wwAt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jm4NxnvIT0cIQu99VMYJoB39hm6EZO+E/J7rXd3m0eI45AvIolc3UNzS3gcB6jXCO
         L0jDUWi4Qw8ocOyr1HLGsi8BlKxXYXdFSOelnbu8IXtvyVX3z5V2FO5VQfYDTGSeHy
         OLAdc7etHJqUWtbGtfSNw+MwX3cDKkks8sf7jT6ZRA1cjGUEqNew6CJYJbNtYqdKvg
         WjgxJNd+C+N6abHGLEbk9xOiNmYKFsSwQ/Eu54neiZYMNacR4/rLKLDmAPOy7OXiOs
         FWJZKhUDIroUmk2hy+BaHNbXnjEowA3HzYPU80giqEeaQNLxliF055+JLPntUNbeea
         a2xbw+EXttD6A==
Date:   Wed, 17 Feb 2021 16:33:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 2/6] arm64: dts: qcom: sm8150: Add Data Capture and
 Compare(DCC) support node
Message-ID: <20210217110331.GS2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <893022aecd4ba354adb57bd463206dd93fc19886.1613541226.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893022aecd4ba354adb57bd463206dd93fc19886.1613541226.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-21, 12:18, Souradeep Chowdhury wrote:
> Add the DCC(Data Capture and Compare) device tree node entry along with
> the addresses for register regions.

This should be last patch..

> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index e5bb17b..3198bd3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -654,6 +654,13 @@
>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		dcc@010a2000{

no leading zero here and space before {

> +			compatible = "qcom,sm8150-dcc", "qcom,dcc";
> +			reg = <0x0 0x010a2000 0x0 0x1000>,
> +				<0x0 0x010ad000 0x0 0x3000>;

pls align this to preceding line

> +			reg-names = "dcc-base", "dcc-ram-base";
> +		};
> +
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
~Vinod
