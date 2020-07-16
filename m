Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A53E222A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgGPRkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 13:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGPRkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 13:40:37 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC32C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 10:40:36 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id t11so3095626qvk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YZ4K32ILO0YG7+Onb9+bb1wbPOZ0IsAwcOMvX1Wf1U=;
        b=DgIAFh9xOdcGljTcbCAE1IcHuv2aaa2mBbzzoSyx+PkPEnrbCyvTBNyFXPYLKiG9Pm
         8pVv0O31SbSSnI5+44WNuLdO577HNgfluZBBRqvKCeX59P3Z6sO4UXk0PT8vXh6Lx/2V
         3FtSeQB0FwxrAc1mp5ySe0Pf0i5r+sXaq8c6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YZ4K32ILO0YG7+Onb9+bb1wbPOZ0IsAwcOMvX1Wf1U=;
        b=E7/dzS4L/oHrF5s9Vwf0W9hDAfrHFOTrEvNkIkkhWNWc+vN5DJdO/PdVb8gIAMjNBA
         LX1HUgINY8QCqRSpQYFLDGiJs/Rh5EvL7iZKPBYBZOzkRnoiVh57F6RqUUJNN0PkmeLs
         +UAEzklP0oey+VQZfkJQuR4nYYNaO69Pnpzy0mwONCh5IWXobjs2iR0EDBrsWl8XuBIF
         HQEXBWPHCzEokdUrrd5Zt1WVHNbIbLqYzcDC5wbZ/FZpRHF64alE/Zbz9BzTv7tFsKac
         mUJ+dRjv2wpvmtY/wV2yQnLpvsPAGpsTnDvU+xxjTwdRjbka2e9JySvqMxeP/MkTn619
         4Rfg==
X-Gm-Message-State: AOAM530ohcmw0+alSq3i0hUI4ZAddxcBPRp3SY3FqrEW69xCWqUSZ8pW
        vN08MEBTniraGjSzhLDWqwXLgWVipHc=
X-Google-Smtp-Source: ABdhPJzta07zVvtGO6ohdOWjoLZRXFE5jF5kpRQ5Tnj2iinJygvSEs+Umc14dreP/0w5L2m+VcF1jw==
X-Received: by 2002:a0c:99c5:: with SMTP id y5mr5504261qve.66.1594921235821;
        Thu, 16 Jul 2020 10:40:35 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id p36sm8695265qte.90.2020.07.16.10.40.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 10:40:35 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id y17so3208959ybm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 10:40:35 -0700 (PDT)
X-Received: by 2002:ab0:150c:: with SMTP id o12mr4397825uae.90.1594920887766;
 Thu, 16 Jul 2020 10:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1594796149-14778-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1594796149-14778-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jul 2020 10:34:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
Message-ID: <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 14, 2020 at 11:56 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Update the clock controller nodes for Low power audio subsystem
> functionality.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Somewhere here you should be pointing to the unlanded bindings patch, AKA:

https://lore.kernel.org/r/1594795010-9074-3-git-send-email-tdas@codeaurora.org

As per usual the fact that are using a new bindings #include file
means Qualcomm maintainers and clock maintainers will need to
coordinate landing and this needs to be pointed out.


>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 2be81a2..8c30a17 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -2136,6 +2137,27 @@
>                         };
>                 };
>
> +               lpasscc: clock-controller@62d00000 {
> +                       compatible = "qcom,sc7180-lpasscorecc";
> +                       reg = <0 0x62d00000 0 0x50000>,
> +                           <0 0x62780000 0 0x30000>;
> +                       reg-names = "lpass_core_cc", "lpass_audio_cc";
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +                       clock-names = "iface";
> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpass_hm: clock-controller@63000000 {
> +                       compatible = "qcom,sc7180-lpasshm";
> +                       reg = <0 0x63000000 0 0x28>;
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +                       clock-names = "iface";
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };

Question: would it ever make sense for a board not to need this clock
controller?  I ask because the sdm845 "lpass" clock controller is
"disabled" by default but yours here isn't.  I know sc7180 and sdm845
work pretty differently and perhaps the sdm845's default of "disabled"
was just overkill, but I thought I'd ask.


> +
>                 etm@7040000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0 0x07040000 0 0x1000>;

Your sort order is off.  You should be sorting by unit address.  Note
that the "ETM" has an extra 0 before its 7, so you're comparing 63 to
07 and you should be after.

Other than those small things above this patch looks like it matches
the example in the bindings, so as long as Rob / the clock guys are
fine with the bindings then this seems good to go.

-Doug
