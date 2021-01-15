Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1562F70E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732443AbhAODTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732441AbhAODTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:19:00 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3085EC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:18:20 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id g15so96526pjd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CYL61nUpT9QBPPOoJporp4vlEmNkT+pHSZF51yBwgfY=;
        b=H147E/W6ElX0kdzhQq8m290rGMnwBel2jhgKL0V8XhKc/7KgcrZuOOwV32wMytwdsq
         QwsCwRHbFm6ES5ynCtkkJBwUlIb1ek6yQJcQ7eiPOsUQP5EUFXNL81Dc0jVFkQXj8hwg
         veTzFlFbCZI1QE7UIktlECNH3nD30ld5r+ybQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CYL61nUpT9QBPPOoJporp4vlEmNkT+pHSZF51yBwgfY=;
        b=ia198RLt6ZBwV75eTfZgNaHZ8CAbcFG6y+Wqfyf6wR6GWOcj/fytbtGUKeDIUny+et
         hpgJPl9pb5SV/+nyaIpqFJehvnYcxv1XGAoiM+XNnC6ilB1mqUCN5hEn/vpf4Ppi4EjV
         1peh8XJkDO4htiYQlaHj3GviJg3GXpG4JL1Wj7C4Sl7ZlTPiphTPD9J4fMLh8It5k403
         uCEfk4i+vZBGuHTRVnNu5L4SU1lHYq7NNR3eIk+4eU4CT9aPkEI5GMdinhuWosgHtu+Y
         qgDDp0hvTa6GzZJ++aZKoe2A0ewvVwvf/Hz/FWPZ/oqC5k3mysing4Z7LLTdy7qZiWJB
         7ZEA==
X-Gm-Message-State: AOAM531jx9mkjU7ZfZ+AWrFY9dOavm4Yu9CcWdsdSugaAVQ3xUksNaRH
        LZJ2dlcDxvNbHmkFSZkemmVB3w==
X-Google-Smtp-Source: ABdhPJwKK/Ocxu/ROS6mrbWbApoVD7MGfUwi3WiESvR/TWJTzsbvbigTM0iW13OtrNg66Ss0ABX2+w==
X-Received: by 2002:a17:90b:14c7:: with SMTP id jz7mr8308072pjb.40.1610680699797;
        Thu, 14 Jan 2021 19:18:19 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x15sm6207760pfi.184.2021.01.14.19.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:18:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org> <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Date:   Thu, 14 Jan 2021 19:18:17 -0800
Message-ID: <161068069765.3661239.6061499369110570958@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2020-09-29 23:42:48)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 5724982..850b43e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -231,6 +231,7 @@
> =20
>                 audio-jack =3D <&alc5682>;
> =20
> +               #sound-dai-cells =3D <0>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> =20
> @@ -257,6 +258,17 @@
>                                 sound-dai =3D <&max98357a>;
>                         };
>                 };

Can you please add a newline here?

> +               dai-link@2 {
> +                       link-name =3D "MultiMedia2";
> +                       reg =3D <2>;
> +                       cpu {
> +                               sound-dai =3D <&lpass_cpu 2>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&msm_dp>;
> +                       };
> +               };
>         };
>  };
> =20
> @@ -782,6 +794,9 @@ hp_i2c: &i2c9 {
>                 reg =3D <MI2S_SECONDARY>;
>                 qcom,playback-sd-lines =3D <0>;
>         };

Can you please add a newline here?

> +       hdmi-primary@0 {

This should be hdmi-primary@2 {

Or a more generic node name should be devised. dai@2 perhaps?

> +               reg =3D <LPASS_DP_RX>;
> +       };
>  };
>
