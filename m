Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B66770602
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 18:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjHDQal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 12:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjHDQaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 12:30:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F39C1BDD
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 09:30:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso35548881fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691166632; x=1691771432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb6BXc3V7vZl1BO3VO9rbNSiYgEtub9HXOe7U0lqXXA=;
        b=DOkOeApEhP9cQxwrIfIcpIWdWPKIF2osAWkSyszrDxr+BenYfT9IY+eBlgvqGnOl0G
         /YKsnYDrRXXMN1I+44XJACKGvVshNWMkKXXysH9aFoL7TCpC18n85EdnnbYcrUghO2hs
         ML77MSemNNc2MQI/yXiyfXzictuo9u+Zpi/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691166632; x=1691771432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb6BXc3V7vZl1BO3VO9rbNSiYgEtub9HXOe7U0lqXXA=;
        b=JtwxXYe5TVcqO8ex2CYJdVpl6W0QGxOZGmIPhIsNF8iHJQpYk1Di00nHThu47lOnOI
         hUtEvHIRRbW5l8S6M7NG+IBus++LxIJNnXeUOhfO4MIA4zq6CTENtd/vIMz5iQrxQ4nN
         GM6krToXC7uVliuYYdQXyHSAkOnS1GKmBvKGehs+MphGqMtun+ffVTnH5g5RzphEuM52
         WYomsoaHbhXULW3+OOOJZ1MPSpgMVXas/m3RhQPS4Ml4njFSRKkYSbeeSzliQPVcUY7k
         UqMizxehPDuM4YFd0+uHBmLDojKdOFN4C/4SKu4oxjQ6y5TRqa8ciX8wR1TFM7K041t2
         I0fg==
X-Gm-Message-State: AOJu0Yyg+q2oGaDDmgK41OLWTQc1hrWWrh1EEdhdzZ1CDs4lZj41VI5D
        mettGUij4aLX8Zx6+saeMZSQnWZkNgHIz9IFoyMCbZMq
X-Google-Smtp-Source: AGHT+IH26KO9eXL2N0L+nMbqQ853uKrd7iIPihITTBedhBbcx82VtX0rtyCZL89dMF1m2J1iJiLrLg==
X-Received: by 2002:a2e:3510:0:b0:2b8:3ac9:e201 with SMTP id z16-20020a2e3510000000b002b83ac9e201mr1811158ljz.40.1691166632173;
        Fri, 04 Aug 2023 09:30:32 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906379300b00993928e4d1bsm1512221ejc.24.2023.08.04.09.30.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 09:30:30 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so69a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 09:30:30 -0700 (PDT)
X-Received: by 2002:a50:9e4c:0:b0:519:7d2:e256 with SMTP id
 z70-20020a509e4c000000b0051907d2e256mr2692ede.0.1691166629720; Fri, 04 Aug
 2023 09:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095836.39551-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230804175734.v2.3.Ie77732a87ab53d21bac47db309b75a796fa19337@changeid>
In-Reply-To: <20230804175734.v2.3.Ie77732a87ab53d21bac47db309b75a796fa19337@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Aug 2023 09:30:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzTY0XKb-hXLprT3OUrpaoNKiCqABgWyY_kXrZMD9H_A@mail.gmail.com>
Message-ID: <CAD=FV=UzTY0XKb-hXLprT3OUrpaoNKiCqABgWyY_kXrZMD9H_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7180: Add board id for lazor/limozeen
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Aug 4, 2023 at 2:58=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor Limozeen board device tree source
> + *
> + * Copyright 2023 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +       model =3D "Google Lazor Limozeen without Touchscreen (rev10+)";
> +       compatible =3D "google,lazor-sku6", "google,lazor-sku18", "qcom,s=
c7180";
> +};
> +
> +/delete-node/&ap_ts;
> +
> +&panel {
> +       compatible =3D "edp-panel";
> +};
> +
> +&sdhc_2 {
> +       status =3D "okay";
> +};
> +
> +&alc5682 {
> +       compatible =3D "realtek,rt5682s";
> +       /delete-property/ VBAT-supply;
> +       realtek,dmic1-clk-pin =3D <2>;
> +       realtek,dmic-clk-rate-hz =3D <2048000>;
> +};
> +
> +&sound {
> +       compatible =3D "google,sc7180-trogdor";
> +       model =3D "sc7180-rt5682s-max98357a-1mic";
> +};

The sort ordering of the nodes above is still wrong. It should be
alphabetical. AKA "alc5682", "panel", "sdhc_2", "sound".

Once that's fixed, feel free to include:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
