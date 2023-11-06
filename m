Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C48757E213A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 13:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjKFMUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 07:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjKFMUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 07:20:47 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C9BBB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 04:20:44 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9ad67058fcso4451295276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699273243; x=1699878043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNrBmQOtJ17ojJmeT7du8FrKMIIzYnoq4n1GU13u2lU=;
        b=H92pnSDeWr3e9AcWDs2HT161bar1Tlz7Fq0xkqPxFqi/+B9Gy3Q4RKTt7i7pMaq0U/
         5G7Po1GNkVT5+BKPE9njjgFfxM8uvnc9MATXcBpooaRBgp1wENAsNdc9ZQzMfpEP/D3a
         1DByK9X+a2bCTMkzxzTiDcJQC6mBh5Fyw2QctbKPe0tn7LiMuzhuS5ExvE9pI+Kvsqcx
         yOVTm5+6m+83KiSOCULLpTyzssZWWIUZjfHdXO7Ntg6bIVwPltR9XvarUPODItRCc+V5
         QHTsznETSfzbZlmPWcVXhqtoIn8imhPZHcrASvA1dHKuUa2WmamaqoD5ma3Q54THTUQ+
         cHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699273243; x=1699878043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNrBmQOtJ17ojJmeT7du8FrKMIIzYnoq4n1GU13u2lU=;
        b=mu11mSJ3bBNwOdo0E+6l6Khmy9T/K+9Gd81M0ALuWkXZmszYYpct0NN2fNeuhpPWAZ
         K8PSKo39pwWx3r87VrmMKOzOBXPhGyJPweWpG/LnbvvNYgUb7pqaJryi98aFyximn6gO
         QDZNUiqIsdVbXxnqp3QBqsybOZyr7eHzMR0au8TDLJEIogflvf2S36if61XDfUi4v+Dz
         vljXP4Li/K02KT/9bykU7j4nTjIEwcLF4qkSFp6R1iIvRmg7tZx2pejpRRc5zrJ7BFSp
         l90hUCAaAzcc6W9Ly2dVFzhPV/I97C5Lapkky8nUHcnLBHBomeyDauGlTpcQsoZ6fimK
         HP5Q==
X-Gm-Message-State: AOJu0YxRL5n657QHe8efxFB94RQC6SljtcEMhiBdzKE5IYau8hr0jh5/
        c0fv0v+643K0zO+FyRgoy+BFTW33Q7JPRTf2R6etUg==
X-Google-Smtp-Source: AGHT+IEWI+f1HNKNSeeVWXlqh/hIENbIf83dLNlmNVJ1X8gb5errhSt5Vw0iEDS5BYJhLkKMzUml4nTi0qHyePAxOUU=
X-Received: by 2002:a25:324c:0:b0:da0:6cf3:c629 with SMTP id
 y73-20020a25324c000000b00da06cf3c629mr24702415yby.41.1699273243154; Mon, 06
 Nov 2023 04:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net> <20231106-pm8937-v1-7-ec51d9eeec53@riseup.net>
In-Reply-To: <20231106-pm8937-v1-7-ec51d9eeec53@riseup.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 14:20:31 +0200
Message-ID: <CAA8EJprKNPiaMi1OxVUHtY-YxzUuy_uZhrNemmU6dQeFEukv0w@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Add PM8937 PMIC
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 14:11, Dang Huynh <danct12@riseup.net> wrote:
>
> The PM8937 features integrated peripherals like ADC, GPIO controller,
> MPPs, PON keys and others.
>
> Add the device tree so that any boards with this PMIC can use it.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  arch/arm64/boot/dts/qcom/pm8937.dtsi | 202 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 202 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8937.dtsi b/arch/arm64/boot/dts/q=
com/pm8937.dtsi
> new file mode 100644
> index 000000000000..6091d6938885
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8937.dtsi
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
> + */
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +       thermal-zones {
> +               pm8937-thermal {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&pm8937_temp>;
> +
> +                       trips {
> +                               pm8937_trip0: pm8937-trip0 {

I don't think you need labels here. Also you can drop PMIC name from
trip point node names.

> +                                       temperature =3D <105000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "passive";
> +                               };
> +                               pm8937_trip1: pm8937-trip1 {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "passive";
> +                               };
> +                               pm8937_trip2: pm8937-trip2 {
> +                                       temperature =3D <145000>;
> +                                       hysteresis =3D <0>;
> +                                       type =3D "passive";

145=C2=B0C is very hot for the passive trip point

Comparing this with other platforms, 125=C2=B0C can be "hot" and 145=C2=B0C=
 is "critical".

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +                               };
> +                       };
> +               };
> +       };
> +};


--=20
With best wishes
Dmitry
