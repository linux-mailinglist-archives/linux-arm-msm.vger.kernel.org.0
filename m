Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060F46D8673
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbjDETB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDETBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:01:25 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A61BBA
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:01:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso24335489wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680721282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZCl/M+6M2kW8Ub1pKIZDU+nW5n/Es3BgH1yXYToFsk=;
        b=sVb2QiP1zGGLbv2Bz9y2C/kr0Th5hUXhkWrW3AHha6az0G+AFFzNsotPmY+qjDK5Pb
         Gj5ABwodld+wB8mTgS9fNXezH6u/mo23FyR0OS8b2WoQKtUMBxpmZBzdZeAJRQHhX+Dk
         CUF1XfFrYbayVA66+9iDVTBttHmNKCa26aJEGpw34ZuG/cu0CnVkdFj/Gc1Oy7pwMY1m
         N2GzIiR5VBwiDY6vuYFIDCD3o1l1baAAtlOum7mU5EtLdz3NDMaMuBK3IrzPrEPvurRz
         9iDiVBYcCHzv5WEK8hSfznnC3WHDTH51bRK0Ftsbv8wDAzMKKJuXnGjanPj4CkMrygHo
         0PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680721282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZCl/M+6M2kW8Ub1pKIZDU+nW5n/Es3BgH1yXYToFsk=;
        b=n1Gl9AaiOq9jhPnDPJSvz53Mvr/BcTNW37+EEDDw9XMSpGdvr1CYjGzMPSGeUuKqlr
         0m3knBLpfSyyEgaOqfz5AsTQe+zkpErQpQKzfzT4kj1SaxsYbWdPAM+u04sJpKv0Ol/8
         /jIhWWawgHGAtbrG6wI3Muvvtaqct8hHH9yp0Mwd/Yut3GUqKKoRmDQwYpFffl6lj6Rn
         rNX6rDSgyaFu1AIyt3lr6U62Pg/t26nEYxP6lcbx4MXBdpQAm0BGI8dBnfMJkVlqH+vD
         +asqc9H014EFiNFwor5Eh5hQ8O0LNcMSZelhUqoZPg/UwSaLG6P7gO5qGlaaM1WOPVlU
         qbqg==
X-Gm-Message-State: AAQBX9elVmkFsFn1DPvdr3i404pE+MzxLs3Lm8AoL4HxbZxsNMCbwdC0
        xVEMQGFKda74XKJtJNRJ8SpjTI3GzQiUF9IuLKG6Rg==
X-Google-Smtp-Source: AKy350b+rkmiVJKskwZo+VZ578tarkKZtlE4b7Mp7Z+LnHAYq82AK36CWlWF/8B2IWcF7IFjA8Gzhfl62xzxXi9ets8=
X-Received: by 2002:a7b:c3ce:0:b0:3ed:526c:25cb with SMTP id
 t14-20020a7bc3ce000000b003ed526c25cbmr1867090wmj.8.1680721281953; Wed, 05 Apr
 2023 12:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
 <20230401154725.1059563-3-bhupesh.sharma@linaro.org> <CAA8EJppTRT+fDp4b6unzn60uJ1CivAEGcxzyVZ5+FE1E073Qzw@mail.gmail.com>
In-Reply-To: <CAA8EJppTRT+fDp4b6unzn60uJ1CivAEGcxzyVZ5+FE1E073Qzw@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 6 Apr 2023 00:31:10 +0530
Message-ID: <CAH=2Ntxja_fhgPhDpPySLEkyGimGUqQR0zHr3ErJ9-js3dw_nA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sat, 1 Apr 2023 at 22:43, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 1 Apr 2023 at 18:49, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > Add USB superspeed qmp phy node to dtsi.
> >
> > Make sure that the various board dts files (which include sm4250.dtsi file)
> > continue to work as intended.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 36 +++++++++++++++++--
> >  .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
> >  3 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> > index a1f0622db5a0..75951fd439df 100644
> > --- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> > @@ -242,6 +242,9 @@ &usb {
> >  &usb_dwc3 {
> >         maximum-speed = "high-speed";
> >         dr_mode = "peripheral";
> > +
> > +       phys = <&usb_hsphy>;
> > +       phy-names = "usb2-phy";
> >  };
> >
> >  &usb_hsphy {
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > index 2a51c938bbcb..b2fa565e4816 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> > @@ -650,6 +650,38 @@ usb_hsphy: phy@1613000 {
> >                         status = "disabled";
> >                 };
> >
> > +               usb_qmpphy: phy@1615000 {
> > +                       compatible = "qcom,sm6115-qmp-usb3-phy";
> > +                       reg = <0x0 0x01615000 0x0 0x200>;
> > +                       clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
> > +                                <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> > +                                <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> > +                       clock-names = "cfg_ahb",
> > +                                     "ref",
> > +                                     "com_aux";
> > +                       resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
> > +                                <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
> > +                       reset-names = "phy_phy", "phy";
> > +                       status = "disabled";
> > +                       #address-cells = <2>;
> > +                       #size-cells = <2>;
> > +                       ranges;
> > +
> > +                       usb_ssphy: phy@1615200 {
>
> Please update this to newer style bindings (see
> qcom,sc8280xp-qmp-usb3-uni-phy.yaml).

I double checked the downstream driver and the HW documentation and
can confirm that this is not a UNI PHY i.e. it has 2 lanes (see
<https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/phy/qualcomm/phy-qcom-qmp-usb.c#n1923>).

Also this is a v3 USB QMP PHY (normally available on other SoCs like
sdm845) instead of v5 QMP USB UNI PHY available on SC8280XP.

So, I think the original patch is correct.

Thanks,
Bhupesh



> > +                               reg = <0x0 0x01615200 0x0 0x200>,
> > +                                     <0x0 0x01615400 0x0 0x200>,
> > +                                     <0x0 0x01615c00 0x0 0x400>,
> > +                                     <0x0 0x01615600 0x0 0x200>,
> > +                                     <0x0 0x01615800 0x0 0x200>,
> > +                                     <0x0 0x01615a00 0x0 0x100>;
> > +                               #clock-cells = <0>;
> > +                               #phy-cells = <0>;
> > +                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> > +                               clock-names = "pipe0";
> > +                               clock-output-names = "usb3_phy_pipe_clk_src";
> > +                       };
> > +               };
> > +
> >                 qfprom@1b40000 {
> >                         compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
> >                         reg = <0x0 0x01b40000 0x0 0x7000>;
> > @@ -1100,8 +1132,8 @@ usb_dwc3: usb@4e00000 {
> >                                 compatible = "snps,dwc3";
> >                                 reg = <0x0 0x04e00000 0x0 0xcd00>;
> >                                 interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> > -                               phys = <&usb_hsphy>;
> > -                               phy-names = "usb2-phy";
> > +                               phys = <&usb_hsphy>, <&usb_ssphy>;
> > +                               phy-names = "usb2-phy", "usb3-phy";
> >                                 iommus = <&apps_smmu 0x120 0x0>;
> >                                 snps,dis_u2_susphy_quirk;
> >                                 snps,dis_enblslpm_quirk;
> > diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> > index 10c9d338446c..d60cc024749b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> > @@ -280,6 +280,9 @@ &usb {
> >  &usb_dwc3 {
> >         maximum-speed = "high-speed";
> >         dr_mode = "peripheral";
> > +
> > +       phys = <&usb_hsphy>;
> > +       phy-names = "usb2-phy";
> >  };
> >
> >  &usb_hsphy {
> > --
> > 2.38.1
> >
>
>
> --
> With best wishes
> Dmitry
