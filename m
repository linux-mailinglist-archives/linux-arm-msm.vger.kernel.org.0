Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE9E152055
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 19:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgBDSTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 13:19:15 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39091 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBDSTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 13:19:14 -0500
Received: by mail-lf1-f65.google.com with SMTP id t23so12863049lfk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=263l/kXk/O2VqBW1YQGhsnniYx47UR4rp/DuGLM6uRs=;
        b=kxqH2zudhtDJEy7ymcHvBzEW3FJpBMLx3CFfUdHnAVFXasTaqStnKXJa88Qd5MfzHr
         UbQLp0c/9m7cBeJM4BVWCs6h0rihDUFeauy/E0ly1EBdlc4HixVHSzUtqetSdUQpXlOl
         sp+wsHotrzDUY7T5d+hui7bjrII+OkqAXQ18+cZI79daW41LyaNoevVvDscXkzAJM+Da
         pFnLz+Bo0x/6YNwxIkn0ZR0T9A2shQ7hcUI//wLyi80iY6sn0D4f4MSqErvemK32An+P
         k+oQvTAFqRfw+sUdQp8fYL82mXDNOkWlnyytsSf04J60eph8Db99ifBecXICZbjBUO17
         pmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=263l/kXk/O2VqBW1YQGhsnniYx47UR4rp/DuGLM6uRs=;
        b=d9qJN2CcghJu9QN3l6any2oqeudQjKp2da3390jdj1VY5CfbFSpP6EarWN0NCVcmqM
         rCBBjcIs3Vn1dxVDtN6bmfNi/Y1WLrt04gSp1Nqbu11M94QBpR9FGVbWIrzCVwskKnkK
         /kbfDTWiG5bB1TpN4v/+eJf9zFzLJ1MvNTwt04cXz0iArAuFiX8xrxeYqVoExfHP+HnF
         wYDF3VlfrC3y5349H0K2qv60AW7jJNw9J8BLT8K8Mg2RJlIVEdgjXX6BBRjNYHmMNSpV
         ma4t2BQMMZ35crczXoFvELFQNfBrgs8nFRSxrBZY80AtJRGRaE/IZfVA1N9guNAZesZm
         hczg==
X-Gm-Message-State: APjAAAVKBp41Ed6qYB/uLFFZjAo0J66uMoy+z9caFEk9lkwre7ygbHoP
        Ow9OruIvyWSEeB2iuEw3PDQxSe7SWN5sisEk7HDmpw==
X-Google-Smtp-Source: APXvYqxYI97dIGwKe2kfoCU+bRfD51KxBYO1PfazopT6MD7LCXVkpTRstdxdtvoPSvV2TW99mgjSmdDAHXDrIn3Whl8=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr15395596lfc.130.1580840350453;
 Tue, 04 Feb 2020 10:19:10 -0800 (PST)
MIME-Version: 1.0
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org> <1578630784-962-7-git-send-email-daidavid1@codeaurora.org>
In-Reply-To: <1578630784-962-7-git-send-email-daidavid1@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Tue, 4 Feb 2020 10:18:34 -0800
Message-ID: <CAE=gft7qtfQjKK-MGgR_sK+Lsi2GmXgPkSsysD-DdUmFW4qMQw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: sdm845: Redefine interconnect provider
 DT nodes
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 9, 2020 at 8:33 PM David Dai <daidavid1@codeaurora.org> wrote:
>
> Add the DT nodes for each of the Network-On-Chip interconnect
> buses found on SDM845 based platform and redefine the rsc_hlos
> child node as a bcm-voter device to better represent the hardware.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index ddb1f23..7c617a9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1364,6 +1364,55 @@
>                         interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               mem_noc: interconnect@1380000 {
> +                       compatible = "qcom,sdm845-mem-noc";
> +                       reg = <0 0x01380000 0 0x27200>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               dc_noc: interconnect@14e0000 {
> +                       compatible = "qcom,sdm845-dc-noc";
> +                       reg = <0 0x014e0000 0 0x400>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               config_noc: interconnect@1500000 {
> +                       compatible = "qcom,sdm845-config-noc";
> +                       reg = <0 0x01500000 0 0x5080>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               system_noc: interconnect@1620000 {
> +                       compatible = "qcom,sdm845-system-noc";
> +                       reg = <0 0x01620000 0 0x18080>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               aggre1_noc: interconnect@16e0000 {
> +                       compatible = "qcom,sdm845-aggre1-noc";
> +                       reg = <0 0x016e0000 0 0xd080>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               aggre2_noc: interconnect@1700000 {
> +                       compatible = "qcom,sdm845-aggre2-noc";
> +                       reg = <0 0x01700000 0 0x3b100>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
> +               mmss_noc: interconnect@1740000 {
> +                       compatible = "qcom,sdm845-mmss-noc";
> +                       reg = <0 0x01740000 0 0x1c1000>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
>                 ufs_mem_hc: ufshc@1d84000 {
>                         compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
>                                      "jedec,ufs-2.0";
> @@ -3100,6 +3149,13 @@
>                         #mbox-cells = <1>;
>                 };
>
> +               gladiator_noc: interconnect@17900000 {
> +                       compatible = "qcom,sdm845-gladiator-noc";
> +                       reg = <0 0x17900000 0 0xd080>;
> +                       #interconnect-cells = <1>;
> +                       qcom,bcm-voters = <&apps_bcm_voter>;
> +               };
> +
>                 apps_rsc: rsc@179c0000 {
>                         label = "apps_rsc";
>                         compatible = "qcom,rpmh-rsc";
> @@ -3174,9 +3230,8 @@
>                                 };
>                         };
>
> -                       rsc_hlos: interconnect {
> -                               compatible = "qcom,sdm845-rsc-hlos";
> -                               #interconnect-cells = <1>;

With this reworking of the bindings the examples in these files are now broken:
Documentation/devicetree/bindings/display/msm/gpu.txt
Documentation/devicetree/bindings/display/msm/dpu.txt

It would be nice to fix them up in a subsequent change.
-Evan
