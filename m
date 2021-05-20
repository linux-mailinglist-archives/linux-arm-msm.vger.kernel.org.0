Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08A5389DCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 08:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhETG0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 02:26:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28014 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhETG0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 02:26:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621491886; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lPEWZInXYCrR26bwC8R9J1S2kRCL+vZQmdRPKezCvRM=;
 b=tvNMtqJG08qtF07ZIk5ef0pbsAUcqSWjkSRu2Uaw17cEpufaqqWPVbMWIuUQBn6l4uXBuK8z
 kDvGy7MhLtN+I0BvOGyeT/HguxsPiaFnDkqfqMMOtxihqWzvPLZl/rHcYKCkz9V+weM++qdr
 4g+f9HB6ygQXei0NAZFuZAbWR+c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60a600987b9a7a2b6c3fd275 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 06:24:24
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1379C433F1; Thu, 20 May 2021 06:24:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E9D5C433D3;
        Thu, 20 May 2021 06:24:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 11:54:23 +0530
From:   skakit@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 1/8] arm64: dts: qcom: sm8350: Add label for
 thermal-zones node
In-Reply-To: <YKOoRPDiTnOQG+4l@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-2-git-send-email-skakit@codeaurora.org>
 <YKOoRPDiTnOQG+4l@vkoul-mobl.Dlink>
Message-ID: <e5c0b6e169eecaf2d2350056be105f13@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-18 17:13, Vinod Koul wrote:
> On 18-05-21, 11:50, satya priya wrote:
>> Add label "thermal_zones" for thermal-zones node.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changes in RESEND V4:
>>  - No Changes.
>> 
>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> index ed0b51b..47c6c0b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
>> @@ -1317,7 +1317,7 @@
>>  		};
>>  	};
>> 
>> -	thermal-zones {
>> +	thermal_zones: thermal-zones {
> 
> is this label used anywhere in this series? If not lets drop it
> 

yes, it is used in pm8350c.dtsi, pmk8350.dtsi and pmr735a.dtsi files 
which are included in sm8350 board dts.

>>  		cpu0-thermal {
>>  			polling-delay-passive = <250>;
>>  			polling-delay = <1000>;
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
