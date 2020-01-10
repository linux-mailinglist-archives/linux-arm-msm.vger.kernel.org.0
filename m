Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F96213741A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 17:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgAJQww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 11:52:52 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40727 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgAJQww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 11:52:52 -0500
Received: by mail-pj1-f68.google.com with SMTP id bg7so1227793pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2020 08:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=SC0UnYuTvxE5OcA375X4sqDX8RR6HMTTrFTXJph6jSE=;
        b=lR9Qv/Rh2eYbSmBp73Q6BrJGiZOTHErsCfUcGyDbgXcFuMwI36N47x623pr35oqewC
         DhPd2mZievnpOgj2/IiBIrrrgWgM/jIO2/qryR72NyThU0yuyTlTTrr0uzsWTYuLb8c5
         JXTo8xNNKwipDeHFgPXASuqAGBA2+0k71Vr1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=SC0UnYuTvxE5OcA375X4sqDX8RR6HMTTrFTXJph6jSE=;
        b=IIJxIg3Y2TpAs/q2nP77FT/1byx2Uf4j/vqgUHwk6cKI/MpF2HHD2dNozs2Ft6j0Zg
         3I58Yk7F1n8hr/juJyOsrMHOK56HcD7lRk4mZkGiGc+dBSxdtHN7/FME3R/IZARpuaUN
         3zBOQd1PHKqDCV1dCoZVqaXIbpu/8Z+lMXDMKiKkwJryQcc5VEMmWCtf0Pn8is0CCFNS
         9HY/oZa57M603PHiCImMM7ZjIHtQ7f5YFlFHkD2ydJSj+YAJhP4zyXn1FrtGLMOId4as
         p5DSQEtUdO5t7Pn7m+G2HFa+ghySJ8GDV2zoDoIM9PYxKOxt7VfTOYPjIDFHMEU8awYc
         eiaA==
X-Gm-Message-State: APjAAAVSt3+93mfg1Bx3/7tGDOS7FRbUe9T+syVpo9at7FCFcwtpjhYO
        pAd5FMFNqXX0Vi2h5th0Pu/jxemxQkzdMA==
X-Google-Smtp-Source: APXvYqxW1qdIS3otqhlBBCjtCjlgjYpsGMdUHQ/sCZODIjnY3CWYaEx8TR2oCPqj2x/eeIHOuztY2Q==
X-Received: by 2002:a17:902:8541:: with SMTP id d1mr5509047plo.57.1578675171031;
        Fri, 10 Jan 2020 08:52:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s26sm3533556pfe.166.2020.01.10.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:52:50 -0800 (PST)
Message-ID: <5e18abe2.1c69fb81.1ab3c.84f9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1578486581-7540-3-git-send-email-sanm@codeaurora.org>
References: <1578486581-7540-1-git-send-email-sanm@codeaurora.org> <1578486581-7540-3-git-send-email-sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7180: Remove global phy reset in QMP phy
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 10 Jan 2020 08:52:49 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-08 04:29:40)
> Remove global phy reset and do only usb phy reset in QMP phy.

Yes that's what this patch does, but you left out the important part:
Why?

>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index c00c3d4..448ab88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1072,9 +1072,8 @@
>                                  <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>                         clock-names =3D "aux", "cfg_ahb", "ref", "com_aux=
";
> =20
> -                       resets =3D <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> -                                <&gcc GCC_USB3_PHY_PRIM_BCR>;
> -                       reset-names =3D "phy", "common";
> +                       resets =3D <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +                       reset-names =3D "phy";
> =20

We shouldn't need to modify the DT node for this. The reset still goes
to this hardware block, so DT should reflect that. Instead, the driver
shouldn't drive this reset on this SoC.

>                         usb_1_ssphy: phy@88e9200 {
>                                 reg =3D <0 0x088e9200 0 0x128>,
