Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845F342A19F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 12:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235831AbhJLKEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 06:04:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60843 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235727AbhJLKEg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 06:04:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634032954; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KzrF2C1DpEGFxREoByICYhE38ZCMJzobznNOOwUoPhY=;
 b=c36sHRhoBAQSlu8j3KQweiJKV2ug6CHexAR98MVNGqRqoewexl8ryf2CYBmSn1PHEO5jkvH3
 mriKn13oVcJ3+UT7cLjObMst//mBQQV0iovCHrO18+JN5X4INzthJfHyl/rm9kxkvL/19Ug0
 DMhlLnZv5rZRhaRoA9k3FUeoDaw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61655d3a446c6db0cb9fc402 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 10:02:34
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2160C4338F; Tue, 12 Oct 2021 10:02:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D78A4C4360C;
        Tue, 12 Oct 2021 10:02:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Oct 2021 15:32:31 +0530
From:   bgodavar@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     marcel@holtmann.org, bjorn.andersson@linaro.org,
        johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjliao@codeaurora.org, pharish@codeaurora.org,
        abhishekpandit@chromium.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sc7280: update bluetooth node in
 SC7280 IDP2 board
In-Reply-To: <fee220ea-4d20-79a2-fe3a-4df09535eca1@linaro.org>
References: <1633523403-32264-1-git-send-email-bgodavar@codeaurora.org>
 <1633523403-32264-2-git-send-email-bgodavar@codeaurora.org>
 <fee220ea-4d20-79a2-fe3a-4df09535eca1@linaro.org>
Message-ID: <34c0794417eab5dd75ecc25cbd15a976@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 2021-10-06 22:18, Dmitry Baryshkov wrote:
> On 06/10/2021 15:30, Balakrishna Godavarthi wrote:
>> This patch updates bluetooth node in SC7280 IDP2 board.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280-idp2.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> index 1fc2add..5c8d54b 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
>> @@ -15,9 +15,15 @@
>>     	aliases {
>>   		serial0 = &uart5;
>> +		bluetooth0 = &bluetooth;
>> +		hsuart0 = &uart7;
> 
> hsuartX does not follow existing aliases definition, so it was frowned
> upon by Rob Herring in the past.
> 
[Bala]: Thanks for pointing out will do in similar way.

>>   	};
>>     	chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   };
>> +
>> +&bluetooth: wcn6750-bt {
>> +	vddio-supply = <&vreg_l18b_1p8>;
>> +};
>> 
