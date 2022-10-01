Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4338B5F1A99
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 09:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJAH2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 03:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJAH2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 03:28:20 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ED312D0E
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 00:28:19 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-349c4310cf7so64238907b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SEE6ZLsU3EIgwfwI3tkOmqbv+2VDE09pQKT3XTU2+4E=;
        b=C1kHlBamYm09+shcK5APbb3aiCVa9DJyrWyqK8GnKCETd4z+soPQgFkiutb0b68Vzk
         Mv9oLqDvmPmKuYRwt/gxiUbuN5n7iQoX2lm/mATrkpz+fPim7sEntDcdMF+ob8KFZQHp
         Fys/c+7msHzj4Z8VbpclVTiUqyndooFChpYa87qsL2v7oJHTnIsVluMtULRq7pG52Hhh
         ULiK4dTeJnZ6j8tXZDgLNDZXN4RCSIwuq2AqpNIGyRm52HsWnRyR/yAdIbWNa1qFpW4W
         ODGg5ib8wlJmZJd9rZnhmMa8PEtaiiH/bKq8dlr1C56k6qlbFRB+56A1nZSrQVMKg8xK
         wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SEE6ZLsU3EIgwfwI3tkOmqbv+2VDE09pQKT3XTU2+4E=;
        b=X4EIJrx0GlRstL9YvD0MVKMmsjBFLMZ8Px/wGGQ6btJ1pSiVvARqw/w+xBqXPM3NO8
         0OEpEeqpA4klGGbtHlCCwGGrmpXsKDhbSmSWW6ft+LvVyiREw7siPSYfriR75KANuF8E
         KKzGCLM0Nd0QE7JE41ltT00Klo/NZp9YIUVZ3dvOqvQHvlOhStclSjunP58K8I+BAY1/
         eV06CC2uWROaESnmJx5fMHDX0aBYlFEIYKj/PMJcPqhQagijLSqZFegisCj5aBX6eNHO
         UG/FiZMe+Qs7AMm/4jgHQ+wjYvVkUB8cCzHr1RCd8smz1IHkgKaenhC6VANns+qbTQ2U
         6zGw==
X-Gm-Message-State: ACrzQf0FBhbSYU88w/T/YfF8L6mB021D8abvREtC/QMQfeA30kup9bmN
        GztpPkWC9fjfX5WYYcFH38G3BA218Ey+2UH8e24057Dh8xc=
X-Google-Smtp-Source: AMsMyM4oz9MU/Da0aGb/3JFVcU6zuXNd4e4OUTiY3ppnKhXBoICpnqvALksm4sdqwqUodwQaU+bfcmCcnPjNtcG7ssI=
X-Received: by 2002:a0d:dbcd:0:b0:356:d169:5ff5 with SMTP id
 d196-20020a0ddbcd000000b00356d1695ff5mr4314939ywe.418.1664609298429; Sat, 01
 Oct 2022 00:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030656.29365-1-quic_molvera@quicinc.com> <20221001030656.29365-3-quic_molvera@quicinc.com>
In-Reply-To: <20221001030656.29365-3-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 10:28:07 +0300
Message-ID: <CAA8EJpqS7pHpuXDeeD_TOus=WAJuFE5sWrjeGH0VQdyTJf2uhA@mail.gmail.com>
Subject: Re: [PATCH 02/19] arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 06:09, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add DTs for Qualcomm IDP platforms using the QDU1000 and QRU1000
> SoCs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 30 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qru1000-idp.dts | 30 ++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qru1000-idp.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1d86a33de528..398920c530b0 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -152,3 +152,5 @@ dtb-$(CONFIG_ARCH_QCOM)     += sm8350-sony-xperia-sagami-pdx214.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sm8350-sony-xperia-sagami-pdx215.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sm8450-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sm8450-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM) += qdu1000-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM) += qru1000-idp.dtb

These two lines stand out. Please fix the indentation and move them to
the proper place.

> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> new file mode 100644
> index 000000000000..0ecf9a7c41ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "qdu1000.dtsi"
> +
> +/ {
> +       model = "Qualcomm Technologies, Inc. QDU1000 IDP";
> +       compatible = "qcom,qdu1000-idp", "qcom,qdu1000";
> +       qcom,board-id = <0x22 0x0>;
> +
> +       aliases {
> +               serial0 = &uart7;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&qupv3_id_0 {
> +       status = "okay";
> +};
> +
> +&uart7 {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> new file mode 100644
> index 000000000000..ddb4ea17f7d2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "qru1000.dtsi"
> +
> +/ {
> +       model = "Qualcomm Technologies, Inc. QRU1000 IDP";
> +       compatible = "qcom,qru1000-idp", "qcom,qru1000";
> +       qcom,board-id = <0x22 0x0>;
> +
> +       aliases {
> +               serial0 = &uart7;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&qupv3_id_0 {
> +       status = "okay";
> +};
> +
> +&uart7 {
> +       status = "okay";
> +};
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
