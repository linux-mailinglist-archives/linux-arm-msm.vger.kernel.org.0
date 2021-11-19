Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F45B456707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 01:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhKSAye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 19:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhKSAye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 19:54:34 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35B6C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:51:33 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id bk14so18308507oib.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8cnZgiwj9XJw4naygCZKbqiNR9D8VICQZJ/k+OihQ6c=;
        b=ndKyn010qoO+1qpay+R1q/8TvFa7FXwoCZ5otYd7548pRDEtEpizZEyeBTiEL2qlaM
         a0Tr6InVcaAaanlYGPMJii+j1Y8JsfEARiTy1EeEyhssCZ66U15Iusrt4nWVGNoWU+Tx
         bFZ50xdSC9oypEdJgHpiDUc+qKPkL+gonsDL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8cnZgiwj9XJw4naygCZKbqiNR9D8VICQZJ/k+OihQ6c=;
        b=xa2L7gG7lccE7NDfcVOihZ5cq7j1KI/K5omAZVTsCSfrbtkmfVf1DjcwYptFVbrapH
         7eCzosCc0cklwtN8N2DPEcFrqEqpMqOBGI4n/dxvu0f4VaP9cTLCthSr8yBChjibIn6w
         bJPXTHXNkOJRaXh14DFSmSnebDtfnoFGMBMlCjM3lD4UXLwi/YHCKtkZ/SJXSyFWCU1U
         QPy3KMExQiACwJALHfb0NIuk1ttNnpjWXR2nDNDJd69XwyY1yTmaGtBor9kqF8Pok/rw
         cVgc8XsMRnfoIej2TB9L2rk/hhX0i92z7BY8XpkL7benjMdG4NHpRPLY/IJ8tfb+5kdJ
         Jk1Q==
X-Gm-Message-State: AOAM532Uc4fODaGm8c5S6owomolij+EpoWWzJflcvnVwF0EQ3tsenV1P
        +1tVbnsJQ3fWqIi5AF8KJI4P8iROFtHAXpTo9Pa/0w==
X-Google-Smtp-Source: ABdhPJzUlN8XM485ZkLTeetA/FYunzmdsJriYPUX3FQapC8fqcv/xBQkkQPI7XgpwgN+jEcRvsIXhYUgOrZn4c4JnKQ=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1274844oil.32.1637283092931;
 Thu, 18 Nov 2021 16:51:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Nov 2021 01:51:32 +0100
MIME-Version: 1.0
In-Reply-To: <1637251016-21923-1-git-send-email-pillair@codeaurora.org>
References: <1637251016-21923-1-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 19 Nov 2021 01:51:32 +0100
Message-ID: <CAE-0n51Z7qimY3k5qCYO5vAJ6o_skfUZL8xYpWN8a+2ThNVUGw@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-11-18 07:56:56)
> Add the WPSS remoteproc node in dts for
> PIL loading.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v5:
> - Update the clock names
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 56 +++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 9b991ba..ddab150 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -80,3 +80,7 @@
>                 qcom,pre-scaling = <1 1>;
>         };
>  };
> +
> +&remoteproc_wpss {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 365a2e0..76c2a90 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -134,6 +134,11 @@
>                         no-map;
>                 };
>
> +               wpss_mem: memory@9ae00000 {
> +                       no-map;
> +                       reg = <0x0 0x9ae00000 0x0 0x1900000>;

Almost always reg comes first. Please swap the order of these two
properties.

> +               };
> +
>                 rmtfs_mem: memory@9c900000 {
>                         compatible = "qcom,rmtfs-mem";
>                         reg = <0x0 0x9c900000 0x0 0x280000>;

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
