Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C8B3560A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 06:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfFEEzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 00:55:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54892 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFEEzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 00:55:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CC92E6074C; Wed,  5 Jun 2019 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559710540;
        bh=h9iwlufpq7/KISUsW3e2E4eX6OYVTsTCWq1ehA98fsM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OAlUvYzgEjn0P2VhZh/Pu77zRs9ypRoj+ZFzcBRncTK/e9gFPTLykhgNBIRh3GigY
         mo0NYxiU6iaOl91kIKvo+8EVkqXYl0hh3KDWhZWEK87NjvAWBIOuF5oFH35yuvF4lY
         23tTGl+kBllW9MHbciEHf+htrdplYjelIojVHPKA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 159746074C;
        Wed,  5 Jun 2019 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559710540;
        bh=h9iwlufpq7/KISUsW3e2E4eX6OYVTsTCWq1ehA98fsM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OAlUvYzgEjn0P2VhZh/Pu77zRs9ypRoj+ZFzcBRncTK/e9gFPTLykhgNBIRh3GigY
         mo0NYxiU6iaOl91kIKvo+8EVkqXYl0hh3KDWhZWEK87NjvAWBIOuF5oFH35yuvF4lY
         23tTGl+kBllW9MHbciEHf+htrdplYjelIojVHPKA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 159746074C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f50.google.com with SMTP id c26so3869624edt.1;
        Tue, 04 Jun 2019 21:55:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWRzR9FH0Xwm0IOX2CDJh+w4DGDUTx95rbF12TgYLMPBKBRSU1c
        scQuhmG40QE55tPE8gkei7ydfMlcNwaCUfrcrSE=
X-Google-Smtp-Source: APXvYqxv0a4cCcROLh0AISC2tWtOtWpbq41ZNWWSx20A4zgTfgPfQfqoTyT7mxmZaVoUMPCbLUCcOGNqGRb0duhh53E=
X-Received: by 2002:a17:906:8d8:: with SMTP id o24mr33250632eje.235.1559710538685;
 Tue, 04 Jun 2019 21:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190604222939.195471-1-swboyd@chromium.org> <20190604223700.GE4814@minitux>
 <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
In-Reply-To: <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Wed, 5 Jun 2019 10:25:26 +0530
X-Gmail-Original-Message-ID: <CAFp+6iHZeawnz7Vfk3=Oox-GN_y6c-E9wMwc-qdp1bTOXgqjFQ@mail.gmail.com>
Message-ID: <CAFp+6iHZeawnz7Vfk3=Oox-GN_y6c-E9wMwc-qdp1bTOXgqjFQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 5, 2019 at 4:16 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2019-06-04 15:37:00)
> > On Tue 04 Jun 15:29 PDT 2019, Stephen Boyd wrote:
> >
> > > The SMMU that sits in front of the QUP needs to be programmed properly
> > > so that the i2c geni driver can allocate DMA descriptors. Failure to do
> > > this leads to faults when using devices such as an i2c touchscreen where
> > > the transaction is larger than 32 bytes and we use a DMA buffer.
> > >
> >
> > I'm pretty sure I've run into this problem, but before we marked the
> > smmu bypass_disable and as such didn't get the fault, thanks.
> >
> > >  arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> > >  arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> > >
> > > Add the right SID and mask so this works.
> > >
> > > Cc: Sibi Sankar <sibis@codeaurora.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index fcb93300ca62..2e57e861e17c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -900,6 +900,7 @@
> > >                       #address-cells = <2>;
> > >                       #size-cells = <2>;
> > >                       ranges;
> > > +                     iommus = <&apps_smmu 0x6c0 0x3>;
> >
> > According to the docs this stream belongs to TZ, the HLOS stream should
> > be 0x6c3.
>
> Aye, I saw this line in the downstream kernel but it doesn't work for
> me. If I specify <&apps_smmu 0x6c3 0x0> it still blows up. I wonder if
> my firmware perhaps is missing some initialization here to make the QUP
> operate in HLOS mode? Otherwise, I thought that the 0x3 at the end was
> the mask and so it should be split off to the second cell in the DT
> specifier but that seemed a little weird.

Two things here -
0x6c0 - TZ SID. Do you see above fault on MTP sdm845 devices?
0x6c3/0x6c6 - HLOS SIDs.

Cheza will throw faults for anything that is programmed with TZ on mtp
as all of that should be handled in HLOS. The firmwares of all these
peripherals assume that the SID reservation is done (whether in TZ or HLOS).

I am inclined to moving the iommus property for all 'TZ' to board dts files.
MTP wouldn't need those SIDs. So, the SOC level dtsi will have just the
HLOS SIDs.

P.S.
As you rightly said, the second cell in iommus property is the mask so that
the iommu is able to reserve all that SIDs that are covered with the
starting SID
and the mask.


Best regards
Vivek
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
