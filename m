Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C6874ED25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 13:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjGKLqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjGKLqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 07:46:46 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1217136
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:46:43 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso5034140276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689076003; x=1691668003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaziZ94maZm3wxKZN4/6tJUYjnO13qJHKuU4Kto9J+o=;
        b=gklfGfriPTido+OOaffg1UM/Xt3uZGiaFzQbkRiEj6Tmj1LRVBgGCZaGtlgvjvifMZ
         wrfFgFRTGYkxKlE33IPeQPj3eak7jhg1sOM6XgI45GwHmBazMNL2tFZChE7wPpT2h1cg
         Cu1Pp+6QIYTx4XPJXH5xPxdukAFLNb9SKlLGhEME+TjBVzOaMPNinHjcxv76viZC3dOS
         E1MTllmiwz+oAUOrySRoWfKd1qxbHKEQQP2MEkVD4eoxfuIR22ihmtKZIGYeDwpuHqcl
         ON7a+xowJIHUTdys1HPKAECxgvtZ8p6TPWspMn2Vfl7u0Oqi3biZcKpXQNfjl6eKeijQ
         KxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689076003; x=1691668003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaziZ94maZm3wxKZN4/6tJUYjnO13qJHKuU4Kto9J+o=;
        b=Xd3Otx0kKkZx5Lb3qg4VZBnGuwrkTj1NpHv1/Iz1mLX2R1+PaiH2mXTFv2EQgQKvDH
         vUouwVK5rNFw6POk9GM3QoDJY7TyJQiCz3jrbmp4A8DCX3RzIt0qN8QJK8UQKBQaiA7i
         PfAaNYtopGV0YGb3cKfGsucFrtJkSbbiehkl/dcCIrGraaJCOQ6UFsj01YxHFSmOcM01
         l1F/R/SQZPdh4fk3qPE00FD5tbTLBWLZxu+jESpwv0gKl5TC3lxK9jOgl06KLAOUUaje
         WAMRju+MPyiqQGKHIQ9FmbuQUJubgRun+QlzqvGN5icHUdC7n1AVXxamq+CyVKQOGay8
         Niug==
X-Gm-Message-State: ABy/qLYVOdycB6wUK2SOwVrLRKLT++fSVyM3nS8b61GIM1KsytzlLNq9
        bi4ZxLthH+7roDj4AW3l9nY/C/F4DXiDsiiTauNLCA==
X-Google-Smtp-Source: APBJJlEpthk74V4DSnuNchB9wf9luhREksQ4SwvkR+x6SOjLik7NxDv46DS6NX9oodSkOtJqYBdIsGCwVZYsO2rYqFM=
X-Received: by 2002:a25:b34c:0:b0:c61:e9b6:82a5 with SMTP id
 k12-20020a25b34c000000b00c61e9b682a5mr11991300ybg.39.1689076002952; Tue, 11
 Jul 2023 04:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230711-topic-rb1_regulator-v1-1-bc4398c35800@linaro.org>
 <CAA8EJpoeAeitC=_pbAxFATfxx8UK-4cAQ=Zr3nKc0jhAdoG5fg@mail.gmail.com>
 <43d290c9-fdec-4832-242e-6732d9f0ea6c@linaro.org> <CAA8EJpozgj=MvYo=eHx1a1YD4gkXEvqHvuvp_mUBXfGMjhYWGA@mail.gmail.com>
 <775764d2-5457-9150-74ca-6e14fa5b2870@linaro.org>
In-Reply-To: <775764d2-5457-9150-74ca-6e14fa5b2870@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 11 Jul 2023 14:46:31 +0300
Message-ID: <CAA8EJpraMoY6W9WfE1i3HNZ-AxcSD6UwCkRReM1mnrcB2YH7VQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: Add regulators
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Jul 2023 at 14:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 11.07.2023 12:56, Dmitry Baryshkov wrote:
> > On Tue, 11 Jul 2023 at 13:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 11.07.2023 12:44, Dmitry Baryshkov wrote:
> >>> On Tue, 11 Jul 2023 at 13:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>>>
> >>>> Add and assign RPM regulators coming from PM2250.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >> [...]
> >>
> >>>> +               pm2250_l5: l5 {
> >>>> +                       /* CSI/DSI */
> >>>> +                       regulator-min-microvolts = <1232000>;
> >>>> +                       regulator-max-microvolts = <1232000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       regulator-boot-on;
> >>>
> >>> why?
> >>>
> >> To answer all of the questions in one go:
> >>
> >> "it's because the regulator is enabled at boot"
> >
> > I was more concerned about the following part:
> >       If the bootloader didn't leave it on then OS should turn it on at boot ...
> >
> > Please remind me, are we declaring them as boot-on so that the
> > regulator core can turn them off later if they are unused?
> In the Linux implementation, yes.

Ack.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Konrad
> >
> >>
> >> Konrad
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l6: l6 {
> >>>> +                       /* DRAM PLL */
> >>>> +                       regulator-min-microvolts = <928000>;
> >>>> +                       regulator-max-microvolts = <928000>;
> >>>> +                       regulator-always-on;
> >>>> +                       regulator-boot-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l7: l7 {
> >>>> +                       /* Wi-Fi CX/MX */
> >>>> +                       regulator-min-microvolts = <664000>;
> >>>> +                       regulator-max-microvolts = <664000>;
> >>>> +               };
> >>>> +
> >>>> +               /*
> >>>> +                * L8 - VDD_LPI_CX
> >>>> +                * L9 - VDD_LPI_MX
> >>>> +                */
> >>>> +
> >>>> +               pm2250_l10: l10 {
> >>>> +                       /* Wi-Fi RFA */
> >>>> +                       regulator-min-microvolts = <1300000>;
> >>>> +                       regulator-max-microvolts = <1300000>;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l11: l11 {
> >>>> +                       /* GPS RF1 */
> >>>> +                       regulator-min-microvolts = <1000000>;
> >>>> +                       regulator-max-microvolts = <1000000>;
> >>>> +                       regulator-boot-on;
> >>>
> >>> Shouldn't it be handled by the modem on its own?
> >>>
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l12: l12 {
> >>>> +                       /* USB PHYs */
> >>>> +                       regulator-min-microvolts = <928000>;
> >>>> +                       regulator-max-microvolts = <928000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       regulator-boot-on;
> >>>
> >>> You guess the question (and further on)
> >>>
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l13: l13 {
> >>>> +                       /* USB/QFPROM/PLLs */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       regulator-boot-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l14: l14 {
> >>>> +                       /* SDHCI1 VQMMC */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       /* Broken hardware, never turn it off! */
> >>>> +                       regulator-always-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l15: l15 {
> >>>> +                       /* WCD/DSI/BT VDDIO */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       regulator-always-on;
> >>>> +                       regulator-boot-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l16: l16 {
> >>>> +                       /* GPS RF2 */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +                       regulator-boot-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l17: l17 {
> >>>> +                       regulator-min-microvolts = <3000000>;
> >>>> +                       regulator-max-microvolts = <3000000>;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l18: l18 {
> >>>> +                       /* VDD_PXn */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l19: l19 {
> >>>> +                       /* VDD_PXn */
> >>>> +                       regulator-min-microvolts = <1800000>;
> >>>> +                       regulator-max-microvolts = <1800000>;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l20: l20 {
> >>>> +                       /* SDHCI1 VMMC */
> >>>> +                       regulator-min-microvolts = <2856000>;
> >>>> +                       regulator-max-microvolts = <2856000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l21: l21 {
> >>>> +                       /* SDHCI2 VMMC */
> >>>> +                       regulator-min-microvolts = <2960000>;
> >>>> +                       regulator-max-microvolts = <3300000>;
> >>>> +                       regulator-allow-set-load;
> >>>> +                       regulator-boot-on;
> >>>> +               };
> >>>> +
> >>>> +               pm2250_l22: l22 {
> >>>> +                       /* Wi-Fi */
> >>>> +                       regulator-min-microvolts = <3312000>;
> >>>> +                       regulator-max-microvolts = <3312000>;
> >>>> +               };
> >>>> +       };
> >>>> +};
> >>>> +
> >>>>  &sdhc_1 {
> >>>> +       vmmc-supply = <&pm2250_l20>;
> >>>> +       vqmmc-supply = <&pm2250_l14>;
> >>>>         pinctrl-0 = <&sdc1_state_on>;
> >>>>         pinctrl-1 = <&sdc1_state_off>;
> >>>>         pinctrl-names = "default", "sleep";
> >>>> @@ -61,6 +322,8 @@ &sdhc_1 {
> >>>>  };
> >>>>
> >>>>  &sdhc_2 {
> >>>> +       vmmc-supply = <&pm2250_l21>;
> >>>> +       vqmmc-supply = <&pm2250_l4>;
> >>>>         cd-gpios = <&tlmm 88 GPIO_ACTIVE_LOW>;
> >>>>         pinctrl-0 = <&sdc2_state_on &sd_det_in_on>;
> >>>>         pinctrl-1 = <&sdc2_state_off &sd_det_in_off>;
> >>>> @@ -104,6 +367,9 @@ &usb {
> >>>>  };
> >>>>
> >>>>  &usb_hsphy {
> >>>> +       vdd-supply = <&pm2250_l12>;
> >>>> +       vdda-pll-supply = <&pm2250_l13>;
> >>>> +       vdda-phy-dpdm-supply = <&pm2250_l21>;
> >>>>         status = "okay";
> >>>>  };
> >>>>
> >>>>
> >>>> ---
> >>>> base-commit: 8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
> >>>> change-id: 20230711-topic-rb1_regulator-44c4ade93246
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
