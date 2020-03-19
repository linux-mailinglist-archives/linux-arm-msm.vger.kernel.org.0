Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F1318AE69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 09:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgCSIeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 04:34:10 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13871 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726063AbgCSIeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 04:34:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584606849; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WjXzvAYgeus60ZHUiMBAn5ZUUcI2n3FOiiJg0MvlMXI=; b=EtGDzg6w1cB7R98UEZr2pQ0mOVqr/1tUft51DFLNC34r3S2FJvyps/vtOJj14x/MpaU8xmqq
 fjHDJ96RTo+YetOPvo86FtUeVGjDJkIjx0uETWTEMuXLeNvlO/31j0vvRH+iFX2aOITLE6yu
 YvmVKlH4DnvdJA0NcDm1vOV+N3o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e732e77.7fdc70171848-smtp-out-n04;
 Thu, 19 Mar 2020 08:33:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D04D0C43637; Thu, 19 Mar 2020 08:33:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.103] (unknown [106.51.30.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5507DC432C2;
        Thu, 19 Mar 2020 08:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5507DC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Fix cpu compatible
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
References: <cd0f3d35ca0fc2944fd97e030a28318ff82dd5c1.1584516925.git.amit.kucheria@linaro.org>
 <2526d2b2907116d1bb6f7edd194226eb7e24c333.1584516925.git.amit.kucheria@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <f78414f8-01c7-1274-14ae-a0222a8f636a@codeaurora.org>
Date:   Thu, 19 Mar 2020 14:03:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2526d2b2907116d1bb6f7edd194226eb7e24c333.1584516925.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/18/2020 2:38 PM, Amit Kucheria wrote:
> "arm,armv8" compatible should only be used for software models. Replace
> it with the real cpu type.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5fe2a31..a01dfefd90be 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -83,7 +83,7 @@
>   
>   		CPU0: cpu@0 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_0>;
> @@ -100,7 +100,7 @@
>   
>   		CPU1: cpu@100 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x100>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_100>;
> @@ -114,7 +114,7 @@
>   
>   		CPU2: cpu@200 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x200>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_200>;
> @@ -128,7 +128,7 @@
>   
>   		CPU3: cpu@300 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x300>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_300>;
> @@ -142,7 +142,7 @@
>   
>   		CPU4: cpu@400 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x400>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_400>;
> @@ -156,7 +156,7 @@
>   
>   		CPU5: cpu@500 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x500>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_500>;
> @@ -170,7 +170,7 @@
>   
>   		CPU6: cpu@600 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x600>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_600>;
> @@ -184,7 +184,7 @@
>   
>   		CPU7: cpu@700 {
>   			device_type = "cpu";
> -			compatible = "arm,armv8";
> +			compatible = "qcom,kryo468";
>   			reg = <0x0 0x700>;
>   			enable-method = "psci";
>   			next-level-cache = <&L2_700>;
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
