Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25D53A48E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 20:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFKSxa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 14:53:30 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:36418 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhFKSx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 14:53:29 -0400
Received: by mail-wm1-f52.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so8721355wmq.1;
        Fri, 11 Jun 2021 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=blJyy+GtTYyuD/0ZaPoBiTfk3dsMy/ByVxg74gzG+ds=;
        b=BLrnWDrgsi5CxXDJegG9hi2UcF8InW5KJdpB3yZ8p7LE3AnxxsyC95QVJzBBnQOJ1B
         J+1lBOrwwhXJElGH4sjUbXVTwzB+uS7F8YjZ5xhrOOX93pliZokU7v9NxxB+kFqt+t8Y
         ZJ+XEahzWY4gW2fUnWfqDZlrv6lMJYufT2f0bbRYMDJ6WpzeDQeAcn9JB0KqyRdGv/j6
         uuS0tC0SWHbTyRZQ43W/HAU7WLgVGr+3/khk4R/8t3d6dOWe7bW3/Ib/Js9pEkCwEleh
         /Y7S/Ts4xxQfU4PNxWNiW2p9iIz2q9exSKhiT3YOnIyXXxuSc8F/ZMv6f5z8ce76b1QG
         1u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=blJyy+GtTYyuD/0ZaPoBiTfk3dsMy/ByVxg74gzG+ds=;
        b=PIZ+gxO3LyAbkSXNGXEMP+xDAXq9BrCVhb8o0RS+4XATteaZBKbsrZkPzYhk5kjKKX
         cyfz8mQeXUUmK6k5EoAZlNxHjhElT1DhLP1lAHjcHDGzHJH/o4Fyvq8M4fT9synl32HQ
         ocQPKk4SJ/WDB7ZOEzoelBa2zQ1oLxWJwiIIoQyN2TivMHtTJZj7Usesfu4tAq6zK6yv
         Monssw1ouggIHzCuzpi/61JzYY1Paycl+4kLl1nzwJo2tYxBul8QyUULztiUkR5VDmWG
         7XoQ49702xZOvZpxlWMrmrBb6hdKsc7SDCsAMsZeG926e4PyXZ4Px8URK5HThHpOPNf0
         cfHg==
X-Gm-Message-State: AOAM533ytgwWvPIyBmMmtY3ncoA541myLwtAxyBHOkqMgH+w3Ep7AdbC
        FmKqer8Gf6kjTQROejyfUGiMcO0pEG2t2n/nR+YUnYYt+vA=
X-Google-Smtp-Source: ABdhPJxRCn7VlJXU1vRcMg0lL7XvKEJrkJimqye0cQukJFVWVFGMDBf1SMg/+Lcr+kib8QHMKvSPSuZX3SuRCilDk4M=
X-Received: by 2002:a05:600c:1ca6:: with SMTP id k38mr22418945wms.49.1623437420485;
 Fri, 11 Jun 2021 11:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210611113514.27173-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210611113514.27173-1-konrad.dybcio@somainline.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 11 Jun 2021 11:54:14 -0700
Message-ID: <CAF6AEGv3UivqUKb8wkCgzpApORV=ucswOzUh7BQMWRiif5ZJdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: Disable Adreno and Venus by default
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 11, 2021 at 4:35 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> Components that rely on proprietary (not to mention signed!) firmware should
> not be enabled by default, as lack of the aforementioned firmware could cause
> various issues, from random errors to straight-up failing to boot.

I admit I probably don't test much without fw, but I think maybe
*that* is the issue to solve instead.

Taking a guess, I think the situation is that you have *some* of the
fw (ie. the unsigned parts coming from linux-firmware) but not
specifically the zap fw.  So adreno_zap_shader_load() returns -ENODEV,
which is interpreted to mean "this is a platform that doesn't need zap
to take GPU out of secure mode", and then things go boom when we try
to write RBBM_SECVID_TRUST_CNTL ?

Which I think is down to missing the "firmware-name" property in the
device specific dts

BR,
-R

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts  | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts  | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  6 ++++++
>  4 files changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 5f41de20aa22..a5b742325261 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -552,7 +552,13 @@ &dsi0_phy {
>         vdds-supply = <&vreg_l5a_0p88>;
>  };
>
> +&gmu {
> +       status = "okay";
> +};
> +
>  &gpu {
> +       status = "okay";
> +
>         zap-shader {
>                 memory-region = <&gpu_mem>;
>                 firmware-name = "qcom/sm8250/a650_zap.mbn";
> @@ -1352,6 +1358,10 @@ &vamacro {
>         qcom,dmic-sample-rate = <600000>;
>  };
>
> +&venus {
> +       status = "okay";
> +};
> +
>  /* PINCTRL - additions to nodes defined in sm8250.dtsi */
>  &qup_spi0_cs_gpio {
>         drive-strength = <6>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> index c3a2c5aa6fe9..397359ee2f85 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -365,6 +365,14 @@ vreg_l7f_1p8: ldo7 {
>         };
>  };
>
> +&gmu {
> +       status = "okay";
> +};
> +
> +&gpu {
> +       status = "okay";
> +};
> +
>  &qupv3_id_1 {
>         status = "okay";
>  };
> @@ -452,3 +460,7 @@ &usb_1_dwc3 {
>  &usb_2_dwc3 {
>         dr_mode = "host";
>  };
> +
> +&venus {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> index cfc4d1febe0f..062b944be91d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
> @@ -465,7 +465,13 @@ &cdsp {
>         firmware-name = "qcom/sm8250/cdsp.mbn";
>  };
>
> +&gmu {
> +       status = "okay";
> +};
> +
>  &gpu {
> +       status = "okay";
> +
>         zap-shader {
>                 memory-region = <&gpu_mem>;
>                 firmware-name = "qcom/sm8250/a650_zap.mbn";
> @@ -691,3 +697,7 @@ &usb_2_qmpphy {
>         vdda-phy-supply = <&vreg_l9a_1p2>;
>         vdda-pll-supply = <&vreg_l18a_0p9>;
>  };
> +
> +&venus {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 4c0de12aaba6..fc1049c2bb11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -1746,6 +1746,8 @@ gpu: gpu@3d00000 {
>
>                         qcom,gmu = <&gmu>;
>
> +                       status = "disabled";
> +
>                         zap-shader {
>                                 memory-region = <&gpu_mem>;
>                         };
> @@ -1819,6 +1821,8 @@ gmu: gmu@3d6a000 {
>
>                         operating-points-v2 = <&gmu_opp_table>;
>
> +                       status = "disabled";
> +
>                         gmu_opp_table: opp-table {
>                                 compatible = "operating-points-v2";
>
> @@ -2323,6 +2327,8 @@ venus: video-codec@aa00000 {
>                                  <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>                         reset-names = "bus", "core";
>
> +                       status = "disabled";
> +
>                         video-decoder {
>                                 compatible = "venus-decoder";
>                         };
> --
> 2.32.0
>
