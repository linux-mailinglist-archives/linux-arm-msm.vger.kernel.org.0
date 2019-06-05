Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C7D35635
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 07:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfFEF1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 01:27:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:32866 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEF1D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 01:27:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE64F6074C; Wed,  5 Jun 2019 05:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559712422;
        bh=1KJN3mFJVMBneJMO/d67H03JGGeCwXkWQw9EA/NpWtY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QLRkqZn0wy/3UdzNoUrvwffxt8Kr6B9Bg9hCvpd7OzILqWtSPMzO1mT9DrKc4T7dl
         TCKl4DhH4x1HTlf+wYnBqlCrS6l26tm6noTFtu6EDec+3rzmkMVw+jYWPreqhjkU9r
         ppodi2GjDvQz88A7gtDzJjYBe/Alu13bndVse+FY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C3A3C609CD;
        Wed,  5 Jun 2019 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559712422;
        bh=1KJN3mFJVMBneJMO/d67H03JGGeCwXkWQw9EA/NpWtY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QLRkqZn0wy/3UdzNoUrvwffxt8Kr6B9Bg9hCvpd7OzILqWtSPMzO1mT9DrKc4T7dl
         TCKl4DhH4x1HTlf+wYnBqlCrS6l26tm6noTFtu6EDec+3rzmkMVw+jYWPreqhjkU9r
         ppodi2GjDvQz88A7gtDzJjYBe/Alu13bndVse+FY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3A3C609CD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f46.google.com with SMTP id p26so3944263edr.2;
        Tue, 04 Jun 2019 22:27:01 -0700 (PDT)
X-Gm-Message-State: APjAAAVgm0GzdoB9JK5inlhi3sv1gMB6DCijHyYDQzr/7fu/yEaypf9/
        YRee09mrHqqOfEs7/H4bf9BQ+HDzSLpr//+yXho=
X-Google-Smtp-Source: APXvYqxdlbGMVdeW3rWEdt46VbbnhcG5V+U3jyhEom0QjHb/okBPll2garbSRrpQ9xZmyFz02Z2v9+15OuPvo9kStv0=
X-Received: by 2002:a50:b797:: with SMTP id h23mr40316638ede.197.1559712420354;
 Tue, 04 Jun 2019 22:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190513210747.22429-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190513210747.22429-1-bjorn.andersson@linaro.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Wed, 5 Jun 2019 10:56:49 +0530
X-Gmail-Original-Message-ID: <CAFp+6iH_pNPVs5QA2fa87ZoVngEFJ362sDivAWzzWPC6K0S5mA@mail.gmail.com>
Message-ID: <CAFp+6iH_pNPVs5QA2fa87ZoVngEFJ362sDivAWzzWPC6K0S5mA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add Truly display
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 14, 2019 at 2:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Bring in the Truly display and enable the DSI channels to make the
> mdss/gpu probe, even though we're lacking LABIB, preventing us from
> seeing anything on the screen.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Looks good to me and work well too with a wip lab-ibb driver change.

Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>

>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 79 +++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 02b8357c8ce8..83198a19ff57 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -352,6 +352,77 @@
>         status = "okay";
>  };
>
> +&dsi0 {
> +       status = "okay";
> +       vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +       qcom,dual-dsi-mode;
> +       qcom,master-dsi;
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&truly_in_0>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +
> +       panel@0 {
> +               compatible = "truly,nt35597-2K-display";
> +               reg = <0>;
> +               vdda-supply = <&vreg_l14a_1p88>;
> +
> +               reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +               mode-gpios = <&tlmm 52 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               truly_in_0: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               truly_in_1: endpoint {
> +                                       remote-endpoint = <&dsi1_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi0_phy {
> +       status = "okay";
> +       vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
> +&dsi1 {
> +       status = "okay";
> +       vdda-supply = <&vdda_mipi_dsi1_1p2>;
> +
> +       qcom,dual-dsi-mode;
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&truly_in_1>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi1_phy {
> +       status = "okay";
> +       vdds-supply = <&vdda_mipi_dsi1_pll>;
> +};
> +
>  &gcc {
>         protected-clocks = <GCC_QSPI_CORE_CLK>,
>                            <GCC_QSPI_CORE_CLK_SRC>,
> @@ -365,6 +436,14 @@
>         clock-frequency = <400000>;
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};
> +
>  &qupv3_id_1 {
>         status = "okay";
>  };
> --
> 2.18.0
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
