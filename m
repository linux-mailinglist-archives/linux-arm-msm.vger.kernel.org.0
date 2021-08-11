Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E13E8A00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 08:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhHKGGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 02:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbhHKGGg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 02:06:36 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CCCC0613D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 23:06:12 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u25so3027303oiv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 23:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=5/tBnKSU5qXKRYe9Fz5ZuIFqv9R0TeD3exvxylKbLkM=;
        b=fEnxbRim5iht0kgzHGnrloV4XCKndmgEs9lvBefL05a//oQ04KBYaVghGtGFK5Cwjr
         K0unP+WDy+E6zOON82EcRujIL9b4u+nYxAl/cKyMZja5YVDQ330geXw9EXAOtJrNsZ0a
         0UE9Dt1OSceaAzQQg4tjgPa5Zxlft8Vp/s/Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=5/tBnKSU5qXKRYe9Fz5ZuIFqv9R0TeD3exvxylKbLkM=;
        b=jLpJqu5mtiSCHcRkz+J+GFcoe9Aru2HDfuOOQWi+NeZHoK91vyVPm6xcs3iGZKMJi6
         EdgemyeERVvI0gO7p4nx86fpp1rwdaI0tbKmeOtAHXff+wOhVgr2zfXPFdLSsxP40WN0
         IlF7Vx9lNVLjQCKbCULcwKy5t9wEQrdNbUTi2Y9eIAy9DXuouHRKDRLCwx3YPyfnkpT9
         HxC7ckDmhvMHiD89Rv9YUVOHlFRfvQdVKetAKxpk3FaWhdBofKDpB4tnXpN4JngFVcy3
         Le8SVso0UvG+nDQ7zzh3vz6fq+Nu/94IwV7BjXI3AFBd5tJGMs3JdfYvMB68A7h0AhyU
         8zJg==
X-Gm-Message-State: AOAM531g1JDIKZS84U0bFkwRyjRyEXxKekJTUAOGO+jtP1gZFtpMR5O6
        f6+lHrv3RIwYb3W8Kw/tqEEbIbbNn8o7mMu7AISS4w==
X-Google-Smtp-Source: ABdhPJwXvEiH2a/IHH2d6b4DTNK8/EMOlbTO2eLGwqF/n11xtDpVt6KjOkcQ/0DWPhM3R1lmejtIJF7wDeohma8DIck=
X-Received: by 2002:a54:468d:: with SMTP id k13mr6293281oic.125.1628661972050;
 Tue, 10 Aug 2021 23:06:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 23:06:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210721080549.28822-3-srivasam@qti.qualcomm.com>
References: <20210721080549.28822-1-srivasam@qti.qualcomm.com> <20210721080549.28822-3-srivasam@qti.qualcomm.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 23:06:11 -0700
Message-ID: <CAE-0n52hdv0ehzQi2si3rPumBiO+=stoU3kkK=0e7fU_5+xUZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-07-21 01:05:49)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 31bf7c698b8f..a4cb9ee567ff 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -288,6 +288,7 @@ sound: sound {
>                         "Headphone Jack", "HPOL",
>                         "Headphone Jack", "HPOR";
>
> +               #sound-dai-cells = <0>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> @@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
>                                 sound-dai = <&max98357a>;
>                         };
>                 };
> +
> +               dai-link@2 {
> +                       link-name = "MultiMedia2";
> +                       reg = <2>;

Should this be

			reg = <LPASS_DP_RX>;

? And then the dai-link@2 should change to dai-link@5? It doesn't seem
to really matter though, so maybe not.

> +                       cpu {
> +                               sound-dai = <&lpass_cpu 2>;

This should be

				sound-dai = <&lpass_cpu LPASS_DP_RX>;

? At least from what I can tell without having it be 5 it doesn't work
properly and external audio over DP doesn't enumerate.

> +                       };
> +
> +                       codec {
> +                               sound-dai = <&mdss_dp>;
> +                       };
> +               };
>         };
>  };
>
> @@ -768,6 +781,10 @@ secondary_mi2s: mi2s@1 {
>                 reg = <MI2S_SECONDARY>;
>                 qcom,playback-sd-lines = <0>;
>         };
> +
> +       hdmi-primary@0 {

This should be hdmi-primary@5 to match the value of LPASS_DP_RX define

> +               reg = <LPASS_DP_RX>;
> +       };
>  };
