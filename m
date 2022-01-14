Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB4948E9F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 13:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241071AbiANMea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 07:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241057AbiANMe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 07:34:29 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DFCC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 04:34:28 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id e3so27007978lfc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74m2z9z8/ANoqPEjwuCfAH2DgVjMBOME/cN8PGQl4s8=;
        b=cI4mVgqcK5b+0olwu/qJGwhS44ktfkLg47uSbyGOzAAW0Pnl1LdOAP//d89vVeIyhk
         MJPs1hN0pMQbDzxkh77FNRkH0ilkjkQOszOXwVpgsp8C0xXVIWXJPF6GZ8GWkMHo/1Q8
         Hq0K9+w8gOMnQYeX4dBp8cfEf/6fIpRwbaeuQL6QGQOGKq5npAle/wxvUiuwHvREAaiv
         WyDxHWkjdwKB3cOy15P2kNxqOY9OtcpVePXt9HT+1XofC+dLGXEZlRiEGBX5MNmYObl7
         Eb8Ekzrtcze5xJ+JHiGs/f0lXWwwKbmknenGFpyGkP0NqjWRTZldGDhcLKq7CnbyDIZn
         xagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74m2z9z8/ANoqPEjwuCfAH2DgVjMBOME/cN8PGQl4s8=;
        b=Vk6frEr6Nk7UGCWf5cxbAYUQuJUszJfUQNZrgvuoWq24gMa2KhylZZLm61qaWNRZi+
         Z/7ifh3eMeNL7xB8QM5ZEkwn52yz2AosFiY6pO4sBS8FZvu4EmoFlxI+Bu0WU/4u5Zya
         wdgllxDhUBYdQoWPKTRBvF2LXt4dkmC1dVYzzH/qq4mKG3HTQU0W7yG8uWUdhlH9NMQt
         cvJKrtyynN3yR3bGyytQOLhgp71+9AJNxOKNk+6ak8Xs6CxIwCyNbhcoKNLnm8V+/yoq
         Mn5P+6rTI4ZRrWpuEy1YdC2U21dhFfzujRcr63vYM3t1z3JsZqVFTk4r3glGZRb1fo01
         k/BA==
X-Gm-Message-State: AOAM531c8zAKdLUiT3e3TwME/5M28dIl5bT1OU0XesIuuLUsCYy/ARpL
        ghJuvGM/Vjxvmln88ntkqbt+28GQf2WjXSti1V0BPQ==
X-Google-Smtp-Source: ABdhPJx/DMSJC2Cpd/wQ055uvougZWWjZP6hhmbGd6G9dfbbiSsd0soImYQZ8yfwk1SAagedSkDl/EIK1aDSAdY/q8k=
X-Received: by 2002:a19:6748:: with SMTP id e8mr6750942lfj.358.1642163667220;
 Fri, 14 Jan 2022 04:34:27 -0800 (PST)
MIME-Version: 1.0
References: <1641749107-31979-1-git-send-email-quic_mkshah@quicinc.com> <1641749107-31979-8-git-send-email-quic_mkshah@quicinc.com>
In-Reply-To: <1641749107-31979-8-git-send-email-quic_mkshah@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 14 Jan 2022 13:33:51 +0100
Message-ID: <CAPDyKFq=VdHzdmmoXBKwWvn1kdL2egX2AM_hERqvM56mVBcGzg@mail.gmail.com>
Subject: Re: [PATCH 07/10] arm64: dts: qcom: Add power-domains property for apps_rsc
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org,
        quic_lsrao@quicinc.com, quic_rjendra@quicinc.com,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 9 Jan 2022 at 18:26, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> Add power-domains property which allows apps_rsc device to attach
> to cluster power domain on sm8150, sm8250, sm8350 and sm8450.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 7826564..83a44f5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3559,6 +3559,7 @@
>                                           <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>,
>                                           <CONTROL_TCS 1>;
> +                       power-domains = <&CLUSTER_PD>;
>
>                         rpmhcc: clock-controller {
>                                 compatible = "qcom,sm8150-rpmh-clk";
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 077d0ab..ebb4a4e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4593,6 +4593,7 @@
>                         qcom,drv-id = <2>;
>                         qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>, <CONTROL_TCS 1>;
> +                       power-domains = <&CLUSTER_PD>;
>
>                         rpmhcc: clock-controller {
>                                 compatible = "qcom,sm8250-rpmh-clk";
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 665f79f..2c5dc305 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1803,6 +1803,7 @@
>                         qcom,drv-id = <2>;
>                         qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
>                                           <WAKE_TCS    3>, <CONTROL_TCS 0>;
> +                       power-domains = <&CLUSTER_PD>;
>
>                         rpmhcc: clock-controller {
>                                 compatible = "qcom,sm8350-rpmh-clk";
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 5e329f8..acd122a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -910,6 +910,7 @@
>                         qcom,drv-id = <2>;
>                         qcom,tcs-config = <ACTIVE_TCS  3>, <SLEEP_TCS   2>,
>                                           <WAKE_TCS    2>, <CONTROL_TCS 0>;
> +                       power-domains = <&CLUSTER_PD>;
>
>                         apps_bcm_voter: bcm-voter {
>                                 compatible = "qcom,bcm-voter";
> --
> 2.7.4
>
