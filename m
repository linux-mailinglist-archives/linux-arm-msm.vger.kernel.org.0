Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938E0103278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 05:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfKTEMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 23:12:34 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:45638
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727264AbfKTEMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 23:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574223153;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=N/2N19eARJ1XCRN9V3ZaMOZYjVMckdZ6fG9koiFT6D0=;
        b=KCyXxH/S3kFOU782Fg7Q4ZyWM6Zl0iS0umweqZNXuS7NU/MYZCs+VuvQPmDfXblx
        TbxeYQ5CVQdNJBL6IBN2nmQO8Th4zlxeq9SeJs7ONsxsH1+3Sg4KZMAna1X8dbJAQVK
        x7zFMcbjOD5Vj+55RSx6v2WQI8uoPOnu3V81ZZdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574223153;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=N/2N19eARJ1XCRN9V3ZaMOZYjVMckdZ6fG9koiFT6D0=;
        b=a3ATZqipY5cQADaV6Wdt5kDW3cFTrjs5CdFNzLUeb/oSswIFVc1TqSM2ifxYr/p1
        QA9X2oH0UyzsO1BGoRuUl2Wa4IJLVfljWIoOObtHi9eoZ1zAtbfqx2kDmZKvfomzy8W
        H5qjKRQS3mWXlI9mcT75iVhCHU/btugMWo/r5ztA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74BD9C447BC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 6/6] arm64: dts: sm8150: Add rpmh power-domain node
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <20191118173944.27043-7-sibis@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016e8703078e-34fb2437-b406-47c2-846e-913fc38678f6-000000@us-west-2.amazonses.com>
Date:   Wed, 20 Nov 2019 04:12:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118173944.27043-7-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.11.20-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2019 11:09 PM, Sibi Sankar wrote:
> Add the DT node for the rpmhpd power controller.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 55 ++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 8f23fcadecb89..0ac257637c2af 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   
> @@ -469,6 +470,60 @@
>   				clock-names = "xo";
>   				clocks = <&xo_board>;
>   			};
> +
> +			rpmhpd: power-controller {
> +				compatible = "qcom,sm8150-rpmhpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmhpd_opp_ret: opp1 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
> +
> +					rpmhpd_opp_min_svs: opp2 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs: opp4 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_svs_l2: opp6 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					};
> +
> +					rpmhpd_opp_nom: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_l1: opp8 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					};
> +
> +					rpmhpd_opp_nom_l2: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp10 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_l1: opp11 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					};
> +				};
> +			};
>   		};
>   	};
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
