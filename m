Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6694D31A3EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 18:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhBLRmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 12:42:47 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:39543 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhBLRmi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 12:42:38 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 47FAD3ED71;
        Fri, 12 Feb 2021 18:41:39 +0100 (CET)
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
References: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org>
 <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
 <CAMi1Hd3d8krtQHv-3LuiCcgCWSgL1L0UeSYWJp27KToyW338gw@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b8618ac4-85aa-5f7f-8550-07f7eec6cc08@somainline.org>
Date:   Fri, 12 Feb 2021 18:41:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd3d8krtQHv-3LuiCcgCWSgL1L0UeSYWJp27KToyW338gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 12/02/21 10:24, Amit Pundir ha scritto:
> Hi,
> 
> On Thu, 11 Feb 2021 at 00:25, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>> Il 10/02/21 09:18, Amit Pundir ha scritto:
>>> From: Sumit Semwal <sumit.semwal@linaro.org>
>>>
>>> Enabling the Display panel for beryllium requires DSI
>>> labibb regulators and panel dts nodes to be added.
>>> It is also required to keep some of the regulators as
>>> always-on.
>>>
>>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>>> ---
>>
>> Hello!
>> Your patch looks good, however, I have a few concerns...
>>
>>> v3: Addressed Konrad's concerns. Configured labibb regulators
>>>       explicitly based on downstream microvolt values. Display
>>>       comes up fine with default discharge-resistor-kohms and
>>>       soft-start-us properties, so didn't touch them.
>>>       Smoke tested on next-20210209.
>>> v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.
>>>
>>>    .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 64 ++++++++++++++++++++++
>>>    1 file changed, 64 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
>>> index 86cbae63eaf7..5ac049a247e1 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
>>> @@ -157,6 +157,14 @@
>>>                        regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>                };
>>>
>>> +             vreg_l14a_1p8: ldo14 {
>>> +                     regulator-min-microvolt = <1800000>;
>>> +                     regulator-max-microvolt = <1800000>;
>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +                     regulator-boot-on;
>>> +                     regulator-always-on;
>>> +             };
>>> +
>>>                vreg_l17a_1p3: ldo17 {
>>>                        regulator-min-microvolt = <1304000>;
>>>                        regulator-max-microvolt = <1304000>;
>>> @@ -191,6 +199,7 @@
>>>                        regulator-min-microvolt = <1200000>;
>>>                        regulator-max-microvolt = <1200000>;
>>>                        regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +                     regulator-boot-on;
>>>                };
>>>        };
>>>    };
>>> @@ -200,6 +209,43 @@
>>>        firmware-name = "qcom/sdm845/cdsp.mdt";
>>>    };
>>>
>>> +&dsi0 {
>>> +     status = "okay";
>>> +     vdda-supply = <&vreg_l26a_1p2>;
>>> +
>>> +     #address-cells = <1>;
>>> +     #size-cells = <0>;
>>> +
>>> +     panel@0 {
>>> +             compatible = "tianma,fhd-video";
>>> +             reg = <0>;
>>> +             vddi0-supply = <&vreg_l14a_1p8>;
>>> +             vddpos-supply = <&lab>;
>>> +             vddneg-supply = <&ibb>;
>>> +
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +
>>> +             reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>>> +
>>> +             port {
>>> +                     tianma_nt36672a_in_0: endpoint {
>>> +                             remote-endpoint = <&dsi0_out>;
>>> +                     };
>>> +             };
>>> +     };
>>> +};
>>> +
>>> +&dsi0_out {
>>> +     remote-endpoint = <&tianma_nt36672a_in_0>;
>>> +     data-lanes = <0 1 2 3>;
>>> +};
>>> +
>>> +&dsi0_phy {
>>> +     status = "okay";
>>> +     vdds-supply = <&vreg_l1a_0p875>;
>>> +};
>>> +
>>>    &gcc {
>>>        protected-clocks = <GCC_QSPI_CORE_CLK>,
>>>                           <GCC_QSPI_CORE_CLK_SRC>,
>>> @@ -215,6 +261,24 @@
>>>        };
>>>    };
>>>
>>> +&ibb {
>>> +     regulator-min-microvolt = <4600000>;
>>> +     regulator-max-microvolt = <6000000>;
>>> +};
>>> +
>>
>> I think you want to also configure overvoltage and overcurrent
>> protection values for both LAB and IBB, as these regulators may be a bit
>> dangerous if used without.
> 
> Can you point me to the relevant DT properties please. I didn't find
> any DT properties which set the over voltage/current protection
> properties explicitly in upstream as well as in downstream kernel.
> Plus I also do not see "regulator-min/max-microamp" values set
> downstream, otherwise I'd have used that as well atleast.
> 

The regulator-{min/max}-microamp is the equivalent of the downstream
"qcom,qpnp-lab-limit-maximum-current" and 
"qcom,qpnp-ibb-limit-maximum-current.

I am sorry if we haven't sent our patch series that will introduce the
Sony MSM8998 Yoshino and SDM630/636 Nile and Ganges platforms, which
are actually using the driver that I've sent fully, as these would have
been a nice reference for you.

In any case, I can point you at our public repositories and their
downstream equivalents...

Here you find the downstream configuration for LAB/IBB:
https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.7.1.r1/arch/arm64/boot/dts/qcom/msm8998-yoshino-common.dtsi#L3158

...And here you find the SoMainline upstream stuff for the same:
https://github.com/SoMainline/linux/blob/SoMainline/v5.11-rc4/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi#L332

https://github.com/SoMainline/linux/blob/SoMainline/v5.11-rc4/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts#L50

I hope that clears out your doubts and difficulties about implementing
the protections on labibb.

Yours,
-- Angelo

> Regards,
> Amit Pundir
> 
>> Besides that, even if it wouldn't be that dangerous, since the
>> protection features are present, it would be nice to configure them
>> properly as in the rare event that something bad happens, you would be
>> able to save the hardware (or at least have a chance to!).
>>
>>> +&lab {
>>> +     regulator-min-microvolt = <4600000>;
>>> +     regulator-max-microvolt = <6000000>;
>>> +};
>>> +
>>
>> Same here.
>>
>> Yours,
>> -- Angelo
>>
>>> +&mdss {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&mdss_mdp {
>>> +     status = "okay";
>>> +};
>>> +
>>>    &mss_pil {
>>>        status = "okay";
>>>        firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
>>>
>>

