Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4043C436AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhJUSrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJUSrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:47:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBD9C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:44:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p16so4106832lfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pHhVhqquKAAu0r/TEo1pX9uwYVJYpZ/W1KvkF4P7FI4=;
        b=VjMGVxMVOpWL6wq1JlI0ny5rn2/k7ayNDN+LmlDqsGGvt1nPfeXXXei9kbVY8pWggA
         LEvnaRvdwolaVvJJNQgQAoMZ29GSC5Q084F7uRSv//T5pzeTPKQTkye6raJYb7B+5BGn
         9uwur3K2Jk84xzuvzLEfGn7i58Psa+FvJIIQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pHhVhqquKAAu0r/TEo1pX9uwYVJYpZ/W1KvkF4P7FI4=;
        b=ShUxAYlpBVOwm1oeCf0jxQaTpuSrPIqP1aEr4xXQBJqqpMf2aLU4FW4y7ZY/XwV4SZ
         Ljozw+pP+gEtGApKbFSsDwVLjzhzfpvPZP5stP8KfDEMWZBJL80ICcJhEl4y2KVdfFyt
         o7Wjxbt2EbwWnU5cpV6ytdcBF05aRR8MW2E2VWFmVACRYI6n2FzEyPxULaL34aYfLa3t
         YuKVnJFfi6XA7AlsHqjI2aTU8PK70xDVidXUdTbTmsRbZX1M6EuBXSPVP59lgLWbGd4w
         37gFpYy1xzoRQxd3l66PTEJqjgNdsEabREl5G3F4BBniQKV1UiOfY7xYMpINecYj0NNY
         Usqw==
X-Gm-Message-State: AOAM532trmJy1SJgMzzKcbmmJcZ155Tgp489Q2rPc1gMYn/wHRVr/uYY
        TWHPnJXjBU8fx81dt3vdTCdepU8c6wdVfY5qj7nFIw==
X-Google-Smtp-Source: ABdhPJy4eaetcGrXWg6kvpqouhiMbpbnWM+kCpqU9amIsEV9R86CYSl3AeDT7uzbbe5EmkZ/5AhH0lkpV1KslXDxoXA=
X-Received: by 2002:ac2:5c12:: with SMTP id r18mr6904239lfp.251.1634841885620;
 Thu, 21 Oct 2021 11:44:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:44:45 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com> <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 21 Oct 2021 11:44:45 -0700
Message-ID: <CAE-0n53NtSwin8RavHqF44d2adv9-_HMwDC+RzyzgQq8Z4t_yA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
To:     Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-10-20 06:58:53)
> From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> Add edp controller and phy DT nodes for sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>

Some comments below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


> Changes in v2:
>     - Move regulator definitions to board file (Matthias Kaehlcke)
>     - Move the gpio definitions to board file (Matthias Kaehlcke)
>     - Move the pinconf to board file (Matthias Kaehlcke)
>     - Move status property (Stephen Boyd)
>     - Drop flags from interrupts (Stephen Boyd)
>     - Add clock names one per line for readability (Stephen Boyd)
>     - Rename edp-opp-table (Stephen Boyd)
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index dd35882..4450277 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2575,7 +2575,7 @@
>                         reg = <0 0xaf00000 0 0x20000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>, <0>, <0>, <0>, <0>, <0>;
> +                                <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;

I can already tell this is going to be a merge mess! Can this also be
one cell per line?

>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>                                       "dsi0_phy_pll_out_byteclk",
>                                       "dsi0_phy_pll_out_dsiclk",
> @@ -2777,6 +2784,103 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       msm_edp: edp@aea0000 {
> +                               compatible = "qcom,sc7280-edp";
> +
> +                               reg = <0 0xaea0000 0 0x200>,
> +                                     <0 0xaea0200 0 0x200>,
> +                                     <0 0xaea0400 0 0xc00>,
> +                                     <0 0xaea1000 0 0x400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <14>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +                               clock-names = "core_xo",
> +                                             "core_ref",
> +                                             "core_iface",
> +                                             "core_aux",
> +                                             "ctrl_link",
> +                                             "ctrl_link_iface",
> +                                             "stream_pixel";
> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +                               phys = <&edp_phy>;
> +                               phy-names = "dp";
> +
> +                               operating-points-v2 = <&edp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               edp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf5_out>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               edp_opp_table: opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-160000000 {
> +                                               opp-hz = /bits/ 64 <160000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-270000000 {
> +                                               opp-hz = /bits/ 64 <270000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-540000000 {
> +                                               opp-hz = /bits/ 64 <540000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +
> +                       edp_phy: phy@aec2000 {

unit address needs to match first reg property. This should be

			edp_phy: phy@aec2a00

> +                               compatible = "qcom,sc7280-edp-phy";
> +
> +                               reg = <0 0xaec2a00 0 0x19c>,
> +                                     <0 0xaec2200 0 0xa0>,
> +                                     <0 0xaec2600 0 0xa0>,
> +                                     <0 0xaec2000 0 0x1c0>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>;
> +                               clock-names = "aux",
> +                                             "cfg_ahb";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               status = "disabled";
> +                       };
>                 };
>
>                 pdc: interrupt-controller@b220000 {
> @@ -3932,6 +4036,7 @@
>                                                          <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                                 };
>                         };
> +

Drop this?
