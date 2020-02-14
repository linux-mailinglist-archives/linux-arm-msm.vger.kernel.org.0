Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0179E15D665
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 12:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNLQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 06:16:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49390 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727965AbgBNLP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 06:15:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581678959; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lHXeqJrR7yd+a5wBDJp8eDtnwzucK8RD4X4JzVufeqY=; b=qKxjPhlor72l0OJgIu32XNVC6n2vmhPxgVByGK4exeGH3W6g0xXeh5W8m35/tDKbWTNyASAf
 PhwZGJ4pvzPUeczcV7jtbydGd9ffTL3FGuT6uazl3lkd8giR++PaixgzWbdlF5Yvb18BdF0e
 s/+8NDkH4tLIZwqPf0zZxc9X76s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e468162.7fb777f08bc8-smtp-out-n03;
 Fri, 14 Feb 2020 11:15:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79BE4C4479D; Fri, 14 Feb 2020 11:15:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [49.207.63.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC07AC433A2;
        Fri, 14 Feb 2020 11:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC07AC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add dynamic CPU power
 coefficients
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1578393926-5052-1-git-send-email-rnayak@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c0efc029-456d-42bc-aa0f-2c05bdf4bd3c@codeaurora.org>
Date:   Fri, 14 Feb 2020 16:45:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1578393926-5052-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/7/2020 4:15 PM, Rajendra Nayak wrote:
> Add dynamic power coefficients for Silver and Gold CPUs on
> SC7180 SoC.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Andy/Bjorn, can we pull this series in for 5.7?
Its essential to get EAS function on sc7180 devices.

>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..fb78bb8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -86,6 +86,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_0>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -103,6 +104,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x100>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_100>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -117,6 +119,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x200>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_200>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -131,6 +134,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x300>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_300>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -145,6 +149,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x400>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_400>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -159,6 +164,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x500>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <100>;
>   			next-level-cache = <&L2_500>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
> @@ -173,6 +179,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x600>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <405>;
>   			next-level-cache = <&L2_600>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> @@ -187,6 +194,7 @@
>   			compatible = "arm,armv8";
>   			reg = <0x0 0x700>;
>   			enable-method = "psci";
> +			dynamic-power-coefficient = <405>;
>   			next-level-cache = <&L2_700>;
>   			#cooling-cells = <2>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
