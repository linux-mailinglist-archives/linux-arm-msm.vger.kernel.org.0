Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD40F3F2682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 07:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhHTFfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 01:35:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48851 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbhHTFfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 01:35:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629437665; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lXsbnDvim+x7SjDi+NgiA4nb25M0s3Avl7+C9WJxIls=; b=CkC6f1opiVsLW2UgdbjF4ufSZfbGGzfMy2hC4L39MQ5N8VugUJ0NxaFOPoq4zPZIITRMjEa6
 Dqpcwh+idF/5fa0uCttcWNefh8sBPJTsM+ngMiH2/BEBsUrp7bjUXEuyr1y4kwB1VSnyBqEO
 OmjHVGkgUKcY93tEhw8i04n52CI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611f3edf1a9008a23e6e933c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 05:34:23
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69587C4360D; Fri, 20 Aug 2021 05:34:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.0.104] (unknown [49.206.50.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5B51C4338F;
        Fri, 20 Aug 2021 05:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A5B51C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add USB related nodes
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org>
 <1625576413-12324-3-git-send-email-sanm@codeaurora.org>
 <CAE-0n52d7UOWQ+hohoyV81+aB1RnNPUEnjPCtr5=nH+a=WK35Q@mail.gmail.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <ea2380bd-734d-a835-05f0-db9d3dbcfe38@codeaurora.org>
Date:   Fri, 20 Aug 2021 11:04:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52d7UOWQ+hohoyV81+aB1RnNPUEnjPCtr5=nH+a=WK35Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 8/18/2021 1:28 AM, Stephen Boyd wrote:
> Quoting Sandeep Maheswaram (2021-07-06 06:00:12)
>> Add nodes for DWC3 USB controller, QMP and HS USB PHYs in sc7280 SOC.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changed qmp usb phy to usb dp phy combo node as per Stephen's comments.
>> Changed dwc to usb and added SC7280 compatible as per Bjorn's comments.
>>
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 164 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a8c274a..cd6908f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -1035,6 +1035,125 @@
>>                          };
>>                  };
>>
> [...]
>> +
>> +               usb_2: usb@8cf8800 {
>> +                       compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
>> +                       reg = <0 0x08cf8800 0 0x400>;
>> +                       status = "disabled";
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +                       dma-ranges;
>> +
>> +                       clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
>> +                                <&gcc GCC_USB30_SEC_MASTER_CLK>,
>> +                                <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
>> +                                <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +                                <&gcc GCC_USB30_SEC_SLEEP_CLK>;
>> +                       clock-names = "cfg_noc", "core", "iface","mock_utmi",
>> +                                     "sleep";
>> +
>> +                       assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +                                         <&gcc GCC_USB30_SEC_MASTER_CLK>;
>> +                       assigned-clock-rates = <19200000>, <200000000>;
>> +
>> +                       interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <&pdc 13 IRQ_TYPE_EDGE_RISING>,
>> +                                    <&pdc 12 IRQ_TYPE_EDGE_RISING>;
> I'm seeing this cause a warning at boot
>
> [    4.724756] irq: type mismatch, failed to map hwirq-12 for
> interrupt-controller@b220000!
> [    4.733401] irq: type mismatch, failed to map hwirq-13 for
> interrupt-controller@b220000!
I should be using  IRQ_TYPE_LEVEL_HIGH. Will correct in next version.
>> +                       interrupt-names = "hs_phy_irq",
>> +                                         "dm_hs_phy_irq", "dp_hs_phy_irq";
>> +
>> +                       power-domains = <&gcc GCC_USB30_SEC_GDSC>;
>> +
>> +                       resets = <&gcc GCC_USB30_SEC_BCR>;
>> +
>> +                       usb_2_dwc3: usb@8c00000 {
>> +                               compatible = "snps,dwc3";
>> +                               reg = <0 0x08c00000 0 0xe000>;
>> +                               interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
>> +                               iommus = <&apps_smmu 0xa0 0x0>;
>> +                               snps,dis_u2_susphy_quirk;
>> +                               snps,dis_enblslpm_quirk;
>> +                               phys = <&usb_2_hsphy>;
>> +                               phy-names = "usb2-phy";
>> +                               maximum-speed = "high-speed";
>> +                       };
>> +               };
>> +
>>                  dc_noc: interconnect@90e0000 {
>>                          reg = <0 0x090e0000 0 0x5080>;
>>                          compatible = "qcom,sc7280-dc-noc";
>> @@ -1063,6 +1182,51 @@
>>                          qcom,bcm-voters = <&apps_bcm_voter>;
>>                  };
>>
>> +               usb_1: usb@a6f8800 {
>> +                       compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
>> +                       reg = <0 0x0a6f8800 0 0x400>;
>> +                       status = "disabled";
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +                       dma-ranges;
>> +
>> +                       clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +                                <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +                                <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +                                <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                                <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
>> +                       clock-names = "cfg_noc", "core", "iface", "mock_utmi",
>> +                                     "sleep";
>> +
>> +                       assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                                         <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +                       assigned-clock-rates = <19200000>, <200000000>;
>> +
>> +                       interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +                                             <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
>> +                                             <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> And this one too.
>
> [    4.898667] irq: type mismatch, failed to map hwirq-14 for
> interrupt-controller@b220000!
> [    4.907241] irq: type mismatch, failed to map hwirq-15 for
> interrupt-controller@b220000!
>
> which looks like genirq code is complaining that the type is different
> than what it is configured for. Are these trigger flags correct? If so,
> then there' some sort of bug in the pdc driver.

I should be using  IRQ_TYPE_LEVEL_HIGH. Will correct in next version.


>
>> +                                             <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
>> +                                         "dm_hs_phy_irq", "ss_phy_irq";
>> +
>> +                       power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
>> +
>> +                       resets = <&gcc GCC_USB30_PRIM_BCR>;
>> +
>> +                       usb_1_dwc3: usb@a600000 {
