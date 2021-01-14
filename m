Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADABC2F6BDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 21:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhANUL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 15:11:29 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:12158 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbhANUL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 15:11:29 -0500
Date:   Thu, 14 Jan 2021 20:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1610655046;
        bh=ulfYdd/znJ0wKOYLZIAjghjo9MVr60+df9iJJXRe/kM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DnGX8c2zCbPMe6+bLs78s6zn6aJHd1iLkNf/ymoamcdYLzXBiGEZhxbOShdrKsGMq
         YZ3C78yAVVqzMIapilCqadKu1+2q+p9exjwYYv7xSSt8pbDHOucGYaQ8r960RXJmsx
         xqJWS9+bN35ulBL3kdv6JlDDMl/Ivn5TGKXWV/iw=
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
Subject: Re: [PATCH v3 1/2] arm64: dts: sdm845: add oneplus6/6t devices
Message-ID: <4db0807e-c33e-5913-1818-1fc055e35acb@connolly.tech>
In-Reply-To: <17d49d19-7672-520c-12d3-c6ed8c12ae47@somainline.org>
References: <20210114185227.25265-1-caleb@connolly.tech> <20210114185227.25265-2-caleb@connolly.tech> <17d49d19-7672-520c-12d3-c6ed8c12ae47@somainline.org>
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


On 14/01/2021 7:19 pm, Konrad Dybcio wrote:
> Hi!
>
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-db845c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-xiaomi-beryllium.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-enchilada.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm845-oneplus-fajita.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)=09+=3D sdm850-lenovo-yoga-c630.dtb
> Please sort.
>
>> +/ {
>> +
> Redundant newline.
>> +=09gpio-keys {
>> +=09=09compatible =3D "gpio-keys";
>> +=09=09label =3D "Volume keys";
>> +=09=09autorepeat;
>> +
>> +=09=09pinctrl-names =3D "default";
>> +=09=09pinctrl-0 =3D <&volume_down_gpio &volume_up_gpio>;
>> +
>> +=09=09vol-down {
>> +=09=09=09label =3D "Volume down";
>> +=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
>> +=09=09=09gpios =3D <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
>> +=09=09=09debounce-interval =3D <15>;
>> +=09=09};
>> +
>> +=09=09vol-up {
>> +=09=09=09label =3D "Volume up";
>> +=09=09=09linux,code =3D <KEY_VOLUMEUP>;
>> +=09=09=09gpios =3D <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
>> +=09=09=09debounce-interval =3D <15>;
>> +=09=09};
>> +=09};
> Perhaps gpio-keys could come before the fixed regulators to keep it a bit=
 more sane/sorted?
>> +&adsp_pas {
> This should come before apps_rsc alphabetically.
>> +// Prevent garbage data on bluetooth UART lines
> Please use C-style comments (/* thing */).
>> +&usb_1 {
>> +=09status =3D "okay";
>> +
>> +=09/*
>> +=09 * disable USB3 clock requirement as the device only supports
>> +=09 * USB2.
>> +=09 */
>> +=09qcom,select-utmi-as-pipe-clk;
>> +};
>> +
>> +&usb_1_dwc3 {
>> +=09/*
>> +=09 * We don't have the capability to switch modes yet.
>> +=09 */
>> +=09dr_mode =3D "peripheral";
>> +
>> +=09/* fastest mode for USB 2 */
>> +=09maximum-speed =3D "high-speed";
>> +
>> +=09/* Remove USB3 phy as it's unused on this device. */
>> +=09phys =3D <&usb_1_hsphy>;
>> +=09phy-names =3D "usb2-phy";
>> +};
> Are you sure you can't get USB3 in host mode? Perhaps it's not worth disc=
arding it upfront, as some boards can do that, definitely do check!
The device definitely doesn't support USB3, although downstream does=20
leave the USB3 phy enabled the hardware doesn't support it. So it made=20
sense to disable it here.
>> \ No newline at end of file
> Please add a newline.
>
>
> The DTS files look correct, but don't you need at least one of msm-id, bo=
ard-id, pmic-id? I'm not exactly sure what OnePlus does, but I can imagine =
they would require such properties..

OnePlus' bootloader doesn't seem to care about these values so I left=20
them out for simplicity.

Cheers,

Caleb

>
> Konrad
>

