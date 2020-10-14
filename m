Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA9428DC5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgJNJGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:06:38 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42934 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726517AbgJNJGi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:06:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602666397; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MYYoWLeS8eltVgolk99JskKAu43wy+MVbWHV08U+L7w=; b=RrlfH8X87tKzxfGG7+lUuDCFtWCbgUGA7lqaw4jnstYAkVpVho0R9+Ken3yO+MACER/RyBNS
 M8DFmxx/PXmcpjQAGgP7e/K4MUXaVOHznfUbM+Z0D8F7oqpzyebmJh7noAKMb/QCWJTzmjBV
 zWBnR2NSwwt9O4WpPO4grgFXnSM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f86bf6bad37af35eccc1643 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 09:05:47
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB5EDC43395; Wed, 14 Oct 2020 09:05:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.66.241] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02532C433C9;
        Wed, 14 Oct 2020 09:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02532C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v10 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        sergei.shtylyov@gmail.com
References: <20201008235934.8931-1-wcheng@codeaurora.org>
 <20201008235934.8931-5-wcheng@codeaurora.org>
 <20201013150316.GB3497815@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <77530347-cef9-2b06-dabe-678ae02ea7d5@codeaurora.org>
Date:   Wed, 14 Oct 2020 02:05:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013150316.GB3497815@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/2020 8:03 AM, Rob Herring wrote:
> On Thu, Oct 08, 2020 at 04:59:34PM -0700, Wesley Cheng wrote:
>> Add the required DTS node for the USB VBUS output regulator, which is
>> available on PM8150B.  This will provide the VBUS source to connected
>> peripherals.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>> index 2bf385f5a55a..49ea597cc0c5 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>> @@ -53,6 +53,12 @@ power-on@800 {
>>  			status = "disabled";
>>  		};
>>  
>> +		pm8150b_vbus: regulator@1100 {
>> +			compatible = "qcom,pm8150b-vbus-reg";
>> +			status = "disabled";
>> +			reg = <0x1100>;
>> +		};
>> +
>>  		pm8150b_typec: usb-typec@1500 {
>>  			compatible = "qcom,pm8150b-usb-typec";
>>  			status = "disabled";
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> index 6c6325c3af59..ba3b5b802954 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>> @@ -409,6 +409,10 @@ &ufs_mem_phy {
>>  	vdda-pll-max-microamp = <19000>;
>>  };
>>  
>> +&pm8150b_vbus {
>> +	status = "okay";
>> +};
> 
> Why aren't you enabling the TypeC node and providing a complete example?
> 

Hi Rob,

I have another patch series which enables the type C node and adds QMP
PHY driver changes for setting the SS lane select MUX.

https://patchwork.kernel.org/project/linux-arm-msm/list/?series=361971

Just wanted to work on getting a PMIC based type C driver out there,
which can be utilized in designs where the QMP PHY lane select mux is
not going to be used. (ie using a FUSB340 as a lane select mux instead
of the QMP PHY mux)

Thanks

Regards,
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
