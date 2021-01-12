Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB6C2F3377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 16:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732693AbhALO7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 09:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbhALO7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 09:59:41 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C35AC061575;
        Tue, 12 Jan 2021 06:59:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o17so3817013lfg.4;
        Tue, 12 Jan 2021 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A+S9SR1UiAMJcykGGWw+EuDqjBvD6gWtwewF85tPhZ0=;
        b=PYaLcVRKniBLz/5IOBDRe7Svt9PKdtHT8j++jvrKTiPTVoMs+cyOBRMDfX4Cr9ghMp
         Jte9UTubJ7CC/hRLxaAwBH6xQsGSXXh0MqQ3Req6rN9hpcxvA5xP17bwSryY9K+jE2mQ
         DzY6yQlRfuJgtobVmXWj7tOsAjI9wZWZT+dTNk3VuPDjPCkbMrdaxtCjJFk/LVsKRDW1
         B6bgZFwgHNk2i8ztyOEM/PkpG3UEtgGeEkqWxV37klIWH/l190U6MKx4kurn1BK2pHFw
         UaDlkoMA/QuF8Zrk02ec40/4vAqTiaUpfyEKZSFVK68xC6GSKfKo5v0awcU4i2oL9iHV
         2fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A+S9SR1UiAMJcykGGWw+EuDqjBvD6gWtwewF85tPhZ0=;
        b=XOjblR4MW/CaP1XiXaL8YzeON8yAkSVkhaMkAO+d1cPZUVrEWYluh72vsdfNJdx2ZH
         OhisK/tRCCTxWeZueGsu+rtooVIfCRNuyrhb//AzP56ORu978xOeffc3tHSWPNSmpqe1
         moZEDaOSS/C3KcPl8F1YR83R8yql+Lw7Cv8SMFTF5oqSVAeJmTdfj4EMQiTm55CgbaOO
         SajDZjS2Kp0fc0U2FzM2dWOQxxxY/DzmDEOczoKOwJtF0BsGaazZzdi8PojwTsqjkLTj
         3s3WI6AZaIMNyFf/8pvYMzz5XotxVp3vkQbRWxS0R0/MOO+MP49LuP7+yYPJqV69uSPK
         +3Bw==
X-Gm-Message-State: AOAM533F2cY4rDo6OCk2c+GtZ3OE6xbm4eG02X0XCeybRwcYS4abPjK0
        B+KFkvpfO8WyE0UEhfXJOP5jRj8r4XqzPLm1oY2BEPhssHwZ3g==
X-Google-Smtp-Source: ABdhPJyJlZ0sG2KzLq+bGutLMwC+6IY4fuutYzt3KgBZNOs/7hv9jHTZ4RQ22fyAgIDXjhmDDz4chmeon+NKaPSvKRs=
X-Received: by 2002:ac2:5450:: with SMTP id d16mr2405138lfn.309.1610463539810;
 Tue, 12 Jan 2021 06:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20210112013127.414277-1-danny@kdrag0n.dev>
In-Reply-To: <20210112013127.414277-1-danny@kdrag0n.dev>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Tue, 12 Jan 2021 17:59:47 +0300
Message-ID: <CANi4RBQCpWiyVLyBcevGcmRr=toPxVF2TrxFmM3vHHnYgaQVHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm660: Fix CPU capacities
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexey Minekhanov <alexeymin@postmarketos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!
I always had a feeling something is not right in those cpu
definitions, so cpus with reg 100-103 are little cores, and 0-3 big
ones?
But downstream sdm660.dtsi has a property "efficiency" [1] with values
which are larger for cores 100-103 than for 0-3 cores (1638 > 1024),
I'm confused...

Property "efficiency" is described in the same tree in [2].

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot=
/dts/qcom/sdm660.dtsi?h=3DLA.UM.7.2.c25#n155
[2] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation=
/devicetree/bindings/arm/cpus.txt?h=3DLA.UM.7.2.c25#n216

=D0=B2=D1=82, 12 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3. =D0=B2 13:51, Danny Lin <=
danny@kdrag0n.dev>:
>
> sdm660 has a big.LITTLE 4+4 CPU setup with CPUs 0-3 being little cores
> and CPUs 4-7 being big cores. The big cores have higher IPC, so they
> should have the higher capacity-dmips-mhz, not the other way around as
> the device tree currently describes it. Fix the incorrect CPU map to
> improve EAS scheduling behavior.
>
> While we're at it, let's replace the old DMIPS/MHz values with new
> measurements that reflect the exact IPC of the CPUs as reported by
> CoreMark.
>
> Performance measurements were made using my freqbench [1]
> benchmark coordinator, which isolates, offlines, and disables the timer
> tick on test CPUs to maximize accuracy. It uses EEMBC CoreMark [2] as
> the workload and measures power usage using the PM660 PMIC's fuel
> gauge.
>
> Normalized DMIPS/MHz capacity scale values for each CPU were calculated
> from CoreMarks/MHz (CoreMark iterations per second per MHz), which
> serves the same purpose. For each CPU, the final capacity-dmips-mhz
> value is the C/MHz value of its maximum frequency normalized to
> SCHED_CAPACITY_SCALE (1024) for the fastest CPU in the system.
>
> A Xiaomi Redmi Note 7 device running a downstream Qualcomm 4.4 kernel
> was used for benchmarking to ensure proper frequency scaling and other
> low-level controls.
>
> Raw benchmark results can be found in the freqbench repository [3].
> Below is a human-readable summary:
>
> Frequency domains: cpu1 cpu4
> Offline CPUs: cpu1 cpu2 cpu3 cpu4 cpu5 cpu6 cpu7
> Baseline power usage: 1130 mW
>
> =3D=3D=3D=3D=3D CPU 1 =3D=3D=3D=3D=3D
> Frequencies: 633 902 1113 1401 1536 1747 1843
>
>  633:  2058     3.2 C/MHz     48 mW    5.9 J   42.6 I/mJ   121.5 s
>  902:  2930     3.2 C/MHz     72 mW    6.2 J   40.6 I/mJ    85.3 s
> 1113:  3616     3.2 C/MHz     79 mW    5.4 J   46.0 I/mJ    69.1 s
> 1401:  4551     3.2 C/MHz    125 mW    6.9 J   36.3 I/mJ    54.9 s
> 1536:  4988     3.2 C/MHz    134 mW    6.7 J   37.1 I/mJ    50.1 s
> 1747:  5674     3.2 C/MHz    179 mW    7.9 J   31.7 I/mJ    44.1 s
> 1843:  5986     3.2 C/MHz    228 mW    9.5 J   26.3 I/mJ    41.8 s
>
> =3D=3D=3D=3D=3D CPU 4 =3D=3D=3D=3D=3D
> Frequencies: 1113 1401 1747 1958 2150 2208
>
> 1113:  5825     5.2 C/MHz    220 mW    9.4 J   26.5 I/mJ    42.9 s
> 1401:  7324     5.2 C/MHz    317 mW   10.8 J   23.1 I/mJ    34.1 s
> 1747:  9135     5.2 C/MHz    474 mW   13.0 J   19.2 I/mJ    27.4 s
> 1958: 10247     5.2 C/MHz    578 mW   14.1 J   17.7 I/mJ    24.4 s
> 2150: 11246     5.2 C/MHz    694 mW   15.4 J   16.2 I/mJ    22.2 s
> 2208: 11551     5.2 C/MHz    736 mW   15.9 J   15.7 I/mJ    21.7 s
>
> [1] https://github.com/kdrag0n/freqbench
> [2] https://www.eembc.org/coremark/
> [3] https://github.com/kdrag0n/freqbench/tree/master/results/sdm660/main
>
> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/q=
com/sdm660.dtsi
> index 4abbdd03d1e7..ca985c5429db 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -40,7 +40,7 @@ CPU0: cpu@100 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x100>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <1024>;
> +                       capacity-dmips-mhz =3D <636>;
>                         next-level-cache =3D <&L2_1>;
>                         L2_1: l2-cache {
>                                 compatible =3D "cache";
> @@ -59,7 +59,7 @@ CPU1: cpu@101 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x101>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <1024>;
> +                       capacity-dmips-mhz =3D <636>;
>                         next-level-cache =3D <&L2_1>;
>                         L1_I_101: l1-icache {
>                                 compatible =3D "cache";
> @@ -74,7 +74,7 @@ CPU2: cpu@102 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x102>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <1024>;
> +                       capacity-dmips-mhz =3D <636>;
>                         next-level-cache =3D <&L2_1>;
>                         L1_I_102: l1-icache {
>                                 compatible =3D "cache";
> @@ -89,7 +89,7 @@ CPU3: cpu@103 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x103>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <1024>;
> +                       capacity-dmips-mhz =3D <636>;
>                         next-level-cache =3D <&L2_1>;
>                         L1_I_103: l1-icache {
>                                 compatible =3D "cache";
> @@ -104,7 +104,7 @@ CPU4: cpu@0 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x0>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <640>;
> +                       capacity-dmips-mhz =3D <1024>;
>                         next-level-cache =3D <&L2_0>;
>                         L2_0: l2-cache {
>                                 compatible =3D "cache";
> @@ -123,7 +123,7 @@ CPU5: cpu@1 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x1>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <640>;
> +                       capacity-dmips-mhz =3D <1024>;
>                         next-level-cache =3D <&L2_0>;
>                         L1_I_1: l1-icache {
>                                 compatible =3D "cache";
> @@ -138,7 +138,7 @@ CPU6: cpu@2 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x2>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <640>;
> +                       capacity-dmips-mhz =3D <1024>;
>                         next-level-cache =3D <&L2_0>;
>                         L1_I_2: l1-icache {
>                                 compatible =3D "cache";
> @@ -153,7 +153,7 @@ CPU7: cpu@3 {
>                         compatible =3D "qcom,kryo260";
>                         reg =3D <0x0 0x3>;
>                         enable-method =3D "psci";
> -                       capacity-dmips-mhz =3D <640>;
> +                       capacity-dmips-mhz =3D <1024>;
>                         next-level-cache =3D <&L2_0>;
>                         L1_I_3: l1-icache {
>                                 compatible =3D "cache";
> --
> 2.29.2
>
