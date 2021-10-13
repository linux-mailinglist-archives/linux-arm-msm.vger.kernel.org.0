Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB6A42C64F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 18:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhJMQ1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 12:27:46 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:57617 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhJMQ1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 12:27:46 -0400
Date:   Wed, 13 Oct 2021 16:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1634142340;
        bh=vnZvf739HKzpLgZYiGExCIHF155ARwhshzwdwIziQqs=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=IcFqdAglvcrEPsynVkP5fv+K5EW1i7dyfxsiugIRid9DChh7wDgBiwR6/eb4owQ1B
         HV3wmA6T/zs2L7yShdojcFbIS8VsVY37VybjLv3hIVwUIZo5L3nIHKt+BuXqye0Zhx
         bIivorXdqFNlTjk1fajCMqNY8tjoCA56ygiatBgQ=
To:     Maulik Shah <mkshah@codeaurora.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>, swboyd@chromium.org,
        mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Stephan Gerhold <stephan@gerhold.net>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v12 0/5] Introduce SoC sleep stats driver
Message-ID: <20211013162356.7106-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 12:08:19 +0530, Maulik Shah wrote:
> Changes in v12:
> - Address Stephan's comments from v11
> - Rename driver and compatible to qcom,rpm(h)-stats
> - Skip reading SMEM for RPM targets
> - Make driver register in late_init to avoid -EPROBE_DEFER from smem.
> - Change size to 0x10000 for RPM targets since area contains many others =
stats.
>=20
> Changes in v11:
> - Address Bjorn's comments from v10
> - Add a case for RPM based targets dynamic offset in driver
> - Update commit messages to use qcom sleep stats instead of soc sleep sta=
ts
> - Drop individual target dtsi changes for sc7180 and sc7280
> - Add single change to enable sleep stats for RPMh based targets
> - Add single change to enable sleep stats for RPM based targets
>=20
> Changes in v10:
> - Updated device node name to use memory instead of aop_msgram
> - Remove Lina's email from maintainers=20
> - Rename driver to qcom_sleep_stats. Update makefile, Kconfig accordingly
> - Address Bjorn's comments from v9
>=20
> Changes in v9:
> - Remove soft dependency on smem module
> - Return -EIO to userspace in case of error
> - Make struct sleep_stats *stat a const pointer
> - Remove the driver from soc_sleep_stats_driver name
> - Remove offset address and directly mention the msgram address in dtsi
> - Use devm_platform_get_and_ioremap_resource() to ioremap dtsi address
> - Update device node name to mention aop_msgram instead rpmh-sleep-stats
> - Update dtsi and documentation accordingly but retain the reviews
>=20
> Changes in v8:
> - Addressed bjorn's comments in driver from v7
> - Update aoss_qmp device node reg size for sc7280
>=20
> Changes in v7:
> - Fix example in bindings documentation as per #address/size-cells =3D <1=
>.
> - Add comment in driver from where 'ddr' subsystems name is read.
> - Update comment in driver to s/beside/besides and others from v6.
> - Rename debugfs_create_entries() from v6.
> - Drop use of memcpy_fromio() to find the name.
> - Use sizeof(*prv_data) in devm_kzalloc().
> - Add change to define readq() if its not yet defined for compile support=
.
> - Add wpss subsystem in the list of subsystems.
> - Add module soft dependency on smem module.
> - Add new change to add device node for sc7280.
>=20
> Changes in v6:
> - Address stephen's comments from v5 which includes below
> - Pad 0 in documentation example to make address 8 digit
> - define macro to calculate offset in driver
> - Add appended_stats_avail to prv_data instead of using entire stats_conf=
ig
> - make array subsystems[] as const
> - Add comment for SSR case
> - Use memcpy_fromio() and devm_kcalloc() during probe
> - Change file permission mode from 444 to 400=20
>=20
> - Address guenter's comments to add depends on QCOM_SMEM
>=20
> - Add adsp_island and cdsp_island subsystems
> - Use strim() to remove whitespace in stat name
>=20
> Changes in v5:
> - Remove underscore from node name in Documentation and DTSI change
> - Remove global config from driver change
>=20
> Changes in v4:
> - Address bjorn's comments from v3 on change 2.
> - Add bjorn's Reviewed-by on change 3 and 4.
>=20
> Changes in v3:
> - Address stephen's comments from v2 in change 1 and 2.
> - Address bjorn's comments from v2 in change 3 and 4.
> - Add Rob and bjorn's Reviewed-by on YAML change.
>=20
> Changes in v2:
> - Convert Documentation to YAML.
> - Address stephen's comments from v1.
> - Use debugfs instead of sysfs.
> - Add sc7180 dts changes for sleep stats
> - Add defconfig changes to enable driver
> - Include subsystem stats from [1] in this single stats driver.
> - Address stephen's comments from [1]
> - Update cover letter inline to mention [1]
>=20
> Qualcomm Technologies, Inc. (QTI)'s chipsets support SoC level low power
> modes. SoCs Always On Processor/Resource Power Manager produces statistic=
s
> of the SoC sleep modes involving lowering or powering down of the rails a=
nd
> the oscillator clock.
>=20
> Additionally multiple subsystems present on SoC like modem, spss, adsp,
> cdsp maintains their low power mode statistics in shared memory (SMEM).
>=20
> Statistics includes SoC sleep mode type, number of times LPM entered, tim=
e
> of last entry, exit, and accumulated sleep duration in seconds.
>=20
> This series adds a driver to read the stats and export to debugfs.
>=20
> [1] https://lore.kernel.org/patchwork/patch/1149381/
>=20
> Mahesh Sivasubramanian (2):
>   dt-bindings: Introduce QCOM Sleep stats bindings
>   soc: qcom: Add Sleep stats driver
>=20
> Maulik Shah (3):
>   arm64: defconfig: Enable Sleep stats driver
>   arm64: dts: qcom: Enable RPMh Sleep stats
>   arm64: dts: qcom: Enable RPM Sleep stats
>=20
>  .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  47 ++++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              |   5 +
>  arch/arm64/boot/dts/qcom/msm8998.dtsi              |   5 +
>  arch/arm64/boot/dts/qcom/qcs404.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   7 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   7 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               |   7 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               |   7 +-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               |   7 +-
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/soc/qcom/Kconfig                           |  10 +
>  drivers/soc/qcom/Makefile                          |   1 +
>  drivers/soc/qcom/qcom_stats.c                      | 277 +++++++++++++++=
++++++
>  15 files changed, 391 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-stats=
.yaml
>  create mode 100644 drivers/soc/qcom/qcom_stats.c
>=20
> --=20

On msm8996-xiaomi-scorpio:

# cat /sys/kernel/debug/qcom_stats/*
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x0
Count: 0
Last Entered At: 0
Last Exited At: 0
Accumulated Duration: 0
Client Votes: 0x0

Also, the warnings from v11 are no longer showing up.

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

