Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFAF918ABC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 05:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgCSE2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 00:28:44 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15339 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgCSE2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 00:28:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584592124; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0mRFMEJwpdIXaB+jwVtf97Gm3MwCqBL7eIA/yGyn8AI=; b=BPB/AhEeJu9TQdGDwd0dgE26CuVpxgXvjImghNLWITxq7FFCWDqyhrZ4yT5g2bcBebmzPeod
 ylsdrX2LH+6nVoWat5mqZ2N/Pn5bPvDtgCjdB/oEkMz+WWO65mOwWrs6qGIG995EWOcdxVKT
 +PuK0UJicA4emFeKd0346oW9nNc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e72f4f1.7fd13655c110-smtp-out-n04;
 Thu, 19 Mar 2020 04:28:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDFC3C43637; Thu, 19 Mar 2020 04:28:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.35.103] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DC6BC433CB;
        Thu, 19 Mar 2020 04:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DC6BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add binding for qcom,usb-hs-7nm
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1584147293-6763-1-git-send-email-wcheng@codeaurora.org>
 <1584147293-6763-2-git-send-email-wcheng@codeaurora.org>
 <20200318220352.GA12501@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <44d97f2d-eb09-1192-ad20-daef7542a8b0@codeaurora.org>
Date:   Wed, 18 Mar 2020 21:28:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318220352.GA12501@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/18/2020 3:03 PM, Rob Herring wrote:
> On Fri, 13 Mar 2020 17:54:50 -0700, Wesley Cheng wrote:
>> This binding shows the descriptions and properties for the
>> 7nm Synopsis HS USB PHY used on QCOM platforms.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  .../devicetree/bindings/phy/qcom,usb-hs-7nm.yaml   | 74 ++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml: ignoring, error parsing file
> Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml:  while scanning a block scalar
>   in "<unicode string>", line 59, column 5
> found a tab character where an indentation space is expected
>   in "<unicode string>", line 73, column 1
> Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.example.dts] Error 1
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1254748
> Please check and re-submit.
> 

Hi Rob,

Sorry for not checking this step beforehand.  I installed the tools for
device tree validation, ran the same check, and resolved the errors.
Will resubmit the series with the changes.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
