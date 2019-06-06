Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0713729D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 13:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfFFLRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 07:17:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58952 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfFFLRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 07:17:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 20C0260A97; Thu,  6 Jun 2019 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559819851;
        bh=44FYV19hER2OKPFePIbE2vYYVMSTWXADeWEp8M56/AI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=apeLxYtwa2KnIJ2NT4qZc5+2anZ9I8dhSoi2ERsbE0hZLkee4tASrDdeAA6GmXhaz
         NW2eDbK+WWuNUp4CQNrja90ROpc5S9tk2vURgt8YGVL/xQ3vjJNu1qHGIx6Ameypfn
         FsPGNbqmz4sU+niQVhaxozhQlwRge3PgjHDu5EKM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7F2D6063A;
        Thu,  6 Jun 2019 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559819850;
        bh=44FYV19hER2OKPFePIbE2vYYVMSTWXADeWEp8M56/AI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M1M6GE79MO4dwRGVPw6dX44nWzVEYMupVmzwDTVnGZjF9IzERYLotzigSVZBdxVN+
         5ikBRSjgLMX+LYqdiuRPh0TrCiXI66kS5aHGeHRd2DoPseMpzZ0aR5UlRQC7vB6TR1
         C4fxI+K5H1cPbsEdEvdD/UfYTi135CxUhV6RKOt0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7F2D6063A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f53.google.com with SMTP id r18so2777395edo.7;
        Thu, 06 Jun 2019 04:17:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVrNhJ0N77bUZzO8wrq65ICXKJno5OEHFIdTTQdRs3Y9N/UVGa8
        W1sRoDe1imCh7WYHONGyrNaZciRFL3V2h2g9PFg=
X-Google-Smtp-Source: APXvYqwklxrrrs8SWvaSCMxC+Og7VzvNs6WCp3Va3dO+SqGYHV81qhQaGPqVo0WZDXo7IgykaSwgCatdbbsvwSmowQI=
X-Received: by 2002:a17:906:3c1:: with SMTP id c1mr33330161eja.221.1559819848628;
 Thu, 06 Jun 2019 04:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190604222939.195471-1-swboyd@chromium.org> <20190604223700.GE4814@minitux>
 <5cf6f4bb.1c69fb81.c39da.5496@mx.google.com> <CAFp+6iHZeawnz7Vfk3=Oox-GN_y6c-E9wMwc-qdp1bTOXgqjFQ@mail.gmail.com>
 <5cf82c6f.1c69fb81.9e342.dbda@mx.google.com>
In-Reply-To: <5cf82c6f.1c69fb81.9e342.dbda@mx.google.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Thu, 6 Jun 2019 16:47:16 +0530
X-Gmail-Original-Message-ID: <CAFp+6iE8FUXxexKbYy=ak+se-pj1XXUZxTu5o=hJvg66V6+Rzw@mail.gmail.com>
Message-ID: <CAFp+6iE8FUXxexKbYy=ak+se-pj1XXUZxTu5o=hJvg66V6+Rzw@mail.gmail.com>
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

Hi Stephen,

On Thu, Jun 6, 2019 at 2:27 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Vivek Gautam (2019-06-04 21:55:26)
> > On Wed, Jun 5, 2019 at 4:16 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Bjorn Andersson (2019-06-04 15:37:00)
> > > > On Tue 04 Jun 15:29 PDT 2019, Stephen Boyd wrote:
> > > >
> > > > > The SMMU that sits in front of the QUP needs to be programmed properly
> > > > > so that the i2c geni driver can allocate DMA descriptors. Failure to do
> > > > > this leads to faults when using devices such as an i2c touchscreen where
> > > > > the transaction is larger than 32 bytes and we use a DMA buffer.
> > > > >
> > > >
> > > > I'm pretty sure I've run into this problem, but before we marked the
> > > > smmu bypass_disable and as such didn't get the fault, thanks.
> > > >
> > > > >  arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> > > > >  arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> > > > >
> > > > > Add the right SID and mask so this works.
> > > > >
> > > > > Cc: Sibi Sankar <sibis@codeaurora.org>
> > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > index fcb93300ca62..2e57e861e17c 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > > @@ -900,6 +900,7 @@
> > > > >                       #address-cells = <2>;
> > > > >                       #size-cells = <2>;
> > > > >                       ranges;
> > > > > +                     iommus = <&apps_smmu 0x6c0 0x3>;
> > > >
> > > > According to the docs this stream belongs to TZ, the HLOS stream should
> > > > be 0x6c3.
> > >
> > > Aye, I saw this line in the downstream kernel but it doesn't work for
> > > me. If I specify <&apps_smmu 0x6c3 0x0> it still blows up. I wonder if
> > > my firmware perhaps is missing some initialization here to make the QUP
> > > operate in HLOS mode? Otherwise, I thought that the 0x3 at the end was
> > > the mask and so it should be split off to the second cell in the DT
> > > specifier but that seemed a little weird.
> >
> > Two things here -
> > 0x6c0 - TZ SID. Do you see above fault on MTP sdm845 devices?
>
> No. I see the above fault on Cheza.

Right, expected.

>
> > 0x6c3/0x6c6 - HLOS SIDs.

My bad, the other SID is 0x6D6.

>
> Why are there two? I see some mentions of GSI mode near these SIDs so
> maybe GSI has to be used for DMA here to get the above two SIDs at the
> IOMMU? Otherwise if we do the non-GSI mode of DMA we're going to use the
> "TZ" SID?

Yea, one for GSI, and the other one for non-GSI DMA. I am unsure at this point
about the use of TZ SID, but i would assume this is the SID that's used by the
qup firmware, and therefore on MTP TZ programs this SID.

>
> >
> > Cheza will throw faults for anything that is programmed with TZ on mtp
> > as all of that should be handled in HLOS. The firmwares of all these
> > peripherals assume that the SID reservation is done (whether in TZ or HLOS).
> >
> > I am inclined to moving the iommus property for all 'TZ' to board dts files.
> > MTP wouldn't need those SIDs. So, the SOC level dtsi will have just the
> > HLOS SIDs.
>
> So you're saying you'd like to have the SID be <&apps_smmu 0x6c3 0x0> in
> the sdm845.dtsi file and then override this on Cheza because our SID is
> different (possibly because we don't use GSI)? Why can't we program the
> SID in Cheza firmware to match the "HLOS" SID of 0x6c3?

Sorry my bad, I missed the overriding part.
May be we add the lists of SIDs in board dts only. So, cheza dts will
have all these SIDs -
<&apps_smmu 0x6c0 0x3>   // for both 0x6c0 (TZ) and 0x6c3 (HLOS)
<&apps_smmu 0x6d6 0x0>   // if we want to use the GSI dma.
and
MTP will have
<&apps_smmu 0x6c3 0x0>
<&apps_smmu 0x6d6 0x0>
WDUT?

>
> >
> > P.S.
> > As you rightly said, the second cell in iommus property is the mask so that
> > the iommu is able to reserve all that SIDs that are covered with the
> > starting SID
> > and the mask.
> >
>
> Well if 0x6c6 is another possibility maybe it should be <&apps_smmu
> 0x6c0 0x7> to cover the 0x6c3 and 0x6c6 SIDs?

The other SID was 0x6D6.

Best regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
