Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564EE32C903
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 02:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245581AbhCDBBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 20:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388681AbhCDAMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 19:12:15 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFC2C0613D9
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 16:07:26 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id e9so5255456pjs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=asxjJNgiUNw6MBg0pakth/o8lvjiDAUFUUQ/6Pge5+4=;
        b=PanXJgzyeHwpKblWdhocuodYjQLVlYm2M3uMk2kp4ryZrfrAwH4WsPXGUAJpUo4Tyy
         Dp03+piJ4ksc7zysNHDbgSvTt8mc5nucEYtSdSRvIvx/AgnGhVAd05Sr7JYDss1+ET8i
         LteG+cwShMGQslPkg92g+HCoOjw9epjuUlkmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=asxjJNgiUNw6MBg0pakth/o8lvjiDAUFUUQ/6Pge5+4=;
        b=FwvaA6l/PkgrNDZCB1b11ZBM3qU/JfApfWorYPA+QSAqPWVgvDtRXKsFGVJIfBof+x
         cfVLvTSp+RLtAFIFZ5H+SJi9X7+BGZLI2/xDzQTgbQOtODCHCHhWWQf0wMFkPuwgG/FO
         aQ0NVkQx+4DXe6G3UGivsEY7igEfJxw8SOPHj8eb+7oN+5dwl1f495dJjz80Vf14/84H
         NbOlYS9k3vR2TRT/bvJantaIWviG4CTsz4ANr26Lo47wP9W1Wmncq2UDIGZSI4ce63VG
         DaDUHoFlEDpGFv/067PwHLyEnH11kEjU8fHzf7D37oj+B8yAG3UFcAb3pXup3m66eb4m
         i/mw==
X-Gm-Message-State: AOAM533ayUBy/IUefZGTeHRpU9U2LjroljULHWY9TKi0Xh3tiEAuAB6x
        7JSrrxSktR/vg3WZmu87J5nQtgFEr6VvMw==
X-Google-Smtp-Source: ABdhPJyNosMbuHpBvBydLjVSSE8esDc/JfjeFRizDQLAXL2Ze61VIO+s7BDsLjCZ7drglIe+1gpCog==
X-Received: by 2002:a17:90b:116:: with SMTP id p22mr1507427pjz.161.1614816445612;
        Wed, 03 Mar 2021 16:07:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id s10sm25538883pgl.90.2021.03.03.16.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 16:07:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614773878-8058-4-git-send-email-rnayak@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org> <1614773878-8058-4-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH v2 03/14] arm64: dts: sc7280: Add basic dts/dtsi files for sc7280 soc
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Wed, 03 Mar 2021 16:07:23 -0800
Message-ID: <161481644369.1478170.2626772524314654990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-03-03 04:17:47)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> new file mode 100644
> index 0000000..4a56d9c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * sc7280 SoC device tree source
> + *
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       interrupt-parent =3D <&intc>;
> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       chosen { };
> +
> +       clocks {
> +               xo_board: xo-board {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <76800000>;

If this is the correct frequency I think we need to update the rpmh clk
driver to use the correct divider? Right now I think it is a 2 when it
should be 4?

> +                       #clock-cells =3D <0>;
> +               };
> +
> +               sleep_clk: sleep-clk {
> +                       compatible =3D "fixed-clock";
> +                       clock-frequency =3D <32000>;
> +                       #clock-cells =3D <0>;
> +               };
> +       };
