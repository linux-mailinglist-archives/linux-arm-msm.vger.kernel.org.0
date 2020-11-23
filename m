Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD132BFF55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 06:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgKWFQb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 00:16:31 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:12801 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWFQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 00:16:31 -0500
Date:   Mon, 23 Nov 2020 05:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1606108588;
        bh=zwjY45w135FchEXy16tCPE5ojoc2C0C5VAy+SVMkTnw=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Hp2khR/atczvRCPH0NQUbB6WiM4e7jDQnJmvLE1xXQrVOgReqMk1EL3KxcdvDacvO
         CQc8Ntkf79E81ceChiCzEXL3X9sVuV1Ka9cxt+uBq26PSW0qaCfzkwLm+pJlmZsWNB
         vkDvokzygrNNWEde9RqDaGEbTlDBoinQI5SvXUmk=
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add iommus property to qup
Message-ID: <3ba39a64-122b-ebe9-04b3-3a23478334a4@connolly.tech>
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

On 2020-11-22 03:41, Bjorn Andersson wrote:
> From: Stephen Boyd <swboyd@chromium.org>
>
> The SMMU that sits in front of the QUP needs to be programmed properly
> so that the i2c geni driver can allocate DMA descriptors. Failure to do
> this leads to faults when using devices such as an i2c touchscreen where
> the transaction is larger than 32 bytes and we use a DMA buffer.
>
> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFS=
YNR1 0x000006c0, GFSYNR2 0x00000000
>
> Add the right SID and mask so this works.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> [bjorn: Define for second QUP as well, be more specific in sdm845.dtsi]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>   arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot=
/dts/qcom/sdm845-cheza.dtsi
> index 39f23cdcbd02..216a74f0057c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -653,10 +653,12 @@ &pm8998_pwrkey {
>  =20
>   &qupv3_id_0 {
>   =09status =3D "okay";
> +=09iommus =3D <&apps_smmu 0x0 0x3>;
>   };
>  =20
>   &qupv3_id_1 {
>   =09status =3D "okay";
> +=09iommus =3D <&apps_smmu 0x6c0 0x3>;
>   };
>  =20
>   &sdhc_2 {
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 6465a6653ad9..d6b7b1bfa202 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1120,6 +1120,7 @@ qupv3_id_0: geniqup@8c0000 {
>   =09=09=09clock-names =3D "m-ahb", "s-ahb";
>   =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>   =09=09=09=09 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +=09=09=09iommus =3D <&apps_smmu 0x3 0x0>;
>   =09=09=09#address-cells =3D <2>;
>   =09=09=09#size-cells =3D <2>;
>   =09=09=09ranges;
> @@ -1460,6 +1461,7 @@ qupv3_id_1: geniqup@ac0000 {
>   =09=09=09clock-names =3D "m-ahb", "s-ahb";
>   =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>   =09=09=09=09 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +=09=09=09iommus =3D <&apps_smmu 0x6c3 0x0>;
>   =09=09=09#address-cells =3D <2>;
>   =09=09=09#size-cells =3D <2>;
>   =09=09=09ranges;

Tested-By: Caleb Connolly <caleb@connolly.tech>

Works on the OnePlus 6.


