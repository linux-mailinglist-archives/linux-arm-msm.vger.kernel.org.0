Return-Path: <linux-arm-msm+bounces-1182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58B7F1691
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38AC4B21891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9BD15E9D;
	Mon, 20 Nov 2023 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWLKJ9PR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC05BA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 06:58:23 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dae7cc31151so4065211276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700492303; x=1701097103; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8+wd4QKLZbQgoejuATdhtqqFo6wKaCpRdP9UyoZGxKQ=;
        b=rWLKJ9PRnrE+D5neCiFKNP1gEbhdIaPTGN53+lnnglRPB6MjjkiT567zjRtrf8QsQs
         O0yqWn/NlM5gezowJ3oMexcA1lo2o/4t64kSrvxQjr1cBp6jVClAQbl3jW0I42ytN151
         oYCIdHI0aLsBzmmv7yN2t6hLMJsusuVzgeIwmAAlzC0K8e3dePbMv2AJ01Cze/OZ9ORn
         ByAtGinl4ncMnKHihJY33iADKN4SEjexR23VaZhv5LqAnZ114D5hvDyZSWH0APw2gO4J
         3W0LR1cH9IhOWohseA7dYakd6lc6N6PxtaoTBCcd0q16+LbRipRRXgRt3VUuI2j6skyp
         O7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492303; x=1701097103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+wd4QKLZbQgoejuATdhtqqFo6wKaCpRdP9UyoZGxKQ=;
        b=n7/SaOlnFlVUp0XhpKYlzl0AWdZii9R5LGswH+V8Qa5I9YYBagai7m2uatM3r1KZNK
         VSTQO0qPlXfcLXMtEuJMCI4aLN68HWiHFZUKbe+pfq8+4vHziKaDaiKRrLD9MMK78wVD
         6MlFeWLuINXJGJw2psbJ9YLRcGa+Yd1AC/j7+56/+c+lfBHe0bcq5YICxevhxLoBgHpT
         QZjdpxaruYwvD6+zoX2s6nGD6TBKbKxx8ArqGS+EwJhv8Sh4g41vsdgWVXs70UglYd3l
         vDTLr0cJDYLWeivB7hCptELxZ4FVt30qPVVxVKTW+IIPwF5CshJ7+6MZbPufQeghPKza
         6cQA==
X-Gm-Message-State: AOJu0YxxrUQzMteL9QoVQIB01z1dV0A1yGYRynmlu+G/VsK8wPXgvnvy
	jcamdOPkFVXpvffOTwq9GsmgMJ63REHuyc+/Bnc/WQ==
X-Google-Smtp-Source: AGHT+IH8eSQaPtNomVl38E+2kG/SQ0nflThtWW3lMZF19Wfqil9HrEhsXJoDXQGMVM+LxCrm/WLKupJoJAQ6spK4Dqg=
X-Received: by 2002:a25:dc01:0:b0:da0:c5eb:a6c6 with SMTP id
 y1-20020a25dc01000000b00da0c5eba6c6mr6388057ybe.32.1700492302820; Mon, 20 Nov
 2023 06:58:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120134754.9526-1-quic_kbajaj@quicinc.com> <20231120134754.9526-4-quic_kbajaj@quicinc.com>
In-Reply-To: <20231120134754.9526-4-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Nov 2023 16:58:11 +0200
Message-ID: <CAA8EJpoR_C2PC7Juo2oXijuPrWgVXqeVffKwpWLqJD4a1Ay-NQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naina Mehta <quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Nov 2023 at 15:48, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Add DTS for Qualcomm qcs6490-rb3gen2 board which uses
> QCS6490 SoC. This adds debug uart and usb support along
> with regulators found on this board.
>
> Co-developed-by: Naina Mehta <quic_nainmeht@quicinc.com>
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 410 +++++++++++++++++++
>  2 files changed, 411 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 77babebe4904..4c0f9e4a2e5b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_QCOM)       += qcm6490-fairphone-fp5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcm6490-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qdu1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qrb2210-rb1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qrb4210-rb2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> new file mode 100644
> index 000000000000..f023dcf768f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +/* PM7250B is configured to use SID8/9 */
> +#define PM7250B_SID 8
> +#define PM7250B_SID1 9
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sc7280.dtsi"
> +#include "pm7250b.dtsi"
> +#include "pm7325.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pmk8350.dtsi"
> +
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &remoteproc_mpss;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &video_mem;
> +/delete-node/ &wlan_ce_mem;
> +/delete-node/ &xbl_mem;
> +
> +/ {
> +       model = "Qualcomm Technologies, Inc. Robotics RB3gen2";
> +       compatible = "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
> +       chassis-type = "embedded";
> +
> +       aliases {
> +               serial0 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };

The board definitely has some fixed-voltage regulators. At least the
vph-pwr. Please describe them here.

> +
> +       reserved-memory {
> +               xbl_mem: xbl@80700000 {
> +                       reg = <0x0 0x80700000 0x0 0x100000>;
> +                       no-map;
> +               };
> +
> +               cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
> +                       reg = <0x0 0x81800000 0x0 0x1e00000>;
> +                       no-map;
> +               };
> +
> +               camera_mem: camera@84300000 {
> +                       reg = <0x0 0x84300000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               wpss_mem: wpss@84800000 {
> +                       reg = <0x0 0x84800000 0x0 0x1900000>;
> +                       no-map;
> +               };
> +
> +               adsp_mem: adsp@86100000 {
> +                       reg = <0x0 0x86100000 0x0 0x2800000>;
> +                       no-map;
> +               };
> +
> +               cdsp_mem: cdsp@88900000 {
> +                       reg = <0x0 0x88900000 0x0 0x1e00000>;
> +                       no-map;
> +               };
> +
> +               video_mem: video@8a700000 {
> +                       reg = <0x0 0x8a700000 0x0 0x700000>;
> +                       no-map;
> +               };
> +
> +               cvp_mem: cvp@8ae00000 {
> +                       reg = <0x0 0x8ae00000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               ipa_fw_mem: ipa-fw@8b300000 {
> +                       reg = <0x0 0x8b300000 0x0 0x10000>;
> +                       no-map;
> +               };
> +
> +               ipa_gsi_mem: ipa-gsi@8b310000 {
> +                       reg = <0x0 0x8b310000 0x0 0xa000>;
> +                       no-map;
> +               };
> +
> +               gpu_microcode_mem: gpu-microcode@8b31a000 {
> +                       reg = <0x0 0x8b31a000 0x0 0x2000>;
> +                       no-map;
> +               };
> +
> +               tz_stat_mem: tz-stat@c0000000 {
> +                       reg = <0x0 0xc0000000 0x0 0x100000>;
> +                       no-map;
> +               };
> +
> +               tags_mem: tags@c0100000 {
> +                       reg = <0x0 0xc0100000 0x0 0x1200000>;
> +                       no-map;
> +               };
> +
> +               qtee_mem: qtee@c1300000 {
> +                       reg = <0x0 0xc1300000 0x0 0x500000>;
> +                       no-map;
> +               };
> +
> +               trusted_apps_mem: trusted_apps@c1800000 {
> +                       reg = <0x0 0xc1800000 0x0 0x1c00000>;
> +                       no-map;
> +               };
> +
> +               debug_vm_mem: debug-vm@d0600000 {
> +                       reg = <0x0 0xd0600000 0x0 0x100000>;
> +                       no-map;
> +               };
> +       };
> +};
> +
> +&apps_rsc {
> +       regulators-0 {
> +               compatible = "qcom,pm7325-rpmh-regulators";
> +               qcom,pmic-id = "b";

No supplies for any of the regulators? That's a pity.

> +
> +               vreg_s1b_1p872: smps1 {
> +                       regulator-min-microvolt = <1840000>;
> +                       regulator-max-microvolt = <2040000>;
> +               };
> +
> +               vreg_s2b_0p876: smps2 {
> +                       regulator-min-microvolt = <570070>;
> +                       regulator-max-microvolt = <1050000>;
> +               };
> +
> +               vreg_s7b_0p972: smps7 {
> +                       regulator-min-microvolt = <535000>;
> +                       regulator-max-microvolt = <1120000>;
> +               };
> +
> +               vreg_s8b_1p272: smps8 {
> +                       regulator-min-microvolt = <1200000>;
> +                       regulator-max-microvolt = <1500000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
> +               };
> +
> +               vreg_l1b_0p912: ldo1 {
> +                       regulator-min-microvolt = <825000>;
> +                       regulator-max-microvolt = <925000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2b_3p072: ldo2 {
> +                       regulator-min-microvolt = <2700000>;
> +                       regulator-max-microvolt = <3544000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3b_0p504: ldo3 {
> +                       regulator-min-microvolt = <312000>;
> +                       regulator-max-microvolt = <910000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l4b_0p752: ldo4 {
> +                       regulator-min-microvolt = <752000>;
> +                       regulator-max-microvolt = <820000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               reg_l5b_0p752: ldo5 {
> +                       regulator-min-microvolt = <552000>;
> +                       regulator-max-microvolt = <832000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l6b_1p2: ldo6 {
> +                       regulator-min-microvolt = <1140000>;
> +                       regulator-max-microvolt = <1260000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l7b_2p952: ldo7 {

Voltage ranges must be added here.

> +                       regulator-allow-set-load;
> +                       regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l8b_0p904: ldo8 {
> +                       regulator-min-microvolt = <870000>;
> +                       regulator-max-microvolt = <970000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l9b_1p2: ldo9 {

Voltage ranges must be added here.


> +                       regulator-allow-set-load;
> +                       regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l11b_1p504: ldo11 {
> +                       regulator-min-microvolt = <1504000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l12b_0p751: ldo12 {
> +                       regulator-min-microvolt = <751000>;
> +                       regulator-max-microvolt = <824000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l13b_0p53: ldo13 {
> +                       regulator-min-microvolt = <530000>;
> +                       regulator-max-microvolt = <824000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l14b_1p08: ldo14 {
> +                       regulator-min-microvolt = <1080000>;
> +                       regulator-max-microvolt = <1304000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l15b_0p765: ldo15 {
> +                       regulator-min-microvolt = <765000>;
> +                       regulator-max-microvolt = <1020000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l16b_1p1: ldo16 {
> +                       regulator-min-microvolt = <1100000>;
> +                       regulator-max-microvolt = <1300000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l17b_1p7: ldo17 {
> +                       regulator-min-microvolt = <1700000>;
> +                       regulator-max-microvolt = <1900000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l18b_1p8: ldo18 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l19b_1p8: ldo19 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +       };
> +
> +       regulators-1 {
> +               compatible = "qcom,pm8350c-rpmh-regulators";
> +               qcom,pmic-id = "c";
> +
> +               vreg_s1c_2p19: smps1 {
> +                       regulator-min-microvolt = <2190000>;
> +                       regulator-max-microvolt = <2210000>;
> +               };
> +
> +               vreg_s2c_0p752: smps2 {
> +                       regulator-min-microvolt = <750000>;
> +                       regulator-max-microvolt = <800000>;
> +               };
> +
> +               vreg_s5c_0p752: smps5 {
> +                       regulator-min-microvolt = <465000>;
> +                       regulator-max-microvolt = <1050000>;
> +               };
> +
> +               vreg_s7c_0p752: smps7 {
> +                       regulator-min-microvolt = <465000>;
> +                       regulator-max-microvolt = <800000>;
> +               };
> +
> +               vreg_s9c_1p084: smps9 {
> +                       regulator-min-microvolt = <1010000>;
> +                       regulator-max-microvolt = <1170000>;
> +               };
> +
> +               vreg_l1c_1p8: ldo1 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1980000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l2c_1p62: ldo2 {
> +                       regulator-min-microvolt = <1620000>;
> +                       regulator-max-microvolt = <1980000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l3c_2p8: ldo3 {
> +                       regulator-min-microvolt = <2800000>;
> +                       regulator-max-microvolt = <3540000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l4c_1p62: ldo4 {
> +                       regulator-min-microvolt = <1620000>;
> +                       regulator-max-microvolt = <3300000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l5c_1p62: ldo5 {
> +                       regulator-min-microvolt = <1620000>;
> +                       regulator-max-microvolt = <3300000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l6c_2p96: ldo6 {
> +                       regulator-min-microvolt = <1650000>;
> +                       regulator-max-microvolt = <3544000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l7c_3p0: ldo7 {
> +                       regulator-min-microvolt = <3000000>;
> +                       regulator-max-microvolt = <3544000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l8c_1p62: ldo8 {
> +                       regulator-min-microvolt = <1620000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l9c_2p96: ldo9 {
> +                       regulator-min-microvolt = <2700000>;
> +                       regulator-max-microvolt = <35440000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l10c_0p88: ldo10 {
> +                       regulator-min-microvolt = <720000>;
> +                       regulator-max-microvolt = <1050000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l11c_2p8: ldo11 {
> +                       regulator-min-microvolt = <2800000>;
> +                       regulator-max-microvolt = <3544000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l12c_1p65: ldo12 {
> +                       regulator-min-microvolt = <1650000>;
> +                       regulator-max-microvolt = <2000000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_l13c_2p7: ldo13 {
> +                       regulator-min-microvolt = <2700000>;
> +                       regulator-max-microvolt = <3544000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
> +               vreg_bob_3p296: bob {
> +                       regulator-min-microvolt = <3008000>;
> +                       regulator-max-microvolt = <3960000>;
> +               };
> +       };
> +};
> +
> +&qupv3_id_0 {
> +       status = "okay";
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges = <32 2>, /* ADSP */
> +                              <48 4>; /* NFC */
> +};
> +
> +&uart5 {
> +       compatible = "qcom,geni-debug-uart";
> +       status = "okay";
> +};
> +
> +&usb_1 {
> +       status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +       dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +       vdda-pll-supply = <&vreg_l10c_0p88>;
> +       vdda33-supply = <&vreg_l2b_3p072>;
> +       vdda18-supply = <&vreg_l1c_1p8>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +       vdda-phy-supply = <&vreg_l6b_1p2>;
> +       vdda-pll-supply = <&vreg_l1b_0p912>;
> +
> +       status = "okay";
> +};
> +
> +&wifi {
> +       memory-region = <&wlan_fw_mem>;

Same question regarding the CE region.

> +};
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

