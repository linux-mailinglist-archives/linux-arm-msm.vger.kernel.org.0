Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D9032FC7D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 19:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhCFSbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 13:31:36 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:49794 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbhCFSbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 13:31:17 -0500
Date:   Sat, 06 Mar 2021 18:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615055475;
        bh=2l/IcuhSUBBuSsU+BkqdVU1YOF1DKkwrbNb+Ng5cJxc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dZXLJqlQBqzlreIcJt49b9b9iQzx2TSAKjcNskH5ZsljU8KZQg1mR/pnbn58O4fCs
         RHUsQMsO3w3B2kF9h3eI/fNXZusPPWFPzCnzM3W0L1om6Qc0aSqUylR6J9tIbzAwHN
         rIFjVYyF+mxugijLpubM7+RIOX68Q33KmDs1fDpU=
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] arm64: dts: add support for the Pixel 2 XL
Message-ID: <16a1c897-cefc-6c4b-3031-d7fc025513f1@connolly.tech>
In-Reply-To: <2e7178e5-9c97-808e-b2ca-19ef0bb667e3@somainline.org>
References: <20210305213235.398252-1-caleb@connolly.tech> <2e7178e5-9c97-808e-b2ca-19ef0bb667e3@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On 06/03/2021 10:49 am, Konrad Dybcio wrote:
>
> On 05.03.2021 22:35, Caleb Connolly wrote:
>> Add a minimal devicetree capable of booting on the Pixel 2 XL MSM8998
>> device.
>>
>> It's currently possible to boot the device into postmarketOS with USB
>> networking, however the display panel depends on Display Stream
>> Compression which is not yet supported in the kernel.
>>
>> The bootloader also requires that the dtbo partition contains a device
>> tree overlay with a particular id which has to be overlayed onto the
>> existing dtb. It's possible to use a specially crafted dtbo partition to
>> workaround this, more information is available here:
>>
>>      https://gitlab.com/calebccff/dtbo-google-wahoo-mainline
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>> It's possible to get wifi working by running Bjorns diag-router in the
>> background, without this the wifi firmware crashes every 10 seconds or
>> so. This is the same issue encountered on the OnePlus 5.
>>
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/msm8998-google-taimen.dts   |  14 +
>>   .../boot/dts/qcom/msm8998-google-wahoo.dtsi   | 391 ++++++++++++++++++
>>   3 files changed, 406 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qco=
m/Makefile
>> index 5113fac80b7a..d942d3ec3928 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8994-msft-lumia-city=
man.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8994-sony-xperia-kitakami-sumire.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8996-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-asus-novago-tp370ql.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-google-taimen.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-hp-envy-x2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-lenovo-miix-630.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8998-mtp.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts b/arch/a=
rm64/boot/dts/qcom/msm8998-google-taimen.dts
>> new file mode 100644
>> index 000000000000..ffaaafe14037
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-google-taimen.dts
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, Caleb Connolly <caleb@connolly.tech>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "msm8998-google-wahoo.dtsi"
>> +
>> +/ {
>> +=09model =3D "Google Pixel 2 XL";
>> +=09compatible =3D "google,taimen", "google,wahoo", "qcom,msm8998", "qco=
m,msm8998-mtp";
> Drop the mtp compatible. Also, afaict wahoo is a shared platform name for=
 P2/2XL, so perhaps using the same naming scheme we used for Xperias/Lumias=
 (soc-vendor-platform-board) would clear up some confusion. In this case, I=
'm not sure about the wahoo compatible, but I reckon it's fine for it to st=
ay so that it's easier to introduce potential quirks that concern both devi=
ces.
>
Yeah, I think it's useful to have a shared compatible for similar devices.
>> +=09qcom,msm-id =3D <0x124 0x20001>;
> Move it to the common dtsi, unless the other Pixel ships with a different=
 SoC revision.
>
>
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi b/arch/a=
rm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
>> new file mode 100644
>> index 000000000000..0c221ead2df7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-google-wahoo.dtsi
>> @@ -0,0 +1,391 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (c) 2020 Caleb Connolly <caleb@connolly.tech> */
>> +
>> +#include "msm8998.dtsi"
>> +#include "pm8998.dtsi"
>> +#include "pmi8998.dtsi"
>> +#include "pm8005.dtsi"
>> +
>> +/delete-node/ &mpss_mem;
>> +/delete-node/ &venus_mem;
>> +/delete-node/ &mba_mem;
>> +/delete-node/ &slpi_mem;
>> +
>> +/ {
>> +=09aliases {
>> +=09};
>> +
>> +=09chosen {
>> +=09=09#address-cells =3D <2>;
>> +=09=09#size-cells =3D <2>;
>> +=09=09ranges;
>> +
>> +=09=09/* Add "earlycon" intended to be used in combination with UART se=
rial console */
>> +=09=09bootargs =3D "clk_ignore_unused earlycon console=3DttyGS0,115200"=
;// loglevel=3D10 drm.debug=3D15 debug";
> clk_ignore_unused is a BIG hack!
Ah, I haven't touched this device in a while, seems like we don't need=20
this anymore on 5.11
>
> You should trace which clocks are important for it to stay alive and fix =
it on the driver side.
>
> What breaks if it's not there? Does it still happen with Angelo's clk pat=
ches that got in for the 5.12
>
> window?
>
> Aside from that, //loglevel... should also go.
>
>
>> +
>> +=09vph_pwr: vph-pwr-regulator {
>> +=09=09compatible =3D "regulator-fixed";
>> +=09=09regulator-name =3D "vph_pwr";
>> +=09=09regulator-always-on;
>> +=09=09regulator-boot-on;
>> +=09};
>> +};
> Don't you need to specify voltage here?
This is based on the MTP board, which does not specify a voltage. Do you=20
know what the correct voltage is here? I can find references to=20
3300000-3500000 uv but I don't know if that's correct. It seems to be=20
derived directly from the battery / power voltage, so this seems about=20
right.
>
>> +
>> +&blsp1_uart3 {
>> +=09status =3D "disabled";
>> +
>> +=09bluetooth {
>> +=09=09compatible =3D "qcom,wcn3990-bt";
>> +
>> +=09=09vddio-supply =3D <&vreg_s4a_1p8>;
>> +=09=09vddxo-supply =3D <&vreg_l7a_1p8>;
>> +=09=09vddrf-supply =3D <&vreg_l17a_1p3>;
>> +=09=09vddch0-supply =3D <&vreg_l25a_3p3>;
>> +=09=09max-speed =3D <3200000>;
>> +=09};
>> +};
> Either enable the UART or rid the bluetooth for now.
>
>
>> +
>> +&pm8005_lsid1 {
>> +=09pm8005-regulators {
>> +=09=09compatible =3D "qcom,pm8005-regulators";
>> +
>> +=09=09vdd_s1-supply =3D <&vph_pwr>;
>> +
>> +=09=09pm8005_s1: s1 { /* VDD_GFX supply */
> regulator-name =3D "vdd_gfx";
>
>
>> +
>> +&spmi_bus {
>> +=09pmic@0 {
>> +=09=09compatible =3D "qcom,pm8994", "qcom,spmi-pmic";
>> +=09=09reg =3D <0x0 SPMI_USID>;
>> +=09=09#address-cells =3D <1>;
>> +=09=09#size-cells =3D <0>;
>> +=09=09pon@800 {
>> +=09=09=09compatible =3D "qcom,pm8916-pon";
>> +
>> +=09=09=09reg =3D <0x800>;
>> +=09=09=09mode-bootloader =3D <0x2>;
>> +=09=09=09mode-recovery =3D <0x1>;
>> +
>> +=09=09=09pwrkey {
>> +=09=09=09=09compatible =3D "qcom,pm8941-pwrkey";
>> +=09=09=09=09interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
>> +=09=09=09=09debounce =3D <15625>;
>> +=09=09=09=09bias-pull-up;
>> +=09=09=09=09linux,code =3D <KEY_POWER>;
>> +=09=09=09};
>> +=09=09};
>> +=09};
>> +};
> That's a lot of indentation, it would be better to add a label: somewhere=
 instead.. Moreover, the exact same pwrkey node is already present in pm899=
8.dtsi, so you should just drop this.

Dropped.

Thanks for the review.

Regards,

Caleb

>
> Konrad
>


