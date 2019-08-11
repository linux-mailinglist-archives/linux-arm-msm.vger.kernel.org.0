Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FEF89273
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Aug 2019 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfHKQIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Aug 2019 12:08:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34134 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHKQIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Aug 2019 12:08:39 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1EA9E60709; Sun, 11 Aug 2019 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565539718;
        bh=q2Eye4K2ziKCFlT1foS+S6HSiy4LOooGYEQTduuBmiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NVnQZNVUOiK3K7aKCxetRqBpEoBkNBU05iW86thPa5J/aTc8I2/mi88U78JdckLbV
         9EiUZ2juRkXB4OJMjH2Di2MajNay0ZFOUQ2qJOA3j05+Lo3cmdVvptj1iE1cbHsnLu
         3Oxn2V4CFyAhZ4D8kt0SuP+FnKMRIaPc49YBLTkk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C0D36053B;
        Sun, 11 Aug 2019 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565539717;
        bh=q2Eye4K2ziKCFlT1foS+S6HSiy4LOooGYEQTduuBmiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hjMIY34Sv2YtANfBFfitDJXajAadIYCdQPemtCzJ9iq2adSonaPKN2fsL7dH+tIcc
         9lYwvg7BEHZkh2nAAIDeB3081lx0jOOeYgTT3M0K7Nkeb+1LNi4flA4d/yMWXYYPjK
         YhN/5/MnQwuWKPsyiOZCC7HkOZw7OnkEvV5HNjgA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C0D36053B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f47.google.com with SMTP id m44so8038470edd.9;
        Sun, 11 Aug 2019 09:08:36 -0700 (PDT)
X-Gm-Message-State: APjAAAWjgAcZLXkEMxNjvoGvu/SmkZXegUcmsK5OgjlOPG8tt0nkxoHr
        WGWju9EHhIUylbxVuHYOghBW8ilJA+Df78RHrrQ=
X-Google-Smtp-Source: APXvYqyFFJCaGAq46SyTCzjuDhcbBv3wmxf8bN+ADhcvIt95E7RRnkwHNH6sBTe8oSgzL5kbHeNmbVUaK3aBr0qGTKk=
X-Received: by 2002:a17:906:2544:: with SMTP id j4mr27620572ejb.221.1565539715693;
 Sun, 11 Aug 2019 09:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-5-vivek.gautam@codeaurora.org> <20190805222627.GA2634@builder>
In-Reply-To: <20190805222627.GA2634@builder>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Sun, 11 Aug 2019 21:38:24 +0530
X-Gmail-Original-Message-ID: <CAFp+6iHGrXAJ2Y1ewxaePGYEcbnprjScUnGyR61qvOv03HVZhQ@mail.gmail.com>
Message-ID: <CAFp+6iHGrXAJ2Y1ewxaePGYEcbnprjScUnGyR61qvOv03HVZhQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
 sequence handler on MTP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        "robh+dt" <robh+dt@kernel.org>,
        David Brown <david.brown@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Andy Gross <agross@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 6, 2019 at 3:56 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
>
> > Indicate on MTP SDM845 that firmware implements handler to
> > TLB invalidate erratum SCM call where SAFE sequence is toggled
> > to achieve optimum performance on real-time clients, such as
> > display and camera.
> >
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 78ec373a2b18..6a73d9744a71 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -2368,6 +2368,7 @@
> >                       compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
> >                       reg = <0 0x15000000 0 0x80000>;
> >                       #iommu-cells = <2>;
> > +                     qcom,smmu-500-fw-impl-safe-errata;
>
> Looked back at this series and started to wonder if there there is a
> case where this should not be set? I mean we're after all adding this to
> the top 845 dtsi...

My bad.
This is not valid in case of cheza. Cheza firmware doesn't implement
the safe errata handling hook.
On cheza we just have the liberty of accessing the secure registers
through scm calls - this is what
we were doing in earlier patch series handling this errata.
So, a property like this should go to mtp board's dts file.

Thanks

Vivek

>
> How about making it the default in the driver and opt out of the errata
> once there is a need?
>
> Regards,
> Bjorn
>
> >                       #global-interrupts = <1>;
> >                       interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> >                                    <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
