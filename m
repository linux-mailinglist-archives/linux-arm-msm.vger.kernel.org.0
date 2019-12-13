Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212CB11E696
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 16:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfLMPc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 10:32:29 -0500
Received: from m228-5.mailgun.net ([159.135.228.5]:55904 "EHLO
        m228-5.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbfLMPc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 10:32:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576251148; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MudX+gsXfMKjKX5fDRX9tiJkJGSE7H9tIT9l1IWXj3c=;
 b=fxzefVs1q292kv0Yc+VaHKinhOfokDWEE9vvI7Tq9JIBJ+NPjX3t+OL9Y7rYcKnSF6OOEBp5
 a0mHKoSpk71Kdm4f0ngh8xntB5i2ym6Hqx6wL50EJGY9MJAVYoEUipM781ClHEbHhlzRbW5+
 pjFsUGVVj78RHwmccxWkicHYhj8=
X-Mailgun-Sending-Ip: 159.135.228.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df3af0b.7f1a486b1308-smtp-out-n03;
 Fri, 13 Dec 2019 15:32:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11D52C63C76; Fri, 13 Dec 2019 15:32:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FB51C8EB87;
        Fri, 13 Dec 2019 15:31:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Dec 2019 21:01:44 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 6/6] arm64: dts: sm8150: Add rpmh power-domain node
In-Reply-To: <20191212073918.GO3143381@builder>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99eab9-35efa01f-8ed3-4a77-87e1-09c381173121-000000@us-west-2.amazonses.com>
 <20191212073918.GO3143381@builder>
Message-ID: <b3c40ad880b68de228a2209fcb853954@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-12 13:09, Bjorn Andersson wrote:
> On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:
> 
>> Add the DT node for the rpmhpd power controller.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> Series applied, please send separate patch for the yaml migration.

Thanks Bjorn, will send it out
asap

> 
> Regards,
> Bjorn
> 
>> ---
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 55 
>> ++++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index 8f23fcadecb89..0ac257637c2af 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -5,6 +5,7 @@
>>   */
>> 
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> 
>> @@ -469,6 +470,60 @@
>>  				clock-names = "xo";
>>  				clocks = <&xo_board>;
>>  			};
>> +
>> +			rpmhpd: power-controller {
>> +				compatible = "qcom,sm8150-rpmhpd";
>> +				#power-domain-cells = <1>;
>> +				operating-points-v2 = <&rpmhpd_opp_table>;
>> +
>> +				rpmhpd_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					rpmhpd_opp_ret: opp1 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
>> +					};
>> +
>> +					rpmhpd_opp_min_svs: opp2 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>> +					};
>> +
>> +					rpmhpd_opp_low_svs: opp3 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +					};
>> +
>> +					rpmhpd_opp_svs: opp4 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +					};
>> +
>> +					rpmhpd_opp_svs_l1: opp5 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					};
>> +
>> +					rpmhpd_opp_svs_l2: opp6 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
>> +					};
>> +
>> +					rpmhpd_opp_nom: opp7 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>> +					};
>> +
>> +					rpmhpd_opp_nom_l1: opp8 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>> +					};
>> +
>> +					rpmhpd_opp_nom_l2: opp9 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
>> +					};
>> +
>> +					rpmhpd_opp_turbo: opp10 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>> +					};
>> +
>> +					rpmhpd_opp_turbo_l1: opp11 {
>> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>> +					};
>> +				};
>> +			};
>>  		};
>>  	};
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
