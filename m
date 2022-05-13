Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55C485261C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 14:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380219AbiEMMZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 08:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380218AbiEMMZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 08:25:05 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23912A28EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 05:25:03 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id w3so6912261qkb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBpUopp6BxB2ZGbL7q3811xhoXXfcHStep2uYJXiQvY=;
        b=pJ0gr6jrOYMxrZy+chiy0WQzCUuuaT/CXA0Ya1wfAa+NKSH+KfO8kAPCtTqY6xKUkM
         Fr1gDzC553oV5TCZbeLQa5ZpzojhnRpDpTo8UvFh1fuTk7/EfL38PXwjHiZc6f2Nd4LV
         BPhSyX8MNPtE+kfGg5FBDuS2Xkcl01tFZHBXdW5Ts/9P02K0atpsKMBt2m/a94AoyVEU
         EtVfa/RnGgEU3jZ+zpFv134uYw+dll7FbAo1Zr1+8CACPyLVl3ZhihtF7bS9cfzgdY33
         CPj+Zauv4HtcdYX4ltIdortit6g66BuiROh7/DHfl1WsOP9tVN96yp7hQ/ncon8dIevS
         en8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBpUopp6BxB2ZGbL7q3811xhoXXfcHStep2uYJXiQvY=;
        b=j/rOZLdmkDfRsqoptI/VWaze/9amdCqdcuvnrn39vjtp1c6h/3YKq7wGa+gpxQvPsV
         UssBM3oGzAk9EsHeSzmf0LlI/G7AtysFyp9TEJcoeQfoOrjMkcpMpXKRaqXllxti3GSy
         T4ra0LqZx7bzZ4BhEvj9BPwvrW3Yy4SaYm2RHm2PjTsOSBQMQ1xRFBitK/d8FYXq8S4C
         iC0Fs4Qeb1S/56TMiR1GVc6kEenPfsQpMIccb3oHD/sQkF3wM1zto1kOTteNgppEfgai
         NKh6egsOMXen2TWvSRDGev6F3i0FfA/ANVSoBiCHkTzwEGSP/0o7clOLI2AExwUrSheM
         nmug==
X-Gm-Message-State: AOAM530VB82mI8W0mIbUJ/YFEsNTPoK3e4ppFmy9MZRECHoODI7gCcwZ
        rpWsjpWCDGn/m2Y2OGW8EGjIzauXuqewLm0k0htLxC6Lxzo=
X-Google-Smtp-Source: ABdhPJwj6qWzoEC2epvWyE5aIwKqWSYYkqo3eZIhz6PbcUM/xIDQrCoUpP7dD0OOLysimdyjRTq30K9i6t8PXP4RL8E=
X-Received: by 2002:a05:620a:2a11:b0:6a0:4ae4:fee6 with SMTP id
 o17-20020a05620a2a1100b006a04ae4fee6mr3496243qkp.30.1652444703092; Fri, 13
 May 2022 05:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220512104545.2204523-1-dmitry.baryshkov@linaro.org>
 <20220512104545.2204523-11-dmitry.baryshkov@linaro.org> <Yn5HEUkNW+g20u58@hovoldconsulting.com>
In-Reply-To: <Yn5HEUkNW+g20u58@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 May 2022 15:24:52 +0300
Message-ID: <CAA8EJpqbs1TYYQG5AmgR0snZDzgcgSobLThQYpDCbEHv3d3mLg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: qcom: sm8250: provide additional MSI interrupts
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 May 2022 at 14:55, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, May 12, 2022 at 01:45:45PM +0300, Dmitry Baryshkov wrote:
> > On SM8250 each group of MSI interrupts is mapped to the separate host
> > interrupt. Describe each of interrupts in the device tree for PCIe0
> > host.
> >
> > Tested on Qualcomm RB5 platform with first group of MSI interrupts being
> > used by the PME and attached ath11k WiFi chip using second group of MSI
> > interrupts.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 410272a1e19b..ef683a2f7412 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -1807,8 +1807,15 @@ pcie0: pci@1c00000 {
> >                       ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
> >                                <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
> >
> > -                     interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
> > -                     interrupt-names = "msi";
> > +                     interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "msi", "msi1", "msi2", "msi3", "msi4", "msi5", "msi6", "msi7";
>
> You must use "msi0" instead of "msi" or you only get 32 MSI regardless
> of what follows currently (and this wouldn't pass DT validation either).

Yes. And that's why I didn't notice that I broke msi0 parsing.

>
> >                       #interrupt-cells = <1>;
> >                       interrupt-map-mask = <0 0 0 0x7>;
> >                       interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
>
> Johan



-- 
With best wishes
Dmitry
