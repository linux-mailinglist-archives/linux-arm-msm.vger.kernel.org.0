Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70648E41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 07:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239300AbiANGPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 01:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239276AbiANGPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 01:15:11 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66837C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:15:11 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso8961160otf.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 22:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+rs9ib3g33qLU8AiFD4BXM4f1mQTvOuGI7OOGqMW8N0=;
        b=HQeHa183ss2xwvQGgBFFyDJIQp+7ijobwLR5NxByE8gCac3Jax7HEx9VX9BSyZISRT
         2uG/NcCoeEx8mR91DRlBPOZWbXHIkLQjNxtWoXIvFFQN360+ZB22UHzNeeUORs2ogXdy
         CWZTGLlpk9an7/T91xXpqnSQt3cf0Z0XX1hGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+rs9ib3g33qLU8AiFD4BXM4f1mQTvOuGI7OOGqMW8N0=;
        b=rK2hyBpVjZjuTySiLqscHE7VasQ0qhZ3CqKqfr5lUHhl7bJNXBHOgx3POJw04BC5eE
         MSdbBbBi5t40TCtBWrwZUAY/JZ7ZpQpQmu8KpoEewphcs0fI4eE150r7PZVd0LXdeWsX
         yngoEzi64Yra6xDkbkp50BDyKDClOHo64b3XcbG4P1MT8uSHhPaniMZUhrYbYXDv1Zlc
         2krk+MopUUDdkBTecfAw29bp8gqRa3hGU7yW/hy4IPUs9plqdcNbqIM8lQqa3tbp8F3D
         2Ek21ZBdyldHu5PvkXU/1leiYL5WbmDdiQjVbiH8HFptbqKYYigJcJNtoIBYTu8VDn8l
         f6ig==
X-Gm-Message-State: AOAM5331wWH3KV9TqyiUjUE8OcO3vJeRyJl7Z0mjoRizk2dqDWkkrlRc
        9YQVivdXH9Q2TJcfV0k2NI4QpWJm7M/3y+kGim/vrw==
X-Google-Smtp-Source: ABdhPJzm2wgY+NMsHJ0/4tH0BadICR5mj3FOiJj6GgxeTjHljLVrIA8pvFs9jP14eFguOM+jj+Hkb+jkwnCm1mWwxaU=
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr4785522otr.77.1642140910672;
 Thu, 13 Jan 2022 22:15:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 22:15:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220113164233.3.Iac012fa8d727be46448d47027a1813ea716423ce@changeid>
References: <20220114004303.905808-1-dianders@chromium.org> <20220113164233.3.Iac012fa8d727be46448d47027a1813ea716423ce@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 13 Jan 2022 22:15:09 -0800
Message-ID: <CAE-0n51e=rYtC3KyhpiO7KSJArxw2pmvh5v8TZ8Yrf-ToTv3Bw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7280: Factor out Chrome common fragment
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     quic_rjendra@quicinc.com, sibis@codeaurora.org,
        kgodara1@codeaurora.org, mka@chromium.org, pmaliset@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-01-13 16:43:02)
> This factors out a device tree fragment from some sc7280 device
> trees. It represents the device tree bits that should be included for
> "Chrome" based sc7280 boards. On these boards the bootloader (Coreboot
> + Depthcharge) configures things slightly different than the
> bootloader that Qualcomm provides. The modem firmware on these boards
> also works differently than on other Qulacomm products and thus the
> reserved memory map needs to be adjusted.
>
> NOTES:
> - This is _not_ quite a no-op change. The "herobrine" and "idp"
>   fragments here were different and it looks like someone simply
>   forgot to update the herobrine version. This updates a few numbers
>   to match IDP. This will also cause the `pmk8350_pon` to be disabled
>   on idp/crd, which I belive is a correct change.
> - At the moment this assumes LTE skus. Once it's clearer how WiFi SKUs
>   will work (how much of the memory map they can reclaim) we may add
>   an extra fragment that will rejigger one way or the other.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One comment below.

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> new file mode 100644
> index 000000000000..9d4f25f77152
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -0,0 +1,97 @@
[...]
> +
> +/* Modem setup is different on Chrome setups than typical Qualcomm setup */
> +&remoteproc_mpss {
> +       status = "okay";
> +       compatible = "qcom,sc7280-mss-pil";
> +       iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> +       memory-region = <&mba_mem &mpss_mem>;

I'd prefer this be

	memory-region = <&mba_mem>, <&mpss_mem>;

so that we know mpss_mem isn't an "argument" or cell for mba_mem. I see
that this is just moving around in this patch though so probably can be
done in a followup.

> +};
> +
> +/* Increase the size from 2.5MB to 8MB */
> +&rmtfs_mem {
> +       reg = <0x0 0x9c900000 0x0 0x800000>;
> +};
