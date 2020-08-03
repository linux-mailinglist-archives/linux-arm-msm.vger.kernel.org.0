Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D40D23AC22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 20:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgHCSJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 14:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCSJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 14:09:34 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20B8C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2020 11:09:33 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j186so19691261vsd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2020 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVtWQUGpmw8jhNyuuKCyNkZI5368yArYPxJOwi5ESm4=;
        b=coDDm+vPAuh6Fuh2z/owncaMvXWcMJtlRYB7hg03SaGSChcDWim/iI7wQu6Gtru4LI
         LNNy/0P59m7hXu3w8xvG2OpKtNRj3lQLUBTX0H4+160GNmcD4+O94D6G26WpSJdbxPGx
         S9b8lEbGDCKUi6B37X/bH0jLuj/oO8PhAeAds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVtWQUGpmw8jhNyuuKCyNkZI5368yArYPxJOwi5ESm4=;
        b=cCEAUOecuXypiPK7LbtbdEnzgS8IYKbm5EarKyVsbd0mS04L9CU3+/y3jlNHq56zVy
         W4N9HZLhJBLy6I3ZNAi03nMnqjID204B74snrPsy0KbmyhkIWLUQti2RRo6ULhb12/VP
         EeypUMtaqo+f4RybmknLF2Mas00bAjzBraVMDpE6XMEd4zI0SQKrvV1+x4nAvx4PK9PL
         Ep+uNf+5erNrtkJrV/UgFcX7Mcl0IZGoKDV23WLQs7UPeeyB3Fdhg7AwCcLSBzUpl7X1
         C9BbsZw73uv4f76oAwWqnHQAg7DGsifmxQABhp605Rh4KntddQsDPsLiMFrw9t4cgDi6
         183w==
X-Gm-Message-State: AOAM530NziB4kDLHe3dzkD5yfxkF7kEcaXOy9Zvg51GCxl+fuivq9se9
        3V4hCCpo7fnTPeI5Qs+/HgeuZu1UPcI=
X-Google-Smtp-Source: ABdhPJyOZrAshmUx8PB3c4mNt3z2YNG42Wb464wiuzXW/wYj3JKo4WB48G6H8XJlZIMssCDfpxughQ==
X-Received: by 2002:a05:6102:85:: with SMTP id t5mr2824698vsp.1.1596478172694;
        Mon, 03 Aug 2020 11:09:32 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id t7sm750224vkk.14.2020.08.03.11.09.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 11:09:31 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id u15so1419683uau.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2020 11:09:30 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr12122918uan.121.1596478170242;
 Mon, 03 Aug 2020 11:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <1596305615-5894-1-git-send-email-tdas@codeaurora.org> <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Aug 2020 11:09:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm4bF07OFQv85kmOyzK9=TcC0gJuuxcJwUxGNed06QTw@mail.gmail.com>
Message-ID: <CAD=FV=Vm4bF07OFQv85kmOyzK9=TcC0gJuuxcJwUxGNed06QTw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
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
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Aug 1, 2020 at 11:14 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Update the clock controller nodes for Low power audio subsystem
> functionality.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..7cf8bfe 100644
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
> @@ -3312,6 +3313,30 @@
>                         qcom,msa-fixed-perm;
>                         status = "disabled";
>                 };
> +
> +               lpasscc: clock-controller@62d00000 {
> +                       compatible = "qcom,sc7180-lpasscorecc";
> +                       reg = <0 0x62d00000 0 0x50000>,
> +                           <0 0x62780000 0 0x30000>;
> +                       reg-names = "lpass_core_cc", "lpass_audio_cc";
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "bi_tcxo";
> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpass_hm: clock-controller@63000000 {
> +                       compatible = "qcom,sc7180-lpasshm";
> +                       reg = <0 0x63000000 0 0x28>;
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "bi_tcxo";
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>         };

You end up adding a blank line at the end that Bjron can probably fix
when applying, but other than that this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
