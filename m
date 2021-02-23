Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B173226A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbhBWHuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhBWHt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:49:58 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18789C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:49:18 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u11so9304828plg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2bMN15X/ldlzY+kOyA3oxwE5Xtr5wOV7/gwAc4EU3do=;
        b=BoZC5ctrAAkufR1dHCVQ4ikWDTS+mjplckbtMqRhwZdM9hwKOPkjxcFfxulan7tz5o
         0DRDBAJ8NQP0C/KB1rYOhxG49dgQcIZav5hhiPZn9pfidDk7PoBRgbJdw91PLd6FhmN5
         ZZ21cArZI3Loh876UGA0wZUyfhSrf1cy3a6gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2bMN15X/ldlzY+kOyA3oxwE5Xtr5wOV7/gwAc4EU3do=;
        b=IYCNI0FDOW5PbqUUDq2WO9tDpbFzaOkZs4Z4DEkKyzGFVJkru650Z8RVRCKyaG+An4
         BvgtKOj1qMxqAh7e63qmD4yrWdgD2VeiXRyYy1zGsd0isb7Icj6HxoIFKirxSFKrtD+C
         qEsDA8comzyd2PIDxCMWnljyMQPqJPi0yj7nZeTuiLXkYIhg9WfZaRHfvlOKk21lB1hN
         wq3iz3irYGbfnro0YrrUH0KakA2hNWRDo0Nmh2rGNPrVPKMDSgLl4WzTHzdWbfS9LPEM
         Otyl6aNI24dgU1gXG+WmcV2yu+iUk6o/ikS6opjUJx/Xm4Zxm6u/VNEOkSP3sqJGMhSm
         GkNg==
X-Gm-Message-State: AOAM532IRAB9xMovDojtK/3VNtNavSG4GQfQ7pv2Dg0LL4nxXDefbWsv
        yzquGFq6PTXnOPYFme8tD2I7VNOaPrChHQ==
X-Google-Smtp-Source: ABdhPJwqT3HCmKvluTv6lBBFUmC9oY5BB+qxeb3plm6mAT9kcQU5w3jDtWKILmv1uESK1gX8hJhg/Q==
X-Received: by 2002:a17:90a:77c8:: with SMTP id e8mr2940196pjs.48.1614066557512;
        Mon, 22 Feb 2021 23:49:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id o5sm1953824pjq.57.2021.02.22.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:49:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-14-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-14-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 13/13] arm64: dts: qcom: sc7280: Add cpuidle states
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:49:15 -0800
Message-ID: <161406655568.1254594.10659725128997811651@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:50)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 8f2002b..3b86052 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -186,12 +207,69 @@
>                         compatible =3D "arm,kryo";
>                         reg =3D <0x0 0x700>;
>                         enable-method =3D "psci";
> +                       cpu-idle-states =3D <&BIG_CPU_SLEEP_0
> +                                          &BIG_CPU_SLEEP_1
> +                                          &CLUSTER_SLEEP_0>;
>                         next-level-cache =3D <&L2_700>;
>                         L2_700: l2-cache {
>                                 compatible =3D "cache";
>                                 next-level-cache =3D <&L3_0>;
>                         };
>                 };
> +
> +               idle-states {
> +                       entry-method =3D "psci";
> +
> +                       LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> +                               compatible =3D "arm,idle-state";
> +                               idle-state-name =3D "little-power-down";
> +                               arm,psci-suspend-param =3D <0x40000003>;
> +                               entry-latency-us =3D <549>;
> +                               exit-latency-us =3D <901>;
> +                               min-residency-us =3D <1774>;

Are these preliminary numbers? They're the same as sc7180 from what I
can tell, but presumably things changed between SoC versions?

> +                               local-timer-stop;
> +                       };
> +
> +                       LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
> +                               compatible =3D "arm,idle-state";
> +                               idle-state-name =3D "little-rail-power-do=
wn";
> +                               arm,psci-suspend-param =3D <0x40000004>;
> +                               entry-latency-us =3D <702>;
> +                               exit-latency-us =3D <915>;
> +                               min-residency-us =3D <4001>;
> +                               local-timer-stop;
> +                       };
> +
> +                       BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> +                               compatible =3D "arm,idle-state";
> +                               idle-state-name =3D "big-power-down";
> +                               arm,psci-suspend-param =3D <0x40000003>;
> +                               entry-latency-us =3D <523>;
> +                               exit-latency-us =3D <1244>;
> +                               min-residency-us =3D <2207>;
