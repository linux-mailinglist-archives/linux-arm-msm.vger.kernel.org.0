Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49EB43A684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 00:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhJYW2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 18:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhJYW2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 18:28:20 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ED2C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 15:25:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u69so17675278oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WFDwbjLin57JuF/SW9mFY64wQd0e/2AHNQmaqQ+zAzw=;
        b=hfK9d+6sqAbG17oSuDhj5y6u9w8qLXtsFL/VMBOaea0q7mFEKscsmbf4qSERmi7GPR
         nMrTraKNOrwWzb5iGo8HeR1xfI4PGbHSlebDkK03yLardVyeDEeCKG/cccpWNIOK95Gm
         BCQW10Ucl0LWO1HxYgXe/Us9WYWmIbv83bHuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WFDwbjLin57JuF/SW9mFY64wQd0e/2AHNQmaqQ+zAzw=;
        b=bJAK80Z1ZFmNVNKFoZxYv0Hz84xbioVmIbpTZmvo/JE2dlPpx9Z/32rm1l79juyq+9
         Kns/vISCC93OuwQWLsSzdM8X1gehDRCW/9Et/Qan4wDUk48+wvE8NgB/IQ/oEVNp6HnY
         p1ok4IKnNW/cNoj7e17moG5yOkdGFofU0ugZ1mMjywVpom41xeSk0iPv+mcd42cw4ELe
         /mExZHDt3B17nswUYd4T3Nfl4ZrEvgl/E4ETsJPTurU/Ayiwh6hgaTA45O+CQ/pFz0Yc
         zNquvUQ6B7hKsHvW72vwZ+pG9Fzv5BA054MqKr+U6dZ/9O2k3GL5QJp0qE9TUBZVAmlX
         0IMw==
X-Gm-Message-State: AOAM533K8FQle1kObcUw04CkSufvTGOMVZvqXCobRa1hA3yKyn1Uqc0/
        dAswUFSppL2CHvs+JvWWimAOuipLPxnBkNdRkw03wQ==
X-Google-Smtp-Source: ABdhPJzzpQ1i3ICHPwTO0aUU1Fwdimfo83m8s5VOlm3vJvVJnxPlnRUx6c+3XcLyUvD8Ng94h5nwNZISc3dIfkOouv8=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr25563747oib.32.1635200757700;
 Mon, 25 Oct 2021 15:25:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 15:25:57 -0700
MIME-Version: 1.0
In-Reply-To: <1635152851-23660-4-git-send-email-quic_c_sanm@quicinc.com>
References: <1635152851-23660-1-git-send-email-quic_c_sanm@quicinc.com> <1635152851-23660-4-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 15:25:57 -0700
Message-ID: <CAE-0n52wGtyd7pUTHL4XtFGz1_41OETi3t8CVVL-yG06RYvsVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add cx power domain support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-10-25 02:07:31)
> Add multi pd support to set performance state for cx domain
> to maintain minimum corner voltage for USB clocks.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
> v2:
> Changed rpmhd_opp_svs to rmphd_opp_nom for cx domain.
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index d74a4c8..9e3b6ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2538,7 +2538,8 @@
>                         interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
>                                           "dm_hs_phy_irq", "ss_phy_irq";
>
> -                       power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +                       power-domains = <&rpmhpd SC7280_CX>, <&gcc GCC_USB30_PRIM_GDSC>;

Order matters and thus the order here can't be flipped.

> +                       required-opps = <&rpmhpd_opp_svs>, <>;
