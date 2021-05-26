Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8A4390F05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 05:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhEZEBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 00:01:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43600 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhEZEA7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 00:00:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622001567; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=P0n4WbezbdAK81w1/rPYSPml9/Ly7Y5wITSskDucO7U=;
 b=JSxFNPfHrLz73OpZZrkAi+tBuFdF2XuyWDViMj5BjCJt8bdT6G1BsgFT95vywFwOmm98pJvn
 ZbA/us2ITlorMuVhBxQpW0a7EKZBZSNuejCgtzhPbRP4Kfb0+iZ7qcAW9oWRlezBhyYf5Uwg
 PqreQXl1gonaLNTpahIpG0T6ufQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60adc79e2bff04e53bb8554b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 03:59:26
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 571AEC4338A; Wed, 26 May 2021 03:59:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A472C433F1;
        Wed, 26 May 2021 03:59:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 May 2021 09:29:25 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V5 06/11] arm64: dts: qcom: pmr735a: Correct the GPIO node
In-Reply-To: <YK1kcVj9iyekNnrj@google.com>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
 <1621937466-1502-7-git-send-email-skakit@codeaurora.org>
 <YK1kcVj9iyekNnrj@google.com>
Message-ID: <f9f929f3bcf41f0188d27a57a79174a3@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-26 02:26, Matthias Kaehlcke wrote:
> On Tue, May 25, 2021 at 03:41:01PM +0530, satya priya wrote:
>> Add gpio ranges and correct the compatible to add
>> "qcom,spmi-gpio" as this pmic is on spmi bus.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V5:
>>  - This is split from patch [5/11] and added newly in V5.
> 
> actually it's a split from patch [5/8], right?
> 

Right, my bad. I should have mentioned this way to be more clear.
Thank you for reviewing the patches!

> https://patchwork.kernel.org/project/linux-arm-msm/patch/1621318822-29332-6-git-send-email-skakit@codeaurora.org/
> 
>>  arch/arm64/boot/dts/qcom/pmr735a.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi 
>> b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> index b0a7cd6c0..b4b6ba24 100644
>> --- a/arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
>> @@ -21,9 +21,10 @@
>>  		};
>> 
>>  		pmr735a_gpios: gpio@8800 {
>> -			compatible = "qcom,pmr735a-gpio";
>> +			compatible = "qcom,pmr735a-gpio", "qcom,spmi-gpio";
>>  			reg = <0x8800>;
>>  			gpio-controller;
>> +			gpio-ranges = <&pmr735a_gpios 0 0 4>;
>>  			#gpio-cells = <2>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
