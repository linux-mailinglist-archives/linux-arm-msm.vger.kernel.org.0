Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CDB575140
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 16:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239672AbiGNO6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 10:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239730AbiGNO6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 10:58:33 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D7B5FA7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:58:32 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so2758287edb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gqvn61K0EIzqga5ZsmwE37Nmr0weGybQOppfrqBQs5Y=;
        b=icHjNfv2FUgdYdYEMXmROTOoNS9JW11vjJJi67wVg8YgRPCvAIKAkjjl/AsD5cdEKI
         OGGlXe4tj+abtMFrHjNNQSr/iaDwR2KZ3R+2cwwS7s8/ngpw7IX/xUuznNRBFh/kT1gu
         Sw3XijASuHCr5UKmpktcOViQo8ujJHxE2yXhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gqvn61K0EIzqga5ZsmwE37Nmr0weGybQOppfrqBQs5Y=;
        b=CkWU/p09f4QtI2KMjFc73fsLwFTq2S4uYdAmo7UZ7O9pesTvQcKK64cm23BKbySIo0
         cIZQdZNMmlk0GkQ0cuaGaoPUc2GCVLxn90VYaazFTh9+ugZfyAJ5Cp2G260NQyuyis+P
         MAoMAjjYNJpbKsDn1DRiIIcS/+/ouRcrlGBj5r/uMCWHibd23qEbF9DT1wUIHCKO1tM7
         3mLUOD5yU0c19Sqe4WHrWbPTJxExAu4m3dST+SNyIDuqUtDk/Ri8qoZgzRWQiZCtrYbP
         bi2NVIfGXYDChazN9toa7LxHIzu55jqtGFbwHRe4Ur2LEHcmZEB6cGzwaRlZuLQOSp03
         pwGQ==
X-Gm-Message-State: AJIora/ahDffo0/eetIGGtFh59YDguHvGIgInKnPi4djZuydSFQLsE1D
        nka/J9k1DpHem53ChrpmXQ6qESYxyPiOBs0a
X-Google-Smtp-Source: AGRyM1sXO5bE8ET1OaYb+xfvmpknzD7k4DPGPXVpDrNcsZeEpfFU75IADKWhcF81C0qPoh0y/EW1Vw==
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id dz16-20020a0564021d5000b0043a737c289cmr12837199edb.47.1657810710567;
        Thu, 14 Jul 2022 07:58:30 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id lc10-20020a170906f90a00b0070efa110afcsm792756ejb.83.2022.07.14.07.58.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 07:58:29 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so1382901wmj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:58:29 -0700 (PDT)
X-Received: by 2002:a05:600c:285:b0:3a2:e5fd:84eb with SMTP id
 5-20020a05600c028500b003a2e5fd84ebmr9737438wmk.151.1657810708973; Thu, 14 Jul
 2022 07:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220714074958.86721-1-jinghung.chen3@hotmail.com> <SG2PR03MB5006A1A4A5F9942C1EA9FA22CC889@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB5006A1A4A5F9942C1EA9FA22CC889@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Jul 2022 07:58:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XST+cuy=EM1A_08H2+_CHFvhuzYOkWe5RAxsTvht_z=Q@mail.gmail.com>
Message-ID: <CAD=FV=XST+cuy=EM1A_08H2+_CHFvhuzYOkWe5RAxsTvht_z=Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 14, 2022 at 12:50 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds LTE skus for villager device tree files.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
>
> ---
>
> Changes in v4:
>  - Reorder 'status' last
>
>  arch/arm64/boot/dts/qcom/Makefile                |  3 +++
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi      | 11 -----------
>  .../arm64/boot/dts/qcom/sc7280-herobrine-crd.dts |  1 +
>  .../dts/qcom/sc7280-herobrine-herobrine-r1.dts   |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi  | 16 ++++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r0-lte.dts    | 14 ++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts    | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts          |  1 +
>  8 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index bb9f4eb3e65a0..7fe7c78a79369 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -103,6 +103,9 @@ dtb-$(CONFIG_ARCH_QCOM)     += sc7180-trogdor-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r1.dtb

As per my comments in the previous patch, the "-r1" entry should be
moved from patch #3 to patch #2.

Also the above line seems to be indented incorrectly.


> +dtb-$(CONFIG_ARCH_QCOM)        += sc7280-herobrine-villager-r0-lte.dtb

For all the sc7180 Chromebook devices the "r0" variants are all sorted
together. Thus the order should end up being:

sc7280-herobrine-villager-r0.dtb
sc7280-herobrine-villager-r0-lte.dtb
sc7280-herobrine-villager-r1.dtb
sc7280-herobrine-villager-r1-lte.dtb


> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Herobrine dts fragment for LTE SKUs
> + *
> + * Copyright 2022 Google LLC.
> + */
> +/* Modem setup is different on Chrome setups than typical Qualcomm setup */
> +
> +&remoteproc_mpss {
> +       compatible = "qcom,sc7280-mss-pil";
> +       iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;

You accidentally dropped the "interconnects" property that was added
by commit a0cdc83fa89b ("arm64: dts: qcom: sc7280: Add proxy
interconnect requirements for modem"). Please put it back.
