Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4503221A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 22:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhBVVkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 16:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbhBVVkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 16:40:13 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECFBC06178A
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 13:39:28 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id h8so14231119qkk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3gtb67Rbv2Oe6UDQp4HWiS6Hu5OxgV81uFWpNkVCzA=;
        b=bQgaV3WmM9hI12gMDgOACFTrUnXNvNEEI20IhDcIxftZHYKoSnXOazZ1/QMf7VimNG
         Raw39gfaB0qGmNxB/RUh3yPWM4YiStFq0wv6U71TPOkVcwhdE+iY0cX5tCmx/SajQLZw
         tqQ4IaaRFYCr+SZ7DXSTmDmXtG0cdb1UbWiQPXDOkMZSOj+5hFMXrpQV/3szHl5AbuAY
         ///sVLgeOxDJouZYY2waVi4O1GKDJuN8pLSmZyc24qYhqjW9IT2i001MIw4ZTFnmNW3Y
         HN7czysY0OBk4/IcGyBfizC2h5GFRHx0svfuI/ngWxqRIaIhzJd4m8mVu6es7Kw0dzDv
         Jycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3gtb67Rbv2Oe6UDQp4HWiS6Hu5OxgV81uFWpNkVCzA=;
        b=lcAOfah8LXRbJ7leO/iDTe/cj1/nzQICM/mXS/iLLvdk62GB4e2hKpYrmQG12nxuMJ
         9C5+Opd144TEZlnnYWVcoIw+Qsf8lAe/D3prNl9FLE7UZOvXqavqx81x90CSnBVweZxY
         L6IyIwRnxGAn8oFUO9h9eEI5yOvFGAySwTIqiC6Is2vuz6FLxAlCyxEzoVbdUjfyKYIa
         nuW+EfO1hXZRxPZ644y3BU4P02XrV+HokShMEYtuJX9skYzSMN3f/n5VBYhtrlZf2SmB
         YfWfY8ImS6R0rcO6UJlklxorr092lyqQ+eOeocNSCC3aPjlMoDvoV7UUSLlVxDTfhfw5
         jhEQ==
X-Gm-Message-State: AOAM5313LECgecCya61yj2Zb9CKu9mmw4K2cqDQXTuZckvsC9UNRCbil
        s2nkD5nEnko8zhyMt1TTM1KQbjzjhuDO+0hUQSG3Yr87jrk7qA==
X-Google-Smtp-Source: ABdhPJy5Vzpy2tapziRuiToT1gzKIWjh/cEM9RiR2vHpBsbPlXddazpWLrGXrUzPpLQPL1I3WFAIPdmmGZcL9+Od5rU=
X-Received: by 2002:ae9:e715:: with SMTP id m21mr24218577qka.217.1614029967625;
 Mon, 22 Feb 2021 13:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20210222132817.1807788-1-bryan.odonoghue@linaro.org> <20210222132817.1807788-4-bryan.odonoghue@linaro.org>
In-Reply-To: <20210222132817.1807788-4-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 23 Feb 2021 00:39:16 +0300
Message-ID: <CAA8EJprQ5CoY6MoUptnTA+RLEzBhc+NfrAefBk4enSLP-9=jOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8250: Add venus DT node
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>, dikshita@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On Mon, 22 Feb 2021 at 16:29, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add DT entries for the sm8250 venus encoder/decoder.
>
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Co-developed-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 60 ++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 3639792411ce..6b6993995eca 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include <dt-bindings/clock/qcom,videocc-sm8250.h>
> +#include <dt-bindings/interconnect/qcom,sm8250.h>
>
>  / {
>         interrupt-parent = <&intc>;
> @@ -1811,6 +1812,65 @@ usb_2_dwc3: dwc3@a800000 {
>                         };
>                 };
>
> +               venus: video-codec@aa00000 {
> +                       compatible = "qcom,sm8250-venus";
> +                       reg = <0 0x0aa00000 0 0x100000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&videocc MVS0C_GDSC>,
> +                                       <&videocc MVS0_GDSC>,
> +                                       <&rpmhpd SM8250_MX>;
> +                       power-domain-names = "venus", "vcodec0", "mx";
> +                       operating-points-v2 = <&venus_opp_table>;
> +
> +                       clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                                <&videocc VIDEO_CC_MVS0C_CLK>,
> +                                <&videocc VIDEO_CC_MVS0_CLK>;
> +                       clock-names = "iface", "core", "vcodec0_core";
> +
> +                       interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_VENUS_CFG>,
> +                                       <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI_CH0>;
> +                       interconnect-names = "cpu-cfg", "video-mem";
> +
> +                       iommus = <&apps_smmu 0x2100 0x0400>;
> +                       memory-region = <&video_mem>;
> +
> +                       resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +                                <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +                       reset-names = "bus", "core";
> +
> +                       video-decoder {
> +                               compatible = "venus-decoder";
> +                       };
> +
> +                       video-encoder {
> +                               compatible = "venus-encoder";
> +                       };
> +
> +                       venus_opp_table: venus-opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-720000000 {
> +                                       opp-hz = /bits/ 64 <720000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-1014000000 {
> +                                       opp-hz = /bits/ 64 <1014000000>;
> +                                       required-opps = <&rpmhpd_opp_svs>;
> +                               };
> +
> +                               opp-1098000000 {
> +                                       opp-hz = /bits/ 64 <1098000000>;
> +                                       required-opps = <&rpmhpd_opp_svs_l1>;
> +                               };
> +
> +                               opp-1332000000 {
> +                                       opp-hz = /bits/ 64 <1332000000>;
> +                                       required-opps = <&rpmhpd_opp_nom>;
> +                               };
> +                       };
> +               };
> +
>                 videocc: clock-controller@abf0000 {
>                         compatible = "qcom,sm8250-videocc";
>                         reg = <0 0x0abf0000 0 0x10000>;
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
