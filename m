Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9011E4BC4B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240938AbiBSB5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 20:57:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240147AbiBSB5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 20:57:41 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B87246373
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 17:57:23 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so5808999ooi.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 17:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=O4w1/n60qxqwVlOxTKzOpTfKi28I2/RDtRvzUGnWMyg=;
        b=c1XE06RLHIrAGxiv2X1h/1nfy9FOFquIrbKqYWvdEjgb7NQr2hXi/N3ie0bynuyaol
         tAhfz0iojY/KL1BPTfUZUjQ6QwXxHOH4zmokNN3Tae8m+MD5yRT1kAYKaCz1JsEfNG71
         HxjROfXwKHFjm/1XScTc0bn2RRqoenBpsLs0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=O4w1/n60qxqwVlOxTKzOpTfKi28I2/RDtRvzUGnWMyg=;
        b=BgPQut033IhnGmrDm18q6ze5iCftyXda6skEGxdKJ/g8gyQzfp3FAMLwfHIUWeAR29
         2ej95j3Gmv/S0DBkyHP5l8FcV0A/9Plj85BpEHHhd8VYW2MeWlt7T6f/cKqKok1Lzuz2
         kLeZ7EjnB4QUWiuiEVMEs/cSV7IWNmV5flexNzjJpKWKEyUX/HKdQM9boHuJw67AjpA5
         Ff55jOfdtRqanhTFInCxz0IrsKX/Hv8Zkh5HZIE86EXAbY+Iooq92d7oQ5CwuhjN/myT
         Gphr9uUQUAArogb2FJrBNWa18PWcgIQS4RbY0taRXfUYtq3PxVykUfQoXluSgjLVbpZm
         v4/Q==
X-Gm-Message-State: AOAM532jbSHqHXdQrCy0C1ZlsOeeev1QHcp36hkTzGRqZZt3U9Bpso8d
        EAjJshsr0gBr2S98E/kWLMgdrva07pBRq1yea133Lg==
X-Google-Smtp-Source: ABdhPJzPjO+V71vJgm0n23Io89XXp4Vg+EB3s05L8mvs0Ol3hN6o6d09tBUfRKerCIjWCPbAZjf0zIjpTCcqmC2bwNk=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr3146796oon.25.1645235843079; Fri, 18
 Feb 2022 17:57:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 17:57:22 -0800
MIME-Version: 1.0
In-Reply-To: <1645182064-15843-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1645182064-15843-1-git-send-email-quic_c_skakit@quicinc.com> <1645182064-15843-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 17:57:22 -0800
Message-ID: <CAE-0n53P1HZCjXUFWApEU8qG3_+Vv4XoZou5OwHsHvMJpqMe=g@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] arm64: dts: qcom: pm8008: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-02-18 03:01:02)
> Add base DTS file for pm8008 with infra and regulator nodes.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
> Changes in V4:
>  - This is newly added in V4, to add all the pm8008 common stuff.
>
> Changes in V5:
>  - Changed the mfd node names from pm8008_chip to pm8008_infra and
>    pm8008_ldo to pm8008_regulators as they re more appropriate.
>  - Changed the compatible for pm8008@9 mfd node to differentiate from
>    pm8008@8 node in driver.
>  - Removed compatible for regulators node.
>  - Removed reg property for LDOs and added in driver.
>
> Changes in V6:
>  - Changed node names to small letters.
>
> Changes in V7:
>  - Removed intermediate regulators node.
>
>  arch/arm64/boot/dts/qcom/pm8008.dtsi | 44 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8008.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8008.dtsi b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> new file mode 100644
> index 0000000..0f48572
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2022, The Linux Foundation. All rights reserved.
> +
> +pm8008_infra: pm8008@8 {

Node name should be generic, pmic@8

> +       compatible = "qcom,pm8008";
> +       reg = <0x8>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +};
> +
> +pm8008_regulators: pm8008@9 {

Node name should be generic, pmic@9

> +       compatible = "qcom,pm8008-regulators";
> +       reg = <0x9>;
> +       #address-cells = <1>;

Address cells is 0 too?

> +       #size-cells = <0>;
> +
> +       pm8008_l1: ldo1 {
> +               regulator-name = "pm8008_l1";
> +       };
> +
> +       pm8008_l2: ldo2 {
> +               regulator-name = "pm8008_l2";
> +       };
> +
> +       pm8008_l3: ldo3 {
> +               regulator-name = "pm8008_l3";
> +       };
> +
> +       pm8008_l4: ldo4 {
> +               regulator-name = "pm8008_l4";
> +       };
> +
> +       pm8008_l5: ldo5 {
> +               regulator-name = "pm8008_l5";
> +       };
> +
> +       pm8008_l6: ldo6 {
> +               regulator-name = "pm8008_l6";
> +       };
> +
> +       pm8008_l7: ldo7 {
> +               regulator-name = "pm8008_l7";
> +       };
>
