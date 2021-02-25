Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DAE3256F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 20:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbhBYTol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 14:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbhBYTm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 14:42:28 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F068CC06178A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:41:44 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id d2so4183674pjs.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 11:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rQpr5+/yevWYmIpNLxeUt8voD/kpC5d74+rfky8OIcQ=;
        b=hmWw3KIsjHnY1fe3QMyLU/f+l9+t0cTKKV1fi7bBFBnnP4ylE0tpE7LX2o4yj52plY
         MZJPJ7tqyDlysj8Hl/udW6HKPo8eVrcJ6Ot2YFpMbDUVbnbBbnLg9azHZKfjCGu+QHGW
         umWfWO0L3E9EyCoUZ2AOiPd0FMF6EgYUNuB8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rQpr5+/yevWYmIpNLxeUt8voD/kpC5d74+rfky8OIcQ=;
        b=r2RrxfRhhQW+RNpFM7BTQr7/+BYtLp0+EVXSx3Tx3fnh8++Qu7jMoNhCoaFiUH5/ZS
         v7hYD0lymwwiDLxPM2ksHF7Ovq7dI294Mxim0EYfwF6OWhSgekmUGzipygDAiDc+dz+K
         nT30KMxkoB5tugQE6MXOHXGWp16rUncHo3laWfyrYCMR6uaDPoxnF2QKbK9el95cJs69
         MyXJCiaEAi1VNZZOk/xGu330EL+VSEAVhd7vyMyj8nJAS86bYfU8Fvfa93A6UqZ2WehP
         Gx0jIdOK/e+NSTq7rKXrSAbPU9LIJoUkFJS+mrI7RL79FZ3csR1p8x3TKD6ORe35LgKK
         BIuw==
X-Gm-Message-State: AOAM532xbAJMaTkfC5emp+xsls6UH3FZzdYf0NWJIY4iqltrCn5IUO45
        KRFMllRD15tQ9ohr+YS3uMpELA==
X-Google-Smtp-Source: ABdhPJyYq/aWU+OvnpQXKNtlrlAIj00JW+H+hFN2jZiEEBKQMLcGqxPVTETtPRzSKUGffP/x0Rps9w==
X-Received: by 2002:a17:90b:3783:: with SMTP id mz3mr18611pjb.88.1614282104581;
        Thu, 25 Feb 2021 11:41:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id c9sm6452234pjr.44.2021.02.25.11.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 11:41:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <463a45f2c3e4a91430c006fa1637c7f4f124185e.1614244789.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <463a45f2c3e4a91430c006fa1637c7f4f124185e.1614244789.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add AOSS QMP node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Thu, 25 Feb 2021 11:41:42 -0800
Message-ID: <161428210272.1254594.16034240343090747878@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-25 01:30:24)
> Add a DT node for the AOSS QMP on SC7280 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 65c1e0f2fb56..cbd567ccc04e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> =20
>  / {
> @@ -368,6 +369,19 @@ pdc: interrupt-controller@b220000 {
>                         interrupt-controller;
>                 };
> =20
> +               aoss_qmp: qmp@c300000 {

power-domain-controller@c300000? power-controller@c300000?

> +                       compatible =3D "qcom,sc7280-aoss-qmp";
> +                       reg =3D <0 0x0c300000 0 0x100000>;
> +                       interrupts-extended =3D <&ipcc IPCC_CLIENT_AOP
> +                                                    IPCC_MPROC_SIGNAL_GL=
INK_QMP
> +                                                    IRQ_TYPE_EDGE_RISING=
>;
> +                       mboxes =3D <&ipcc IPCC_CLIENT_AOP
> +                                       IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +                       #clock-cells =3D <0>;
> +                       #power-domain-cells =3D <1>;
> +               };
> +
>                 spmi_bus: qcom,spmi@c440000 {

Ick, should be spmi@

>                         compatible =3D "qcom,spmi-pmic-arb";
>                         reg =3D <0 0x0c440000 0 0x1100>,
