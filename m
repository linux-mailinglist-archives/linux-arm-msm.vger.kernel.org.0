Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F13625CCC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 23:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgICVvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 17:51:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:53779 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729442AbgICVvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 17:51:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599169884; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KkUwaOv29rJxTh90c7/ir1eEKy0BUkrSWEVWw1RACx0=; b=EQ4vPk9KhDv3O8RhQ92CxnfRz3Uvo/Af7k5YcFQMawB5L0seNxvj83oLIZ5A1IACEPeS4Jxk
 S1TV0DnZBgLUSDMEG+JWkfhFJ9fHMykAS/hY4O7sSAQxJ2n48rYVjwT4F3FHrO501S4MJhBl
 XbINgaQDJWQ9oOiiUjtA9k1Vmag=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f51653654e87432be657478 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 21:50:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68F2EC433C9; Thu,  3 Sep 2020 21:50:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.110.72.171] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48B28C433C8;
        Thu,  3 Sep 2020 21:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48B28C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v8 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>, sboyd@kernel.org,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-5-wcheng@codeaurora.org>
 <1ed0a34c-6219-fe3d-7d9c-13a74ce2d4d0@gmail.com>
 <02111c69-73fd-5e8c-5594-27393865d458@codeaurora.org>
 <20200830175257.GA1947@uller>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <fb81083e-7672-d199-689f-ede89228b485@codeaurora.org>
Date:   Thu, 3 Sep 2020 14:50:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200830175257.GA1947@uller>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/30/2020 10:52 AM, Bjorn Andersson wrote:
> On Thu 20 Aug 07:47 UTC 2020, Wesley Cheng wrote:
> 
>>
>>
>> On 8/12/2020 2:34 AM, Sergei Shtylyov wrote:
>>> Hello!
>>>
>>> On 12.08.2020 10:19, Wesley Cheng wrote:
>>>
>>>> Add the required DTS node for the USB VBUS output regulator, which is
>>>> available on PM8150B.  This will provide the VBUS source to connected
>>>> peripherals.
>>>>
>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>>>>   arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>>>>   2 files changed, 10 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>>> b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>>> index 053c659734a7..9e560c1ca30d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
>>>> @@ -53,6 +53,12 @@ power-on@800 {
>>>>               status = "disabled";
>>>>           };
>>>>   +        pm8150b_vbus: dcdc@1100 {
>>>
>>>    s/dcdc/regulator/? What is "dcdc", anyway?
>>>    The device nodes must have the generic names, according to the DT spec.
>>>
>>
>> Hi Sergei,
>>
>> Thanks for the comment!
>>
>> DCDC is the label that we use for the DC to DC converter block, since
>> the VBUS booster will output 5V to the connected devices.  Would it make
>> more sense to have "dc-dc?"
>>
> 
> At this level it's just a regulator at 0x1100, so it should be
> "regulator@1100". If you would like a more useful name in the running
> system you should be able to use the "regulator-name" property.
> 
> Regards,
> Bjorn
> 

Hi Bjorn,

Thanks for the suggestion.  Sounds good, I will just use the "regulator"
name for now.

Thanks
Wesley

>> Thanks
>> Wesley
>>
>>>> +            compatible = "qcom,pm8150b-vbus-reg";
>>>> +            status = "disabled";
>>>> +            reg = <0x1100>;
>>>> +        };
>>>> +
>>>>           pm8150b_typec: typec@1500 {
>>>>               compatible = "qcom,pm8150b-usb-typec";
>>>>               status = "disabled";
>>> [...]
>>>
>>> MBR, Sergei
>>
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
