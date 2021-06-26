Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AD53B4FD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 20:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhFZS2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Jun 2021 14:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhFZS2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Jun 2021 14:28:36 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B829C061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jun 2021 11:26:14 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id l8-20020a4ae3880000b029024c7811b6dbso240444oov.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jun 2021 11:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DI2G5sC+Fy/uFtOTYjG+9gP3jQj4m7g2L2nJ6Mw5TXQ=;
        b=qP4eOuoypEx1BjN1liacNmSJs0DwEOd4ewbRhNVkEvHaS7kCfQY007YSBT1z81iZXi
         bvpM2oHMQ7PxghLDc6yoXlS5OploeVHnz55zswD0gNdrSizVpDpXlUI2GaSK3vcuxRwA
         wogbQGMVUfyD3c5Tqd0jgpKOiHtthlpmL62AUGgPM5SFMqCQXBhuvWW39OKatUuuIikA
         HU1IKAhRkeHbyPuEFNnWiewhtmNZJW3VH20oR72wLqgIOYrLVFZRtWy3iLk8sdndVKlp
         KAId1zng2aXCbJvheW2K+FwcOBtmWnWMvk+U5nGknfaRW274/ZVZqK3JJuVX3tf1EuJW
         MhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DI2G5sC+Fy/uFtOTYjG+9gP3jQj4m7g2L2nJ6Mw5TXQ=;
        b=oQ+YJJFGmoS/5vnsFFiP0U7OwSd7pDWLL3LLLztjcVZ4gNu8OgLP6LsdjYwVKBM875
         cHcAuLB+fkmfFZmLSr4e7bSw7m9Gqr8ohhoz1tMD7EG35dqZz66Qtcw2k766ymIIS2Q6
         5Y/aXPLHxhV50W3eQFLR2Soyf+Qnxx4+k95DJr7optWGqg/u88NiJYyVR43VLctvXg8N
         z2jMg8/uHUQ2OonQdh4+TzsQ0uHb1U3KCf17bl7Mwljvc9TmVhY8KhwnY6ubeKwmNZYb
         LCl5gKTlxcSxhzMbuJeB+Ck0jFwlXkxT4nQ4c3ythkgsT96MlZX/2TgeWzGpao47XikW
         iKTg==
X-Gm-Message-State: AOAM532iThVzT8N19TeCo8vp7x+x/e7xTBbwmLgZmt51hNPki8gHEz68
        LnOet5NlTMfnyCo0vNCjOYl3x4sv5IijhtVdym7i8A==
X-Google-Smtp-Source: ABdhPJzNDHIr64wdhMId/mbxHV/ll0JwmQkAF6D6aJGefkDeTU5iD/2EuvjzpmsJ8rRcOfQ8todbK3ox4gloezWhfBY=
X-Received: by 2002:a4a:6c0c:: with SMTP id q12mr13837143ooc.81.1624731973541;
 Sat, 26 Jun 2021 11:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
 <20210625220311.527549-2-bhupesh.sharma@linaro.org> <YNZaOK3XcsQq8H+B@yoga>
In-Reply-To: <YNZaOK3XcsQq8H+B@yoga>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 26 Jun 2021 23:56:02 +0530
Message-ID: <CAH=2NtyLchPaz6g5jHcgOUrgXFHiy9DwxcgFviNfgGD0k5B_mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Use consistent naming for dwc3 usb
 nodes for sm8150
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        balbi@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Sat, 26 Jun 2021 at 04:05, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 25 Jun 17:03 CDT 2021, Bhupesh Sharma wrote:
>
> > The dwc3 usb nodes in sm8150.dtsi are currently named differently,
> > leading to some confusion when one sees the entries in sysfs or
> > dmesg:
> > [    1.943482] dwc3 a600000.usb: Adding to iommu group 1
> > [    2.266127] dwc3 a800000.dwc3: Adding to iommu group 2
> >
> > Name both the nodes as dwc3@<addr> for consistency.
> >
> > While at it also arrange the two usb controller, hs-phy and
> > ss-phy nodes closer in the dts for better readability.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 30 ++++++++++++++--------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 612dda0fef43..3be6d093a99b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -2205,6 +2205,20 @@ glink-edge {
> >                       };
> >               };
> >
> > +             dc_noc: interconnect@9160000 {
> > +                     compatible = "qcom,sm8150-dc-noc";
> > +                     reg = <0 0x09160000 0 0x3200>;
> > +                     #interconnect-cells = <1>;
> > +                     qcom,bcm-voters = <&apps_bcm_voter>;
> > +             };
> > +
> > +             gem_noc: interconnect@9680000 {
> > +                     compatible = "qcom,sm8150-gem-noc";
> > +                     reg = <0 0x09680000 0 0x3e200>;
> > +                     #interconnect-cells = <1>;
> > +                     qcom,bcm-voters = <&apps_bcm_voter>;
> > +             };
> > +
> >               usb_1_hsphy: phy@88e2000 {
> >                       compatible = "qcom,sm8150-usb-hs-phy",
> >                                    "qcom,usb-snps-hs-7nm-phy";
> > @@ -2266,20 +2280,6 @@ usb_1_ssphy: lanes@88e9200 {
> >                       };
> >               };
> >
> > -             dc_noc: interconnect@9160000 {
> > -                     compatible = "qcom,sm8150-dc-noc";
> > -                     reg = <0 0x09160000 0 0x3200>;
> > -                     #interconnect-cells = <1>;
> > -                     qcom,bcm-voters = <&apps_bcm_voter>;
> > -             };
> > -
> > -             gem_noc: interconnect@9680000 {
> > -                     compatible = "qcom,sm8150-gem-noc";
> > -                     reg = <0 0x09680000 0 0x3e200>;
> > -                     #interconnect-cells = <1>;
> > -                     qcom,bcm-voters = <&apps_bcm_voter>;
> > -             };
> > -
> >               usb_2_qmpphy: phy@88eb000 {
> >                       compatible = "qcom,sm8150-qmp-usb3-uni-phy";
> >                       reg = <0 0x088eb000 0 0x200>;
> > @@ -2344,7 +2344,7 @@ usb_1: usb@a6f8800 {
> >
> >                       resets = <&gcc GCC_USB30_PRIM_BCR>;
> >
> > -                     usb_1_dwc3: usb@a600000 {
> > +                     usb_1_dwc3: dwc3@a600000 {
>
> "usb@" is actually the right one, per the rather recent standardization
> across the dwc3 bindings.

Ok, yes that makes more sense.
Although a grep for the keyword 'dwc3@', does lead up to quite a few
qcom dts files which use 'dwc3@ 'instead of 'usb@', which seem
inconsistent as per the bindings doc (see [1]).

Maybe I can fix those in v2 as well.

[1]. Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

Thanks,
Bhupesh
>
> >                               compatible = "snps,dwc3";
> >                               reg = <0 0x0a600000 0 0xcd00>;
> >                               interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > --
> > 2.31.1
> >
