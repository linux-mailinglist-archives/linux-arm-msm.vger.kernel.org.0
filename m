Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A717E3623D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 17:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245712AbhDPPXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 11:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245198AbhDPPXN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 11:23:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 773D06108E;
        Fri, 16 Apr 2021 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618586568;
        bh=UCKWKHLkdVDLh4B5BSFqDmm4kFaMLm1dcAxBoArsevE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FGoRsOclkKlCKcw6rgXINyJAGcTpW0dN4IIju1cOwA99yCTttbeKD6DNlHazYdCUi
         8RNnSCbNoEU3AXm3rAwp13aMJOjv1d8EJd0/Jd+xLSKeQHpL2AGMtPKDDAr4b5CvUu
         puzZ7/rfJzd3zwkmX5CXNI+R2HXy01lrg96MqGAzjiVBb1U57GFrDcZpsgMSVJoaKq
         tU1N39vM3RXYltkjOCZarzYIyHfxlcRc3HerjLpiy3x2iFgxYSQSo0L7T6kmYxJBLQ
         PBCEPbmcp/SWNyFCV4rAKnZ8G2LEVxSUwXcG0wy1w+edEs8eIc/AInRssH0s/wiTPb
         XeO3IH0MMiYvA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH v3] arm64: boot: dts: qcom: sm8150: add SPI nodes
In-Reply-To: <0688f0cc-55f1-4450-c86a-5e661a85310b@connolly.tech>
References: <20210416103225.1872145-1-balbi@kernel.org>
 <0688f0cc-55f1-4450-c86a-5e661a85310b@connolly.tech>
Date:   Fri, 16 Apr 2021 18:22:44 +0300
Message-ID: <87r1jameyj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Caleb Connolly <caleb@connolly.tech> writes:
>> From: Felipe Balbi <felipe.balbi@microsoft.com>
>>
>> Add missing SPI nodes for SM8150.
>>
>> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
>> ---
>>
>> changes since v2:
>> 	- switch to new pinctrl format
>>
>> Changes since v1:
>>
>> 	- avoid modifying drive strength on i2c. No functional
>>            changes, just keeping 0x02 instead of 2
>>
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 439 +++++++++++++++++++++++++++
>>   1 file changed, 439 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index 7207a3689d9d..c563f381a138 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -602,6 +602,21 @@ i2c0: i2c@880000 {
>>   				status = "disabled";
>>   			};
>>
>> +			spi0: spi@880000 {
>> +				compatible = "qcom,geni-spi";
>> +				reg = <0 0x880000 0 0x4000>;
>> +				reg-names = "se";
>
> I don't think we need the reg-names property on any of these.

true, but it doesn't hurt either :-) I can remove, but I'll wait before
spinning another revision

> Otherwise,
>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>

Thanks

-- 
balbi
