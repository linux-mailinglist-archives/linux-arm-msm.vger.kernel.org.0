Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6034A34A23D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 07:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCZG5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 02:57:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54170 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhCZG5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 02:57:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616741820; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RAyEBGBjxIvMwdux9ANMuPgjLIvn6C+I2w/01nqQa7c=;
 b=pSJB/jkkNypucf7/AKjWxT9QDibXIwg/KxqteaFysysBx0Pcwfz0JoxwbpBQh+nK7S8gk2zE
 1U/6nwz1MvOHis322AnPWqZAklqkFbNOWQsbwVCYXJHlk089Dh1Smz2qLt4JcR/8TAmAV+KC
 taHhHeaBBGiLx2bj0PyohQvwgno=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 605d85b89920eadeccd3ecb2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 06:56:55
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0BD2C43461; Fri, 26 Mar 2021 06:56:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09989C433C6;
        Fri, 26 Mar 2021 06:56:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Mar 2021 12:26:52 +0530
From:   sbhanu@codeaurora.org
To:     Doug Anderson <dianders@google.com>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org>
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
 <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org>
Message-ID: <6fdf704c4716f5873d413229ca8adc57@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-25 09:28, Veerabhadrarao Badiganti wrote:
> On 3/23/2021 9:41 PM, Doug Anderson wrote:
>> Hi,
>> 
>> On Sat, Mar 20, 2021 at 11:18 AM Shaik Sajida Bhanu
>> <sbhanu@codeaurora.org> wrote:
>>> Add nodes for eMMC and SD card on sc7280.
>>> 
>>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>>> 
>>> ---
>>> This change is depends on the below patch series:
>>> https://lore.kernel.org/patchwork/project/lkml/list/?series=488871
>>> https://lore.kernel.org/patchwork/project/lkml/list/?series=489530
>>> https://lore.kernel.org/patchwork/project/lkml/list/?series=488429
>>> 
>>> Changes since V1:
>>>          - Moved SDHC nodes as suggested by Bjorn Andersson.
>>>          - Dropped "pinconf-" prefix as suggested by Bjorn Andersson.
>>>          - Removed extra newlines as suggested by Konrad Dybcio.
>>>          - Changed sd-cd pin to bias-pull-up in sdc2_off as suggested 
>>> by
>>>            Veerabhadrarao Badiganti.
>>>          - Added bandwidth votes for eMMC and SD card.
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7280-idp.dts |  25 ++++
>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi    | 213 
>>> ++++++++++++++++++++++++++++++++
>>>   2 files changed, 238 insertions(+)
>>> 
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> index 54d2cb3..4105263 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>>> @@ -8,6 +8,7 @@
>>>   /dts-v1/;
>>> 
>>>   #include "sc7280.dtsi"
>>> +#include <dt-bindings/gpio/gpio.h>
>>> 
>>>   / {
>>>          model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
>>> @@ -242,6 +243,30 @@
>>>          status = "okay";
>>>   };
>>> 
>>> +&sdhc_1 {
>>> +       status = "okay";
>> When I apply your patch I find that your sort order is wrong. "s"
>> comes before "u" and after "q" in the alphabet so "sdhc_1" and
>> "sdhc_2" should sort _after "qupv3_id_0" and before "uart5"
>> 
sure will change the order.
>> 
>>> +       pinctrl-names = "default", "sleep";
>>> +       pinctrl-0 = <&sdc1_on>;
>>> +       pinctrl-1 = <&sdc1_off>;
>>> +
>>> +       vmmc-supply = <&vreg_l7b_2p9>;
>>> +       vqmmc-supply = <&vreg_l19b_1p8>;
>>> +};
>>> +
>>> +&sdhc_2 {
>>> +       status = "okay";
>>> +
>>> +       pinctrl-names = "default","sleep";
>>> +       pinctrl-0 = <&sdc2_on>;
>>> +       pinctrl-1 = <&sdc2_off>;
>>> +
>>> +       vmmc-supply = <&vreg_l9c_2p9>;
>>> +       vqmmc-supply = <&vreg_l6c_2p9>;
>>> +
>>> +       cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
>> Where is the pinctrl for the card detect?  Oh, I see it's in
>> "sdc2_on". Probably would be good to break it out since this is
>> board-specific. See below.
>> 
okay
>> 
>>> +};
>>> +
>>>   /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>>> 
>>>   &qup_uart5_default {
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> index 8f6b569..69eb064 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>> @@ -20,6 +20,11 @@
>>> 
>>>          chosen { };
>>> 
>>> +       aliases {
>>> +               mmc1 = &sdhc_1;
>>> +               mmc2 = &sdhc_2;
>>> +       };
>>> +
>>>          clocks {
>>>                  xo_board: xo-board {
>>>                          compatible = "fixed-clock";
>>> @@ -305,6 +310,64 @@
>>>                          #power-domain-cells = <1>;
>>>                  };
>>> 
>>> +               sdhc_1: sdhci@7c4000 {
>>> +                       compatible = "qcom,sdhci-msm-v5";
>> Please make the compatible:
>>    compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
>> 
>> ...and add to the bindings. It should be a trivial bindings patch so
>> not too much trouble.
>> 
>> NOTE: even though the "qcom,sc7280-sdhci" should be in the bindings
>> and here you _shouldn't_ be adding any code for it. Just let the
>> fallback compatible string ("qcom,sdhci-msm-v5") do its magic. Adding
>> the sc7280 specific version is more of a "just in case we need it
>> later" type thing.
>> 
sure
>> 
>>> +                       reg = <0 0x7c4000 0 0x1000>,
>>> +                                       <0 0x7c5000 0 0x1000>;
>>> +                       reg-names = "hc", "cqhci";
>>> +
>>> +                       iommus = <&apps_smmu 0xC0 0x0>;
>>> +                       interrupts = <GIC_SPI 652 
>>> IRQ_TYPE_LEVEL_HIGH>,
>>> +                                       <GIC_SPI 656 
>>> IRQ_TYPE_LEVEL_HIGH>;
>>> +                       interrupt-names = "hc_irq", "pwr_irq";
>>> +
>>> +                       clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>>> +                                       <&gcc GCC_SDCC1_AHB_CLK>,
>>> +                                       <&rpmhcc RPMH_CXO_CLK>;
>>> +                       clock-names = "core", "iface", "xo";
>> I'm curious: why is the "xo" clock needed here but not for sc7180?
> Actually its needed even for sc7180. We are making use of this clock
> in msm_init_cm_dll()
> The default PoR value is also same as calculated value for
> HS200/HS400/SDR104 modes.
> But just not to rely on default register values we need this entry.
> 
>> 
>>> +                       interconnects = <&aggre1_noc MASTER_SDCC_1 0 
>>> &mc_virt SLAVE_EBI1 0>,
>>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>>> &cnoc2 SLAVE_SDCC_1 0>;
>>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>>> +                       power-domains = <&rpmhpd SC7280_CX>;
>>> +                       operating-points-v2 = <&sdhc1_opp_table>;
>>> +
>>> +                       bus-width = <8>;
>>> +                       non-removable;
>> This was actually a problem on sc7180 too, but you probably don't want
>> "non-removable" in the SoC file. Board files really should be adding
>> this. Though the SoC might be designed with the idea that this would
>> be used for a non-removable eMMC card I don't know why it wouldn't be
>> possible for someone to hook this up to an external slot and use a
>> GPIO somewhere as a card detect.
>> 
sure will move
>> 
>>> +                       supports-cqe;
>>> +                       no-sd;
>>> +                       no-sdio;
>> Does the port really not support SD / SDIO, or are you adding these
>> two properties just because on your reference board it's not hooked up
>> to SD/SDIO? What exactly makes it impossible to use SD/SDIO on this
>> port?
>> 
> By having this, we can optimize emmc device scan time.
> Driver wont issue SDIO & SDcards specific commands while
> scanning the device.Its little optimization.
> I think board specific dt is right place.
> 
> 
>>> +                       max-frequency = <192000000>;
>> Why do you need to specify this?
This helps to avoid lower speed modes running in high clock rate,
and As Veerabhadrarao Badiganti mentioned

This will align clock requests between mmc core layer and sdhci-msm
platform driver. Say, for HS200/HS400 modes of eMMC, mmc-core layer
tries to set clock at 200Mhz, whereas sdhci-msm expects 192Mhz for
these modes. So we have to rely on clock driver floor/ceil values.
By having this property, mmc-core layer itself request for 192Mhz.

Same is for SD card SDR104 mode, core layer expects clock at 208Mhz
whereas sdhci-msm can max operate only at 202Mhz. By having this
property, core layer requests only for 202Mhz for SDR104 mode.

BTW, this helps only for max possible speed modes.
In case of lower-speed modes (for DDR52) we still need to rely on clock
floor rounding.

>> 
>> 
>>> +                       qcom,dll-config = <0x0007642c>;
>>> +                       qcom,ddr-config = <0x80040868>;
>> These magic hex values really have no place being in dts which should
>> have things expressed at a higher level. ...but I guess that ship has
>> sailed and this is in the bindings so I guess we're stuck with them,
>> so I guess they're fine.
sure
>> 
>> 
>>> +                       mmc-ddr-1_8v;
>>> +                       mmc-hs200-1_8v;
>>> +                       mmc-hs400-1_8v;
>>> +                       mmc-hs400-enhanced-strobe;
>>> +
>>> +                       status = "disabled";
>>> +
>>> +                       sdhc1_opp_table: sdhc1-opp-table {
>>> +                               compatible = "operating-points-v2";
>>> +
>>> +                               opp-100000000 {
>>> +                                       opp-hz = /bits/ 64 
>>> <100000000>;
>>> +                                       required-opps = 
>>> <&rpmhpd_opp_low_svs>;
>>> +                                       opp-peak-kBps = <1200000 
>>> 76000>;
>>> +                                       opp-avg-kBps = <1200000 
>>> 50000>;
>> Why are the kBps numbers so vastly different than the ones on sc7180
>> for the same OPP point. That implies:
>> 
>> a) sc7180 is wrong.
>> 
>> b) This patch is wrong.
>> 
>> c) The numbers are essentially random and don't really matter.
>> 
>> Can you identify which of a), b), or c) is correct, or propose an
>> alternate explanation of the difference?
>> 

We calculated bus votes values for both sc7180 and sc7280 with ICB tool,
above mentioned values we got for sc7280.

>> 
>>> +                               };
>>> +
>>> +                               opp-384000000 {
>>> +                                       opp-hz = /bits/ 64 
>>> <384000000>;
>>> +                                       required-opps = 
>>> <&rpmhpd_opp_nom>;
>>> +                                       opp-peak-kBps = <5400000 
>>> 1600000>;
>>> +                                       opp-avg-kBps = <6000000 
>>> 300000>;
>> These opp numbers are also quite different than sc7180
>> 
We calculated bus votes values for both sc7180 and sc7280 with ICB tool,
above mentioned values we got for sc7280.
>> 
>>> +                               };
>>> +                       };
>>> +               };
>>> +
>>>                  qupv3_id_0: geniqup@9c0000 {
>>>                          compatible = "qcom,geni-se-qup";
>>>                          reg = <0 0x009c0000 0 0x2000>;
>>> @@ -328,6 +391,54 @@
>>>                          };
>>>                  };
>>> 
>>> +               sdhc_2: sdhci@8804000 {
>>> +                       compatible = "qcom,sdhci-msm-v5";
>>> +                       reg = <0 0x08804000 0 0x1000>;
>>> +
>>> +                       iommus = <&apps_smmu 0x100 0x0>;
>>> +                       interrupts = <GIC_SPI 207 
>>> IRQ_TYPE_LEVEL_HIGH>,
>>> +                                       <GIC_SPI 223 
>>> IRQ_TYPE_LEVEL_HIGH>;
>>> +                       interrupt-names = "hc_irq", "pwr_irq";
>>> +
>>> +                       clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>>> +                                       <&gcc GCC_SDCC2_AHB_CLK>,
>>> +                                       <&rpmhcc RPMH_CXO_CLK>;
>>> +                       clock-names = "core", "iface", "xo";
>>> +                       interconnects = <&aggre1_noc MASTER_SDCC_2 0 
>>> &mc_virt SLAVE_EBI1 0>,
>>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>>> &cnoc2 SLAVE_SDCC_2 0>;
>>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>>> +                       power-domains = <&rpmhpd SC7280_CX>;
>>> +                       operating-points-v2 = <&sdhc2_opp_table>;
>>> +
>>> +                       bus-width = <4>;
>>> +
>>> +                       no-mmc;
>>> +                       no-sdio;
>> Similar question to above: why exactly would mmc not work? Are you
>> saying that if someone hooked this up to a full sized SD card slot and
>> placed an MMC card into the slot that it wouldn't work? Similar
>> question about SDIO. If someone placed an external SDIO card into your
>> slot, would it not work?
>> 
> As mentioned above, its just to optimize SDcard scan time a little.
>>> +                       max-frequency = <202000000>;
>> Not needed?
>> 
yes it is needed same as above
>>> +
>>> +                       qcom,dll-config = <0x0007642c>;
>>> +
>>> +                       status = "disabled";
>>> +
>>> +                       sdhc2_opp_table: sdhc2-opp-table {
>>> +                                       compatible = 
>>> "operating-points-v2";
>>> +
>>> +                                       opp-100000000 {
>>> +                                               opp-hz =/bits/ 64 
>>> <100000000>;
>>> +                                               required-opps = 
>>> <&rpmhpd_opp_low_svs>;
>>> +                                               opp-peak-kBps = 
>>> <1200000 76000>;
>>> +                                               opp-avg-kBps = 
>>> <1200000 50000>;
>>> +                                       };
>>> +                                       opp-202000000 {
>> Blank line between the OPPs?
sure
>> 
>>> +                                               opp-hz = /bits/ 64 
>>> <202000000>;
>>> +                                               required-opps = 
>>> <&rpmhpd_opp_nom>;
>>> +                                               opp-peak-kBps = 
>>> <3500000 1200000>;
>>> +                                               opp-avg-kBps = 
>>> <5000000 100000>;
>>> +                                       };
>> Similar questions about why the OPPs are so vastly different from 
>> sc7180.
We calculated bus votes values for both sc7180 and sc7280 with ICB tool,
above mentioned values we got for sc7280.
>> 
>>> +                               };
>>> +               };
>>> +
>>>                  pdc: interrupt-controller@b220000 {
>>>                          compatible = "qcom,sc7280-pdc", "qcom,pdc";
>>>                          reg = <0 0x0b220000 0 0x30000>;
>>> @@ -374,6 +485,108 @@
>>>                                  pins = "gpio46", "gpio47";
>>>                                  function = "qup13";
>>>                          };
>>> +
>>> +                       sdc1_on: sdc1-on {
>>> +                               clk {
>>> +                                       pins = "sdc1_clk";
>>> +                                       bias-disable;
>>> +                                       drive-strength = <16>;
>>> +                               };
>>> +
>>> +                               cmd {
>>> +                                       pins = "sdc1_cmd";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <10>;
>>> +                               };
>>> +
>>> +                               data {
>>> +                                       pins = "sdc1_data";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <10>;
>>> +                               };
>>> +
>>> +                               rclk {
>>> +                                       pins = "sdc1_rclk";
>>> +                                       bias-pull-down;
>>> +                               };
>> * generally "bias" doesn't belong in the SoC file but instead should
>> be in the board file. Some boards might have external pulls (even if
>> the internal ones would work fine, hardware designers do weird things)
>> and thus might need to disable the internal ones (double pulls are not
>> great).
>> 
>> * generally drive-strength doesn't belong in the SoC file but should
>> be in the board file. Different boards with different layouts might
>> need different drive strengths, right?
>> 
>> If you remove those two things, I guess there's not actually much left
>> in the SoC dtsi file so I guess move these all to the board file? That
>> seems to be what we ended up with in "qrb5165-rb5.dts" / "sm8250.dtsi"
>> which is an example of a board using the new style of pinctrl for
>> devicetree.
>> 
sure
>> 
>>> +                       };
>>> +
>>> +                       sdc1_off: sdc1-off {
>>> +                               clk {
>>> +                                       pins = "sdc1_clk";
>>> +                                       bias-disable;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               cmd {
>>> +                                       pins = "sdc1_cmd";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               data {
>>> +                                       pins = "sdc1_data";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               rclk {
>>> +                                       pins = "sdc1_rclk";
>>> +                                       bias-pull-down;
>>> +                               };
>>> +                       };
>> No need for a sleep state for the rclk since it's the same as the
>> active state, right? NOTE: one way to handle this would be to define
>> one node per pingroup and thus do something like:
>> 
>> pinctrl-names = "default", "sleep";
>> pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
>> pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>,
>> <&sdc1_rclk>;
>> 
>> I do wish we could avoid having to duplicate the "bias" in every board
>> file. Hrm, I wonder if this could be made simpler by actually putting
>> the "sleep" states in the sc7180.dtsi file (not the board file) and
>> using "bias-bus-hold" to avoid it being board specific?
>> 
>> Thus (assuming it works), the total summary would be:
>> 
>> 1. Board dts file fully defines "sdc1_clk", "sdc1_cmd", "sdc1_data",
>> "sdc1_rclk", specifying whatever bias and drive strength needed for
>> the board.
>> 
>> 2. SoC dtsi fully defines "sdc1_clk_sleep", "sdc1_cmd_sleep",
>> "sdc1_data_sleep", "sdc1_rclk_sleep", specifying drive-strength of 2
>> (for outputs) and "bias-bus-hold" which is OK for all board.
>> 
sure
>> 
>>> +
>>> +                       sdc2_on: sdc2-on {
>>> +                               clk {
>>> +                                       pins = "sdc2_clk";
>>> +                                       bias-disable;
>>> +                                       drive-strength = <16>;
>>> +                               };
>>> +
>>> +                               cmd {
>>> +                                       pins = "sdc2_cmd";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <10>;
>>> +                               };
>>> +
>>> +                               data {
>>> +                                       pins = "sdc2_data";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <10>;
>>> +                               };
>>> +
>>> +                               sd-cd {
>>> +                                       pins = "gpio91";
>> NOTE: even if we find some reason to keep some of the pinctrl in the
>> SoC dtsi file, the card detect almost certainly needs to move _fully_
>> to the board dts file. Different boards could use a different card
>> detect pin.
>> 
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>> Drive strength isn't needed for input pins. Please remove.
sure
>> 
>>> +                               };
>>> +                       };
>>> +
>>> +                       sdc2_off: sdc2-off {
>>> +                               clk {
>>> +                                       pins = "sdc2_clk";
>>> +                                       bias-disable;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               cmd {
>>> +                                       pins = "sdc2_cmd";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               data {
>>> +                                       pins = "sdc2_data";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>>> +                               };
>>> +
>>> +                               sd-cd {
>>> +                                       pins = "gpio91";
>>> +                                       bias-pull-up;
>>> +                                       drive-strength = <2>;
>>> +                               };
>> There's definitely no need for a separate sleep state for the CD line.
okay
>> 
>> 
>> -Doug
