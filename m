Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD77118527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 11:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbfLJKds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 05:33:48 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:32810
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726574AbfLJKds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 05:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575974026;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=oPcXVs4sL0jagQxzN++WYvN2FEBiS1MvQ1+FLl0GrXM=;
        b=Lg3zVhYIoRjIld+taplBBX23mprv1Eg7OlBvBueC3Wc+mUpik7RYm0tFyOvCZHf+
        xM3/ICcRir5BpB9WMXKPojWLe/UchXnOSiXNE/avh0gY9hbO9Vrt9CTlk1G0LnghVVn
        LZjJ5VauoyurZWq7uMJc/nkrUVjkNWWCIqjGgHd0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575974026;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=oPcXVs4sL0jagQxzN++WYvN2FEBiS1MvQ1+FLl0GrXM=;
        b=hP7S+Su5DANVDSOweFKmBO5en3dtGC7yGiwCNuvbYLYYVCZZJw93vt9layKoVx3d
        ULSxEn5qo1elCjvBKRK89Sn/tNAxyw8AgFB1ZAeDcmYYU5CtLFny+ZfPGROvwpx497l
        bkElB2NX5abjP9yMMGmQ0u6a0ug4aCcqJL7FGqFM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14BEEC447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v5 13/13] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
 <20191108092824.9773-14-rnayak@codeaurora.org>
 <CAD=FV=VUoj1egZqw9koNHDPBCCEh_XZ5nZAPNKcnya2UACG8hw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0101016eef5f3e13-a3071a8d-10d8-41fc-b635-9a2d2dcc8a68-000000@us-west-2.amazonses.com>
Date:   Tue, 10 Dec 2019 10:33:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VUoj1egZqw9koNHDPBCCEh_XZ5nZAPNKcnya2UACG8hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.12.10-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/6/2019 5:55 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Nov 8, 2019 at 5:29 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>>
>> Add QUP SE instances configuration for sc7180.
>>
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 146 +++++
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 675 ++++++++++++++++++++++++
>>   2 files changed, 821 insertions(+)
> 
> Comments below could be done in a follow-up patch if it makes more sense.
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index e1d6278d85f7..666e9b92c7ad 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> 
> At the top of this file, please add aliases for all i2c and spi
> devices (like sdm845 did).  Right now trying to use command line i2c
> tools is super confusing because busses are super jumbled.

sure, I'll add it.

> 
> 
>> +                       i2c2: i2c@888000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00888000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_i2c2_default>;
>> +                               interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
> 
> Where is spi2?
> 
> 
>> +                       i2c4: i2c@890000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00890000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_i2c4_default>;
>> +                               interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
> 
> Where is spi4?
> 
> 
>> +                       i2c7: i2c@a84000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00a84000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_i2c7_default>;
>> +                               interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
> 
> Where is spi7?
> 
> 
>> +                       i2c9: i2c@a8c000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00a8c000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_i2c9_default>;
>> +                               interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
> 
> Where is spi9?

so looks like these qup instances (qup2/4/7/9) can only be configured to be used as i2c or uart
and not spi since we have only 2 pins for them and spi needs 4.
  
> 
>> +                       qup_spi1_default: qup-spi1-default {
>> +                               pinmux {
>> +                                       pins = "gpio0", "gpio1",
>> +                                              "gpio2", "gpio3",
>> +                                              "gpio12", "gpio94";
> 
> Please just mux one of the chip selects by default.  It seems like it
> would be _much_ more common to have a single SPI device on the bus and
> then every board doesn't have to override this.
> 
> 
>> +                       qup_spi6_default: qup-spi6-default {
>> +                               pinmux {
>> +                                       pins = "gpio59", "gpio60",
>> +                                              "gpio61", "gpio62",
>> +                                              "gpio68", "gpio72";
> 
> Please just mux one of the chip selects by default.  It seems like it
> would be _much_ more common to have a single SPI device on the bus and
> then every board doesn't have to override this.
> 
> 
>> +                       qup_spi10_default: qup-spi10-default {
>> +                               pinmux {
>> +                                       pins = "gpio86", "gpio87",
>> +                                              "gpio88", "gpio89",
>> +                                              "gpio90", "gpio91";
> 
> Please just mux one of the chip selects by default.  It seems like it
> would be _much_ more common to have a single SPI device on the bus and
> then every board doesn't have to override this.

yes, i will fix all of them to remove the additional chip select muxes.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
