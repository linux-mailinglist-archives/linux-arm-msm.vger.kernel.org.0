Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4813FA690
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 17:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhH1Pss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 11:48:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56753 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbhH1Pss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 11:48:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630165677; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3Me/tDEtDhKcORMu1acBBz70kU2AKNLfilsmWR135rY=; b=sOe9ZhT34m/s2a8xbeFCRLdyHO5fom1xLGwrE85TUedaes/keeYqdEtCXnFncCG3BQvqVfGF
 tOLt9pDbk9aaKRk0Ghz8Z8/QIDP4NxRZ8RMvslxvhLqCw48KmIcFDhTuZfAr/3/QE57tc7eX
 FxULVmDpqjXHHgXw5PLQPovLXZ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 612a5a9697222b4b5b65fb4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Aug 2021 15:47:34
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E032C43619; Sat, 28 Aug 2021 15:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.87.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 070C9C4338F;
        Sat, 28 Aug 2021 15:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 070C9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 06/18] arm64: dts: qcom: sm6350: Add TLMM block node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
 <20210828131814.29589-6-konrad.dybcio@somainline.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <3f1dbbf3-8d62-e855-0dcf-740da7adb7df@codeaurora.org>
Date:   Sat, 28 Aug 2021 21:17:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210828131814.29589-6-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/28/2021 6:48 PM, Konrad Dybcio wrote:
> Add TLMM pinctrl node to enable referencing the SoC pins in other nodes.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Fix the gpio ranges from 156 to 157
>
>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index d57c669ae0d6..03f7601457b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -406,6 +406,25 @@ pdc: interrupt-controller@b220000 {
>   			interrupt-controller;
>   		};
>   
> +		tlmm: pinctrl@f100000 {
> +			compatible = "qcom,sm6350-tlmm";
> +			reg = <0 0x0f100000 0 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
you will not require other interrupts (209 to 216) for dual edge to work 
since you have below set in pinctrl-sm6350.c

.wakeirq_dual_edge_errata = true,

Thanks,
Maulik
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 157>;
> +		};
> +
>   		intc: interrupt-controller@17a00000 {
>   			compatible = "arm,gic-v3";
>   			#interrupt-cells = <3>;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

