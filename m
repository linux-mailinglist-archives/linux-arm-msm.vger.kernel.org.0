Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94D93FA693
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 17:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhH1PuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 11:50:21 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:44275 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhH1PuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 11:50:19 -0400
Received: from [192.168.1.101] (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6D1D23EF16;
        Sat, 28 Aug 2021 17:49:25 +0200 (CEST)
Subject: Re: [PATCH v2 06/18] arm64: dts: qcom: sm6350: Add TLMM block node
To:     Maulik Shah <mkshah@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
 <20210828131814.29589-6-konrad.dybcio@somainline.org>
 <3f1dbbf3-8d62-e855-0dcf-740da7adb7df@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <39680f6f-56ff-7f87-0d8a-9bd31dc5ffce@somainline.org>
Date:   Sat, 28 Aug 2021 17:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3f1dbbf3-8d62-e855-0dcf-740da7adb7df@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 28.08.2021 17:47, Maulik Shah wrote:
> Hi,
>
> On 8/28/2021 6:48 PM, Konrad Dybcio wrote:
>> Add TLMM pinctrl node to enable referencing the SoC pins in other nodes.
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>> Changes since v1:
>> - Fix the gpio ranges from 156 to 157
>>
>>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> index d57c669ae0d6..03f7601457b4 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -406,6 +406,25 @@ pdc: interrupt-controller@b220000 {
>>               interrupt-controller;
>>           };
>>   +        tlmm: pinctrl@f100000 {
>> +            compatible = "qcom,sm6350-tlmm";
>> +            reg = <0 0x0f100000 0 0x300000>;
>> +            interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
>> +                    <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> you will not require other interrupts (209 to 216) for dual edge to work since you have below set in pinctrl-sm6350.c
>
> .wakeirq_dual_edge_errata = true,
>
> Thanks,
> Maulik


Right, I updated the binding but not the dt... Thanks for spotting that.


Konrad

