Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C2A3122FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Feb 2021 10:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBGJJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Feb 2021 04:09:13 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:45758 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhBGJJM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Feb 2021 04:09:12 -0500
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id BADE64405EB;
        Sun,  7 Feb 2021 11:08:25 +0200 (IST)
References: <cover.1611756920.git.baruch@tkos.co.il>
 <59a0d43f34b69406cd320f16edc4e7fabe022bfd.1611756920.git.baruch@tkos.co.il>
 <ebdc1f5c424968a8e1b5463b29f616cf@codeaurora.org>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH 3/3] arm64: dts: ipq6018: enable USB2 support
In-reply-to: <ebdc1f5c424968a8e1b5463b29f616cf@codeaurora.org>
Date:   Sun, 07 Feb 2021 11:08:25 +0200
Message-ID: <87sg68xn1y.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kathiravan T,

Thanks for your review.

On Fri, Feb 05 2021, Kathiravan T wrote:
> On 2021-01-27 19:50, Baruch Siach wrote:
>> From: Kathiravan T <kathirav@codeaurora.org>
>> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
>> [baruch: adjust regs address/size; drop binding updates;
>>  drop unsupported quirk properties]
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  8 ++++
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 48 ++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> index 99cefe88f6f2..5aec18308712 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> @@ -78,3 +78,11 @@ nand@0 {
>>  		nand-bus-width = <8>;
>>  	};
>>  };
>> +
>> +&qusb_phy_1 {
>> +	status = "ok";
>> +};
>> +
>> +&usb2 {
>> +	status = "ok";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> index 9fa5b028e4f3..d4a3d4e4a7e9 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -524,6 +524,54 @@ qrtr_requests {
>>  			};
>>  		};
>> +		qusb_phy_1: qusb@59000 {
>> +			compatible = "qcom,ipq6018-qusb2-phy";
>> +			reg = <0x0 0x059000 0x0 0x180>;
>> +			#phy-cells = <0>;
>> +
>> +			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
>> +				 <&xo>;
>> +			clock-names = "cfg_ahb", "ref";
>
> As per the bindings, ref clock should be 19.2MHz where the XO in IPQ60xx is
> 24MHz. Did the USB enumerated successfully and able to perform read / write
> operations?

I managed to enumerate an Ethernet USB dongle with only this series
applied.  But then I tested again with USB storage device. That only
worked with downstream clock adjust/period patch:

  https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/commit/?h=fig&id=707d8fa2b481888f4792edc6561e81999301cbcf

That patch applies cleanly on top of v5.11-rc4.

Is anyone at Codeaurora pushing the dwc3 clock patch upstream? Should I
do that?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
