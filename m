Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C7526FBDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgIRL5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 07:57:10 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:17264 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIRL5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 07:57:09 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 07:57:07 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600430228; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=azsUpAi2ZxIp5qSiODfJODHqLAc6+8CcBnmxsKDe3eY=; b=eyy2X5UYkvfZEXqR2gaqmS+XesYJUeO58qc72kU4+SknM8nmwFLks+DLX7HB+vIZ82Igbzby
 4h/HQYb34oiYrvN1ifF6I8C5Wh0ikgF1EO6/CPqvHnYzhN/AXKurJSIzZnx0FWYO+iKvw3v3
 Og5KHtixchID4SuhB+E18nbS3Ng=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f649f4ffda7475cca6c1db4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 11:51:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22A4DC433FF; Fri, 18 Sep 2020 11:51:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.131.172.121] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 670A5C433C8;
        Fri, 18 Sep 2020 11:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 670A5C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S
 driver
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
References: <1599019441-29308-1-git-send-email-srivasam@codeaurora.org>
 <CAD=FV=U1k7T6z=dZHYWFpnAw1bTptPjKXd7z9YuOQOsOFrXp-A@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <c36dbcd7-4492-3598-68c0-f4aea1c1dabf@codeaurora.org>
Date:   Fri, 18 Sep 2020 17:21:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U1k7T6z=dZHYWFpnAw1bTptPjKXd7z9YuOQOsOFrXp-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Mr. Doug for your time to review this patch!!

On 9/14/2020 11:11 PM, Doug Anderson wrote:
> Hi,
>
> On Tue, Sep 1, 2020 at 9:04 PM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> Add the I2S controller node to sc7180 dtsi.
>> Add pinmux for primary and secondary I2S.
>>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index d46b383..db60ca5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -676,6 +676,36 @@
>>                          };
>>                  };
>>
>> +               lpass_cpu: lpass@62f00000 {
>> +                       compatible = "qcom,sc7180-lpass-cpu";
>> +
>> +                       reg = <0 0x62f00000 0 0x29000>;
>> +                       reg-names = "lpass-lpaif";
>> +
>> +                       iommus = <&apps_smmu 0x1020 0>;
>> +
>> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
>> +
>> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
>> +                                <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
>> +                                <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
>> +                                <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
>> +                                <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
>> +                                <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
>> +
>> +                       clock-names = "pcnoc-sway-clk", "audio-core",
>> +                                       "mclk0", "pcnoc-mport-clk",
>> +                                       "mi2s-bit-clk0", "mi2s-bit-clk1";
>> +
>> +
>> +                       #sound-dai-cells = <1>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "lpass-irq-lpaif";
>> +               };
>> +
>>                  sdhc_1: sdhci@7c4000 {
> Your node is still sorted incorrectly.  Nodes with unit addresses
> should be sorted numerically.
>
> The number 0x62f00000 is greater than the number 0x7c4000.  Thus your
> node should not be placed above "sdhci@7c4000".  It should be placed
> somewhere further down in the file.

Will place it accordingly.

>
>
>>                          compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>>                          reg = <0 0x7c4000 0 0x1000>,
>> @@ -1721,6 +1751,45 @@
>>                                  };
>>                          };
>>
>> +                       sec_mi2s_active: sec-mi2s-active {
>> +                               pinmux {
>> +                                       pins = "gpio49", "gpio50", "gpio51";
>> +                                       function = "mi2s_1";
>> +                               };
>> +
>> +                               pinconf {
>> +                                       pins = "gpio49", "gpio50", "gpio51";;
> nit: double-semi-colon.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

