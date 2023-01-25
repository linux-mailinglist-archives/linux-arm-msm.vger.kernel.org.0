Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E832167AA97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 07:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbjAYG4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 01:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjAYG4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 01:56:34 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B1F46175;
        Tue, 24 Jan 2023 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1674629787; x=1706165787;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=NvLVjrVmtc2xURfKIrrLOz2yXUNEQbkV9G1cceR48IY=;
  b=p9eBEe0V1hOInECdOkWcauPGdCLmV4Z72fr6iuxRvU8HlaB91ilOd1FW
   en9iZf0jEthnBQ4tedd4VbKYFa32qpST9ANOGI4FWm2gnYFYMpNUvWof3
   y/5S+FHoG+j+azAtASWlvTxPqkNeximQJutsV+XZos1x7kZEsSEZF7Up4
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Jan 2023 22:56:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.45.79.139])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 22:56:27 -0800
Received: from [10.216.52.138] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 22:56:23 -0800
Message-ID: <b788e82c-4e87-bc1d-9701-b1436283e379@quicinc.com>
Date:   Wed, 25 Jan 2023 12:26:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
From:   Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8540p-ride: Fix some i2c pinctrl
 settings
To:     Andrew Halaney <ahalaney@redhat.com>, <andersson@kernel.org>
CC:     <agross@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <bmasney@redhat.com>
References: <20230124192351.695838-1-ahalaney@redhat.com>
Content-Language: en-US
In-Reply-To: <20230124192351.695838-1-ahalaney@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/25/2023 12:53 AM, Andrew Halaney wrote:
> Some of the pinctrl groups were invalid for the selected pins. Select
> the proper qup group to fix these warnings:
> 
> [    6.523566] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio135" for function "qup15"
> [    6.535042] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio136" for function "qup15"
> [    6.597536] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio158" for function "qup15"
> [    6.597544] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio159" for function "qup15"
> [    6.597991] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio0" for function "qup15"
> [    6.597996] sc8280xp-tlmm f100000.pinctrl: invalid group "gpio1" for function "qup15"
> 
> Fixes: e073899ec3e1 ("arm64: dts: qcom: sa8540p-ride: add i2c nodes")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Reviewed-by: Shazad Hussain <quic_shazhuss@quicinc.com>


>   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index eacc1764255b..cb9fbdeb5a9e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -318,21 +318,21 @@ &xo_board_clk {
>   &tlmm {
>   	i2c0_default: i2c0-default-state {
>   		pins = "gpio135", "gpio136";
> -		function = "qup15";
> +		function = "qup0";
>   		drive-strength = <2>;
>   		bias-pull-up;
>   	};
>   
>   	i2c1_default: i2c1-default-state {
>   		pins = "gpio158", "gpio159";
> -		function = "qup15";
> +		function = "qup1";
>   		drive-strength = <2>;
>   		bias-pull-up;
>   	};
>   
>   	i2c12_default: i2c12-default-state {
>   		pins = "gpio0", "gpio1";
> -		function = "qup15";
> +		function = "qup12";
>   		drive-strength = <2>;
>   		bias-pull-up;
>   	};
