Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9E4B02A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 03:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiBJB6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 20:58:22 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbiBJB4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 20:56:13 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E02AAB4
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 17:41:26 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso4615579oop.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 17:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7BvHswSXg9zN9k7P3bu3kJhfUU/WgKwQ6HEFpY+l4jA=;
        b=Ewraufgtj1xMfakazeSpwx5MnBYDQHaeFVN1wLgspkWrMugkjtb49bIjLe5uO4rZnG
         1/SsRTmx/SdfhAdZc4IcIwJP+dA8AJX591gYcpvbwF3giFkKi4T1Ft5Om1/eRIcZOEY/
         B0i/ShAZtw1hvFkJ6P6wjp4UGB/ApLobqDUNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7BvHswSXg9zN9k7P3bu3kJhfUU/WgKwQ6HEFpY+l4jA=;
        b=1fAjYdXHpdrvXb0dJii4bHYfsvAwtlaG//R72hfUW0kdKiri0GIvJ/D9xtP7w3gcK2
         JC+mEg8BQ9GnQjd7cyKhIAyF8s1RCLSat5pxcN8C8gC6LNzH9Rqf0duV8MG2CQoNoxVK
         PP26RR39tzAhJKMuYoqaOw4LPMM9hOTlpCljmB9S6BvBOf5hL3iPedLR/9jGoDwFwP/R
         36JEOpvUt8q95iL+2vb1P28/N2RprZj8DAc6O/YK9L4Y897+pPOgoVEulHQai37FS09a
         5LqZ8l90fYiTJH2W/Q5df8DqdIy8s2SsdwmqwSy1G4CEFoRyKlS4gtapYgUm7277wCUf
         Ae8Q==
X-Gm-Message-State: AOAM530dUM17auqgj9fy2F7tnham7aKz9zx78GJmLkMGv3hXJ8FX/5Zd
        fAyPA1c8UfEYjP8OWBvKpG9m6hml+WR4CLcZwytQig==
X-Google-Smtp-Source: ABdhPJz5nnuCshCtEM3gga4og7wjd6Bj6dW8FLpEygBvjacEExJ8np7WaRj3GTND+KVxtMxzzyhuWn0ScaNhy+C9qjM=
X-Received: by 2002:a05:6870:1209:: with SMTP id 9mr72218oan.8.1644457285749;
 Wed, 09 Feb 2022 17:41:25 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 17:41:25 -0800
MIME-Version: 1.0
In-Reply-To: <1644331940-18986-6-git-send-email-quic_c_skakit@quicinc.com>
References: <1644331940-18986-1-git-send-email-quic_c_skakit@quicinc.com> <1644331940-18986-6-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 9 Feb 2022 17:41:25 -0800
Message-ID: <CAE-0n52vX-50GEZ5X3PhnZaLyriALRtoqGiWSydi4WSAvGmf9A@mail.gmail.com>
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: pm8008: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-02-08 06:52:19)
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
>  arch/arm64/boot/dts/qcom/pm8008.dtsi | 46 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8008.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8008.dtsi b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> new file mode 100644
> index 0000000..8e04983
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> +
> +pm8008_infra: pm8008@8 {
> +       compatible = "qcom,pm8008";
> +       reg = <0x8>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +};
> +
> +pm8008_regulators: pm8008@9 {
> +       compatible = "qcom,pm8008-regulators";
> +       reg = <0x9>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       regulators {

What is the point of the 'regulators' node? Why can't we just put LDO1
directly underneath the node that has the "qcom,pm8008-regulators"
compatible?

> +               pm8008_l1: LDO1 {
> +                       regulator-name = "pm8008_l1";
> +               };
> +
