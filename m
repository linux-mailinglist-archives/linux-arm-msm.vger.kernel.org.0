Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D431D9FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhBQNLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:11:14 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:42937 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230473AbhBQNLN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:11:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613567453; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=B3QRxLJ6gJmRoLswKWrB0gcSQ+YQnvw7f1kZhRUjVzs=;
 b=IR7gFZnPN25n82xFwXiq7F+7f99ErDvRMVyJPfQX1xT+4EsPHH81pcbqk4wppyAnOU3DH8GN
 rD0Pd+BVz8r1efDvcDY6LuAHTlieFlMQWp75HbWD4H4aWmtDexyY0N1S9YgC8TbxzWJBeHb3
 RgkvZGYxLNxcpcEYi9UynCFFHoM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 602d15bf98fd902dc20aa0df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 13:10:23
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A7F8C43464; Wed, 17 Feb 2021 13:10:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B633AC433CA;
        Wed, 17 Feb 2021 13:10:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Feb 2021 18:40:22 +0530
From:   schowdhu@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 2/6] arm64: dts: qcom: sm8150: Add Data Capture and
 Compare(DCC) support node
In-Reply-To: <20210217110331.GS2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <893022aecd4ba354adb57bd463206dd93fc19886.1613541226.git.schowdhu@codeaurora.org>
 <20210217110331.GS2774@vkoul-mobl.Dlink>
Message-ID: <10001950e73eb5e322fda6359103ebda@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Please find the replies inline.


On 2021-02-17 16:33, Vinod Koul wrote:
> On 17-02-21, 12:18, Souradeep Chowdhury wrote:
>> Add the DCC(Data Capture and Compare) device tree node entry along 
>> with
>> the addresses for register regions.
> 
> This should be last patch..

Ack

> 
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index e5bb17b..3198bd3 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -654,6 +654,13 @@
>>  			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>>  		};
>> 
>> +		dcc@010a2000{
> 
> no leading zero here and space before {

Ack

> 
>> +			compatible = "qcom,sm8150-dcc", "qcom,dcc";
>> +			reg = <0x0 0x010a2000 0x0 0x1000>,
>> +				<0x0 0x010ad000 0x0 0x3000>;
> 
> pls align this to preceding line

Ack

> 
>> +			reg-names = "dcc-base", "dcc-ram-base";
>> +		};
>> +
>>  		ufs_mem_hc: ufshc@1d84000 {
>>  			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
>>  				     "jedec,ufs-2.0";
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
