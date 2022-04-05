Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A73D4F4BC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349243AbiDEXFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573504AbiDETNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 15:13:19 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89023E885A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 12:11:20 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id q129so106896oif.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+sCFFwWhVh6IX8olIQEwfE/A9caFnSQEQiTDby/DQD0=;
        b=htZpWkYwxplvXURN6IyOQGpIM7h5Xaj/QSzBur6jP2dUuzrHLspI/2pUZmT5jJA26H
         p/MLtsHVJX059A4he5GjdU7AnIBH/Pd0MiOXNMrXW2bsC3jr4X325qgSdNfJIFuKm3ww
         oFU8c/+S2YeMLeJkGp8/tNdI4mm3Jyzt9cj4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+sCFFwWhVh6IX8olIQEwfE/A9caFnSQEQiTDby/DQD0=;
        b=ObqL/8K3ALI8Sl8SOxZgEjTYj5vrA1gWG8LIrTMJeWqleuENhKpA/RrrU//5UA6xQL
         PLSjt5kgpfQLVMFnJmHanEr+giLBDOrZAEeVF5JhDKagXs/hIE4HEjVJbwz5EE+syvDh
         r+G/BcUrglRiRnG5r0aQD1So4ykHCPXwHE5qj81SpA+x9JJw6mMrc8GMZBQCD27yfc++
         wUeTU0r7xEiOJZsvBLDoSgPA+k5Z3iMEEcUi7yVl3wlvgQIKLDceuveke1n/rCQMyvw0
         mRx06jfHJmFYx+OIGXBJwmOubLjeh5GCJ+jk5eEmUWgfVzWSKI0u2wSj1T1AOUm2Frjm
         tWcQ==
X-Gm-Message-State: AOAM533PONcZEQk1WlXK8UGcF74w4hV5ZqAlzCLkyIMF8SKjBIlWKR1r
        q4slipOVGhHBxm+IACcrMRqH/IihEQOelJhB/6SRzHrvlyY=
X-Google-Smtp-Source: ABdhPJxaJqt3rZ7rG2CvTp/vFfikXLJk33kvQpji7R5HlYgG9oSpRARWmCg3M9/Tlt7qRxM2Iw5QQ2YqXcp5w3lOf1A=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr1996111oie.193.1649185879962; Tue, 05
 Apr 2022 12:11:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 14:11:19 -0500
MIME-Version: 1.0
In-Reply-To: <1649166633-25872-6-git-send-email-quic_c_skakit@quicinc.com>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com> <1649166633-25872-6-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 14:11:19 -0500
Message-ID: <CAE-0n51rLRcWE+h3zaWNy-nJYK4tQoivjdbfgYrwTJbjYYxWFw@mail.gmail.com>
Subject: Re: [PATCH V9 5/6] arm64: dts: qcom: pm8008: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-05 06:50:32)
> diff --git a/arch/arm64/boot/dts/qcom/pm8008.dtsi b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> new file mode 100644
> index 0000000..24bd832
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2022, The Linux Foundation. All rights reserved.
> +
> +&pm8008_bus {
> +       pm8008: pm8008@8 {

pmic@8

> +               compatible = "qcom,pm8008";
> +               reg = <0x8>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       pm8008_regulators: pm8008@9 {

pmic@9

> +               compatible = "qcom,pm8008-regulators";
> +               reg = <0x9>;
> +               #address-cells = <0>;
> +               #size-cells = <0>;
> +
