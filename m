Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14E524A089
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 15:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgHSNuW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 09:50:22 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:32338 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728608AbgHSNth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 09:49:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597844976; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0mtotj0y7f/ujlPF/3BquuIrAPK++4mXpR4ueE77w5Y=;
 b=g0p7E++j6YxbnjEOds9aB4TcL4WohLxbHYPTKcz4DsCAWvXxPUeYQrvAal5/mNZfmBd6Ka8V
 u39/HqnD8U9nDDBbeYw35GibCyZKJWxVJ4cPoMVC0TSi6wqbaDYt0BX+365L5lBYwMqgc/or
 WeB2YUUa6d4xwlqHDHSkkPEOuNg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f3d2de6d90407f0b972b867 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Aug 2020 13:49:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1D36C433CB; Wed, 19 Aug 2020 13:49:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15974C433C6;
        Wed, 19 Aug 2020 13:49:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 Aug 2020 19:19:25 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
In-Reply-To: <20200817180158.GD2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
 <20200817180158.GD2995789@google.com>
Message-ID: <1cbbc8cf5c918c6a9eee5ef349707fc6@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-17 23:31, Matthias Kaehlcke wrote:
> On Fri, Jul 24, 2020 at 09:28:01AM +0530, satya priya wrote:
>> Add sleep pin ctrl for BT uart, and also change the bias
>> configuration to match Bluetooth module.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V2:
>>  - This patch adds sleep state for BT UART. Newly added in V2.
>> 
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 
>> ++++++++++++++++++++++++++++-----
>>  1 file changed, 36 insertions(+), 6 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 26cc491..bc919f2 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -469,20 +469,50 @@
>> 
>>  &qup_uart3_default {
>>  	pinconf-cts {
>> -		/*
>> -		 * Configure a pull-down on 38 (CTS) to match the pull of
>> -		 * the Bluetooth module.
>> -		 */
>> +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
> 
> Has the pull from the Bluetooth module been removed or did the previous 
> config
> incorrectly claim that the Bluetooth module has a pull-down?
> 

The previous config was incorrect, so we corrected it to match the pull 
of BT.

>>  		pins = "gpio38";
>> +		bias-disable;
>> +	};
>> +
>> +	pinconf-rts {
>> +		/* We'll drive 39 (RTS), so configure pull-down */
>> +		pins = "gpio39";
>> +		drive-strength = <2>;
>>  		bias-pull-down;
>> +	};
>> +
>> +	pinconf-tx {
>> +		/* We'll drive 40 (TX), so no pull */
> 
> The rationales for RTS and TX contradict each other. According to the 
> comment
> the reason to configure a pull-down on RTS is that it is driven by the 
> host.
> Then for TX the reason to configure no pull is that it is driven by the 
> host.
> 
> Please make sure the comments *really* describe the rationale, 
> otherwise they
> are just confusing.

The rationale for RTS is that we don't want it to be floating and want 
to make sure that it is pulled down, to receive bytes. Will modify the 
comment mentioning the same.
