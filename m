Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8501A4CFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 02:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgDKAp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 20:45:57 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58715 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726648AbgDKAp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 20:45:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586565957; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=baG7AxsdPksik3jIsNvIYu8dRq4/IoOL7ZLETdz7QWM=; b=mF9v1TURWuKBvw95KJPnshRU1vvH/qQDas5RdgrLRstS9VJH3hQs2be2BdO+1DeJKrGlMhwm
 EQ/kYvDQxKFYvNKSGy87itlAH3XSbEodgK+8Wr8jRddUowEDu+Ibh/zEM+R1SaqGb0Vmz/sR
 lBNH010/mWLV/XirNgae0e0Ilo0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e911343.7f2eaf90ed50-smtp-out-n05;
 Sat, 11 Apr 2020 00:45:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 225CAC43636; Sat, 11 Apr 2020 00:45:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.206.125.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48833C433CB;
        Sat, 11 Apr 2020 00:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48833C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add ipq8074 usb dt
 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1586543372-13969-1-git-send-email-sivaprak@codeaurora.org>
 <1586543372-13969-2-git-send-email-sivaprak@codeaurora.org>
 <20200410220540.GC20625@builder.lan>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <c22e2ccd-3f9d-e0ce-45e5-01cb603c8555@codeaurora.org>
Date:   Sat, 11 Apr 2020 06:15:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410220540.GC20625@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 4/11/2020 3:35 AM, Bjorn Andersson wrote:
> On Fri 10 Apr 11:29 PDT 2020, Sivaprakash Murugesan wrote:
>
>> Add ipq8074 qmp phy device compatible for usb super speed usb support.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>> index 18a8985..d60c845 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       enum:
>>         - qcom,ipq8074-qmp-pcie-phy
>> +      - qcom,ipq8074-qmp-usb-phy
> I believe you're missing a "3" here.
Yes. Will correct it in next patch set.
> Regards,
> Bjorn
>
