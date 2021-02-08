Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94100312A30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 06:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBHFpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 00:45:04 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:26886 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhBHFpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 00:45:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612763077; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SNwZjcgmzSGiqNT0HEv7usgWCVSuQQU7Ep8ZviLz5tk=;
 b=lcnZu1mK//09cCneG8ZDgP3HKCY83jlrNbc9/Y2aK0Shiy8mibCD+Sxk+ytXKl0tnlXTiPU+
 +qGfSLdID31oBns7gBEnU5rj3qsxWO+04SGNZd12LlifWy6NCsh1xdmTZJZAxzSoTjLFDi67
 X7BT4gRPuQY2Tn1RM0gYHEtpLwU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6020cfaa34db06ef7987b381 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 05:44:10
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DED4C433ED; Mon,  8 Feb 2021 05:44:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24E76C433C6;
        Mon,  8 Feb 2021 05:44:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Feb 2021 11:14:09 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH 3/3] arm64: dts: ipq6018: enable USB2 support
In-Reply-To: <87sg68xn1y.fsf@tarshish>
References: <cover.1611756920.git.baruch@tkos.co.il>
 <59a0d43f34b69406cd320f16edc4e7fabe022bfd.1611756920.git.baruch@tkos.co.il>
 <ebdc1f5c424968a8e1b5463b29f616cf@codeaurora.org> <87sg68xn1y.fsf@tarshish>
Message-ID: <a5870d87bdfd02087af217130a801022@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-07 14:38, Baruch Siach wrote:
> Hi Kathiravan T,
> 
> Thanks for your review.
> 
> On Fri, Feb 05 2021, Kathiravan T wrote:
>> On 2021-01-27 19:50, Baruch Siach wrote:
>>> From: Kathiravan T <kathirav@codeaurora.org>
>>> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
>>> [baruch: adjust regs address/size; drop binding updates;
>>>  drop unsupported quirk properties]
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  8 ++++
>>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 48 
>>> ++++++++++++++++++++
>>>  2 files changed, 56 insertions(+)
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>> b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>> index 99cefe88f6f2..5aec18308712 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>> @@ -78,3 +78,11 @@ nand@0 {
>>>  		nand-bus-width = <8>;
>>>  	};
>>>  };
>>> +
>>> +&qusb_phy_1 {
>>> +	status = "ok";
>>> +};
>>> +
>>> +&usb2 {
>>> +	status = "ok";
>>> +};
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> index 9fa5b028e4f3..d4a3d4e4a7e9 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> @@ -524,6 +524,54 @@ qrtr_requests {
>>>  			};
>>>  		};
>>> +		qusb_phy_1: qusb@59000 {
>>> +			compatible = "qcom,ipq6018-qusb2-phy";
>>> +			reg = <0x0 0x059000 0x0 0x180>;
>>> +			#phy-cells = <0>;
>>> +
>>> +			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
>>> +				 <&xo>;
>>> +			clock-names = "cfg_ahb", "ref";
>> 
>> As per the bindings, ref clock should be 19.2MHz where the XO in 
>> IPQ60xx is
>> 24MHz. Did the USB enumerated successfully and able to perform read / 
>> write
>> operations?
> 
> I managed to enumerate an Ethernet USB dongle with only this series
> applied.  But then I tested again with USB storage device. That only
> worked with downstream clock adjust/period patch:
> 
> 
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/commit/?h=fig&id=707d8fa2b481888f4792edc6561e81999301cbcf
> 
> That patch applies cleanly on top of v5.11-rc4.
> 
> Is anyone at Codeaurora pushing the dwc3 clock patch upstream? Should I
> do that?

Sure, please go ahead.

> 
> Thanks,
> baruch

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
