Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5F64AA4EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Feb 2022 01:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378693AbiBEALl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 19:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239054AbiBEALk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 19:11:40 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123E3D8399EF
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 16:11:39 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id me13so23905117ejb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 16:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=/Rc3cQrXcIDJMZ073MZIfwqft6X5NTFv6dtbx8TCmmM=;
        b=EsT1630iljK1uzbE+T6nDtA1FAnrkswWeoCFLyIAi3W00+UboaHY3siGM6I8LgarLS
         tzF3THNtm7rbvanCa0wHFSQ5mtXjPngda2cImHYtldFTPW1Gv8cTWTePLTCTGGV9HqPp
         uLX5bLfvNZ8qIhaMJ6HcxuenyY0fKGP3daEARXFWFer77mtb18NomqpasJgK42HKSuVF
         OvarhvWmMmF3knK9P+MUiwTaf5zB4OOwDnAErqdWHuK8PFD2q8iBeSNbyAElf5wigDHw
         rHYW1OXniqwGOH4j0Nvkn5qPxmRcbfEPpOOzwNdRJNQ4wPI0YJnwVc5xYwWjINMbJDGH
         0xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=/Rc3cQrXcIDJMZ073MZIfwqft6X5NTFv6dtbx8TCmmM=;
        b=ajhipmDyHBFzGYTK1TzjZUNmxGuBS+NFi66dTsMPNlSJN+LBmqP3Ub9MTrLOeuI+vH
         pt4Nwa9RjnRDxwfeHyLA3Wj7SRlGRAGbTIvFXbAYAlu7eES5Ht+p/tloHM/xaR+wVq3V
         SAYWGUJFiyIL8ULqw/mGjsOs1Lc1IrusEfv30kxxht0/UPVcDP6ZbLlMWf4hEbnfKWIo
         KrQsPiGqPFtbYVmC35+QB16HTZGXU9UoGBoPJen2pFExm0a7lErWO38KbNPOHnVQ8+Zl
         /joHTzhwgXF5H4JJM5M0ispu1dlTzg8ITro9PYsFYCrh/v1aUfatt/aYdO+7ttbnU+3f
         kGNg==
X-Gm-Message-State: AOAM533aPhp1z4dqt8wFgmGkWab035hlOXu1jRDpXehW7nh5GMUvCmAs
        3TAvqSGbqXjb0chepcouKsirpwwHJtaYhNeB
X-Google-Smtp-Source: ABdhPJwjrfjC74ruUii2OTxnRmd9dhMkEXBQ3Mgsk8REwEvlMk8hwo802H+czPdWc41xHeZbslDOMA==
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr1169520ejc.65.1644019897444;
        Fri, 04 Feb 2022 16:11:37 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id c1sm1128162ejn.203.2022.02.04.16.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 16:11:36 -0800 (PST)
Date:   Sat, 5 Feb 2022 01:11:34 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Message-ID: <Yf3Atq+YFB6FlF3T@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220131230214.123610-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131230214.123610-1-petr.vorel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

> Although downstream supports HS400, there are overclocking warnings when
> using mmc-hs400-1_8v:

> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
> mmc0: new HS400 MMC card at address 0001
Any tip which gcc could be problematic?
Is it dangerous to use it? The issue might have been in downstream kernel, but
just hidden.

NOTE (as I wrote earlier) Konrad's patch Remove NoC clocks [1]
has no effect about this.

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/20211230023101.1122588-1-konrad.dybcio@somainline.org/

> Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:

> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
> mmc0: new HS200 MMC card at address 0001

> But as the problem is probably elsewhere (bullhead behaves the same),
> keep mmc-hs400-1_8v.

> Angler does not have SD card, thus sdhc2 kept disabled.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * update sdhc1 overclocking comment.

> Kind regards,
> Petr

>  .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 0e3dd48f0dbf..64f9dbee06a1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -1,12 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> + * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
>   */

>  /dts-v1/;

>  #include "msm8994.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

>  /* Angler's firmware does not report where the memory is allocated */
>  /delete-node/ &cont_splash_mem;
> @@ -41,3 +42,13 @@ serial@f991e000 {
>  &tlmm {
>  	gpio-reserved-ranges = <85 4>;
>  };
> +
> +/*
> + * There are overclocking warnings (more for HS400 than for HS200), but
> + * downstream also supports also HS400 thus keep it (problem elsewhere?).
> + */
> +&sdhc1 {
> +	status = "okay";
> +
> +	mmc-hs400-1_8v;
> +};
