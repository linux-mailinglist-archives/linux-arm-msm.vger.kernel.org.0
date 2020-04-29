Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC371BE09F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 16:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgD2OSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 10:18:52 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:34750 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726661AbgD2OSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 10:18:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588169929; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=h0jvRC7HGXaYimqyTJRzfmOTezRJJ7zDAntXQ60QslU=; b=u8KHbgrJa0bQkeXoJFp4SS0JgUSk17tclz5teFPT/kUPUoRGlbtpocDiwL3yI8lETfn/0YYT
 GQi5JoQjPflV9ac/8kbWncNP6kR7nKoaGZtosSOIM98cuZs0ZKeHxBjoQoji88uwYOwsOZdX
 Puvax7PbGqpnYqScqBIN9SxSZvY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea98cb5.7f2e1fdd23e8-smtp-out-n05;
 Wed, 29 Apr 2020 14:18:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5679CC44791; Wed, 29 Apr 2020 14:18:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 932EDC44792;
        Wed, 29 Apr 2020 14:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 932EDC44792
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 07/17] arm64: dts: sdm845: Add DSI and MDP OPP tables
 and power-domains
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-8-git-send-email-rnayak@codeaurora.org>
 <20200429002705.GM4525@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <39ccd066-1691-b53d-029b-f6533f18d2e9@codeaurora.org>
Date:   Wed, 29 Apr 2020 19:48:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429002705.GM4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/29/2020 5:57 AM, Matthias Kaehlcke wrote:
> On Tue, Apr 28, 2020 at 07:02:55PM +0530, Rajendra Nayak wrote:
>> Add the OPP tables for DSI and MDP based on the perf state/clk
>> requirements, and add the power-domains property to specify the
>> scalable power domain.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 36b9fb1..7a625ad 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -3309,6 +3309,59 @@
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		mdp_opp_table: mdp-opp-table {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-19200000 {
>> +				opp-hz = /bits/ 64 <19200000>;
>> +				required-opps = <&rpmhpd_opp_min_svs>;
>> +			};
>> +
>> +			opp-171428571 {
>> +				opp-hz = /bits/ 64 <171428571>;
>> +				required-opps = <&rpmhpd_opp_low_svs>;
>> +			};
>> +
>> +			opp-344000000 {
>> +				opp-hz = /bits/ 64 <344000000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>;
>> +			};
>> +
>> +			opp-430000000 {
>> +				opp-hz = /bits/ 64 <430000000>;
>> +				required-opps = <&rpmhpd_opp_nom>;
>> +			};
>> +		};
> 
> as commented on "[v3,03/17] arm64: dts: sdm845: Add OPP table for all qup
> devices" (https://patchwork.kernel.org/patch/11514693/) this table should
> probably be inside the 'mdp' node.

right, I will move this and the below table inside the device nodes.

> 
>> +
>> +		dsi_opp_table: dsi-opp-table {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-19200000 {
>> +				opp-hz = /bits/ 64 <19200000>;
>> +				required-opps = <&rpmhpd_opp_min_svs>;
>> +			};
>> +
>> +			opp-180000000 {
>> +				opp-hz = /bits/ 64 <180000000>;
>> +				required-opps = <&rpmhpd_opp_low_svs>;
>> +			};
>> +
>> +			opp-275000000 {
>> +				opp-hz = /bits/ 64 <275000000>;
>> +				required-opps = <&rpmhpd_opp_svs>;
>> +			};
>> +
>> +			opp-328580000 {
>> +				opp-hz = /bits/ 64 <328580000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>;
>> +			};
>> +
>> +			opp-358000000 {
>> +				opp-hz = /bits/ 64 <358000000>;
>> +				required-opps = <&rpmhpd_opp_nom>;
>> +			};
>> +		};
>> +
> 
> depending on the outcome of the discussion mentioned above this might have
> to move into the 'dsi0' node.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
